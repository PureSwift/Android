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
    
    static var unknown: AndroidBinderError.ErrorCode { .init(STATUS_UNKNOWN_ERROR) } // INT32_MIN value
    
    static var noMemory: AndroidBinderError.ErrorCode { .init(STATUS_NO_MEMORY) }
    
    static var invalidOperation: AndroidBinderError.ErrorCode { .init(STATUS_INVALID_OPERATION) }
    
    static var badValue: AndroidBinderError.ErrorCode { .init(STATUS_BAD_VALUE) }
}

// MARK: - Internal Extensions

internal extension binder_status_t {
    
    func mapError(
        file: StaticString = #file,
        function: StaticString = #function
    ) -> Result<Void, AndroidBinderError> {
        guard self != STATUS_OK else {
            return .success(())
        }
        let errorCode = AndroidBinderError.ErrorCode(rawValue: self)
        let error = AndroidBinderError(errorCode, file: file, function: function)
        return .failure(error)
    }
}
