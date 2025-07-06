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

#endif
