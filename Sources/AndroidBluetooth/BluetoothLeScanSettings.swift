//
//  AndroidLEScanSettings.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/20/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth.LE {
    
    public typealias ScanSettings = AndroidBluetoothLowEnergyScanSettings
}

public extension Android.Bluetooth.LE.ScanSettings {
    
    public typealias ScanMode = AndroidBluetoothLowEnergyScanMode
    
    public typealias CallbackType = AndroidBluetoothLowEnergyCallbackType
    
    public typealias MatchMode = AndroidBluetoothLowEnergyMatchMode
    
    public typealias MatchNum = AndroidBluetoothLowEnergyMatchNum
    
    public typealias Phy = AndroidBluetoothLowEnergyPhy
}

/// android.bluetooth.le.ScanSettings
///
/// Bluetooth LE scan settings are passed to startScan(ScanCallback) to define the parameters for the scan.
public final class AndroidBluetoothLowEnergyScanSettings: JavaObject {
    
    fileprivate static let javaClassName = "android/bluetooth/le/ScanSettings"
    
    fileprivate static var JNIClass: jclass?
    
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
    
    private static var new_MethodID_1: jmethodID?
    
    public static var `default`: Android.Bluetooth.LE.ScanSettings {
        
        struct Cache {
            
            static let builder = Android.Bluetooth.LE.ScanSettings.Builder()
        }
        
        return Cache.builder.build()
    }
}

// MARK: CONSTANTS

public extension Android.Bluetooth.LE.ScanSettings {
    
    private static var CALLBACK_TYPE_ALL_MATCHES_FieldID: jfieldID?
    
    /// Trigger a callback for every Bluetooth advertisement found that matches the filter criteria.
    internal static var CALLBACK_TYPE_ALL_MATCHES: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CALLBACK_TYPE_ALL_MATCHES",
                fieldType: "I",
                fieldCache: &CALLBACK_TYPE_ALL_MATCHES_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var CALLBACK_TYPE_FIRST_MATCH_FieldID: jfieldID?
    
    /// A result callback is only triggered for the first advertisement packet received that matches the filter criteria.
    internal static var CALLBACK_TYPE_FIRST_MATCH: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CALLBACK_TYPE_FIRST_MATCH",
                fieldType: "I",
                fieldCache: &CALLBACK_TYPE_FIRST_MATCH_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var CALLBACK_TYPE_MATCH_LOST_FieldID: jfieldID?
    
    /// Receive a callback when advertisements are no longer received from a device that has been previously reported by a first match callback.
    internal static var CALLBACK_TYPE_MATCH_LOST: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CALLBACK_TYPE_MATCH_LOST",
                fieldType: "I",
                fieldCache: &CALLBACK_TYPE_MATCH_LOST_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var MATCH_MODE_AGGRESSIVE_FieldID: jfieldID?
    
    /// In Aggressive mode, hw will determine a match sooner even with feeble signal strength and few number of sightings/match in a duration.
    internal static var MATCH_MODE_AGGRESSIVE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MATCH_MODE_AGGRESSIVE",
                fieldType: "I",
                fieldCache: &MATCH_MODE_AGGRESSIVE_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var MATCH_MODE_STICKY_FieldID: jfieldID?
    
    /// For sticky mode, higher threshold of signal strength and sightings is required before reporting by hw
    internal static var MATCH_MODE_STICKY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MATCH_MODE_STICKY",
                fieldType: "I",
                fieldCache: &MATCH_MODE_STICKY_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var MATCH_NUM_FEW_ADVERTISEMENT_FieldID: jfieldID?
    
    /// Match few advertisement per filter, depends on current capability and availibility of the resources in hw.
    internal static var MATCH_NUM_FEW_ADVERTISEMENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MATCH_NUM_FEW_ADVERTISEMENT",
                fieldType: "I",
                fieldCache: &MATCH_NUM_FEW_ADVERTISEMENT_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var MATCH_NUM_MAX_ADVERTISEMENT_FieldID: jfieldID?
    
    /// Match as many advertisement per filter as hw could allow, depends on current capability and availibility of the resources in hw.
    internal static var MATCH_NUM_MAX_ADVERTISEMENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MATCH_NUM_MAX_ADVERTISEMENT",
                fieldType: "I",
                fieldCache: &MATCH_NUM_MAX_ADVERTISEMENT_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var MATCH_NUM_ONE_ADVERTISEMENT_FieldID: jfieldID?
    
    /// Match one advertisement per filter
    internal static var MATCH_NUM_ONE_ADVERTISEMENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MATCH_NUM_ONE_ADVERTISEMENT",
                fieldType: "I",
                fieldCache: &MATCH_NUM_ONE_ADVERTISEMENT_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var PHY_LE_ALL_SUPPORTED_FieldID: jfieldID?
    
