//
//  Looper.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/14/25.
//

#if os(Android)
import Android
import AndroidNDK
import SystemPackage
import CoreFoundation
import Dispatch
import _Concurrency

// Much of this is adapted from https://github.com/PADL/AndroidLooper/blob/0f26e1bdb989120f5689d74ea69a0525833ecd52/Sources/AndroidLooper/ALooper.swift

/// https://developer.android.com/ndk/reference/group/looper
public struct AndroidLooper: ~Copyable, @unchecked Sendable {
    
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
        if _mainLooper != nil {
            ALooper_release(_mainLooper)
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
    public func add(fd: FileDescriptor, ident: CInt = 0, events: Events = .input, callback: LooperCallback? = nil, data: UnsafeMutableRawPointer? = nil) throws {
        if ALooper_addFd(_looper, fd.rawValue, callback != nil ? CInt(ALOOPER_POLL_CALLBACK) : ident, events.rawValue, callback, data) != 1 {
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
            return PollResult(ident: err, fd: outFd, events: Events(rawValue: outEvents), data: outData)
        }
    }
}

public extension AndroidLooper {
    
    enum Error: Swift.Error {
        case addFdFailure
        case removeFdFailure
        case preparationFailure(CInt)
        case pollTimeout
        case pollError
    }

    struct Events: OptionSet, Sendable {
        
        public typealias RawValue = CInt
        
        public let rawValue: RawValue

        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }

        public static var input: Events { Events(rawValue: 1 << 0) }
        public static var output: Events { Events(rawValue: 1 << 1) }
        public static var error: Events { Events(rawValue: 1 << 2) }
        public static var hangup: Events { Events(rawValue: 1 << 3) }
        public static var invalid: Events { Events(rawValue: 1 << 4) }
    }
    
    struct PollResult {
        let ident: CInt
        let fd: CInt
        let events: Events
        let data: UnsafeRawPointer?
    }
}

public typealias LooperCallback = @convention(c) (CInt, CInt, UnsafeMutableRawPointer?) -> CInt

private nonisolated(unsafe) var _mainLooper: OpaquePointer? = nil

public extension AndroidLooper {
    static var main: Self {
        Self(wrapping: _mainLooper!)
    }
}

private func drainAExecutor(fd: CInt, events: CInt, data: UnsafeMutableRawPointer?) -> CInt {
    let executor = Unmanaged<AndroidLooperExecutor>.fromOpaque(data!).takeUnretainedValue()
    executor.drain()
    return 1
}

// Swift structured concurrency executor that enqueues jobs on an Android Looper.
open class AndroidLooperExecutor: SerialExecutor, @unchecked Sendable {
    private let _eventFd: FileDescriptor
    private let _looper: AndroidLooper
    private let _queue = LockedState(initialState: [UnownedJob]())

    /// Initialize with Android Looper
    public init(looper: consuming AndroidLooper) throws {
        let fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK)
        if fd < 0 {
            throw Errno(rawValue: errno)
        }
        _eventFd = FileDescriptor(rawValue: fd)
        _looper = looper
        do {
            try _looper.add(fd: _eventFd, callback: drainAExecutor, data: Unmanaged.passUnretained(self).toOpaque())
        } catch {
            try _eventFd.close()
            throw error
        }
    }

    deinit {
        if _eventFd.rawValue != -1 {
            _ = try? _looper.remove(fd: _eventFd)
            try? _eventFd.close()
        }
    }

    /// Read number of remaining events from eventFd
    private var eventsRemaining: UInt64 {
        get throws {
            var value = UInt64(0)
            try withUnsafeMutableBytes(of: &value) {
                guard try _eventFd.read(into: $0) == MemoryLayout<UInt64>.size else {
                    throw Errno.invalidArgument
                }
            }

            return value
        }
    }

    /// Increment number of remaining events on eventFd
    func signal() throws {
        var value = UInt64(1)
        try withUnsafeBytes(of: &value) {
            guard try _eventFd.write($0) == MemoryLayout<UInt64>.size else {
                throw Errno.outOfRange
            }
        }
    }

    /// Drain job queue
    fileprivate func drain() {
        if let eventsRemaining = try? eventsRemaining {
            for _ in 0..<eventsRemaining {
                let job = dequeue()
                guard let job else { break }
                job.runSynchronously(on: asUnownedSerialExecutor())
            }
        }

        while CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.0, true) == CFRunLoopRunResult.handledSource {
            // continue handling queued events without a timeout
        }
    }

    /// Dequeue a single job
    private func dequeue() -> UnownedJob? {
        _queue.withLock { queue in
            guard !queue.isEmpty else { return nil }
            return queue.removeFirst()
        }
    }

    /// Enqueue a single job
    public func enqueue(_ job: UnownedJob) {
        _queue.withLock { queue in
            queue.append(job)
        }
        try! signal()
    }

    public func asUnownedSerialExecutor() -> UnownedSerialExecutor {
        UnownedSerialExecutor(ordinary: self)
    }
}

@globalActor
public final actor AndroidMainActor: GlobalActor {
    static let _executor = try! AndroidLooperExecutor(looper: AndroidLooper.main)

    public static let shared = AndroidMainActor()
    public static let sharedUnownedExecutor: UnownedSerialExecutor = AndroidMainActor._executor
        .asUnownedSerialExecutor()

    public nonisolated var unownedExecutor: UnownedSerialExecutor {
        Self.sharedUnownedExecutor
    }
}

private extension AndroidMainActor {
    private static var didInstallGlobalExecutor = false

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

// https://github.com/apple-oss-distributions/libdispatch/blob/bd82a60ee6a73b4eca50af028b48643d51aaf1ea/src/queue.c#L8237
// https://forums.swift.org/t/main-dispatch-queue-in-linux-sdl-app/31708/3
@_silgen_name("_dispatch_main_queue_callback_4CF")
func _dispatch_main_queue_callback_4CF()

@_silgen_name("_dispatch_get_main_queue_port_4CF")
func _dispatch_get_main_queue_port_4CF() -> Int32
#endif
