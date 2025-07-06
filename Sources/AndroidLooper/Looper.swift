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
    
    internal init(handle: Handle) {
        self.handle = handle
    }
}

// MARK: - Initialization

public extension Looper {
    
    /// Directly initialize from a pointer.
    init(_ pointer: OpaquePointer) {
        self.handle = .init(pointer)
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
     * Prepares a looper associated with the calling thread, and returns it.
     * If the thread already has a looper, it is returned.  Otherwise, a new
     * one is created, associated with the thread, and returned.
     *
     * The opts may be ALOOPER_PREPARE_ALLOW_NON_CALLBACKS or 0.
     */
    func prepare() {
        
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
}