    /// Use all supported PHYs for scanning.
    internal static var PHY_LE_ALL_SUPPORTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_LE_ALL_SUPPORTED",
                fieldType: "I",
                fieldCache: &PHY_LE_ALL_SUPPORTED_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var SCAN_MODE_BALANCED_FieldID: jfieldID?
    
    /// Perform Bluetooth LE scan in balanced power mode.
    internal static var SCAN_MODE_BALANCED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_MODE_BALANCED",
                fieldType: "I",
                fieldCache: &SCAN_MODE_BALANCED_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var SCAN_MODE_LOW_LATENCY_FieldID: jfieldID?
    
    /// Scan using highest duty cycle.
    internal static var SCAN_MODE_LOW_LATENCY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_MODE_LOW_LATENCY",
                fieldType: "I",
                fieldCache: &SCAN_MODE_LOW_LATENCY_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var SCAN_MODE_LOW_POWER_FieldID: jfieldID?
    
    /// Perform Bluetooth LE scan in low power mode.
    internal static var SCAN_MODE_LOW_POWER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_MODE_LOW_POWER",
                fieldType: "I",
                fieldCache: &SCAN_MODE_LOW_POWER_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
    
    private static var SCAN_MODE_OPPORTUNISTIC_FieldID: jfieldID?
    
    /// A special Bluetooth LE scan mode.
    internal static var SCAN_MODE_OPPORTUNISTIC: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_MODE_OPPORTUNISTIC",
                fieldType: "I",
                fieldCache: &SCAN_MODE_OPPORTUNISTIC_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
}

// MARK: METHODS

public extension Android.Bluetooth.LE.ScanSettings {
    
    private static var describeContents_MethodID: jmethodID?
    
    /// Describe the kinds of special objects contained in this Parcelable instance's marshaled representation. For example, if
    /// the object will include a file descriptor in the output of writeToParcel(Parcel, int), the return value of this method
    /// must include the CONTENTS_FILE_DESCRIPTOR bit.
    ///
    /// @return a bitmask indicating the set of special object types marshaled by this Parcelable object instance.
    public func describeContents() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "describeContents",
                                               methodSig: "()I",
                                               methodCache: &AndroidBluetoothLowEnergyScanSettings.describeContents_MethodID,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    private static var getCallbackType_MethodID: jmethodID?
    
    public func getCallbackType() -> Android.Bluetooth.LE.ScanSettings.CallbackType {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getCallbackType",
                                               methodSig: "()I",
                                               methodCache: &AndroidBluetoothLowEnergyScanSettings.getCallbackType_MethodID,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.LE.ScanSettings.CallbackType(rawValue: Int(__return))
    }
    
    private static var getLegacy_MethodID: jmethodID?
    
    /// Returns whether only legacy advertisements will be returned. Legacy advertisements include advertisements as
    /// specified by the Bluetooth core specification 4.2 and below.
    public func getLegacy() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "getLegacy",
                                                   methodSig: "()Z",
                                                   methodCache: &AndroidBluetoothLowEnergyScanSettings.getLegacy_MethodID,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    private static var getPhy_MethodID: jmethodID?
    
    /// Returns the physical layer used during a scan.
    public func getPhy() -> Android.Bluetooth.LE.ScanSettings.Phy {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getPhy",
                                               methodSig: "()I",
                                               methodCache: &AndroidBluetoothLowEnergyScanSettings.getPhy_MethodID,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.LE.ScanSettings.Phy(rawValue: Int(__return))
    }
    
    private static var getReportDelayMillis_MethodID: jmethodID?
    
    /// Returns report delay timestamp based on the device clock.
    public func getReportDelayMillis() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallLongMethod(object: javaObject,
                                                methodName: "getReportDelayMillis",
                                                methodSig: "()J",
                                                methodCache: &AndroidBluetoothLowEnergyScanSettings.getReportDelayMillis_MethodID,
                                                args: &__args,
                                                locals: &__locals)
        return __return
    }
    
    private static var getScanMode_MethodID: jmethodID?
    
    public func getScanMode() -> Android.Bluetooth.LE.ScanSettings.ScanMode {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getScanMode",
                                               methodSig: "()I",
                                               methodCache: &AndroidBluetoothLowEnergyScanSettings.getScanMode_MethodID,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.LE.ScanSettings.ScanMode(rawValue: Int(__return))
    }
    
    private static var getScanResultType_MethodID: jmethodID?
    
    public func getScanResultType() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getScanResultType",
                                               methodSig: "()I",
                                               methodCache: &AndroidBluetoothLowEnergyScanSettings.getScanResultType_MethodID,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
}

// MARK: - Supporting Types

public extension Android.Bluetooth.LE.ScanSettings {
    
