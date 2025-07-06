//
//  AndroidBinder.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(Android)
import Android
import AndroidNDK
#elseif canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Gblic
#endif
import SystemPackage
import Binder

/**
 * Represents a local or remote object which can be used for IPC or which can itself be sent.
 *
 * This object has a refcount associated with it and will be deleted when its refcount reaches zero.
 * How methods interactive with this refcount is described below. When using this API, it is
 * intended for a client of a service to hold a strong reference to that service. This also means
 * that user data typically should hold a strong reference to a local AIBinder object. A remote
 * AIBinder object automatically holds a strong reference to the AIBinder object in the server's
 * process. A typically memory layout looks like this:
 *
 * Key:
 *   --->         Ownership/a strong reference
 *   ...>         A weak reference
 *
 *                         (process boundary)
 *                                 |
 * MyInterface ---> AIBinder_Weak  |  ProxyForMyInterface
 *      ^                .         |          |
 *      |                .         |          |
 *      |                v         |          v
 *   UserData  <---   AIBinder   <-|-      AIBinder
 *                                 |
 *
 * In this way, you'll notice that a proxy for the interface holds a strong reference to the
 * implementation and that in the server process, the AIBinder object which was sent can be resent
 * so that the same AIBinder object always represents the same object. This allows, for instance, an
 * implementation (usually a callback) to transfer all ownership to a remote process and
 * automatically be deleted when the remote process is done with it or dies. Other memory models are
 * possible, but this is the standard one.
 *
 * If the process containing an AIBinder dies, it is possible to be holding a strong reference to
 * an object which does not exist. In this case, transactions to this binder will return
 * STATUS_DEAD_OBJECT. See also AIBinder_linkToDeath, AIBinder_unlinkToDeath, and AIBinder_isAlive.
 *
 * Once an AIBinder is created, anywhere it is passed (remotely or locally), there is a 1-1
 * correspondence between the address of an AIBinder and the object it represents. This means that
 * when two AIBinder pointers point to the same address, they represent the same object (whether
 * that object is local or remote). This correspondance can be broken accidentally if AIBinder_new
 * is erronesouly called to create the same object multiple times.
 */
public final class AndroidBinder {
    
    internal let handle: Handle
    
    // MARK: - Initialization
    
    deinit {
        handle.release()
    }
    
    internal init(_ handle: Handle) {
        self.handle = handle
    }
    
    /// Directly initialize from a pointer.
    public init(_ pointer: OpaquePointer) {
        self.handle = .init(pointer)
    }
    
    /**
     * Creates a new binder object of the appropriate class.
     *
     * Ownership of args is passed to this object. The lifecycle is implemented with AIBinder_incStrong
     * and AIBinder_decStrong. When the reference count reaches zero, onDestroy is called.
     *
     * When this is called, the refcount is implicitly 1. So, calling decStrong exactly one time is
     * required to delete this object.
     *
     * Once an AIBinder object is created using this API, re-creating that AIBinder for the same
     * instance of the same class will break pointer equality for that specific AIBinder object. For
     * instance, if someone erroneously created two AIBinder instances representing the same callback
     * object and passed one to a hypothetical addCallback function and then later another one to a
     * hypothetical removeCallback function, the remote process would have no way to determine that
     * these two objects are actually equal using the AIBinder pointer alone (which they should be able
     * to do). Also see the suggested memory ownership model suggested above.
     *
     * Available since API level 29.
     *
     * \param clazz the type of the object to be created.
     * \param args the args to pass to AIBinder_onCreate for that class.
     *
     * \return a binder object representing the newly instantiated object.
     */
    public init(class: borrowing BinderClass, arguments: [String] = []) {
        fatalError()
    }
}

// MARK: - Properties

public extension AndroidBinder {
    
    /**
     * Determine whether the current thread is currently executing an incoming transaction.
     *
     * \return true if the current thread is currently executing an incoming transaction, and false
     * otherwise.
     */
    static var isHandlingTransaction: Bool {
        AIBinder_isHandlingTransaction()
    }
    
    /**
     * This returns the calling UID assuming that this thread is called from a thread that is processing
     * a binder transaction (for instance, in the implementation of AIBinder_Class_onTransact).
     *
     * This can be used with higher-level system services to determine the caller's identity and check
     * permissions.
     *
     * Available since API level 29.
     *
     * \return calling uid or the current process's UID if this thread isn't processing a transaction.
     */
    static var callingUID: uid_t {
        AIBinder_getCallingUid()
    }

    /**
     * This returns the calling PID assuming that this thread is called from a thread that is processing
     * a binder transaction (for instance, in the implementation of AIBinder_Class_onTransact).
     *
     * This can be used with higher-level system services to determine the caller's identity and check
     * permissions. However, when doing this, one should be aware of possible TOCTOU problems when the
     * calling process dies and is replaced with another process with elevated permissions and the same
     * PID.
     *
     * Warning: oneway transactions do not receive PID. Even if you expect
     * a transaction to be synchronous, a misbehaving client could send it
     * as a synchronous call and result in a 0 PID here. Additionally, if
     * there is a race and the calling process dies, the PID may still be
     * 0 for a synchronous call.
     *
     * Available since API level 29.
     *
     * \return calling pid or the current process's PID if this thread isn't processing a transaction.
     * If the transaction being processed is a oneway transaction, then this method will return 0.
     */
    static var callingPID: pid_t {
        AIBinder_getCallingPid()
    }
    
