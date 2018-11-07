//
//  BluetoothLeAdvertisingSetParameters.swift
//  Android
//
//  Created by Marco Estrella on 5/25/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth.LE {
    
    public typealias AdvertisingSetParameters = AndroidBluetoothLowEnergyAdvertisingSetParameters
}

public extension Android.Bluetooth.LE.AdvertisingSetParameters {
    
    public typealias PrimaryPhy = AndroidBluetoothLowEnergyPrimaryPhy
    
    public typealias SecondaryPhy = AndroidBluetoothLowEnergySecondaryPhy
    
    public typealias TxPowerLevel = AndroidBluetoothLowEnergyTxPowerLevel
}

public extension Android.Bluetooth.LE.AdvertisingSetParameters {
    
    /// LE Primary Phy
    public struct AndroidBluetoothLowEnergyPrimaryPhy: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Bluetooth LE 1M PHY. Used to refer to LE 1M Physical Channel for advertising, scanning or connection.
         */
        public static let phyLe1m = Android.Bluetooth.LE.AdvertisingSetParameters.PrimaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_1M)
        
        /**
         * Bluetooth LE Coded PHY. Used to refer to LE Coded Physical Channel for advertising, scanning or connection.
         */
        public static let phyLeCoded = Android.Bluetooth.LE.AdvertisingSetParameters.PrimaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_CODED)
    }
    
    /// LE Secondary Phy
    public struct AndroidBluetoothLowEnergySecondaryPhy: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Bluetooth LE 1M PHY. Used to refer to LE 1M Physical Channel for advertising, scanning or connection.
         */
        public static let phyLe1m = Android.Bluetooth.LE.AdvertisingSetParameters.SecondaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_1M)
        
        /**
         * Bluetooth LE Coded PHY. Used to refer to LE Coded Physical Channel for advertising, scanning or connection.
         */
        public static let phyLeCoded = Android.Bluetooth.LE.AdvertisingSetParameters.SecondaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_CODED)
        
        /**
         * Bluetooth LE 2M PHY. Used to refer to LE 2M Physical Channel for advertising, scanning or connection.
         */
        public static let phyLe2m = Android.Bluetooth.LE.AdvertisingSetParameters.SecondaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_2M)
    }
    
    /// LE Secondary Phy
    public struct AndroidBluetoothLowEnergyTxPowerLevel: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public static let ultraLow = Android.Bluetooth.LE.AdvertisingSetParameters.TxPowerLevel(rawValue: Android.Bluetooth.LE.AdvertisingSetParameters.TX_POWER_ULTRA_LOW)
        
        public static let low = Android.Bluetooth.LE.AdvertisingSetParameters.TxPowerLevel(rawValue: Android.Bluetooth.LE.AdvertisingSetParameters.TX_POWER_LOW)
        
        public static let medium = Android.Bluetooth.LE.AdvertisingSetParameters.TxPowerLevel(rawValue: Android.Bluetooth.LE.AdvertisingSetParameters.TX_POWER_MEDIUM)
        
        public static let high = Android.Bluetooth.LE.AdvertisingSetParameters.TxPowerLevel(rawValue: Android.Bluetooth.LE.AdvertisingSetParameters.TX_POWER_HIGH)
    }
}



public final class AndroidBluetoothLowEnergyAdvertisingSetParameters: JavaObject {
    
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
}

// MARK: Properties

public extension AndroidBluetoothLowEnergyAdvertisingSetParameters {
    
    /**
     * Returns the advertising interval.
     */
    public var interval: Int {
        
        get { return getInterval() }
    }
    
    /**
     * Returns the primary advertising phy.
     */
    public var primaryPhy: Android.Bluetooth.LE.AdvertisingSetParameters.PrimaryPhy? {
        
        get { return getPrimaryPhy() }
    }
    
    /**
     * Returns the secondary advertising phy.
     */
    public var secondaryPhy: Android.Bluetooth.LE.AdvertisingSetParameters.SecondaryPhy? {
        
        get { return getSecondaryPhy() }
    }
    
    /**
     * Returns the TX power level for advertising.
     */
    public var txPowerLevel: Android.Bluetooth.LE.AdvertisingSetParameters.TxPowerLevel? {
        
        get { return getTxPowerLevel() }
    }
    
    /**
     * Returns whether the TX Power will be included.
     */
    public var includeTxPower: Bool {
        
        get { return getIncludeTxPower() }
    }
    
    /**
     * Returns whether the advertisement will be anonymous.
     */
    public var isAnonymous: Bool {
        
        get { return getIsAnonymous() }
    }
    
