//
//  Sensor.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if os(Android)
import Android
import CAndroidNDK
#endif

/// A reference to a hardware sensor.
///
/// Sensor instances are vended by `SensorManager` and do not have independent
/// ownership — the underlying pointer is valid for the lifetime of the
/// `SensorManager` that created it.
public struct Sensor: @unchecked Sendable {

    internal let pointer: OpaquePointer

    internal init(_ pointer: OpaquePointer) {
        self.pointer = pointer
    }
}

// MARK: - Properties

public extension Sensor {

    /// The name string of the sensor.
    var name: String {
        guard let cStr = ASensor_getName(pointer) else { return "" }
        return String(cString: cStr)
    }

    /// The vendor string of the sensor.
    var vendor: String {
        guard let cStr = ASensor_getVendor(pointer) else { return "" }
        return String(cString: cStr)
    }

    /// The type of the sensor.
    var type: SensorType {
        SensorType(rawValue: ASensor_getType(pointer))
    }

    /// The resolution of the sensor in the sensor's unit.
    var resolution: Float {
        ASensor_getResolution(pointer)
    }

    /// The minimum delay in microseconds between two events, or 0 if the sensor
    /// reports only when values change.
    var minDelay: Int32 {
        ASensor_getMinDelay(pointer)
    }

    /// The maximum number of events that the hardware FIFO can hold.
    var fifoMaxEventCount: Int32 {
        ASensor_getFifoMaxEventCount(pointer)
    }

    /// The number of events reserved for this sensor in the hardware FIFO.
    var fifoReservedEventCount: Int32 {
        ASensor_getFifoReservedEventCount(pointer)
    }

    /// The type string of the sensor (e.g. `"android.sensor.accelerometer"`).
    var stringType: String? {
        ASensor_getStringType(pointer).map { String(cString: $0) }
    }

    /// The reporting mode of the sensor.
    var reportingMode: SensorReportingMode? {
        SensorReportingMode(rawValue: ASensor_getReportingMode(pointer))
    }

    /// Whether this sensor is a wake-up sensor.
    var isWakeUpSensor: Bool {
        ASensor_isWakeUpSensor(pointer)
    }

    /// The hardware sensor handle, unique within a device.
    @available(Android 29, *)
    var handle: Int32 {
        ASensor_getHandle(pointer)
    }
}

// MARK: - Equatable

extension Sensor: Equatable {

    public static func == (lhs: Sensor, rhs: Sensor) -> Bool {
        lhs.pointer == rhs.pointer
    }
}

// MARK: - Hashable

extension Sensor: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(pointer)
    }
}

// MARK: - CustomStringConvertible

extension Sensor: CustomStringConvertible {

    public var description: String {
        "\(name) (\(vendor))"
    }
}
