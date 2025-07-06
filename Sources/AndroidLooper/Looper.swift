//
//  Looper.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if os(Android)
import Android
import AndroidNDK
#endif
import SystemPackage

/**
 * Looper
 *
 * A looper is the state tracking an event loop for a thread.
 * Loopers do not define event structures or other such things; rather
 * they are a lower-level facility to attach one or more discrete objects
 * listening for an event.  An "event" here is simply data available on
 * a file descriptor: each attached object has an associated file descriptor,
 * and waiting for "events" means (internally) polling on all of these file
 * descriptors until one or more of them have data available.
 *
 * A thread can have only one `ALooper` associated with it.
 */
public struct Looper: ~Copyable {
    
    internal let handle: Handle
    
    internal init(_ handle: Handle) {
        self.handle = handle
    }
}

// MARK: - Initialization

public extension Looper {
    
    /// Directly initialize from a pointer.
    init(_ pointer: OpaquePointer) {
        self.handle = .init(pointer)
    }
    
    static var currentThread: Looper? {
        Handle.forThread().flatMap { .init($0) }
    }
    
    static func currentThread(options: PrepareOptions) -> Looper {
        Looper(.prepare(options: options))
    }
}

// MARK: - Properties

public extension Looper {
    
    
}

// MARK: - Methods

public extension Looper {
    
    /// Access the underlying opaque pointer.
    func withUnsafePointer<E, Result>(_ body: (OpaquePointer) throws(E) -> Result) throws(E) -> Result where E: Error {
        try body(handle.pointer)
    }
    
    /**
     * Wakes the poll asynchronously.
     *
     * This method can be called on any thread.
     * This method returns immediately.
     */
    func wake() {
        handle.wake()
    }
}

// MARK: - Supporting Types

internal extension Looper {
    
    struct Handle {
        
        let pointer: OpaquePointer
        
        init(_ pointer: OpaquePointer) {
            self.pointer = pointer
        }
    }
}

internal extension Looper.Handle {
    
    /**
     * Returns the looper associated with the calling thread, or NULL if
     * there is not one.
     */
    static func forThread() -> Looper.Handle? {
        ALooper_forThread().flatMap { .init($0) }
    }
    
    /**
     * Prepares a looper associated with the calling thread, and returns it.
     * If the thread already has a looper, it is returned.  Otherwise, a new
     * one is created, associated with the thread, and returned.
     *
     * The opts may be ALOOPER_PREPARE_ALLOW_NON_CALLBACKS or 0.
     */
    static func prepare(options: Looper.PrepareOptions = []) -> Looper.Handle {
        guard let pointer = ALooper_prepare(Int32(options.rawValue)) else {
            fatalError("Unable to initialize")
        }
        return Looper.Handle(pointer)
    }
    
    /**
     * Acquire a reference on the given `ALooper` object.  This prevents the object
     * from being deleted until the reference is removed.  This is only needed
     * to safely hand an `ALooper` from one thread to another.
     */
    func retain() {
        ALooper_acquire(pointer)
    }
    
    /**
     * Remove a reference that was previously acquired with `ALooper_acquire()`.
     */
    func release() {
        ALooper_release(pointer)
    }
    
    /**
     * Wakes the poll asynchronously.
     *
     * This method can be called on any thread.
     * This method returns immediately.
     */
    func wake() {
        ALooper_wake(pointer)
    }
    
    /**
     * Adds a new file descriptor to be polled by the looper.
     * If the same file descriptor was previously added, it is replaced.
     *
     * "fd" is the file descriptor to be added.
     * "ident" is an identifier for this event, which is returned from ALooper_pollOnce().
     * The identifier must be >= 0, or ALOOPER_POLL_CALLBACK if providing a non-NULL callback.
     * "events" are the poll events to wake up on.  Typically this is ALOOPER_EVENT_INPUT.
     * "callback" is the function to call when there is an event on the file descriptor.
     * "data" is a private data pointer to supply to the callback.
     *
     * There are two main uses of this function:
     *
     * (1) If "callback" is non-NULL, then this function will be called when there is
     * data on the file descriptor.  It should execute any events it has pending,
     * appropriately reading from the file descriptor.  The 'ident' is ignored in this case.
     *
     * (2) If "callback" is NULL, the 'ident' will be returned by ALooper_pollOnce
     * when its file descriptor has data available, requiring the caller to take
     * care of processing it.
     *
     * Returns 1 if the file descriptor was added or -1 if an error occurred.
     *
     * This method can be called on any thread.
     * This method may block briefly if it needs to wake the poll.
     */
    func add(fileDescriptor: FileDescriptor) {
        
    }
    
    /**
     * Removes a previously added file descriptor from the looper.
     *
     * When this method returns, it is safe to close the file descriptor since the looper
     * will no longer have a reference to it.  However, it is possible for the callback to
     * already be running or for it to run one last time if the file descriptor was already
     * signalled.  Calling code is responsible for ensuring that this case is safely handled.
     * For example, if the callback takes care of removing itself during its own execution either
     * by returning 0 or by calling this method, then it can be guaranteed to not be invoked
     * again at any later time unless registered anew.
     *
     * Returns 1 if the file descriptor was removed, 0 if none was previously registered
     * or -1 if an error occurred.
     *
     * This method can be called on any thread.
     * This method may block briefly if it needs to wake the poll.
     */
    func remove(fileDescriptor: FileDescriptor) {
        
    }
}
