//
//  Constants.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if !os(Android)

var STATUS_OK: Int32 { 0 }
var STATUS_UNKNOWN_ERROR: Int32 { stub() }
var STATUS_NO_MEMORY: Int32 { stub() }
var STATUS_INVALID_OPERATION: Int32 { stub() }
var STATUS_BAD_VALUE: Int32 { stub() }
var STATUS_BAD_TYPE: Int32 { stub() }
var STATUS_NAME_NOT_FOUND: Int32 { stub() }
var STATUS_PERMISSION_DENIED: Int32 { stub() }
var STATUS_NO_INIT: Int32 { stub() }
var STATUS_ALREADY_EXISTS: Int32 { stub() }
var STATUS_DEAD_OBJECT: Int32 { stub() }
var STATUS_FAILED_TRANSACTION: Int32 { stub() }
var STATUS_BAD_INDEX: Int32 { stub() }
var STATUS_NOT_ENOUGH_DATA: Int32 { stub() }
var STATUS_WOULD_BLOCK: Int32 { stub() }
var STATUS_TIMED_OUT: Int32 { stub() }
var STATUS_UNKNOWN_TRANSACTION: Int32 { stub() }
var STATUS_FDS_NOT_ALLOWED: Int32 { stub() }
var STATUS_UNEXPECTED_NULL: Int32 { stub() }

var EX_NONE: Int32 { 0 }
var EX_SECURITY: Int32 { stub() }
var EX_BAD_PARCELABLE: Int32 { stub() }
var EX_ILLEGAL_ARGUMENT: Int32 { stub() }
var EX_NULL_POINTER: Int32 { stub() }
var EX_ILLEGAL_STATE: Int32 { stub() }
var EX_NETWORK_MAIN_THREAD: Int32 { stub() }
var EX_UNSUPPORTED_OPERATION: Int32 { stub() }
var EX_SERVICE_SPECIFIC: Int32 { stub() }
var EX_PARCELABLE: Int32 { stub() }
var EX_TRANSACTION_FAILED: Int32 { stub() }

#endif
