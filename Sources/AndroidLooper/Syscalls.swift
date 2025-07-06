//
//  Syscalls.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//


#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Gblic
#endif

import Dispatch

// MARK: - Dispatch

// https://github.com/apple-oss-distributions/libdispatch/blob/bd82a60ee6a73b4eca50af028b48643d51aaf1ea/src/queue.c#L8237
// https://forums.swift.org/t/main-dispatch-queue-in-linux-sdl-app/31708/3
@_silgen_name("_dispatch_main_queue_callback_4CF")
func _dispatch_main_queue_callback_4CF()

@_silgen_name("_dispatch_get_main_queue_port_4CF")
func _dispatch_get_main_queue_port_4CF() -> Int32

#if !os(Android)

func stub() -> Never {
    fatalError("Not running on Android JVM")
}

// MARK: - Looper

func ALooper_forThread() -> OpaquePointer? { stub() }

func ALooper_prepare(_ opts: Int32) -> OpaquePointer? { stub() }

func ALooper_acquire(_ looper: OpaquePointer) { stub() }

func ALooper_release(_ looper: OpaquePointer) { stub() }

func ALooper_wake(_ looper: OpaquePointer) { stub() }

func ALooper_pollOnce(
    _ timeoutMillis: Int32,
    _ outFd: UnsafeMutablePointer<Int32>?,
    _ outEvents: UnsafeMutablePointer<Int32>?,
    _ outData: UnsafeMutablePointer<UnsafeMutableRawPointer?>?
) -> Int32 { stub() }

func ALooper_pollAll(
    _ timeoutMillis: Int32,
    _ outFd: UnsafeMutablePointer<Int32>?,
    _ outEvents: UnsafeMutablePointer<Int32>?,
    _ outData: UnsafeMutablePointer<UnsafeMutableRawPointer?>?
) -> Int32 { stub() }

public typealias ALooper_callbackFunc = @convention(c) (
    Int32, Int32, UnsafeMutableRawPointer?
) -> Int32

func ALooper_addFd(
    _ looper: OpaquePointer,
    _ fd: Int32,
    _ ident: Int32,
    _ events: Int32,
    _ callback: ALooper_callbackFunc?,
    _ data: UnsafeMutableRawPointer?
) -> Int32 { stub() }

func ALooper_removeFd(
    _ looper: OpaquePointer,
    _ fd: Int32
) -> Int32 { stub() }

// MARK: - Choreographer

func AChoreographer_getInstance() -> OpaquePointer? { stub() }

func AChoreographer_postFrameCallback(
    _ choreographer: OpaquePointer,
    _ callback: @escaping AChoreographer_frameCallback,
    _ data: UnsafeMutableRawPointer?
) { stub() }

func AChoreographer_postFrameCallbackDelayed(
    _ choreographer: OpaquePointer,
    _ callback: @escaping AChoreographer_frameCallback,
    _ data: UnsafeMutableRawPointer?,
    _ delayMillis: Int
) { stub() }

func AChoreographer_postFrameCallback64(
    _ choreographer: OpaquePointer,
    _ callback: @escaping AChoreographer_frameCallback64,
    _ data: UnsafeMutableRawPointer?
) { stub() }

func AChoreographer_postFrameCallbackDelayed64(
    _ choreographer: OpaquePointer,
    _ callback: @escaping AChoreographer_frameCallback64,
    _ data: UnsafeMutableRawPointer?,
    _ delayMillis: UInt32
) { stub() }

func AChoreographer_postVsyncCallback(
    _ choreographer: OpaquePointer,
    _ callback: @escaping AChoreographer_vsyncCallback,
    _ data: UnsafeMutableRawPointer?
) { stub() }

func AChoreographer_registerRefreshRateCallback(
    _ choreographer: OpaquePointer,
    _ callback: @escaping AChoreographer_refreshRateCallback,
    _ data: UnsafeMutableRawPointer?
) { stub() }

func AChoreographer_unregisterRefreshRateCallback(
    _ choreographer: OpaquePointer,
    _ callback: @escaping AChoreographer_refreshRateCallback,
    _ data: UnsafeMutableRawPointer?
) { stub() }

func AChoreographerFrameCallbackData_getFrameTimeNanos(
    _ data: OpaquePointer
) -> Int64 { stub() }

func AChoreographerFrameCallbackData_getFrameTimelinesLength(
    _ data: OpaquePointer
) -> Int { stub() }

func AChoreographerFrameCallbackData_getPreferredFrameTimelineIndex(
    _ data: OpaquePointer
) -> Int { stub() }

func AChoreographerFrameCallbackData_getFrameTimelineVsyncId(
    _ data: OpaquePointer,
    _ index: Int
) -> AVsyncId { stub() }

func AChoreographerFrameCallbackData_getFrameTimelineExpectedPresentationTimeNanos(
    _ data: OpaquePointer,
    _ index: Int
) -> Int64 { stub() }

func AChoreographerFrameCallbackData_getFrameTimelineDeadlineNanos(
    _ data: OpaquePointer,
    _ index: Int
) -> Int64 { stub() }

#endif
