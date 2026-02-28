//
//  SensorEventQueue.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if os(Android)
import Android
import CAndroidNDK
#endif

/// An event queue for receiving sensor events.
///
/// Create via `SensorManager.createEventQueue(looper:)`.
/// The queue is automatically destroyed when this value is deinitialized.
public struct SensorEventQueue: ~Copyable {

    internal let queue: OpaquePointer

    /// Retained to call `ASensorManager_destroyEventQueue` on deinit.
    internal let manager: OpaquePointer

    internal init(queue: OpaquePointer, manager: OpaquePointer) {
        self.queue = queue
        self.manager = manager
    }

    deinit {
        ASensorManager_destroyEventQueue(manager, queue)
    }
}

// MARK: - Methods

public extension SensorEventQueue {

    /// Enables the sensor at the default sampling rate.
    ///
    /// Prefer ``register(_:samplingPeriod:maxReportLatency:)`` for more control.
    func enable(_ sensor: Sensor) throws(AndroidSensorError) {
        let result = ASensorEventQueue_enableSensor(queue, sensor.pointer)
        guard result >= 0 else {
            throw .enableSensor(result)
        }
    }

    /// Disables the sensor so it no longer posts events to this queue.
    func disable(_ sensor: Sensor) throws(AndroidSensorError) {
        let result = ASensorEventQueue_disableSensor(queue, sensor.pointer)
        guard result >= 0 else {
            throw .disableSensor(result)
        }
    }

    /// Registers a sensor with this queue, enabling it and setting the desired
    /// sampling period and batch latency.
    ///
    /// - Parameters:
    ///   - sensor: The sensor to register.
    ///   - samplingPeriod: Desired sampling period in microseconds.
    ///     Use `SensorDelay.normal`, `.game`, `.ui`, or `.fastest` as starting points.
    ///   - maxReportLatency: Maximum delay in microseconds before an event must be
    ///     reported. Pass `0` to disable batching.
    func register(
        _ sensor: Sensor,
        samplingPeriod: Int32 = SensorDelay.normal,
        maxReportLatency: Int64 = 0
    ) throws(AndroidSensorError) {
        let result = ASensorEventQueue_registerSensor(
            queue, sensor.pointer, samplingPeriod, maxReportLatency
        )
        guard result >= 0 else {
            throw .registerSensor(result)
        }
    }

    /// Sets the delivery rate for a sensor that is already registered.
    ///
    /// - Parameters:
    ///   - sensor: The registered sensor.
    ///   - usec: Desired event interval in microseconds.
    func setEventRate(for sensor: Sensor, usec: Int32) throws(AndroidSensorError) {
        let result = ASensorEventQueue_setEventRate(queue, sensor.pointer, usec)
        guard result >= 0 else {
            throw .setEventRate(result)
        }
    }

    /// Returns `true` if there are pending events in the queue.
    var hasEvents: Bool {
        ASensorEventQueue_hasEvents(queue) > 0
    }

    /// Reads up to `maxCount` pending events from the queue.
    ///
    /// - Parameter maxCount: Maximum number of events to read per call.
    /// - Returns: An array of `SensorEvent` values (may be empty).
    func getEvents(maxCount: Int = 16) throws(AndroidSensorError) -> [SensorEvent] {
        var buffer = [ASensorEvent](repeating: ASensorEvent(), count: maxCount)
        let count = ASensorEventQueue_getEvents(queue, &buffer, maxCount)
        guard count >= 0 else {
            throw .getEvents(Int32(count))
        }
        return buffer.prefix(count).map { SensorEvent($0) }
    }
}
