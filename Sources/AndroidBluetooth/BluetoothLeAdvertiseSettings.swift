//
//  BluetoothLeAdvertiseSettings.swift
//  Android
//
//  Created by Marco Estrella on 5/28/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth.LE {
    
    public typealias AdvertiseSettings = AndroidBluetoothLowEnergyAdvertiseSettings
}

public extension AndroidBluetoothLowEnergyAdvertiseSettings {
    
    public typealias AdvertiseMode = AndroidBluetoothLowEnergyAdvertiseMode
    public typealias TxPowerLevel = AndroidBluetoothLowEnergyTxPowerLevel
}

/**
 * The AdvertiseSettings provide a way to adjust advertising preferences for each Bluetooth LE advertisement instance.
 *
 * Use AdvertiseSettings.Builder to create an instance of this class.
 */
public final class AndroidBluetoothLowEnergyAdvertiseSettings: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    /**
     * Returns the advertise mode.
     */
    public var mode: AndroidBluetoothLowEnergyAdvertiseSettings.AdvertiseMode? {
        
        get { return getMode() }
    }
    
    /**
     * Returns the advertising time limit in milliseconds.
     */
    public var timeout: Int {
        
        get { return getTimeout() }
    }
    
    /**
     * Returns the TX power level for advertising.
     */
    public var txPowerLevel: AndroidBluetoothLowEnergyAdvertiseSettings.TxPowerLevel? {
        
        get { return nil }
    }
    
    /**
     * Returns whether the advertisement will indicate connectable.
     */
    public var isConnectable: Bool {
        
        get { return getIsConnectable() }
    }
}

// MARK: - CONSTANTS

public extension Android.Bluetooth.LE.AdvertiseSettings {
    
    public static var ADVERTISE_MODE_BALANCED: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_MODE_BALANCED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ADVERTISE_MODE_BALANCED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    public static var ADVERTISE_MODE_LOW_LATENCY: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_MODE_LOW_LATENCY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ADVERTISE_MODE_LOW_LATENCY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    public static var ADVERTISE_MODE_LOW_POWER: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_MODE_LOW_POWER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ADVERTISE_MODE_LOW_POWER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    public static var ADVERTISE_TX_POWER_HIGH: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_TX_POWER_HIGH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ADVERTISE_TX_POWER_HIGH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    public static var ADVERTISE_TX_POWER_LOW: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_TX_POWER_LOW",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ADVERTISE_TX_POWER_LOW,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    public static var ADVERTISE_TX_POWER_MEDIUM: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_TX_POWER_MEDIUM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ADVERTISE_TX_POWER_MEDIUM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    public static var ADVERTISE_TX_POWER_ULTRA_LOW: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_TX_POWER_ULTRA_LOW",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ADVERTISE_TX_POWER_ULTRA_LOW,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
}

// MARK: - INTERNAL METHODS

internal extension Android.Bluetooth.LE.AdvertiseSettings {
    
    @_versioned
    internal func getIsConnectable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                               methodName: "isConnectable",
                                               methodSig: "()Z",
                                               methodCache: &JNICache.MethodID.isConnectable,
                                               args: &__args,
                                               locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    @_versioned
    internal func getMode() -> Android.Bluetooth.LE.AdvertiseSettings.AdvertiseMode? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                  methodName: "getMode",
                                                  methodSig: "()I",
                                                  methodCache: &JNICache.MethodID.getMode,
                                                  args: &__args,
                                                  locals: &__locals)
        
        return Android.Bluetooth.LE.AdvertiseSettings.AdvertiseMode( rawValue: Int( __return ))
    }
    
    @_versioned
    internal func getTimeout() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getTimeout",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getTimeout,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int( __return )
    }
    
    @_versioned
    internal func getTxPowerLevel() -> Android.Bluetooth.LE.AdvertiseSettings.TxPowerLevel? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getTxPowerLevel",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getTxPowerLevel,
                                               args: &__args,
                                               locals: &__locals)
        
        return Android.Bluetooth.LE.AdvertiseSettings.TxPowerLevel( rawValue: Int( __return ))
    }
}

// MARK: - JNICache

internal extension Android.Bluetooth.LE.AdvertiseSettings {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["AdvertiseSettings"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var ADVERTISE_MODE_BALANCED: jfieldID?
            static var ADVERTISE_MODE_LOW_LATENCY: jfieldID?
            static var ADVERTISE_MODE_LOW_POWER: jfieldID?
            static var ADVERTISE_TX_POWER_HIGH: jfieldID?
            static var ADVERTISE_TX_POWER_LOW: jfieldID?
            static var ADVERTISE_TX_POWER_MEDIUM: jfieldID?
            static var ADVERTISE_TX_POWER_ULTRA_LOW: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getMode: jmethodID?
            static var getTimeout: jmethodID?
            static var getTxPowerLevel: jmethodID?
            static var isConnectable: jmethodID?
            
        }
    }
}

// MARK: -

public extension Android.Bluetooth.LE.AdvertiseSettings {
    
    /// LE Advertise Mode.
    public struct AndroidBluetoothLowEnergyAdvertiseMode: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Perform Bluetooth LE advertising in low power mode. This is the default and preferred advertising mode as it consumes the least power.
         */
        public static let lowPower = Android.Bluetooth.LE.AdvertiseSettings.AdvertiseMode(rawValue: Android.Bluetooth.LE.AdvertiseSettings.ADVERTISE_MODE_LOW_POWER)
        
        /**
         * Perform Bluetooth LE advertising in low power mode. This is the default and preferred advertising mode as it consumes the least power.
         */
        public static let balanced = Android.Bluetooth.LE.AdvertiseSettings.AdvertiseMode(rawValue: Android.Bluetooth.LE.AdvertiseSettings.ADVERTISE_MODE_BALANCED)
        
        /**
         * Perform Bluetooth LE advertising in low power mode. This is the default and preferred advertising mode as it consumes the least power.
         */
        public static let lowLatency = Android.Bluetooth.LE.AdvertiseSettings.AdvertiseMode(rawValue: Android.Bluetooth.LE.AdvertiseSettings.ADVERTISE_MODE_LOW_LATENCY)
    }
    
    /// LE Advertise Mode.
    public struct AndroidBluetoothLowEnergyTxPowerLevel: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Advertise using the lowest transmission (TX) power level. Low transmission power can be used to restrict the visibility range of advertising packets.
         */
        public static let ultraLow = Android.Bluetooth.LE.AdvertiseSettings.TxPowerLevel(rawValue: Android.Bluetooth.LE.AdvertiseSettings.ADVERTISE_TX_POWER_ULTRA_LOW)
        
        /**
         * Advertise using low TX power level.
         */
        public static let low = Android.Bluetooth.LE.AdvertiseSettings.TxPowerLevel(rawValue: Android.Bluetooth.LE.AdvertiseSettings.ADVERTISE_TX_POWER_LOW)
        
        /**
         * Advertise using medium TX power level.
         */
        public static let medium = Android.Bluetooth.LE.AdvertiseSettings.TxPowerLevel(rawValue: Android.Bluetooth.LE.AdvertiseSettings.ADVERTISE_TX_POWER_MEDIUM)
        
        /**
         * Advertise using high TX power level. This corresponds to largest visibility range of the advertising packet.
         */
        public static let high = Android.Bluetooth.LE.AdvertiseSettings.TxPowerLevel(rawValue: Android.Bluetooth.LE.AdvertiseSettings.ADVERTISE_TX_POWER_HIGH)
    }
}
