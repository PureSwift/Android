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
        internal init(looper: consuming Looper) throws(Errno) {
            let fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK) // TODO: Move to System / Socket package
            if fd < 0 {
                throw Errno(rawValue: errno)
            }
            self.eventFd = FileDescriptor(rawValue: fd)
            self.looper = looper
            guard looper.handle.add(fileDescriptor: eventFd, callback: drainAExecutor, data: Unmanaged.passUnretained(self).toOpaque()) else {
                try? eventFd.close()
                throw .invalidArgument
            }
        }

        deinit {
            if eventFd.rawValue != -1 {
                _ = looper.handle.remove(fileDescriptor: eventFd)
                try? eventFd.close()
            }
        }

        /// Read number of remaining events from eventFd
        private var eventsRemaining: UInt64 {
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
            try withUnsafeBytes(of: &value) { (pointer) throws(Errno) -> () in
                guard try eventFd.write(pointer) == MemoryLayout<UInt64>.size else {
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
            queue.withLock { queue in
                guard !queue.isEmpty else { return nil }
                return queue.removeFirst()
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

@available(macOS 13.0, *)
private func drainAExecutor(fd: CInt, events: CInt, data: UnsafeMutableRawPointer?) -> CInt {
    let executor = Unmanaged<Looper.Executor>.fromOpaque(data!).takeUnretainedValue()
    executor.drain()
    return 1
}
