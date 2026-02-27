//
//  Permission+Check.swift
//  AndroidKit
//
//  Created by Alsey Coleman Miller on 2/26/26.
//

#if os(Android)
import Android
import AndroidNDK
#elseif canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif
import SystemPackage

public extension Permission {

    /// Result of `APermissionManager_checkPermission`.
    enum CheckStatus: Sendable, Equatable {
        /// Permission is granted (`0`).
        case granted
        /// Permission is denied (`-1`).
        case denied
        /// Any other platform-specific status code.
        case unknown(Int32)
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
    func check(
        pid: pid_t = getpid(),
        uid: uid_t = getuid()
    ) -> CheckStatus {
        let result: Int32
        #if os(Android)
        result = rawValue.withCString {
            APermissionManager_checkPermission($0, pid, uid)
        }
        #else
        result = -1
        #endif
        switch result {
        case 0:
            return .granted
        case -1:
            return .denied
        default:
            return .unknown(result)
        }
    }

    /// Returns `true` when this permission is granted for the current process.
    var isGranted: Bool {
        check() == .granted
    }
}
