//
//  AndroidBluetoothLowEnergyScanner.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth.LE {
    
    public typealias Scanner = AndroidBluetoothLowEnergyScanner
}

public final class AndroidBluetoothLowEnergyScanner: JavaObject {
    
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

// MARK: - Constants

public extension AndroidBluetoothLowEnergyScanner {
    
    /// Optional extra indicating the callback type, which will be one of CALLBACK_TYPE_* constants in ScanSettings.
    public static var EXTRA_CALLBACK_TYPE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_CALLBACK_TYPE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_CALLBACK_TYPE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Optional extra indicating the error code, if any.
    public static var EXTRA_ERROR_CODE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_ERROR_CODE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_ERROR_CODE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Extra containing a list of ScanResults.
    public static var EXTRA_LIST_SCAN_RESULT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_LIST_SCAN_RESULT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_LIST_SCAN_RESULT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - Methods

public extension AndroidBluetoothLowEnergyScanner {
    
    /**
     * Start Bluetooth LE scan using a PendingIntent. The scan results will be delivered via the PendingIntent. Use this method of scanning if your process is not always running
     * and it should be started when scan results are available.
     *
     * An app must hold ACCESS_COARSE_LOCATION or ACCESS_FINE_LOCATION permission in order to get results.
     *
     * When the PendingIntent is delivered, the Intent passed to the receiver or activity will contain one or more of the extras EXTRA_CALLBACK_TYPE,
     * EXTRA_ERROR_CODE and EXTRA_LIST_SCAN_RESULT to indicate the result of the scan.
     *
     * Requires the BLUETOOTH_ADMIN permission.
     *
     * Returns 0 for success or an error code from ScanCallback if the scan request could not be sent.
     */
    public func startScan(filters: [Android.Bluetooth.LE.ScanFilter]? = nil,
                          settings: Android.Bluetooth.LE.ScanSettings = Android.Bluetooth.LE.ScanSettings.Builder().build(),
                          callbackIntent: JavaObject) -> Int {
        let filterList: ArrayList?
        
        if let filters = filters, filters.isEmpty == false {
            
            let list = ArrayList(filters.count)
            
            filters.forEach {
                let success = list.add($0)
                assert(success, "Could not add to list")
            }
            
            filterList = list
            
        } else {
            
            filterList = nil
        }
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: filterList, locals: &__locals ),
            JNIType.toJava( value: settings, locals: &__locals ),
            JNIType.toJava( value: callbackIntent, locals: &__locals )
        ]
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "startScan",
            methodSig: "(Ljava/util/List;Landroid/bluetooth/le/ScanSettings;Landroid/app/PendingIntent;)I",
            methodCache: &JNICache.MethodID.startScan,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Start Bluetooth LE scan with default parameters and no filters. The scan results will be delivered through callback.
     * For unfiltered scans, scanning is stopped on screen off to save power. Scanning is resumed when screen is turned on again.
     * To avoid this, use startScan(List, ScanSettings, ScanCallback) with desired ScanFilter.
     *
     * An app must hold ACCESS_COARSE_LOCATION or ACCESS_FINE_LOCATION permission in order to get results.
     *
     * Requires the BLUETOOTH_ADMIN permission.
     */
    public func startScan(callback: Android.Bluetooth.LE.ScanCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startScan",
            methodSig: "(Landroid/bluetooth/le/ScanCallback;)V",
            methodCache: &JNICache.MethodID.startScan2,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Start Bluetooth LE scan.
     *
     * - Parameter filters: `Array` of `ScanFilter` for finding exact BLE devices.
     * @- Parameter settings: Settings for the scan.
     * @- Parameter callback: Callback used to deliver scan results.
     */
    public func startScan(filters: [Android.Bluetooth.LE.ScanFilter]? = nil,
                          settings: Android.Bluetooth.LE.ScanSettings,
                          callback: Android.Bluetooth.LE.ScanCallback) {
        
        let filterList: ArrayList?
        
        if let filters = filters, filters.isEmpty == false {
            
            let list = ArrayList(filters.count)
            
            filters.forEach {
                let success = list.add($0)
                assert(success, "Could not add to list")
            }
            
            filterList = list
            
        } else {
            
            filterList = nil
        }
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: filterList, locals: &__locals ),
            JNIType.toJava( value: settings, locals: &__locals ),
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startScan",
            methodSig: "(Ljava/util/List;Landroid/bluetooth/le/ScanSettings;Landroid/bluetooth/le/ScanCallback;)V",
            methodCache: &JNICache.MethodID.startScan3,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Stops an ongoing Bluetooth LE scan.
     *
     * Requires the BLUETOOTH_ADMIN permission.
     */
    public func stopScan(callback: Android.Bluetooth.LE.ScanCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "stopScan",
            methodSig: "(Landroid/bluetooth/le/ScanCallback;)V",
            methodCache: &JNICache.MethodID.stopScan,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Stops an ongoing Bluetooth LE scan started using a PendingIntent.
     *
     * Requires the BLUETOOTH_ADMIN permission.
     */
    public func stopScan(callbackIntent: JavaObject) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: callbackIntent, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "stopScan",
            methodSig: "(Landroid/app/PendingIntent;)V",
            methodCache: &JNICache.MethodID.stopScan2,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Flush pending batch scan results stored in Bluetooth controller. This will return Bluetooth LE scan results batched on bluetooth controller.
     * Returns immediately, batch scan results data will be delivered through the callback.
     */
    public func flushPendingScanResults(callback: Android.Bluetooth.LE.ScanCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "flushPendingScanResults",
            methodSig: "(Landroid/bluetooth/le/ScanCallback;)V",
            methodCache: &JNICache.MethodID.flushPendingScanResults,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Private

private extension AndroidBluetoothLowEnergyScanner {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/le/BluetoothLeScanner"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            static var EXTRA_CALLBACK_TYPE: jfieldID?
            static var EXTRA_ERROR_CODE: jfieldID?
            static var EXTRA_LIST_SCAN_RESULT: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var flushPendingScanResults: jmethodID?
            static var startScan: jmethodID?
            static var startScan2: jmethodID?
            static var startScan3: jmethodID?
            static var stopScan: jmethodID?
            static var stopScan2: jmethodID?
        }
    }
}
