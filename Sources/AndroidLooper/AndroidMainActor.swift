//
//  AndroidMainActor.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if os(Android)
import Android
import AndroidNDK
#endif

import SystemPackage
import CoreFoundation
import Dispatch

@available(macOS 13.0, *)
@globalActor
public actor AndroidMainActor: GlobalActor {

    public static let shared = AndroidMainActor()
    
    public static let sharedUnownedExecutor: UnownedSerialExecutor = {
        // ensure executor is retained to avoid crash
         // https://forums.swift.org/t/how-to-properly-use-custom-executor-on-global-actor/71829/4
        guard let executor = AndroidMainActor.executor else {
            fatalError("Executor was never installed")
        }
        return executor.asUnownedSerialExecutor()
    }()

    public nonisolated var unownedExecutor: UnownedSerialExecutor {
        Self.sharedUnownedExecutor
    }
}

@available(macOS 13.0, *)
public extension AndroidMainActor {

    /// Setup the main looper,
    ///
    /// - Note: Make sure to call from main thread.
    static func setupMainLooper() -> Bool {
        
        // release previous looper and executor
        executor = nil
        
        // acquire looper for current thread (retained)
        guard let looper = Looper.currentThread else {
            // this happens sometimes when running in test cases
            return false
        }
        
        // the public API should always be retained.
        assert(looper.isRetained)
        
        let executor: Looper.Executor
        do {
            executor = try Looper.Executor(looper: looper)
        }
        catch {
            assertionFailure("Unable to initialize Looper.Executor: \(error)")
            return false
        }
        
        // override the global executors to wake the main looper to drain the queue whenever something is scheduled
        return AndroidMainActor.installGlobalExecutor(executor)
    }
}

@available(macOS 13.0, *)
extension Looper {
    
    /// Returns the main Looper setup with `AndroidMainActor`
    static var main: Self {
        guard let executor = AndroidMainActor.executor else {
            fatalError("Executor was never installed")
        }
        return Looper(executor.looper) // return a retained instance
    }
}

@available(macOS 13.0, *)
private extension AndroidMainActor {
    
    nonisolated(unsafe) static var didInstallGlobalExecutor = false
        
    nonisolated(unsafe) static var executor: Looper.Executor?

    /// Set Android event loop based executor to be the global executor
    /// Note that this should be called before any of the jobs are created.
    /// This installation step will be unnecessary after custom executor are
    /// introduced officially, but it is part of "Future Directions":
    /// https://github.com/swiftlang/swift-evolution/blob/main/proposals/0392-custom-actor-executors.md#overriding-the-mainactor-executor
    ///
    /// See also [a draft proposal for custom executors](https://github.com/rjmccall/swift-evolution/blob/custom-executors/proposals/0000-custom-executors.md#the-default-global-concurrent-executor)
    static func installGlobalExecutor(
        _ executor: Looper.Executor
    ) -> Bool {
        if didInstallGlobalExecutor {
            return false
        }
        didInstallGlobalExecutor = true

        let looperCallback: Looper.Callback = { ft, event, data in
            while true {
                switch CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.0, true) {
                case CFRunLoopRunResult.handledSource:
                    continue // continue run loop
                case CFRunLoopRunResult.finished:
                    return 1 // continue listening for events
                case CFRunLoopRunResult.stopped:
                    return 0 // stop listening
                case CFRunLoopRunResult.timedOut:
                    return 1 // continue listening for events
                default:
                    break
                }
            }
        }
        
        let mainLoop = CFRunLoopGetMain() // initialize main loop
        let dispatchPort = _dispatch_get_main_queue_port_4CF()
        let fileDescriptor = FileDescriptor(rawValue: dispatchPort)
        
        guard executor.looper.handle.add(
            fileDescriptor: fileDescriptor,
            id: 0,
            events: .input,
            callback: looperCallback,
            data: nil
        ) else {
            return false
        }
        // install executor
        self.executor = executor
        _ = mainLoop
        return true
    }
}

@available(macOS 13.0, *)
internal extension Looper.Handle {
    
    /// Waits for events to be available, with optional timeout in milliseconds.
    func pollOnce(duration: Duration? = nil) throws(Error) -> AndroidMainActor.PollResult? {
        var outFd: CInt = -1
        var outEvents: CInt = 0
        var outData: UnsafeMutableRawPointer?

        let timeoutMillis: CInt
        if let duration {
            timeoutMillis = CInt(duration.milliseconds)
        } else {
            timeoutMillis = 0
        }
        
        let err = ALooper_pollOnce(timeoutMillis, &outFd, &outEvents, &outData)
        switch Int(err) {
        case ALOOPER_POLL_WAKE:
            fallthrough
        case ALOOPER_POLL_CALLBACK:
            return nil
        case ALOOPER_POLL_TIMEOUT:
            throw AndroidMainActor.Error.pollTimeout
        case ALOOPER_POLL_ERROR:
            throw AndroidMainActor.Error.pollError
        default:
            return AndroidMainActor.PollResult(id: err, fd: .init(rawValue: outFd), events: Looper.Events(rawValue: Int(outEvents)), data: outData)
        }
    }
}

@available(macOS 13.0, *)
public extension AndroidMainActor {
    
    enum Error: Swift.Error {
        case pollTimeout
        case pollError
    }
    
    struct PollResult: Identifiable {
        public let id: CInt
        public let fd: FileDescriptor
        public let events: Looper.Events
        public let data: UnsafeRawPointer?
    }
}
