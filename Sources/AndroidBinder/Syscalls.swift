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

// Lifecycle (API 29/31)
func AParcel_create() -> OpaquePointer? { stub() }
func AParcel_delete(_ parcel: OpaquePointer) { stub() }

// Position and size (API 29/31)
func AParcel_setDataPosition(_ parcel: OpaquePointer, _ position: Int32) -> binder_status_t { stub() }
func AParcel_getDataPosition(_ parcel: OpaquePointer) -> Int32 { stub() }
func AParcel_getDataSize(_ parcel: OpaquePointer) -> Int32 { stub() }
func AParcel_reset(_ parcel: OpaquePointer) -> binder_status_t { stub() }
func AParcel_appendFrom(_ from: OpaquePointer, _ to: OpaquePointer, _ start: Int32, _ size: Int32) -> binder_status_t { stub() }

// Marshal / unmarshal (API 33)
func AParcel_marshal(_ parcel: OpaquePointer, _ buffer: UnsafeMutablePointer<UInt8>, _ start: Int, _ length: Int) -> binder_status_t { stub() }
func AParcel_unmarshal(_ parcel: OpaquePointer, _ buffer: UnsafePointer<UInt8>, _ length: Int) -> binder_status_t { stub() }

// Scalar writes (API 29)
func AParcel_writeInt32(_ parcel: OpaquePointer, _ value: Int32) -> binder_status_t { stub() }
func AParcel_writeUint32(_ parcel: OpaquePointer, _ value: UInt32) -> binder_status_t { stub() }
func AParcel_writeInt64(_ parcel: OpaquePointer, _ value: Int64) -> binder_status_t { stub() }
func AParcel_writeUint64(_ parcel: OpaquePointer, _ value: UInt64) -> binder_status_t { stub() }
func AParcel_writeFloat(_ parcel: OpaquePointer, _ value: Float) -> binder_status_t { stub() }
func AParcel_writeDouble(_ parcel: OpaquePointer, _ value: Double) -> binder_status_t { stub() }
func AParcel_writeBool(_ parcel: OpaquePointer, _ value: Bool) -> binder_status_t { stub() }
func AParcel_writeChar(_ parcel: OpaquePointer, _ value: UInt16) -> binder_status_t { stub() }
func AParcel_writeByte(_ parcel: OpaquePointer, _ value: Int8) -> binder_status_t { stub() }
func AParcel_writeString(_ parcel: OpaquePointer, _ string: UnsafePointer<CChar>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeStrongBinder(_ parcel: OpaquePointer, _ binder: OpaquePointer?) -> binder_status_t { stub() }
func AParcel_writeParcelFileDescriptor(_ parcel: OpaquePointer, _ fd: Int32) -> binder_status_t { stub() }
func AParcel_writeStatusHeader(_ parcel: OpaquePointer, _ status: OpaquePointer) -> binder_status_t { stub() }

// Scalar reads (API 29)
func AParcel_readInt32(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Int32>) -> binder_status_t { stub() }
func AParcel_readUint32(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<UInt32>) -> binder_status_t { stub() }
func AParcel_readInt64(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Int64>) -> binder_status_t { stub() }
func AParcel_readUint64(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<UInt64>) -> binder_status_t { stub() }
func AParcel_readFloat(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Float>) -> binder_status_t { stub() }
func AParcel_readDouble(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Double>) -> binder_status_t { stub() }
func AParcel_readBool(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Bool>) -> binder_status_t { stub() }
func AParcel_readChar(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<UInt16>) -> binder_status_t { stub() }
func AParcel_readByte(_ parcel: OpaquePointer, _ outValue: UnsafeMutablePointer<Int8>) -> binder_status_t { stub() }
func AParcel_readString(_ parcel: OpaquePointer, _ stringData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>?) -> Bool)?) -> binder_status_t { stub() }
func AParcel_readStrongBinder(_ parcel: OpaquePointer, _ outBinder: UnsafeMutablePointer<OpaquePointer?>) -> binder_status_t { stub() }
func AParcel_readParcelFileDescriptor(_ parcel: OpaquePointer, _ outFd: UnsafeMutablePointer<Int32>) -> binder_status_t { stub() }
func AParcel_readStatusHeader(_ parcel: OpaquePointer, _ outStatus: UnsafeMutablePointer<OpaquePointer?>) -> binder_status_t { stub() }

// Array writes (API 29)
func AParcel_writeByteArray(_ parcel: OpaquePointer, _ arrayData: UnsafePointer<Int8>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeInt32Array(_ parcel: OpaquePointer, _ arrayData: UnsafePointer<Int32>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeUint32Array(_ parcel: OpaquePointer, _ arrayData: UnsafePointer<UInt32>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeInt64Array(_ parcel: OpaquePointer, _ arrayData: UnsafePointer<Int64>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeUint64Array(_ parcel: OpaquePointer, _ arrayData: UnsafePointer<UInt64>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeFloatArray(_ parcel: OpaquePointer, _ arrayData: UnsafePointer<Float>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeDoubleArray(_ parcel: OpaquePointer, _ arrayData: UnsafePointer<Double>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeCharArray(_ parcel: OpaquePointer, _ arrayData: UnsafePointer<UInt16>?, _ length: Int32) -> binder_status_t { stub() }
func AParcel_writeBoolArray(_ parcel: OpaquePointer, _ arrayData: UnsafeRawPointer?, _ length: Int32, _ getter: (@convention(c) (UnsafeRawPointer?, Int32) -> Bool)?) -> binder_status_t { stub() }

// Array reads (API 29) — allocator callback receives (context, length, outBuffer) -> Bool
func AParcel_readByteArray(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>?) -> Bool)?) -> binder_status_t { stub() }
func AParcel_readInt32Array(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<Int32>?>?) -> Bool)?) -> binder_status_t { stub() }
func AParcel_readUint32Array(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<UInt32>?>?) -> Bool)?) -> binder_status_t { stub() }
func AParcel_readInt64Array(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<Int64>?>?) -> Bool)?) -> binder_status_t { stub() }
func AParcel_readUint64Array(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<UInt64>?>?) -> Bool)?) -> binder_status_t { stub() }
func AParcel_readFloatArray(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<Float>?>?) -> Bool)?) -> binder_status_t { stub() }
func AParcel_readDoubleArray(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<Double>?>?) -> Bool)?) -> binder_status_t { stub() }
func AParcel_readCharArray(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32, UnsafeMutablePointer<UnsafeMutablePointer<UInt16>?>?) -> Bool)?) -> binder_status_t { stub() }
// Bool array read uses separate allocator (no outBuffer) and a per-element setter callback
func AParcel_readBoolArray(_ parcel: OpaquePointer, _ arrayData: UnsafeMutableRawPointer?, _ allocator: (@convention(c) (UnsafeMutableRawPointer?, Int32) -> Bool)?, _ setter: (@convention(c) (UnsafeMutableRawPointer?, Int32, Bool) -> Void)?) -> binder_status_t { stub() }

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
