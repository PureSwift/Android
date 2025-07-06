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

import SystemPackage
import CoreFoundation
import Dispatch

@available(macOS 13.0, *)
public extension Looper {
    
    // Swift structured concurrency executor that enqueues jobs on an Android Looper.
    final class SerialExecutor: Executor, _Concurrency.SerialExecutor, @unchecked Sendable {
        
        private let _eventFd: FileDescriptor
        private let _looper: AndroidMainActor.AndroidLooper
        private let _queue = LockedState(initialState: [UnownedJob]())

        /// Initialize with Android Looper
        internal init(looper: consuming AndroidMainActor.AndroidLooper) throws {
            #if os(Android)
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
            #else
            stub()
            #endif
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
}

