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

#if !os(Android)

func stub() -> Never {
    fatalError("Not running on Android JVM")
}

// MARK: - Binder

func AIBinder_new(_ clazz: OpaquePointer, _ args: UnsafeRawPointer?) { stub() }
func AIBinder_decStrong(_ binder: OpaquePointer) { stub() }
func AIBinder_incStrong(_ binder: OpaquePointer) { stub() }
func AIBinder_associateClass(_ binder: OpaquePointer, _ binderClass: UnsafeRawPointer) -> binder_status_t { stub() }
func AIBinder_getClass(_ binder: OpaquePointer) -> UnsafeRawPointer? { stub() }
func AIBinder_prepareTransaction(_ binder: OpaquePointer) -> OpaquePointer { stub() }
func AIBinder_transact(_ binder: OpaquePointer, _ transactionCode: Int32, _ inParcel: OpaquePointer, _ outParcel: OpaquePointer?, _ flags: UInt32) -> binder_status_t { stub() }
func AIBinder_setExtension(_ binder: OpaquePointer, _ extensionBinder: OpaquePointer) -> binder_status_t { stub() }
func AIBinder_isRemote(_ binder: OpaquePointer) -> Bool { stub() }
func AIBinder_isAlive(_ binder: OpaquePointer) -> Bool { stub() }
func AIBinder_dump(_ binder: OpaquePointer, _ fd: Int32, _ args: UnsafePointer<UnsafePointer<CChar>?>?, _ numArgs: UInt32) -> binder_status_t { stub() }
func AIBinder_ping(_ binder: OpaquePointer) -> binder_status_t { stub() }
func AIBinder_linkToDeath(_ binder: OpaquePointer, _ recipient: UnsafeMutablePointer<OpaquePointer>?, _ cookie: UnsafeMutableRawPointer?) -> binder_status_t { stub() }
func AIBinder_unlinkToDeath(_ binder: OpaquePointer, _ recipient: UnsafeMutablePointer<OpaquePointer>?, _ cookie: UnsafeMutableRawPointer?) -> binder_status_t { stub() }
func AIBinder_weakRefs(_ binder: OpaquePointer) -> UnsafeMutableRawPointer? { stub() }
func AIBinder_getCallingUid() -> uid_t { stub() }
func AIBinder_getCallingPid() -> pid_t { stub() }
func AIBinder_isHandlingTransaction() -> Bool { stub() }
func AIBinder_debugGetRefCount(_ binder: OpaquePointer) -> Int32 { stub() }

// MARK: - Parcel

func AParcel_create() -> OpaquePointer? { stub() }
func AParcel_delete(_ parcel: OpaquePointer) { stub() }
func AParcel_setDataPosition(_ parcel: OpaquePointer, _ position: Int32) -> binder_status_t { stub() }
func AParcel_getDataPosition(_ parcel: OpaquePointer) -> Int32 { stub() }
func AParcel_writeInt32(_ parcel: OpaquePointer, _ value: Int32) -> binder_status_t { stub() }
func AParcel_writeBool(_ parcel: OpaquePointer, _ value: Bool) -> binder_status_t { stub() }
func AParcel_writeFloat(_ parcel: OpaquePointer, _ value: Float) -> binder_status_t { stub() }
func AParcel_writeDouble(_ parcel: OpaquePointer, _ value: Double) -> binder_status_t { stub() }
func AParcel_writeString(_ parcel: OpaquePointer, _ string: UnsafePointer<CChar>?) -> binder_status_t { stub() }
func AParcel_writeParcelable(_ parcel: OpaquePointer, _ parcelable: OpaquePointer) -> binder_status_t { stub() }
func AParcel_marshal(_ parcel: OpaquePointer, _ buffer: UnsafeMutablePointer<UInt8>, _ offset: UInt32, _ length: UInt32) -> binder_status_t { stub() }
func AParcel_unmarshal(_ parcel: OpaquePointer, _ buffer: UnsafePointer<UInt8>, _ length: UInt32) -> binder_status_t { stub() }
func AParcel_getDataSize(_ parcel: OpaquePointer) -> Int32 { stub() }
func AParcel_readInt32(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Int32>) -> binder_status_t { stub() }
func AParcel_readBool(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Bool>) -> binder_status_t { stub() }
func AParcel_readFloat(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Float>) -> binder_status_t { stub() }
func AParcel_readDouble(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Double>) -> binder_status_t { stub() }
func AParcel_readString(_ parcel: OpaquePointer, _ outString: UnsafeMutablePointer<UnsafePointer<CChar>?>) -> binder_status_t { stub() }
func AParcel_readParcelable(_ parcel: OpaquePointer, _ outParcelable: UnsafeMutablePointer<OpaquePointer?>) -> binder_status_t { stub() }

// MARK: - Status

func AStatus_delete(_ pointer: OpaquePointer) { stub() }
func AStatus_newOk() -> OpaquePointer? { stub() }
func AStatus_fromExceptionCode(_ code: binder_exception_t) -> OpaquePointer? { stub() }
func AStatus_fromExceptionCodeWithMessage(_ code: binder_exception_t, _ message: UnsafePointer<CChar>?) -> OpaquePointer? { stub() }
func AStatus_fromServiceSpecificError(_ error: Int32) -> OpaquePointer? { stub() }
func AStatus_fromServiceSpecificErrorWithMessage(_ error: Int32, _ message: UnsafePointer<CChar>?) -> OpaquePointer? { stub() }
func AStatus_fromStatus(_ status: binder_status_t) -> OpaquePointer? { stub() }
func AStatus_isOk(_ pointer: OpaquePointer) -> Bool { stub() }
func AStatus_getExceptionCode(_ pointer: OpaquePointer) -> binder_exception_t { stub() }
func AStatus_getServiceSpecificError(_ pointer: OpaquePointer) -> Int32 { stub() }
func AStatus_getStatus(_ pointer: OpaquePointer) -> binder_status_t { stub() }
func AStatus_getMessage(_ pointer: OpaquePointer) -> UnsafePointer<CChar>? { stub() }
func AStatus_getDescription(_ pointer: OpaquePointer) -> UnsafePointer<CChar>? { stub() }
func AStatus_deleteDescription(_ pointer: UnsafePointer<CChar>) { stub() }

#endif
