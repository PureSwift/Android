//
//  AndroidBluetoothLowEnergyScanner.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import java_util

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
    
    /**
     * Start Bluetooth LE scan.
     *
     * - Parameter filters: `Array` of `ScanFilter` for finding exact BLE devices.
     * @- Parameter settings: Settings for the scan.
     * @- Parameter callback: Callback used to deliver scan results.
    */
    public func startScan(filters: [Android.Bluetooth.LE.ScanFilter]? = nil,
                          settings: Android.Bluetooth.LE.ScanSettings = Android.Bluetooth.LE.ScanSettings.Builder().build(),
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
            methodCache: &JNICache.MethodID.startScan,
            args: &__args,
            locals: &__locals )
    }
    
    public func stopScan() {
        
        
    }
    
    public func flushPendingScanResults() {
        
        
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
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var startScan: jmethodID?
        }
    }
}
