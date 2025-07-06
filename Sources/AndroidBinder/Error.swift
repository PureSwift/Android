//
//  Error.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(Android)
import Android
import AndroidNDK
#endif

/// Android NDK Binder Error
public struct AndroidBinderError: Error {
    
    public let errorCode: ErrorCode
    
    internal let file: StaticString
    
    internal let function: StaticString
    
    internal init(
        _ errorCode: ErrorCode,
        file: StaticString = #file,
        function: StaticString = #function
    ) {
        assert(errorCode.rawValue != STATUS_OK)
        self.errorCode = errorCode
        self.file = file
        self.function = function
    }
}

// MARK: - Properties

public extension AndroidBinderError {
    
    var message: String {
        let status = Status(errorCode: errorCode)
        return status.description
    }
}

// MARK: - CustomStringConvertible

extension AndroidBinderError: CustomStringConvertible {
    
    public var description: String {
        message
    }
}

// MARK: - Supporting Types

public extension AndroidBinderError {
    
    /**
     * Low-level status types for use in binder. This is the least preferable way to
     * return an error for binder services (where binder_exception_t should be used,
     * particularly EX_SERVICE_SPECIFIC).
     */
    struct ErrorCode: RawRepresentable, Equatable, Hashable, Sendable {
        
        public let rawValue: Int32
        
        public init(rawValue: Int32) {
            self.init(rawValue)
        }
        
        private init(_ raw: Int32) {
            assert(raw != 0)
            self.rawValue = raw
        }
        
        private init(_ raw: Int) {
            self.init(Int32(raw))
        }
    }
}

// MARK: - Constants

public extension AndroidBinderError.ErrorCode {
    
    static var unknown: Self { .init(STATUS_UNKNOWN_ERROR) } // INT32_MIN
    static var noMemory: Self { .init(STATUS_NO_MEMORY) } // -ENOMEM
    static var invalidOperation: Self { .init(STATUS_INVALID_OPERATION) } // -ENOSYS
    static var badValue: Self { .init(STATUS_BAD_VALUE) } // -EINVAL
    static var badType: Self { .init(STATUS_BAD_TYPE) } // (STATUS_UNKNOWN_ERROR + 1)
    static var nameNotFound: Self { .init(STATUS_NAME_NOT_FOUND) } // -ENOENT
    static var permissionDenied: Self { .init(STATUS_PERMISSION_DENIED) } // -EPERM
    static var noInit: Self { .init(STATUS_NO_INIT) } // -ENODEV
    static var alreadyExists: Self { .init(STATUS_ALREADY_EXISTS) } // -EEXIST
    static var deadObject: Self { .init(STATUS_DEAD_OBJECT) } // -EPIPE
    static var failedTransaction: Self { .init(STATUS_FAILED_TRANSACTION) } // (STATUS_UNKNOWN_ERROR + 2)
    static var badIndex: Self { .init(STATUS_BAD_INDEX) } // -EOVERFLOW
    static var notEnoughData: Self { .init(STATUS_NOT_ENOUGH_DATA) } // -ENODATA
    static var wouldBlock: Self { .init(STATUS_WOULD_BLOCK) } // -EWOULDBLOCK
    static var timedOut: Self { .init(STATUS_TIMED_OUT) } // -ETIMEDOUT
    static var unknownTransaction: Self { .init(STATUS_UNKNOWN_TRANSACTION) } // -EBADMSG
    static var fdsNotAllowed: Self { .init(STATUS_FDS_NOT_ALLOWED) } // (STATUS_UNKNOWN_ERROR + 7)
    static var unexpectedNull: Self { .init(STATUS_UNEXPECTED_NULL) } // (STATUS_UNKNOWN_ERROR + 8)
}

// MARK: - Internal Extensions

internal extension binder_status_t {
    
    func mapError(
        file: StaticString = #file,
        function: StaticString = #function
    ) -> Result<Void, AndroidBinderError> {
        mapError((), file: file, function: function)
    }
    
    func mapError<T>(
        _ value: T,
        file: StaticString = #file,
        function: StaticString = #function
    ) -> Result<T, AndroidBinderError> {
        guard self != STATUS_OK else {
            return .success(value)
        }
        let errorCode = AndroidBinderError.ErrorCode(rawValue: self)
        let error = AndroidBinderError(errorCode, file: file, function: function)
        return .failure(error)
    }
}
