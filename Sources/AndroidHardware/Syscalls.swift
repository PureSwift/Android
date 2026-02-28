//
//  Syscalls.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

#if !os(Android)

func stub() -> Never {
    fatalError("Not running on Android")
}

public typealias ALooper_callbackFunc = @convention(c) (Int32, Int32, UnsafeMutableRawPointer?) -> Int32

// MARK: - ASensorEvent

/**
 * A sensor event payload.
 *
 * This struct must match the C layout of ASensorEvent exactly.
 * Total size: 104 bytes on all supported Android ABI targets.
 *   version(4) + sensor(4) + type(4) + reserved0(4) +
 *   timestamp(8) + data_union(64) + flags(4) + reserved1(12)
 */
public struct ASensorEvent: Sendable {
    public var version: Int32       // sizeof(struct ASensorEvent)
    public var sensor: Int32        // sensor identifier
    public var type: Int32          // sensor type
    public var reserved0: Int32
    public var timestamp: Int64     // nanoseconds
    // Data union: largest member is float[16] = 64 bytes.
    // Represented here as eight UInt64 to keep the layout correct
    // without needing to replicate the full C union hierarchy.
    internal var _data: (UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64)
    public var flags: UInt32
    internal var _reserved1: (Int32, Int32, Int32)

    public init() {
        version = 0; sensor = 0; type = 0; reserved0 = 0; timestamp = 0
        _data = (0, 0, 0, 0, 0, 0, 0, 0)
        flags = 0; _reserved1 = (0, 0, 0)
    }
}

// MARK: - ASensorManager

func ASensorManager_getInstanceForPackage(_ packageName: UnsafePointer<CChar>?) -> OpaquePointer? { stub() }
func ASensorManager_getSensorList(_ manager: OpaquePointer, _ list: UnsafeMutablePointer<UnsafePointer<OpaquePointer?>?>) -> Int32 { stub() }
func ASensorManager_getDefaultSensor(_ manager: OpaquePointer, _ type: Int32) -> OpaquePointer? { stub() }
func ASensorManager_getDefaultSensorEx(_ manager: OpaquePointer, _ type: Int32, _ wakeUp: Bool) -> OpaquePointer? { stub() }
func ASensorManager_createEventQueue(_ manager: OpaquePointer, _ looper: OpaquePointer, _ ident: Int32, _ callback: ALooper_callbackFunc?, _ data: UnsafeMutableRawPointer?) -> OpaquePointer? { stub() }
func ASensorManager_destroyEventQueue(_ manager: OpaquePointer, _ queue: OpaquePointer) -> Int32 { stub() }

// MARK: - ASensor

func ASensor_getName(_ sensor: OpaquePointer) -> UnsafePointer<CChar>? { stub() }
func ASensor_getVendor(_ sensor: OpaquePointer) -> UnsafePointer<CChar>? { stub() }
func ASensor_getType(_ sensor: OpaquePointer) -> Int32 { stub() }
func ASensor_getResolution(_ sensor: OpaquePointer) -> Float { stub() }
func ASensor_getMinDelay(_ sensor: OpaquePointer) -> Int32 { stub() }
func ASensor_getFifoMaxEventCount(_ sensor: OpaquePointer) -> Int32 { stub() }
func ASensor_getFifoReservedEventCount(_ sensor: OpaquePointer) -> Int32 { stub() }
func ASensor_getStringType(_ sensor: OpaquePointer) -> UnsafePointer<CChar>? { stub() }
func ASensor_getReportingMode(_ sensor: OpaquePointer) -> Int32 { stub() }
func ASensor_isWakeUpSensor(_ sensor: OpaquePointer) -> Bool { stub() }
func ASensor_getHandle(_ sensor: OpaquePointer) -> Int32 { stub() }

// MARK: - ASensorEventQueue

func ASensorEventQueue_registerSensor(_ queue: OpaquePointer, _ sensor: OpaquePointer, _ samplingPeriodUs: Int32, _ maxBatchReportLatencyUs: Int64) -> Int32 { stub() }
func ASensorEventQueue_enableSensor(_ queue: OpaquePointer, _ sensor: OpaquePointer) -> Int32 { stub() }
func ASensorEventQueue_disableSensor(_ queue: OpaquePointer, _ sensor: OpaquePointer) -> Int32 { stub() }
func ASensorEventQueue_setEventRate(_ queue: OpaquePointer, _ sensor: OpaquePointer, _ usec: Int32) -> Int32 { stub() }
func ASensorEventQueue_hasEvents(_ queue: OpaquePointer) -> Int32 { stub() }
func ASensorEventQueue_getEvents(_ queue: OpaquePointer, _ events: UnsafeMutablePointer<ASensorEvent>, _ count: Int) -> Int { stub() }
func ASensorEventQueue_requestAdditionalInfoEvents(_ queue: OpaquePointer, _ enable: Bool) -> Int32 { stub() }

#endif
