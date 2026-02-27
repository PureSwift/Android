//
//  SensorEvent.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

/// A sensor event containing a measurement from a hardware sensor.
public struct SensorEvent: Sendable {

    private let raw: ASensorEvent

    internal init(_ raw: ASensorEvent) {
        self.raw = raw
    }
}

// MARK: - Properties

public extension SensorEvent {

    /// The sensor identifier (matches `Sensor.handle`).
    var sensor: Int32 { raw.sensor }

    /// The sensor type.
    var type: SensorType { SensorType(rawValue: raw.type) }

    /// The time at which the event occurred, in nanoseconds since boot.
    var timestamp: Int64 { raw.timestamp }

    /// Raw floating-point data values (up to 16 floats).
    ///
    /// The layout depends on `type`. For most sensors the relevant values
    /// are in the first 3 elements (x, y, z).
    var data: [Float] {
        withUnsafeBytes(of: raw._data) { bytes in
            Array(bytes.bindMemory(to: Float.self))
        }
    }
}

// MARK: - Convenience Accessors

public extension SensorEvent {

    /// Acceleration vector in m/s² (x, y, z) — valid for `.accelerometer`,
    /// `.linearAcceleration`, and `.gravity` events.
    var acceleration: (x: Float, y: Float, z: Float) {
        withUnsafeBytes(of: raw._data) { bytes in
            let f = bytes.bindMemory(to: Float.self)
            return (f[0], f[1], f[2])
        }
    }

    /// Rotation rate in rad/s (x, y, z) — valid for `.gyroscope` events.
    var angularVelocity: (x: Float, y: Float, z: Float) {
        withUnsafeBytes(of: raw._data) { bytes in
            let f = bytes.bindMemory(to: Float.self)
            return (f[0], f[1], f[2])
        }
    }

    /// Magnetic field in μT (x, y, z) — valid for `.magneticField` events.
    var magneticField: (x: Float, y: Float, z: Float) {
        withUnsafeBytes(of: raw._data) { bytes in
            let f = bytes.bindMemory(to: Float.self)
            return (f[0], f[1], f[2])
        }
    }

    /// Rotation vector (x, y, z, w) — valid for `.rotationVector` and
    /// related events.
    var rotationVector: (x: Float, y: Float, z: Float, w: Float) {
        withUnsafeBytes(of: raw._data) { bytes in
            let f = bytes.bindMemory(to: Float.self)
            return (f[0], f[1], f[2], f[3])
        }
    }

    /// Illuminance in lx — valid for `.light` events.
    var light: Float {
        withUnsafeBytes(of: raw._data) { $0.bindMemory(to: Float.self)[0] }
    }

    /// Distance in cm — valid for `.proximity` events.
    var distance: Float {
        withUnsafeBytes(of: raw._data) { $0.bindMemory(to: Float.self)[0] }
    }

    /// Temperature in °C — valid for `.ambientTemperature` events.
    var temperature: Float {
        withUnsafeBytes(of: raw._data) { $0.bindMemory(to: Float.self)[0] }
    }

    /// Pressure in hPa — valid for `.pressure` events.
    var pressure: Float {
        withUnsafeBytes(of: raw._data) { $0.bindMemory(to: Float.self)[0] }
    }

    /// Relative humidity as a percentage — valid for `.relativeHumidity` events.
    var relativeHumidity: Float {
        withUnsafeBytes(of: raw._data) { $0.bindMemory(to: Float.self)[0] }
    }

    /// Cumulative step count since last reboot — valid for `.stepCounter` events.
    var stepCount: UInt64 {
        withUnsafeBytes(of: raw._data) { $0.bindMemory(to: UInt64.self)[0] }
    }

    /// Hinge angle in degrees — valid for `.hingeAngle` events.
    var hingeAngle: Float {
        withUnsafeBytes(of: raw._data) { $0.bindMemory(to: Float.self)[0] }
    }
}
