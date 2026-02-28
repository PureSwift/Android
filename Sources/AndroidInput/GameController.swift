//
//  GameController.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if AGDK
#if os(Android)
import Android
import CAndroidNDK
#endif

/// Swift wrapper for the Android Game Controller (Paddleboat) C API.
@MainActor
public struct GameController: ~Copyable {
    
    let environment: JNIEnvironment
    
    public init(context: jobject, environment: JNIEnvironment) throws {
        let result = Paddleboat_init(environment, context)
        guard result == 0 else {
            throw GameController.Error(rawValue: result) ?? GameController.Error.notInitialized
        }
        guard Paddleboat_isInitialized() else {
            throw GameController.Error.notInitialized
        }
        self.environment = environment
    }
    
    deinit {
        Paddleboat_destroy(environment)
    }
    
    public func update() {
        Paddleboat_update(environment)
    }
    
    // MARK: - Back button
    public static func setBackButtonConsumed(_ consume: Bool) {
        Paddleboat_setBackButtonConsumed(consume)
    }
    
    public static func isBackButtonConsumed() -> Bool {
        Paddleboat_getBackButtonConsumed()
    }
    
    // MARK: - Controller Info / Data
    public static func getControllerStatus(index: Int32) -> ControllerStatus {
        ControllerStatus(rawValue: Paddleboat_getControllerStatus(index)) ?? .inactive
    }
    
    public static func getControllerName(index: Int32, bufferSize: Int = 128) -> (ErrorCode, String) {
        var buffer = [CChar](repeating: 0, count: bufferSize)
        let err = Paddleboat_getControllerName(index, Int32(buffer.count), &buffer)
        let code = ErrorCode(rawValue: err) ?? .noError
        let name = buffer.withUnsafeBufferPointer { String(cString: $0.baseAddress!) }
        return (code, name)
    }
    
    // MARK: - Lights / Vibration
    @discardableResult
    public func setControllerLight(index: Int32, type: LightType, data: UInt32) -> ErrorCode {
        let err = Paddleboat_setControllerLight(index, type.rawValue, data, environment)
        return ErrorCode(rawValue: err) ?? .noError
    }

    @discardableResult
    public func setControllerVibration(index: Int32, vibration: VibrationData) -> ErrorCode {
        var cData = Paddleboat_Vibration_Data(duration_ms: vibration.durationMs,
                                              left_motor_intensity: vibration.intensityLeft,
                                              right_motor_intensity: vibration.intensityRight)
        let err = Paddleboat_setControllerVibrationData(index, &cData, environment)
        return ErrorCode(rawValue: err) ?? .noError
    }
    
    // MARK: - Motion
    public static func getIntegratedMotionSensorFlags() -> IntegratedMotionSensorFlags {
        IntegratedMotionSensorFlags(rawValue: Paddleboat_getIntegratedMotionSensorFlags())
    }
}

// MARK: - Supporting Types

public extension GameController {
    
    // MARK: - Version / Constants
    public static var maxControllers: Int32 { 8 }
    
    // MARK: - Error
    public enum Error: Int32, Swift.Error {
        case noError = 0
        case alreadyInitialized = -2000
        case notInitialized = -2001
        case invalidParameter = -2002
        case invalidControllerIndex = -2003
        case noController = -2004
        case featureNotSupported = -2005
        case fileIO = -2006
        case incompatibleMappingData = -2007
        case invalidMappingData = -2008
        case noMouse = -2009
        case initGCMFailure = -2010
    }

    typealias ErrorCode = Error

    public enum ControllerStatus: Int32 {
        case inactive = 0
        case active = 1
        case justConnected = 2
        case justDisconnected = 3
    }

    public struct Buttons: OptionSet, Sendable {
        public let rawValue: UInt32
        public init(rawValue: UInt32) { self.rawValue = rawValue }
        public static let a            = Buttons(rawValue: 1 << 0)
        public static let b            = Buttons(rawValue: 1 << 1)
        public static let x            = Buttons(rawValue: 1 << 2)
        public static let y            = Buttons(rawValue: 1 << 3)
        public static let l1           = Buttons(rawValue: 1 << 4)
        public static let r1           = Buttons(rawValue: 1 << 5)
        public static let l2           = Buttons(rawValue: 1 << 6)
        public static let r2           = Buttons(rawValue: 1 << 7)
        public static let l3           = Buttons(rawValue: 1 << 8)
        public static let r3           = Buttons(rawValue: 1 << 9)
        public static let dpadUp       = Buttons(rawValue: 1 << 10)
        public static let dpadDown     = Buttons(rawValue: 1 << 11)
        public static let dpadLeft     = Buttons(rawValue: 1 << 12)
        public static let dpadRight    = Buttons(rawValue: 1 << 13)
        public static let start        = Buttons(rawValue: 1 << 14)
        public static let select       = Buttons(rawValue: 1 << 15)
        public static let system       = Buttons(rawValue: 1 << 16)
        public static let touchpad     = Buttons(rawValue: 1 << 17)
        public static let aux1         = Buttons(rawValue: 1 << 18)
        public static let aux2         = Buttons(rawValue: 1 << 19)
        public static let aux3         = Buttons(rawValue: 1 << 20)
        public static let aux4         = Buttons(rawValue: 1 << 21)
    }
    
    public enum LightType: Int32 {
        case playerNumber = 0
        case rgb = 1
    }
    
    public struct IntegratedMotionSensorFlags: OptionSet, Sendable {
        public let rawValue: UInt32
        public init(rawValue: UInt32) { self.rawValue = rawValue }
        public static let none          = IntegratedMotionSensorFlags([])
        public static let accelerometer = IntegratedMotionSensorFlags(rawValue: 0x00000001)
        public static let gyroscope     = IntegratedMotionSensorFlags(rawValue: 0x00000002)
        public static let indexFlag     = IntegratedMotionSensorFlags(rawValue: 0x40000000)
    }
    
    public struct VibrationData {
        public var durationMs: Int32
        public var intensityLeft: Float
        public var intensityRight: Float
        public init(durationMs: Int32, intensityLeft: Float, intensityRight: Float) {
            self.durationMs = durationMs
            self.intensityLeft = intensityLeft
            self.intensityRight = intensityRight
        }
    }
}
#endif