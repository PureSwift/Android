//
//  Syscalls.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if !os(Android)

func stub() -> Never {
    fatalError("Not running on Android JVM")
}

func AParcel_delete(_ pointer: OpaquePointer) { stub() }
func AParcel_setDataPosition(_ pointer: OpaquePointer, _ position: Int32) -> binder_status_t { stub() }
func AParcel_getDataPosition(_ pointer: OpaquePointer) -> Int32 { stub() }
func AParcel_writeInt32(_ pointer: OpaquePointer, _ value: Int32) -> binder_status_t { stub() }
func AParcel_marshal(_ pointer: OpaquePointer, _ buffer: UnsafeMutablePointer<UInt8>, _ start: UInt32, _ len: UInt32) -> binder_status_t { stub() }
func AParcel_unmarshal(_ pointer: OpaquePointer, _ buffer: UnsafePointer<UInt8>, _ len: UInt32) -> binder_status_t { stub() }

func AStatus_delete(_ pointer: OpaquePointer) { stub() }
func AStatus_newOk() -> OpaquePointer { stub() }
func AStatus_fromExceptionCode(_ code: binder_exception_t) -> OpaquePointer { stub() }
func AStatus_fromExceptionCodeWithMessage(_ code: binder_exception_t, _ message: UnsafePointer<CChar>?) -> OpaquePointer { stub() }
func AStatus_fromServiceSpecificError(_ error: Int32) -> OpaquePointer { stub() }
func AStatus_fromServiceSpecificErrorWithMessage(_ error: Int32, _ message: UnsafePointer<CChar>?) -> OpaquePointer { stub() }
func AStatus_fromStatus(_ status: binder_status_t) -> OpaquePointer { stub() }
func AStatus_isOk(_ pointer: OpaquePointer) -> Bool { stub() }
func AStatus_getExceptionCode(_ pointer: OpaquePointer) -> binder_exception_t { stub() }
func AStatus_getServiceSpecificError(_ pointer: OpaquePointer) -> Int32 { stub() }
func AStatus_getStatus(_ pointer: OpaquePointer) -> binder_status_t { stub() }
func AStatus_getMessage(_ pointer: OpaquePointer) -> UnsafePointer<CChar> { stub() }
func AStatus_getDescription(_ pointer: OpaquePointer) -> UnsafePointer<CChar> { stub() }
func AStatus_deleteDescription(_ pointer: UnsafePointer<CChar>) { stub() }


#endif