    /// LE Scan mode.
    public struct AndroidBluetoothLowEnergyScanMode: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Perform Bluetooth LE scan in low power mode. This is the default scan mode as it consumes the least power. This mode
         * is enforced if the scanning application is not in foreground.
         */
        public static let lowPower = Android.Bluetooth.LE.ScanSettings.ScanMode(rawValue: Android.Bluetooth.LE.ScanSettings.SCAN_MODE_LOW_POWER)
        
        /**
         * Perform Bluetooth LE scan in balanced power mode. Scan results are returned at a rate that
         * provides a good trade-off between scan frequency and power consumption.
         */
        public static let balanced = Android.Bluetooth.LE.ScanSettings.ScanMode(rawValue: Android.Bluetooth.LE.ScanSettings.SCAN_MODE_BALANCED)
        
        /**
         * Scan using highest duty cycle. It's recommended to only use this mode when the application is running in the foreground.
         */
        public static let lowLatency = Android.Bluetooth.LE.ScanSettings.ScanMode(rawValue: Android.Bluetooth.LE.ScanSettings.SCAN_MODE_LOW_LATENCY)
    }
    
    /// LE Callback Type
    public struct AndroidBluetoothLowEnergyCallbackType: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        /**
         * Trigger a callback for every Bluetooth advertisement found that matches the filter criteria. If no filter is active, all
         * advertisement packets are reported.
         */
        public static let allMatches = Android.Bluetooth.LE.ScanSettings.CallbackType(rawValue: Android.Bluetooth.LE.ScanSettings.CALLBACK_TYPE_ALL_MATCHES)
        
        /**
         * A result callback is only triggered for the first advertisement packet received that matches the filter criteria.
         */
        public static let firstMatch = Android.Bluetooth.LE.ScanSettings.CallbackType(rawValue: Android.Bluetooth.LE.ScanSettings.CALLBACK_TYPE_FIRST_MATCH)
        
        /**
         * Receive a callback when advertisements are no longer received from a device that has been previously reported by a first match callback.
         */
        public static let matchLost = Android.Bluetooth.LE.ScanSettings.CallbackType(rawValue: Android.Bluetooth.LE.ScanSettings.CALLBACK_TYPE_MATCH_LOST)
    }
    
    /// LE Match Mode
    public struct AndroidBluetoothLowEnergyMatchMode: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * In Aggressive mode, hw will determine a match sooner even with feeble signal strength and few number of sightings/match in a duration.
         */
        public static let aggressive = Android.Bluetooth.LE.ScanSettings.MatchMode(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_MODE_AGGRESSIVE)
        
        /**
         * For sticky mode, higher threshold of signal strength and sightings is required before reporting by hw
         */
        public static let sticky = Android.Bluetooth.LE.ScanSettings.MatchMode(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_MODE_STICKY)
    }
    
    /// LE Match Num
    public struct AndroidBluetoothLowEnergyMatchNum: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Match one advertisement per filter.
         */
        public static let oneAdvertisement = Android.Bluetooth.LE.ScanSettings.MatchNum(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_NUM_ONE_ADVERTISEMENT)
        
        /**
         * Match few advertisement per filter, depends on current capability and availibility of the resources in hw.
         */
        public static let fewAdvertisement = Android.Bluetooth.LE.ScanSettings.MatchNum(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_NUM_FEW_ADVERTISEMENT)
        
        /**
         * Match as many advertisement per filter as hw could allow, depends on current capability and availibility of the resources in hw.
         */
        public static let maxAdvertisement = Android.Bluetooth.LE.ScanSettings.MatchNum(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_NUM_MAX_ADVERTISEMENT)
    }
    
    /// LE Phy
    public struct AndroidBluetoothLowEnergyPhy: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Bluetooth LE 1M PHY. Used to refer to LE 1M Physical Channel for advertising, scanning or connection.
         */
        public static let phyLe1m = Android.Bluetooth.LE.ScanSettings.Phy(rawValue: Android.Bluetooth.Device.PHY_LE_1M)
        
        /**
         * Bluetooth LE Coded PHY. Used to refer to LE Coded Physical Channel for advertising, scanning or connection.
         */
        public static let phyCoded = Android.Bluetooth.LE.ScanSettings.Phy(rawValue: Android.Bluetooth.Device.PHY_LE_CODED)
        
        /**
         * Use all supported PHYs for scanning. This will check the controller capabilities, and start the scan on 1Mbit and LE Coded PHYs if supported, or on the 1Mbit PHY only.
         */
        public static let phyLeAllSupported = Android.Bluetooth.LE.ScanSettings.Phy(rawValue: Android.Bluetooth.LE.ScanSettings.PHY_LE_ALL_SUPPORTED)
    }

}
