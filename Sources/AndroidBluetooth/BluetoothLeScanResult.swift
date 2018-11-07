//
//  AndroidBluetoothLEScanResult.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import java_util
import JNI
import Android
import Bluetooth

public extension Android.Bluetooth.LE {
    
    public typealias ScanResult = AndroidBluetoothLowEnergyScanResult
}

public extension Android.Bluetooth.LE.ScanResult {
    
    public typealias DataStatus = AndroidBluetoothLowEnergyDataStatus
    
    public typealias PrimaryPhy = AndroidBluetoothLowEnergyPrimaryPhy
    
    public typealias SecondaryPhy = AndroidBluetoothLowEnergySecondaryPhy
}

/**
 * ScanResult for Bluetooth LE scan.
 */
public final class AndroidBluetoothLowEnergyScanResult: JavaObject {
    
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
    
    /** Returns the advertising set id. May return SID_NOT_PRESENT if no set id was is present.
     */
    public var advertisingSid: Int {
        @inline(__always)
        get { return getAdvertisingSid() }
    }
    
    /**
     * Returns the remote bluetooth device identified by the bluetooth device address.
     */
    public var device: Android.Bluetooth.Device {
        
        @inline(__always)
        get { return getDevice() }
    }
    
    /**
     * Returns the periodic advertising interval in units of 1.25ms. Valid range is 6 (7.5ms) to 65536 (81918.75ms).
     * A value of PERIODIC_INTERVAL_NOT_PRESENT means periodic advertising interval is not present.
     */
    public var periodicAdvertisingInterval: Int {
        
        @inline(__always)
        get { return getPeriodicAdvertisingInterval() }
    }
    
    /**
     * Returns the primary Physical Layer on which this advertisment was received. Can be one of PHY_LE_1M or PHY_LE_CODED.
     */
    public var primaryPhy: Android.Bluetooth.LE.ScanResult.PrimaryPhy {
        
        @inline(__always)
        get { return getPrimaryPhy() }
    }

    
    /**
     * Returns the received signal strength in dBm. The valid range is [-127, 126].
     */
    public var rssi: Int {
        
        @inline(__always)
        get { return getRssi() }
    }
    
    /**
     * Returns the secondary Physical Layer on which this advertisment was received. Can be one of PHY_LE_1M, PHY_LE_2M,
     * PHY_LE_CODED or PHY_UNUSED - if the advertisement was not received on a secondary physical channel.
     */
    public var secondaryPhy: Android.Bluetooth.LE.ScanResult.SecondaryPhy {
        
        @inline(__always)
        get { return getSecondaryPhy() }
    }
    
    /**
     * Returns the scan record, which is a combination of advertisement and scan response.
     */
    public var scanRecord: Android.Bluetooth.LE.ScanRecord {
        
        @inline(__always)
        get { return getScanRecord() }
    }
    
    /**
     * Returns timestamp since boot when the scan record was observed.
     */
    public var timestampNanos: Int64 {
        
        @inline(__always)
        get { return getTimestampNanos() }
    }
    
    /**
     * Returns the transmit power in dBm. Valid range is [-127, 126]. A value of TX_POWER_NOT_PRESENT indicates that the TX power is not present.
     */
    public var txPower: Int {
        
        @inline(__always)
        get { return getTxPower() }
    }
    
    /**
     * Returns true if this object represents connectable scan result.
     */
    public var isConnectable: Bool {
        
        @inline(__always)
        get { return getConnectable() }
    }
    
    /**
     * Returns true if this object represents legacy scan result. Legacy scan results do not contain advanced advertising information as specified in the Bluetooth Core Specification v5.
     */
    public var isLegacy: Bool {
        
        @inline(__always)
        get { return getLegacy() }
    }
    /**
     * Returns the advertising flags indicating the discoverable mode and capability of the device.
     *
     * - Returns: Returns -1 if the flag field is not set.
     */
    public var advertiseFlags: BitMaskOptionSet<GAPFlag>? {
        
        @inline(__always)
        get {
            let rawValue = getAdvertiseFlags()
            return rawValue > 0 ? BitMaskOptionSet<GAPFlag>(rawValue: UInt8(rawValue)) : nil
        }
    }
}

