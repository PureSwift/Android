//
//  SerialExecutor.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if os(Android)
import Android
import AndroidNDK
#endif

import CoreFoundation
import Dispatch
import SystemPackage

@available(macOS 13.0, iOS 13.0, *)
public extension Looper {
    
    // Swift structured concurrency executor that enqueues jobs on an Android Looper.
    final class Executor: SerialExecutor, @unchecked Sendable {
        
        let eventFd: FileDescriptor
        let looper: Looper
        let queue = LockedState(initialState: [UnownedJob]())
        
        /// Initialize with Android Looper
        internal init(looper: consuming Looper) throws(AndroidLooperError) {
            let looperHandle = looper.handle
            // open fd
            let fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK) // TODO: Move to System / Socket package
            if fd < 0 {
                throw .bionic(Errno(rawValue: errno))
            }
            
            // initialize
            let eventFd = FileDescriptor(rawValue: fd)
            self.eventFd = eventFd
            self.looper = looper
            
            // Add fd to Looper
            try configureLooper()
        }

        deinit {
            if eventFd.rawValue != -1 {
                _ = try? looper.remove(fileDescriptor: eventFd)
                try? eventFd.close()
            }
        }
        
        /// Enqueue a single job
        public func enqueue(_ job: UnownedJob) {
            queue.withLock { queue in
                queue.append(job)
            }
            try! signal()
        }

        public func asUnownedSerialExecutor() -> UnownedSerialExecutor {
            UnownedSerialExecutor(ordinary: self)
        }
    }
}

@available(macOS 13.0, iOS 13.0, *)
internal extension Looper.Executor {
    
    func configureLooper() throws(AndroidLooperError) {
        do {
            // add to looper
            try looper.handle.add(fileDescriptor: eventFd, callback: drainAExecutor, data: Unmanaged.passUnretained(self).toOpaque()).get()
        }
        catch {
            try? eventFd.close()
            throw error
        }
    }
    
    /// Read number of remaining events from eventFd
    var eventsRemaining: UInt64 {
        get throws {
            var value = UInt64(0)
            try withUnsafeMutableBytes(of: &value) {
                guard try eventFd.read(into: $0) == MemoryLayout<UInt64>.size else {
                    throw Errno.invalidArgument
                }
            }

            return value
        }
    }

    /// Increment number of remaining events on eventFd
    func signal() throws {
        var value = UInt64(1)
        try withUnsafeBytes(of: &value) { (pointer) throws -> () in
            guard try eventFd.write(pointer) == MemoryLayout<UInt64>.size else {
                throw Errno.outOfRange
            }
        }
    }

    /// Drain job queue
    func drain() {
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
    func dequeue() -> UnownedJob? {
        queue.withLock { queue in
            guard !queue.isEmpty else { return nil }
            return queue.removeFirst()
        }
    }
}

@available(macOS 13.0, iOS 13.0, *)
private func drainAExecutor(fd: CInt, events: CInt, data: UnsafeMutableRawPointer?) -> CInt {
    let executor = Unmanaged<Looper.Executor>.fromOpaque(data!).takeUnretainedValue()
    executor.drain()
    return 1
}