    /**
     * Returns whether the advertisement will be connectable.
     */
    public var isConnectable: Bool {
        
        get { return getIsConnectable() }
    }
    
    /**
     * Returns whether the legacy advertisement will be used.
     */
    public var isLegacy: Bool {
        
        get { return getIsLegacy() }
    }
    
    /**
     * Returns whether the advertisement will be scannable.
     */
    public var isScannable: Bool {
        
        get { return getIsScannable() }
    }
}

// MARK: CONSTANTS

internal extension Android.Bluetooth.LE.AdvertisingSetParameters {
    
    internal static var INTERVAL_HIGH: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "INTERVAL_HIGH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.INTERVAL_HIGH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var INTERVAL_LOW: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "INTERVAL_LOW",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.INTERVAL_LOW,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var INTERVAL_MAX: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "INTERVAL_MAX",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.INTERVAL_MAX,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var INTERVAL_MEDIUM: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "INTERVAL_MEDIUM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.INTERVAL_MEDIUM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var INTERVAL_MIN: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "INTERVAL_MIN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.INTERVAL_MIN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var TX_POWER_HIGH: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "TX_POWER_HIGH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TX_POWER_HIGH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var TX_POWER_LOW: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "TX_POWER_LOW",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TX_POWER_LOW,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var TX_POWER_MAX: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "TX_POWER_MAX",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TX_POWER_MAX,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var TX_POWER_MEDIUM: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "TX_POWER_MEDIUM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TX_POWER_MEDIUM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var TX_POWER_MIN: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "TX_POWER_MIN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TX_POWER_MIN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
    
    internal static var TX_POWER_ULTRA_LOW: Int {
        get {
            let __value = JNIField.GetStaticIntField(
                fieldName: "TX_POWER_ULTRA_LOW",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TX_POWER_ULTRA_LOW,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            return Int(__value)
        }
    }
}

// MARK: INTERNAL METHODS

internal extension Android.Bluetooth.LE.AdvertisingSetParameters {
    
    @_versioned
    internal func getInterval() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                   methodName: "getInterval",
                                                   methodSig: "()I",
                                                   methodCache: &JNICache.MethodID.getInterval,
                                                   args: &__args,
                                                   locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func getPrimaryPhy() -> Android.Bluetooth.LE.AdvertisingSetParameters.PrimaryPhy? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getPrimaryPhy",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getPrimaryPhy,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.LE.AdvertisingSetParameters.PrimaryPhy(rawValue: Int(__return))
    }
    
    @_versioned
    internal func getSecondaryPhy() -> Android.Bluetooth.LE.AdvertisingSetParameters.SecondaryPhy? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getSecondaryPhy",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getSecondaryPhy,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.LE.AdvertisingSetParameters.SecondaryPhy(rawValue: Int(__return))
    }
    
    @_versioned
    internal func getTxPowerLevel() -> Android.Bluetooth.LE.AdvertisingSetParameters.TxPowerLevel {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getTxPowerLevel",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getTxPowerLevel,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.LE.AdvertisingSetParameters.TxPowerLevel(rawValue: Int(__return))
    }
    
    @_versioned
    internal func getIncludeTxPower() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "includeTxPower",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.includeTxPower,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    @_versioned
    internal func getIsAnonymous() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isAnonymous",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isAnonymous,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
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
    internal func getIsLegacy() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isLegacy",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isLegacy,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    @_versioned
    internal func getIsScannable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isScannable",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isScannable,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: - JNICache

internal extension Android.Bluetooth.LE.AdvertisingSetParameters {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["AdvertisingParameters"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var INTERVAL_HIGH: jfieldID?
            static var INTERVAL_LOW: jfieldID?
            static var INTERVAL_MAX: jfieldID?
            static var INTERVAL_MEDIUM: jfieldID?
            static var INTERVAL_MIN: jfieldID?
            static var TX_POWER_HIGH: jfieldID?
            static var TX_POWER_LOW: jfieldID?
            static var TX_POWER_MAX: jfieldID?
            static var TX_POWER_MEDIUM: jfieldID?
            static var TX_POWER_MIN: jfieldID?
            static var TX_POWER_ULTRA_LOW: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getInterval: jmethodID?
            static var getPrimaryPhy: jmethodID?
            static var getSecondaryPhy: jmethodID?
            static var getTxPowerLevel: jmethodID?
            static var includeTxPower: jmethodID?
            static var isAnonymous: jmethodID?
            static var isConnectable: jmethodID?
            static var isLegacy: jmethodID?
            static var isScannable: jmethodID?
            
        }
    }
}