// MARK: CONSTANTS

public extension Android.Bluetooth.LE.ScanResult {
    
    /// For chained advertisements, inidcates tha the data contained in this scan result is complete.
    public static var DATA_COMPLETE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DATA_COMPLETE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DATA_COMPLETE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// For chained advertisements, indicates that the controller was unable to receive all chained packets and the scan result contains incomplete truncated data.
    public static var DATA_TRUNCATED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DATA_TRUNCATED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DATA_TRUNCATED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Periodic advertising interval is not present in the packet.
    public static var PERIODIC_INTERVAL_NOT_PRESENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERIODIC_INTERVAL_NOT_PRESENT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERIODIC_INTERVAL_NOT_PRESENT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Indicates that the secondary physical layer was not used.
    public static var PHY_UNUSED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_UNUSED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_UNUSED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Advertising Set ID is not present in the packet.
    public static var SID_NOT_PRESENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SID_NOT_PRESENT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SID_NOT_PRESENT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// TX power is not present in the packet.
    public static var TX_POWER_NOT_PRESENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TX_POWER_NOT_PRESENT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TX_POWER_NOT_PRESENT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: METHODS

internal extension Android.Bluetooth.LE.ScanResult {
    
    @_versioned
    internal func getAdvertisingSid() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                  methodName: "getAdvertisingSid",
                                                  methodSig: "()I",
                                                  methodCache: &JNICache.MethodID.getAdvertisingSid,
                                                  args: &__args,
                                                  locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func getDataStatus() -> Android.Bluetooth.LE.ScanResult.DataStatus {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getDataStatus",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getDataStatus,
                                               args: &__args,
                                               locals: &__locals)
        
        return Android.Bluetooth.LE.ScanResult.DataStatus(rawValue: Int(__return))
    }
    
    @_versioned
    internal func getDevice() -> Android.Bluetooth.Device {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getDevice",
                                                  methodSig: "()Landroid/bluetooth/BluetoothDevice;",
                                                  methodCache: &JNICache.MethodID.getDevice,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.Device( javaObject: __return )
    }
    
    @_versioned
    internal func getPeriodicAdvertisingInterval() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                  methodName: "getPeriodicAdvertisingInterval",
                                                  methodSig: "()I",
                                                  methodCache: &JNICache.MethodID.getPeriodicAdvertisingInterval,
                                                  args: &__args,
                                                  locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func getPrimaryPhy() -> Android.Bluetooth.LE.ScanResult.PrimaryPhy {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getPrimaryPhy",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getPrimaryPhy,
                                               args: &__args,
                                               locals: &__locals)
        
        return Android.Bluetooth.LE.ScanResult.PrimaryPhy(rawValue: Int(__return))
    }
    
    
    
    @_versioned
    internal func getSecondaryPhy() -> Android.Bluetooth.LE.ScanResult.SecondaryPhy {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getSecondaryPhy",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getSecondaryPhy,
                                               args: &__args,
                                               locals: &__locals)
        
        return Android.Bluetooth.LE.ScanResult.SecondaryPhy(rawValue: Int(__return))
    }
    
    @_versioned
    internal func getRssi() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getRssi",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getRssi,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func getTimestampNanos() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallLongMethod(object: javaObject,
                                               methodName: "getTimestampNanos",
                                               methodSig: "()J",
                                               methodCache: &JNICache.MethodID.getTimestampNanos,
                                               args: &__args,
                                               locals: &__locals)
        return Int64(__return)
    }
    
    @_versioned
    internal func getTxPower() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getTxPower",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getTxPower,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func getConnectable() -> Bool {
        
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
    internal func getLegacy() -> Bool {
        
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
    internal func getScanRecord() -> Android.Bluetooth.LE.ScanRecord {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getScanRecord",
                                                  methodSig: JNICache.MethodSignature.getScanRecord,
                                                  methodCache: &JNICache.MethodID.getScanRecord,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.LE.ScanRecord(javaObject: __return)
    }
    
    /**
     Returns the advertising flags indicating the discoverable mode and capability of the device. Returns -1 if the flag field is not set.
     */
    @_versioned
    internal func getAdvertiseFlags() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getAdvertiseFlags",
                                               methodSig: JNICache.MethodSignature.getAdvertiseFlags,
                                               methodCache: &JNICache.MethodID.getAdvertiseFlags,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int(__return)
    }
}

