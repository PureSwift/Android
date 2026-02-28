//
//  Permission+Check.swift
//  AndroidKit
//
//  Created by Alsey Coleman Miller on 2/26/26.
//

#if os(Android)
import Android
import CAndroidNDK
#elseif canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

public extension Permission {

    /// Permission State
    enum CheckStatus: Int32, Sendable, Equatable {
        
        /// Permission is granted (`0`).
        case granted = 0
        
        /// Permission is denied (`-1`).
        case denied = -1
    }
    
    enum Error: Int32, Swift.Error {
        
        /**
         This is returned if the permission check encountered an unspecified error.

         The output result is unmodified.
         */
        case unknown = -1
        
        /**
         This is returned if the permission check failed because the service is unavailable.

         The output result is unmodified.
         */
        case serviceUnavailable = -2
    }
}

public extension Permission {
    
    /// Checks this permission for a specific process/user pair using
    /// `APermissionManager_checkPermission`.
    ///
    /// - Parameters:
    ///   - pid: Process ID to evaluate. Defaults to the current process ID.
    ///   - uid: User ID to evaluate. Defaults to the current user ID.
    /// - Returns: Permission check status.
    @available(Android 31, *)
    func check(
        pid: pid_t = getpid(),
        uid: uid_t = getuid()
    ) throws(Permission.Error) -> CheckStatus {
        try _check(pid: pid, uid: uid).get()
    }
    
    /// Checks this permission for a specific process/user pair using
    /// `APermissionManager_checkPermission`.
    ///
    /// - Parameters:
    ///   - pid: Process ID to evaluate. Defaults to the current process ID.
    ///   - uid: User ID to evaluate. Defaults to the current user ID.
    /// - Returns: Permission check status.
    @available(Android 31, *)
    internal func _check(
        pid: pid_t = getpid(),
        uid: uid_t = getuid()
    ) -> Result<CheckStatus, Error> {
        var result: Int32 = -1
        let returnCode: Int32
        #if os(Android)
        returnCode = rawValue.withCString {
            APermissionManager_checkPermission($0, pid, uid, &result)
        }
        #else
        returnCode = -1
        #endif
        guard returnCode != 0, let status = CheckStatus(rawValue: result) else {
            return .failure(.init(rawValue: returnCode) ?? .unknown)
        }
        return .success(status)
    }

    /// Returns `true` when this permission is granted for the current process.
    @available(Android 31, *)
    var isGranted: Bool {
        let status = _check()
        switch status {
        case .success(.granted):
            return true
        default:
            return false
        }
    }
}
