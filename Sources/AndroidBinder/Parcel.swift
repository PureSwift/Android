//
//  AndroidParcel.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(Android)
import Android
import AndroidNDK
#endif
import Binder

/**
 * Android Binder Parcel
 *
 * This object represents a package of data that can be sent between processes. When transacting, an
 * instance of it is automatically created to be used for the transaction. When two processes use
 * binder to communicate, they must agree on a format of this parcel to be used in order to transfer
 * data. This is usually done in an IDL (see AIDL, specificially).
 */
public struct Parcel: ~Copyable {
    
    internal let handle: Handle
    
    internal init(handle: Handle) {
        self.handle = handle
    }
    
    deinit {
        handle.delete()
    }
}

// MARK: - Initialization

public extension Parcel {
    
    /// Directly initialize from a pointer.
    init(_ pointer: OpaquePointer) {
        self.handle = .init(pointer)
    }
}

// MARK: - Properties

public extension Parcel {
    
    /// Gets the current position within the parcel.
    var dataPosition: Int {
        Int(handle.dataPosition)
    }
}

// MARK: - Methods

public extension Parcel {
    
    /// Access the underlying opaque pointer.
    func withUnsafePointer<E, Result>(_ body: (OpaquePointer) throws(E) -> Result) throws(E) -> Result where E: Error {
        try body(handle.pointer)
    }
    
    /// Sets the position within the parcel.
    func setDataPosition(_ position: Int) throws(AndroidBinderError) {
        try handle.setDataPosition(Int32(position)).get()
    }
}

// MARK: - Supporting Types

internal extension Parcel {
    
    struct Handle {
        
        let pointer: OpaquePointer
        
        init(_ pointer: OpaquePointer) {
            self.pointer = pointer
        }
    }
}

internal extension Parcel.Handle {
    
    /**
     * Cleans up a parcel.
     *
     * Available since API level 29.
     *
     * \param parcel A parcel returned by AIBinder_prepareTransaction or AIBinder_transact when a
     * transaction is being aborted.
     */
    func delete() {
        AParcel_delete(pointer)
    }
    
    /**
     * Sets the position within the parcel.
     *
     * This must be called with a position that has been previously returned from
     * AParcel_getDataPosition. If writes are made after setting the data position, they must
     * be made in the exact same sequence used before resetting data position. Writing over
     * objects such as binders or file descriptors is not supported.
     *
     * Available since API level 29.
     *
     * \param parcel The parcel of which to set the position.
     * \param position Position of the parcel to set. This must be a value returned by
     * AParcel_getDataPosition. Positions are constant for a given parcel between processes.
     *
     * \return STATUS_OK on success. If position is negative, then STATUS_BAD_VALUE will be returned.
     */
    func setDataPosition(_ position: Int32) -> Result<Void, AndroidBinderError> {
        AParcel_setDataPosition(pointer, position).mapError()
    }
    
    /**
     * Gets the current position within the parcel.
     *
     * Available since API level 29.
     *
     * \param parcel The parcel of which to get the position.
     *
     * \return The size of the parcel. This will always be greater than 0. The values returned by this
     * function before and after calling various reads and writes are not defined. Only the delta
     * between two positions between a specific sequence of calls is defined. For instance, if position
     * is X, writeBool is called, and then position is Y, readBool can be called from position X will
     * return the same value, and then position will be Y.
     */
    var dataPosition: Int32 {
        AParcel_getDataPosition(pointer)
    }
}
