//
//  Status.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(Android)
import Android
import AndroidNDK
#endif

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
    
    /// Directly initialize from a pointer.
    init(_ pointer: OpaquePointer) {
        self.handle = .init(pointer)
    }
    
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
    
    /// New status with the specified exception code.
    init(exception: Exception) {
        self.init(.from(exception: exception))
    }
    
    /// New status with the specified exception code and message.
    init(exception: Exception, message: String) {
        self.init(.from(exception: exception, message: message))
    }
    
    /// New status with the specified service-specific error code.
    init(serviceSpecific error: Int32) {
        self.init(.from(serviceSpecificError: error))
    }
    
    /// New status with the specified service-specific error code and message.
    init(serviceSpecific error: Int32, message: String) {
        self.init(.from(serviceSpecificError: error, message: message))
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
    var message: String? {
        handle.message
    }
    
    /// The exception code this status represents.
    var exception: Exception? {
        handle.exception
    }
    
    /// The service-specific error code if applicable.
    var serviceSpecificError: Int32? {
        handle.serviceSpecificError
    }
}

// MARK: - Methods

public extension Status {
    
    /// Access the underlying opaque pointer.
    func withUnsafePointer<E, Result>(_ body: (OpaquePointer) throws(E) -> Result) throws(E) -> Result where E: Error {
        try body(handle.pointer)
    }
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
        
        init(_ pointer: OpaquePointer) {
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
            guard let cString = AStatus_getDescription(status.pointer) else {
                fatalError("Unable to initialize")
            }
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
     * New status which is considered a success.
     *
     * Available since API level 29.
     *
     * \return a newly constructed status object that the caller owns.
     */
    static func newOk() -> Status.Handle {
        guard let pointer = AStatus_newOk() else {
            fatalError("Unable to initialize \(Self.self) \(#function)")
        }
        return Status.Handle(pointer)
    }
    
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
        guard let pointer = AStatus_fromStatus(status.rawValue) else {
            fatalError("Unable to initialize \(Self.self) \(#function)")
        }
        return Status.Handle(pointer)
    }
    
    /**
     * New status with exception code.
     *
     * Available since API level 29.
     *
     * \param exception the code that this status should represent. If this is EX_NONE, then this
     * constructs an non-error status object.
     *
     * \return a newly constructed status object that the caller owns.
     */
    static func from(exception: Exception) -> Status.Handle {
        guard let pointer = AStatus_fromExceptionCode(exception.rawValue) else {
            fatalError("Unable to initialize \(Self.self) \(#function)")
        }
        return Status.Handle(pointer)
    }
    
    /**
     * New status with exception code and message.
     *
     * Available since API level 29.
     *
     * \param exception the code that this status should represent. If this is EX_NONE, then this
     * constructs an non-error status object.
     * \param message the error message to associate with this status object.
     *
     * \return a newly constructed status object that the caller owns.
     */
    static func from(exception: Exception, message: String) -> Status.Handle {
        message.withCString { cString in
            guard let pointer = AStatus_fromExceptionCodeWithMessage(exception.rawValue, cString) else {
                fatalError("Unable to initialize \(Self.self) \(#function)")
            }
            return Status.Handle(pointer)
        }
    }
    
    static func from(serviceSpecificError error: Int32) -> Status.Handle {
        guard let pointer = AStatus_fromServiceSpecificError(error) else {
            fatalError("Unable to initialize \(Self.self) \(#function)")
        }
        return Status.Handle(pointer)
    }
    
    static func from(serviceSpecificError error: Int32, message: String) -> Status.Handle {
        let pointer = message.withCString { cString in
            AStatus_fromServiceSpecificErrorWithMessage(error, cString)
            
        }
        guard let pointer else {
            fatalError("Unable to initialize \(Self.self) \(#function)")
        }
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
    var message: String? {
        let message = AStatus_getMessage(pointer).flatMap { String(cString: $0) }
        guard let message, message.isEmpty == false else {
            return nil
        }
        return message
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
    
    /**
     * The exception that this status object represents.
     *
     * Available since API level 29.
     *
     * \param status the status being queried.
     *
     * \return the exception code that this object represents.
     */
    var exception: Exception? {
        let code = AStatus_getExceptionCode(pointer)
        guard code != 0 else {
            return nil
        }
        guard let exception = Exception(rawValue: code) else {
            assertionFailure("Invalid exception code \(code)")
            return .transactionFailed
        }
        return exception
    }
    
    /**
     * The service specific error if this object represents one. This function will only ever return a
     * non-zero result if AStatus_getExceptionCode returns EX_SERVICE_SPECIFIC. If this function returns
     * 0, the status object may still represent a different exception or status. To find out if this
     * transaction as a whole is okay, use AStatus_isOk instead.
     *
     * Available since API level 29.
     *
     * \param status the status being queried.
     *
     * \return the service-specific error code if the exception code is EX_SERVICE_SPECIFIC or 0.
     */
    var serviceSpecificError: Int32? {
        let value = AStatus_getServiceSpecificError(pointer)
        return value != 0 ? value : nil
    }
}
