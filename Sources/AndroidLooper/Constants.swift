//
//  Constants.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if !os(Android)

import CoreFoundation

typealias AVsyncId = Int64

typealias AChoreographer_frameCallback = @convention(c) (Int, UnsafeMutableRawPointer?) -> Void
typealias AChoreographer_frameCallback64 = @convention(c) (Int64, UnsafeMutableRawPointer?) -> Void
typealias AChoreographer_vsyncCallback = @convention(c) (UnsafePointer<OpaquePointer>?, UnsafeMutableRawPointer?) -> Void
typealias AChoreographer_refreshRateCallback = @convention(c) (Int64, UnsafeMutableRawPointer?) -> Void

var ALOOPER_PREPARE_ALLOW_NON_CALLBACKS: Int32 { stub() }

var ALOOPER_EVENT_INPUT: Int32 { stub() }
var ALOOPER_EVENT_OUTPUT: Int32 { stub() }
var ALOOPER_EVENT_ERROR: Int32 { stub() }
var ALOOPER_EVENT_HANGUP: Int32 { stub() }
var ALOOPER_EVENT_INVALID: Int32 { stub() }

var ALOOPER_POLL_WAKE: Int { stub() }
var ALOOPER_POLL_CALLBACK: Int { stub() }
var ALOOPER_POLL_TIMEOUT: Int { stub() }
var ALOOPER_POLL_ERROR: Int { stub() }

// renamed on Darwin
var kCFRunLoopDefaultMode: CFRunLoopMode { .defaultMode }

#endif
