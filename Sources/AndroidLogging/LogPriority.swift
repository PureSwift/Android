//
//  LogPriority.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/14/25.
//

#if canImport(Android)
import Android
#endif

/// Android Log Priority
public enum LogPriority: Equatable, Hashable, CaseIterable, Sendable {
    
    /**
     Debug logging.

     Should typically be disabled for a release apk.
     */
    case debug
    
    /**
     The default priority, for internal use only.
     */
    case `default`
    
    /**
     Error logging.

     For use with unrecoverable failures.
     */
    case error
    
    /**
     Fatal logging.

     For use when aborting.
     */
    case fatal
    
    /**
     Informational logging.

     Should typically be disabled for a release apk.
     */
    case info
    
    /**
     For internal use only.
     */
    case silent
    
    /**
     For internal use only.
     */
    case unknown
    
    /**
     Verbose logging.

     Should typically be disabled for a release apk.
     */
    case verbose
    
    /**
     Warning logging.

     For use with recoverable failures.
     */
    case warning
}

#if canImport(Android)
internal typealias CLogPriority = android_LogPriority

internal extension CLogPriority {
    
    init(_ priority: LogPriority) {
        switch priority {
        case .debug:
            self = ANDROID_LOG_DEBUG
        case .default:
            self = ANDROID_LOG_DEFAULT
        case .error:
            self = ANDROID_LOG_ERROR
        case .fatal:
            self = ANDROID_LOG_FATAL
        case .info:
            self = ANDROID_LOG_INFO
        case .silent:
            self = ANDROID_LOG_SILENT
        case .unknown:
            self = ANDROID_LOG_UNKNOWN
        case .verbose:
            self = ANDROID_LOG_VERBOSE
        case .warning:
            self = ANDROID_LOG_WARN
        }
    }
}
#endif
