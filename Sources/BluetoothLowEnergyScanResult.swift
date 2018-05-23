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

public extension Android.Bluetooth.LE {
    
    public typealias ScanResult = AndroidBluetoothLowEnergyScanResult
    
    public typealias DataStatus = AndroidBluetoothLowEnergyDataStatus
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
    public static let dataComplete = Android.Bluetooth.LE.DataStatus(rawValue: Android.Bluetooth.LE.ScanResult.DATA_COMPLETE)
    
    /**
     * For chained advertisements, indicates that the controller was unable to receive all chained packets and the scan result contains incomplete truncated data.
     */
    public static let dataTruncated = Android.Bluetooth.LE.DataStatus(rawValue: Android.Bluetooth.LE.ScanResult.DATA_TRUNCATED)
}

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
     * Returns the scan record, which is a combination of advertisement and scan response.
     */
    public var scanRecord: JavaObject? {
        
        @inline(__always)
        get { return nil }
    }
}

// MARK: CONSTANTS

public extension Android.Bluetooth.LE.ScanResult {
    
    /// For chained advertisements, inidcates tha the data contained in this scan result is complete.
    internal static var DATA_COMPLETE: Int {
        
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
    internal static var DATA_TRUNCATED: Int {
        
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
    internal static var PERIODIC_INTERVAL_NOT_PRESENT: Int {
        
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
    internal static var PHY_UNUSED: Int {
        
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
    internal static var SID_NOT_PRESENT: Int {
        
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
    internal static var TX_POWER_NOT_PRESENT: Int {
        
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
    internal func getDataStatus() -> Android.Bluetooth.LE.DataStatus {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getDataStatus",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getDataStatus,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.LE.DataStatus.init(rawValue: Int(__return))
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
        }
    }
}
