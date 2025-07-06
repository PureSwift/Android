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
public final actor AndroidMainActor: GlobalActor {
    
    static let _executor = try! Looper.Executor(looper: AndroidLooper.main)

    public static let shared = AndroidMainActor()
    public static let sharedUnownedExecutor: UnownedSerialExecutor = AndroidMainActor._executor
        .asUnownedSerialExecutor()

    public nonisolated var unownedExecutor: UnownedSerialExecutor {
        Self.sharedUnownedExecutor
    }
}

@available(macOS 13.0, *)
private extension AndroidMainActor {
    
    nonisolated(unsafe) private static var didInstallGlobalExecutor = false

    /// Set Android event loop based executor to be the global executor
    /// Note that this should be called before any of the jobs are created.
    /// This installation step will be unnecessary after custom executor are
    /// introduced officially, but it is part of "Future Directions":
    /// https://github.com/swiftlang/swift-evolution/blob/main/proposals/0392-custom-actor-executors.md#overriding-the-mainactor-executor
    ///
    /// See also [a draft proposal for custom executors](https://github.com/rjmccall/swift-evolution/blob/custom-executors/proposals/0000-custom-executors.md#the-default-global-concurrent-executor)
    static func installGlobalExecutor() -> Bool {
        if didInstallGlobalExecutor {
            return false
        }
        didInstallGlobalExecutor = true

        let looperCallback: LooperCallback = { ft, event, data in
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

        let mainLoop = CFRunLoopGetMain()

        // https://github.com/readdle/swift-android-ndk/blob/main/Sources/CAndroidNDK/MainRunLoop.c#L71
        //__CFPort wakeUpPort = mainLoop->_wakeUpPort;
        //int result = ALooper_addFd(_mainLooper, wakeUpPort, 0, CInt(ALOOPER_EVENT_INPUT), &looperCallback, nil)
        //mainLoop->_perRunData->ignoreWakeUps = 0x0;

        let dispatchPort = _dispatch_get_main_queue_port_4CF()
        let result = ALooper_addFd(_mainLooper, dispatchPort, 0, CInt(ALOOPER_EVENT_INPUT), looperCallback, nil)
        return result == 1 // Returns 1 if the file descriptor was added or -1 if an error occurred.
    }
}

@available(macOS 13.0, *)
internal extension AndroidMainActor {
    
    // Much of this is adapted from https://github.com/PADL/AndroidLooper/blob/0f26e1bdb989120f5689d74ea69a0525833ecd52/Sources/AndroidLooper/ALooper.swift

    /// https://developer.android.com/ndk/reference/group/looper
    @available(macOS 13.0, *)
    @available(*, deprecated, message: "Use Looper instead")
    struct AndroidLooper: ~Copyable, @unchecked Sendable {
        
        private let _looper: OpaquePointer

        public init(wrapping looper: OpaquePointer) {
            ALooper_acquire(looper)
            _looper = looper
        }

        deinit {
            ALooper_release(_looper)
        }

        // Called from applicaton entry point
        public static func setupMainLooper() -> Bool {
            if let looper = _mainLooper {
                ALooper_release(looper)
                _mainLooper = nil
            }

            _mainLooper = ALooper_forThread()
            if _mainLooper == nil {
                // this happens sometimes when running in test cases
                return false
            }
            ALooper_acquire(_mainLooper)

            // override the global executors to wake the main looper to drain the queue whenever something is scheduled
            return AndroidMainActor.installGlobalExecutor()
        }

        func deinitMainLooper() {
            ALooper_release(_mainLooper)
            _mainLooper = nil
        }

        /// Adds a new file descriptor to be polled by the looper.
        public func add(fd: FileDescriptor, ident: CInt = 0, events: Looper.Events = .input, callback: LooperCallback? = nil, data: UnsafeMutableRawPointer? = nil) throws {
            if ALooper_addFd(_looper, fd.rawValue, callback != nil ? CInt(ALOOPER_POLL_CALLBACK) : ident, Int32(events.rawValue), callback, data) != 1 {
                throw AndroidLooper.Error.addFdFailure
            }
        }

        /// Prepares a looper associated with the calling thread, and returns it.
        public static func prepare(opts: CInt) throws -> Self {
            guard let looper = ALooper_prepare(opts) else {
                throw AndroidLooper.Error.preparationFailure(opts)
            }
            return AndroidLooper(wrapping: looper)
        }

        /// Wakes the poll asynchronously.
        public func wake() {
            ALooper_wake(_looper)
        }

        /// Removes a previously added file descriptor from the looper.
        @discardableResult
        public func remove(fd: FileDescriptor) throws -> Bool {
            let ret = ALooper_removeFd(_looper, fd.rawValue)
            if ret < 0 {
                throw AndroidLooper.Error.removeFdFailure
            }
            return ret == 1
        }

        /// Waits for events to be available, with optional timeout in milliseconds.
        public static func pollOnce(duration: Duration? = nil) throws -> PollResult? {
            var outFd: CInt = -1
            var outEvents: CInt = 0
            var outData: UnsafeMutableRawPointer?

            let timeoutMillis: CInt
            if let duration = duration {
                timeoutMillis = CInt(Double(duration.components.seconds) * 1000 + Double(duration.components.attoseconds) * 1e-15)
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
                throw AndroidLooper.Error.pollTimeout
            case ALOOPER_POLL_ERROR:
                throw AndroidLooper.Error.pollError
            default:
                return PollResult(ident: err, fd: outFd, events: Looper.Events(rawValue: Int(outEvents)), data: outData)
            }
        }
    }
}


@available(macOS 13.0, *)
extension AndroidMainActor.AndroidLooper {
    
    enum Error: Swift.Error {
        case addFdFailure
        case removeFdFailure
        case preparationFailure(CInt)
        case pollTimeout
        case pollError
    }
    
    struct PollResult {
        let ident: CInt
        let fd: CInt
        let events: Looper.Events
        let data: UnsafeRawPointer?
    }
}

typealias LooperCallback = @convention(c) (CInt, CInt, UnsafeMutableRawPointer?) -> CInt

private nonisolated(unsafe) var _mainLooper: OpaquePointer! = nil

@available(macOS 13.0, *)
extension AndroidMainActor.AndroidLooper {
    static var main: Self {
        Self(wrapping: _mainLooper!)
    }
}