    /**
     * If this is hosted in a process other than the current one.
     *
     * Available since API level 29.
     *
     * \param binder the binder being queried.
     *
     * \return true if the AIBinder represents an object in another process.
     */
    var isRemote: Bool {
        handle.isRemote
    }
    
    /**
     * If this binder is known to be alive. This will not send a transaction to a remote process and
     * returns a result based on the last known information. That is, whenever a transaction is made,
     * this is automatically updated to reflect the current alive status of this binder. This will be
     * updated as the result of a transaction made using AIBinder_transact, but it will also be updated
     * based on the results of bookkeeping or other transactions made internally.
     *
     * Available since API level 29.
     *
     * \param binder the binder being queried.
     *
     * \return true if the binder is alive.
     */
    var isAlive: Bool {
        handle.isAlive
    }
}

// MARK: - Methods

public extension AndroidBinder {
    
    /// Access the underlying opaque pointer.
    func withUnsafePointer<E, Result>(_ body: (OpaquePointer) throws(E) -> Result) throws(E) -> Result where E: Error {
        try body(handle.pointer)
    }
    
    /**
     * Built-in transaction for all binder objects. This sends a transaction that will immediately
     * return. Usually this is used to make sure that a binder is alive, as a placeholder call, or as a
     * consistency check.
     *
     * Available since API level 29.
     *
     * \param binder the binder being queried.
     *
     * \return STATUS_OK if the ping succeeds.
     */
    func ping() throws(AndroidBinderError) {
        try handle.ping().get()
    }
    
    /**
     * Built-in transaction for all binder objects. This dumps information about a given binder.
     *
     * See also AIBinder_Class_setOnDump, AIBinder_onDump.
     *
     * Available since API level 29.
     *
     * \param binder the binder to dump information about
     * \param fd where information should be dumped to
     * \param args null-terminated arguments to pass (may be null if numArgs is 0)
     * \param numArgs number of args to send
     *
     * \return STATUS_OK if dump succeeds (or if there is nothing to dump)
     */
    func dump(to destination: FileDescriptor, arguments: [String] = []) throws(AndroidBinderError) {
        try handle.dump(to: destination, arguments: arguments).get()
    }
}

// MARK: - Supporting Types

internal extension AndroidBinder {
    
    struct Handle {
        
        let pointer: OpaquePointer
        
        init(_ pointer: OpaquePointer) {
            self.pointer = pointer
        }
    }
}

internal extension AndroidBinder.Handle {
    
    /**
     * If this is hosted in a process other than the current one.
     *
     * Available since API level 29.
     *
     * \param binder the binder being queried.
     *
     * \return true if the AIBinder represents an object in another process.
     */
    var isRemote: Bool {
        AIBinder_isRemote(pointer)
    }
    
    /**
     * If this binder is known to be alive. This will not send a transaction to a remote process and
     * returns a result based on the last known information. That is, whenever a transaction is made,
     * this is automatically updated to reflect the current alive status of this binder. This will be
     * updated as the result of a transaction made using AIBinder_transact, but it will also be updated
     * based on the results of bookkeeping or other transactions made internally.
     *
     * Available since API level 29.
     *
     * \param binder the binder being queried.
     *
     * \return true if the binder is alive.
     */
    var isAlive: Bool {
        AIBinder_isAlive(pointer)
    }
    
    /**
     * For debugging only!
     *
     * Available since API level 29.
     *
     * \param binder the binder object to retrieve the refcount of.
     *
     * \return the number of strong-refs on this binder in this process. If binder is null, this will be
     * -1.
     */
    var debugReferenceCount: Int32 {
        AIBinder_debugGetRefCount(pointer)
    }
    
    /**
     * Built-in transaction for all binder objects. This sends a transaction that will immediately
     * return. Usually this is used to make sure that a binder is alive, as a placeholder call, or as a
     * consistency check.
     *
     * Available since API level 29.
     *
     * \param binder the binder being queried.
     *
     * \return STATUS_OK if the ping succeeds.
     */
    func ping() -> Result<Void, AndroidBinderError> {
        AIBinder_ping(pointer).mapError()
    }
    
    /**
     * This will delete the object and call onDestroy once the refcount reaches zero.
     *
     * Available since API level 29.
     *
     * \param binder the binder object to remove a refcount from.
     */
    func release() {
        AIBinder_decStrong(pointer)
    }
    
    /**
     * This can only be called if a strong reference to this object already exists in process.
     *
     * Available since API level 29.
     *
     * \param binder the binder object to add a refcount to.
     */
    func retain() {
        AIBinder_incStrong(pointer)
    }
    
    /**
     * Built-in transaction for all binder objects. This dumps information about a given binder.
     *
     * See also AIBinder_Class_setOnDump, AIBinder_onDump.
     *
     * Available since API level 29.
     *
     * \param binder the binder to dump information about
     * \param fd where information should be dumped to
     * \param args null-terminated arguments to pass (may be null if numArgs is 0)
     * \param numArgs number of args to send
     *
     * \return STATUS_OK if dump succeeds (or if there is nothing to dump)
     */
    func dump(to destination: FileDescriptor, arguments: [String] = []) -> Result<Void, AndroidBinderError> {
        fatalError()
    }
}
