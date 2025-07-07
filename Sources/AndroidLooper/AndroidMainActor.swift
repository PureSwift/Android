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
        
        // override the global executors to wake the main looper to drain the queue whenever something is scheduled
        do {
            let executor = try Looper.Executor(looper: looper)
            return try AndroidMainActor.installGlobalExecutor(executor)
        }
        catch {
            return false
        }
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
    ) throws(AndroidLooperError) -> Bool {
        if didInstallGlobalExecutor {
            return false
        }
        didInstallGlobalExecutor = true

        let looperCallback: Looper.Handle.Callback = { ft, event, data in
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
        
        try executor.looper.handle.add(
            fileDescriptor: fileDescriptor,
            id: 0,
            events: .input,
            callback: looperCallback,
            data: nil
        ).get()
        
        // install executor
        self.executor = executor
        _ = mainLoop
        return true
    }
}
