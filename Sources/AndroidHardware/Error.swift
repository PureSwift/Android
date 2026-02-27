//
//  Error.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

/// Android Sensor Error
public enum AndroidSensorError: Swift.Error {

    /// Unable to get sensor manager instance.
    case invalidManager

    /// Unable to create event queue.
    case createEventQueue

    /// Unable to enable sensor (result code).
    case enableSensor(Int32)

    /// Unable to disable sensor (result code).
    case disableSensor(Int32)

    /// Unable to register sensor (result code).
    case registerSensor(Int32)

    /// Unable to set event rate (result code).
    case setEventRate(Int32)

    /// Error reading sensor events (result code).
    case getEvents(Int32)
}
