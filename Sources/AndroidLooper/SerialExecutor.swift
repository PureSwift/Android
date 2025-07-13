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
import Socket

@available(macOS 13.0, iOS 13.0, *)
public extension Looper {
    
    // Swift structured concurrency executor that enqueues jobs on an Android Looper.
    final class Executor: SerialExecutor, @unchecked Sendable {
        
        #if os(Android)
        let eventFd: SocketDescriptor.Event
        #endif
        let looper: Looper
        let queue = LockedState(initialState: [UnownedJob]())
        
        /// Initialize with Android Looper
        internal init(looper: consuming Looper) throws(AndroidLooperError) {
            #if os(Android)
            let eventFd: SocketDescriptor.Event
            // open fd
            do {
                eventFd = try SocketDescriptor.Event(0, flags: [.closeOnExec, .nonBlocking])
            }
            catch {
                throw .bionic(error)
            }
            // initialize
            self.eventFd = eventFd
            #endif
            self.looper = looper
            // Add fd to Looper
            try configureLooper()
        }

        deinit {
            #if os(Android)
            if eventFd.rawValue != -1 {
                _ = try? looper.remove(fileDescriptor: .init(rawValue: eventFd.rawValue))
                try? eventFd.close()
            }
            #endif
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
        #if os(Android)
        do {
            // add to looper
            try looper.handle.add(fileDescriptor: .init(rawValue: eventFd.rawValue), callback: drainAExecutor, data: Unmanaged.passUnretained(self).toOpaque()).get()
        }
        catch {
            try? eventFd.close()
            throw error
        }
        #endif
    }
    
    /// Read number of remaining events from eventFd
    var eventsRemaining: UInt64 {
        get throws {
            #if os(Android)
            try eventFd.read().rawValue
            #else
            0
            #endif
        }
    }

    /// Increment number of remaining events on eventFd
    func signal() throws {
        #if os(Android)
        try eventFd.write(1)
        #endif
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
