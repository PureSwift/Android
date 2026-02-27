//
//  SensorType.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

/// Android sensor type identifier.
public struct SensorType: RawRepresentable, Equatable, Hashable, Sendable {

    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
}

// MARK: - Constants

public extension SensorType {

    /// Measures the acceleration force in m/s² along x, y, z axes including gravity.
    static var accelerometer: Self { .init(rawValue: 1) }

    /// Measures the ambient geomagnetic field in μT for all three axes.
    static var magneticField: Self { .init(rawValue: 2) }

    /// Measures the orientation of the device in degrees around all three axes.
    static var orientation: Self { .init(rawValue: 3) }

    /// Measures the rate of rotation around x, y, z axes in rad/s.
    static var gyroscope: Self { .init(rawValue: 4) }

    /// Measures the ambient light level (illuminance) in lx.
    static var light: Self { .init(rawValue: 5) }

    /// Measures the ambient air pressure in hPa or mbar.
    static var pressure: Self { .init(rawValue: 6) }

    /// Measures the proximity of an object in cm relative to the viewing screen.
    static var proximity: Self { .init(rawValue: 8) }

    /// Measures the force of gravity in m/s² along x, y, z axes.
    static var gravity: Self { .init(rawValue: 9) }

    /// Measures the acceleration force in m/s² along x, y, z axes, excluding gravity.
    static var linearAcceleration: Self { .init(rawValue: 10) }

    /// Measures the orientation of the device as a combination of angle and axis.
    static var rotationVector: Self { .init(rawValue: 11) }

    /// Measures the relative ambient humidity in percent.
    static var relativeHumidity: Self { .init(rawValue: 12) }

    /// Measures the ambient air temperature in °C.
    static var ambientTemperature: Self { .init(rawValue: 13) }

    /// Measures the geomagnetic field for all three axes without hard iron calibration.
    static var magneticFieldUncalibrated: Self { .init(rawValue: 14) }

    /// Measures the rotation vector without the geomagnetic field component.
    static var gameRotationVector: Self { .init(rawValue: 15) }

    /// Measures the rate of rotation around each axis without drift compensation.
    static var gyroscopeUncalibrated: Self { .init(rawValue: 16) }

    /// Triggers an event each time a significant motion is detected.
    static var significantMotion: Self { .init(rawValue: 17) }

    /// Triggers an event each time a step is detected.
    static var stepDetector: Self { .init(rawValue: 18) }

    /// Reports the cumulative number of steps taken since the last reboot.
    static var stepCounter: Self { .init(rawValue: 19) }

    /// Measures the rotation vector based on the geomagnetic field and accelerometer.
    static var geomagneticRotationVector: Self { .init(rawValue: 20) }

    /// Measures the heart rate in beats per minute.
    static var heartRate: Self { .init(rawValue: 21) }

    /// Measures the pose of the device (rotation + translation) as a 6DoF value.
    static var pose6DOF: Self { .init(rawValue: 28) }

    /// Triggers an event when the device is stationary.
    static var stationaryDetect: Self { .init(rawValue: 29) }

    /// Triggers an event when the device starts moving.
    static var motionDetect: Self { .init(rawValue: 30) }

    /// Triggers an event each heartbeat.
    static var heartBeat: Self { .init(rawValue: 31) }

    /// Reports newly connected or disconnected dynamic sensors.
    static var dynamicSensorMeta: Self { .init(rawValue: 32) }

    /// Reports additional sensor information.
    static var additionalInfo: Self { .init(rawValue: 33) }

    /// Reports when the device transitions between on-body and off-body.
    static var lowLatencyOffbodyDetect: Self { .init(rawValue: 34) }

    /// Measures acceleration on all three axes without calibration.
    static var accelerometerUncalibrated: Self { .init(rawValue: 35) }

    /// Measures the hinge angle between two integral parts of the device.
    static var hingeAngle: Self { .init(rawValue: 36) }

    /// Tracks head orientation and motion.
    static var headTracker: Self { .init(rawValue: 37) }

    /// Measures acceleration along a subset of axes.
    static var accelerationLimitedAxes: Self { .init(rawValue: 38) }

    /// Measures rotation along a subset of axes.
    static var gyroscopeLimitedAxes: Self { .init(rawValue: 39) }

    /// Measures acceleration along a subset of axes without calibration.
    static var accelerationLimitedAxesUncalibrated: Self { .init(rawValue: 40) }

    /// Measures rotation along a subset of axes without calibration.
    static var gyroscopeLimitedAxesUncalibrated: Self { .init(rawValue: 41) }

    /// Measures the user's heading in degrees relative to magnetic north.
    static var heading: Self { .init(rawValue: 42) }
}

// MARK: - Supporting Types

/// The accuracy of a sensor measurement.
public enum SensorAccuracy: Int32, Sendable {

    /// The values returned are unreliable.
    case minimum = 0

    /// The sensor has low accuracy.
    case low = 1

    /// The sensor has medium accuracy.
    case medium = 2

    /// The sensor has maximum accuracy.
    case high = 3
}

/// Describes how a sensor reports data.
public enum SensorReportingMode: Int32, Sendable {

    /// Reports data continuously at a requested rate.
    case continuous = 0

    /// Reports data only when values change.
    case onChange = 1

    /// Reports a single data sample and then disables itself.
    case oneShot = 2

    /// Reports data in a mode specific to the sensor type.
    case special = 3
}

/// Standard sensor sampling delays.
public enum SensorDelay {

    /// Rate suited for the user interface (200ms).
    public static var normal: Int32 { 200_000 }

    /// Rate suited for UI (60ms).
    public static var ui: Int32 { 60_000 }

    /// Rate suited for games (20ms).
    public static var game: Int32 { 20_000 }

    /// Fastest rate supported by the sensor.
    public static var fastest: Int32 { 0 }
}
