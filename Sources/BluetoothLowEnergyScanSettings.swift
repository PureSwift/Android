//
//  AndroidLEScanSettings.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/20/18.
//

import Foundation
import java_swift
import java_util

public extension Android.Bluetooth.LE {
    
    public typealias ScanSettings = AndroidBluetoothLowEnergyScanSettings
}

public extension Android.Bluetooth.LE.ScanSettings {
    
    public typealias Builder = AndroidBluetoothLowEnergyScanSettingsBuilder
}

/// android.bluetooth.le.ScanSettings
///
/// Bluetooth LE scan settings are passed to startScan(ScanCallback) to define the parameters for the scan.
public final class AndroidBluetoothLowEnergyScanSettings: JavaObject {
    
    fileprivate static let javaClassName = "android/bluetooth/le/ScanSettings"
    
    private static var JNIClass: jclass?
    
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
    
    //CONSTANTS
    
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

// MARK: - Builder

/// android.bluetooth.le.ScanSettings.Builder
///
/// Builder for ScanSettings.
public final class AndroidBluetoothLowEnergyScanSettingsBuilder: JavaObject {
    
    private static let javaClassName = Android.Bluetooth.LE.ScanSettings.javaClassName + "$Builder"
    
    private static var JNIClass: jclass?
    
    private static var init_MethodID: jmethodID?
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: AndroidBluetoothLowEnergyScanSettingsBuilder.javaClassName,
            classCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.JNIClass,
            methodSig: "()V",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.init_MethodID,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    private static var build_MethodID: jmethodID?
    
    public func build() -> Android.Bluetooth.LE.ScanSettings {
        
        var __locals = [jobject]()
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "build",
                                                  methodSig: "()Landroid/bluetooth/le/ScanSettings;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.build_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }

        return AndroidBluetoothLowEnergyScanSettings( javaObject: __return )
    }
    
    private static var setScanMode_MethodID: jmethodID?
    
    // public android.bluetooth.le.ScanSettings$Builder setScanMode(int);
    // descriptor: (I)Landroid/bluetooth/le/ScanSettings$Builder;
    public func setScanMode(_ newValue: Android.Bluetooth.LE.ScanMode) -> Android.Bluetooth.LE.ScanSettings.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(newValue.rawValue))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScanMode",
            methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setScanMode_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setScanMode",
                                                  methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setScanMode_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettingsBuilder(javaObject: __return)
    }
}