// MARK: - JNI

internal extension Android.Bluetooth.LE.ScanResult {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["ScanResult"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            static var DATA_COMPLETE: jfieldID?
            static var DATA_TRUNCATED: jfieldID?
            static var PERIODIC_INTERVAL_NOT_PRESENT: jfieldID?
            static var PHY_UNUSED: jfieldID?
            static var SID_NOT_PRESENT: jfieldID?
            static var TX_POWER_NOT_PRESENT: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getAdvertisingSid: jmethodID?
            static var getDataStatus: jmethodID?
            static var getDevice: jmethodID?
            static var getPeriodicAdvertisingInterval: jmethodID?
            static var getPrimaryPhy: jmethodID?
            static var getRssi: jmethodID?
            static var getScanRecord: jmethodID?
            static var getSecondaryPhy: jmethodID?
            static var getTimestampNanos: jmethodID?
            static var getTxPower: jmethodID?
            static var isConnectable: jmethodID?
            static var isLegacy: jmethodID?
            static var getAdvertiseFlags: jmethodID?
        }
        
        struct MethodSignature {
            
            static let getScanRecord = JNIMethodSignature(
                argumentTypes: [],
                returnType: .object(Android.Bluetooth.LE.ScanRecord.JNICache.classSignature)
                ).rawValue
            
            static let getAdvertiseFlags = JNIMethodSignature(
                argumentTypes: [],
                returnType: .boolean
                ).rawValue
        }
    }
}

// MARK: - Supporting Types

public extension Android.Bluetooth.LE.ScanResult {
    
    /// LE Primary Phy
    public struct AndroidBluetoothLowEnergyPrimaryPhy: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Bluetooth LE 1M PHY. Used to refer to LE 1M Physical Channel for advertising, scanning or connection.
         */
        public static let phyLe1m = Android.Bluetooth.LE.ScanResult.PrimaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_1M)
        
        /**
         * Bluetooth LE Coded PHY. Used to refer to LE Coded Physical Channel for advertising, scanning or connection.
         */
        public static let phyLeCoded = Android.Bluetooth.LE.ScanResult.PrimaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_CODED)
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
        public static let phyLe1m = Android.Bluetooth.LE.ScanResult.SecondaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_1M)
        
        /**
         * Bluetooth LE Coded PHY. Used to refer to LE Coded Physical Channel for advertising, scanning or connection.
         */
        public static let phyLeCoded = Android.Bluetooth.LE.ScanResult.SecondaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_CODED)
        
        /**
         * Bluetooth LE 2M PHY. Used to refer to LE 2M Physical Channel for advertising, scanning or connection.
         */
        public static let phyLe2m = Android.Bluetooth.LE.ScanResult.SecondaryPhy(rawValue: Android.Bluetooth.Device.PHY_LE_2M)
        
        /**
         * Indicates that the secondary physical layer was not used.
         */
        public static let phyUnused = Android.Bluetooth.LE.ScanResult.SecondaryPhy(rawValue: Android.Bluetooth.LE.ScanResult.PHY_UNUSED)
    }
    
    /// LE Data Status.
    public struct AndroidBluetoothLowEnergyDataStatus: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * For chained advertisements, inidcates tha the data contained in this scan result is complete.
         */
        public static let dataComplete = Android.Bluetooth.LE.ScanResult.DataStatus(rawValue: Android.Bluetooth.LE.ScanResult.DATA_COMPLETE)
        
        /**
         * For chained advertisements, indicates that the controller was unable to receive all chained packets and the scan result contains incomplete truncated data.
         */
        public static let dataTruncated = Android.Bluetooth.LE.ScanResult.DataStatus(rawValue: Android.Bluetooth.LE.ScanResult.DATA_TRUNCATED)
    }
}
