//
//  Status.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

/**
 * Android Binder Status
 *
 * This is a helper class that encapsulates a standard way to keep track of and chain binder errors
 * along with service specific errors.
 *
 * It is not required to be used in order to Status/receive transactions, but it is required in
 * order to be compatible with standard AIDL transactions since it is written as the header to the
 * out Status for transactions which get executed (don't fail during unStatusing of input arguments
 * or sooner).
 */
public struct Status: ~Copyable {
    
    internal let handle: Handle
    
    internal init(_ handle: Handle) {
        self.handle = handle
    }
    
    deinit {
        handle.delete()
    }
}

// MARK: - Initialization

public extension Status {
    
    /// New status which is considered a success.
    init() {
        self.init(.newOk())
    }
    
    /// New status with the specified error code.
    ///
    /// This is typically for low level failures
    init(errorCode: AndroidBinderError.ErrorCode) {
        self.init(.from(status: errorCode))
    }
}

// MARK: - Properties

public extension Status {
    
    /// Whether this object represents a successful transaction.
    var isOk: Bool {
        handle.isOk
    }
    
    /// The status if this object represents one.
    var status: AndroidBinderError.ErrorCode? {
        handle.status
    }
    
    /// If there is a message associated with this status, this will return that message.
    var message: String {
        handle.message
    }
}

// MARK: - Methods

public extension Status {
    
    
}

// MARK: - CustomStringConvertible

extension Status { //: CustomStringConvertible, CustomDebugStringConvertible {
    
    /// Get human-readable description for debugging.
    public var description: String {
        handle.withDescription { $0.description }
    }
}

// MARK: - Supporting Types

internal extension Status {
    
    struct Handle {
        
        let pointer: OpaquePointer
        
        private init(_ pointer: OpaquePointer) {
            self.pointer = pointer
        }
    }
}

internal extension Status {
    
    struct Description: ~Copyable {
        
        let cString: UnsafePointer<CChar>
        
        private init(_ cString: UnsafePointer<CChar>) {
            self.cString = cString
        }
        
        /**
         * Get human-readable description for debugging.
         *
         * Available since API level 30.
         *
         * \param status the status being queried.
         *
         * \return a description, must be deleted with AStatus_deleteDescription.
         */
        init(status: Status.Handle) {
            let cString = AStatus_getDescription(status.pointer)
            self.init(cString)
        }
        
        deinit {
            AStatus_deleteDescription(cString)
        }
    }
}

extension Status.Description {
    
    public var description: String {
        String(cString: cString)
    }
}

internal extension Status.Handle {
    
    /**
     * New status with binder_status_t. This is typically for low level failures when a binder_status_t
     * is returned by an API on AIBinder or AParcel, and that is to be returned from a method returning
     * an AStatus instance. This is the least preferable way to return errors.
     * Prefer exceptions (particularly service-specific errors) when possible.
     *
     * Available since API level 29.
     *
     * \param status a low-level error to associate with this status object.
     *
     * \return a newly constructed status object that the caller owns.
     */
    static func from(status: AndroidBinderError.ErrorCode) -> Status.Handle {
        assert(status.rawValue != 0)
        let pointer = AStatus_fromStatus(status.rawValue)
        return Status.Handle(pointer)
    }
    
    /**
     * New status which is considered a success.
     *
     * Available since API level 29.
     *
     * \return a newly constructed status object that the caller owns.
     */
    static func newOk() -> Status.Handle {
        let pointer = AStatus_newOk()
        return Status.Handle(pointer)
    }
    
    /**
     * Deletes memory associated with the status instance.
     *
     * Available since API level 29.
     *
     * \param status the status to delete, returned from AStatus_newOk or one of the AStatus_from* APIs.
     */
    func delete() {
        AStatus_delete(pointer)
    }
    
    /**
     * Get human-readable description for debugging.
     *
     * Available since API level 30.
     *
     * \param status the status being queried.
     *
     * \return a description, must be deleted with AStatus_deleteDescription.
     */
    func withDescription<T>(_ block: (borrowing Status.Description) -> T) -> T {
        let description = Status.Description(status: self)
        return block(description)
    }
    
    /**
     * If there is a message associated with this status, this will return that message. If there is no
     * message, this will return an empty string.
     *
     * The returned string has the lifetime of the status object passed into this function.
     *
     * Available since API level 29.
     *
     * \param status the status being queried.
     *
     * \return the message associated with this error.
     */
    var message: String {
        String(cString: AStatus_getMessage(pointer))
    }
    
    /**
     * Whether this object represents a successful transaction. If this function returns true, then
     * AStatus_getExceptionCode will return EX_NONE.
     *
     * Available since API level 29.
     *
     * \param status the status being queried.
     *
     * \return whether the status represents a successful transaction. For more details, see below.
     */
    var isOk: Bool {
        AStatus_isOk(pointer)
    }
    
    /**
     * The status if this object represents one. This function will only ever return a non-zero result
     * if AStatus_getExceptionCode returns EX_TRANSACTION_FAILED. If this function return 0, the status
     * object may represent a different exception or a service specific error. To find out if this
     * transaction as a whole is okay, use AStatus_isOk instead.
     *
     * Available since API level 29.
     *
     * \param status the status being queried.
     *
     * \return the status code if the exception code is EX_TRANSACTION_FAILED or 0.
     */
    var status: AndroidBinderError.ErrorCode? {
        let errorCode = AStatus_getStatus(pointer)
        guard errorCode != 0 else {
            return nil
        }
        return AndroidBinderError.ErrorCode(rawValue: errorCode)
    }
}
