//
//  BluetoothAdapterLeScanCallback.swift
//  Android
//
//  Created by Marco Estrella on 6/7/18.
//

import Foundation
import java_swift
import java_util
import JNI
import Android

public extension Android.Bluetooth.Adapter {
    
    public typealias LeScanCallback = AndroidBluetoothAdapterLeScanCallback
}

/**
 * Callback interface used to deliver LE scan results.
 */
public protocol AndroidBluetoothAdapterLeScanCallback: JavaProtocol {
    
    func onLeScan(device: Android.Bluetooth.Device, rssi: Int, scanRecord: [Int8])
}

// MARK: - Local Listener

extension AndroidBluetoothAdapterLeScanCallback {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return AndroidBluetoothAdapterLeScanCallbackLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal class AndroidBluetoothAdapterLeScanCallbackLocal: JNILocalProxy<AndroidBluetoothAdapterLeScanCallback, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
            JNICache.Method.onLeScan.method,
            .finalize
        ]
        
        let clazz = JNI.FindClass( proxyClassName() )
        
        let nativesCount = jint(natives.count)
        withUnsafePointer(to: &natives[0]) { nativesPtr in
            if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, nativesCount ) != jint(JNI_OK) {
                JNI.report( "Unable to register java natives" )
            }
        }
        
        defer { JNI.DeleteLocalRef( clazz ) }
        
        return JNI.api.NewGlobalRef( JNI.env, clazz )!
    }()
    
    override open class func proxyClassName() -> String { return JNICache.className }
    
    override open class func proxyClass() -> jclass? { return _proxyClass }
}

// MARK: - JNI

private extension AndroidBluetoothAdapterLeScanCallbackLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Bluetooth.className(["SwiftBluetoothAdapter$LeScanCallback"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method cache
        fileprivate enum Method {
            
            internal enum onLeScan: JNINativeMethodEntry {
                
                static let name = "__on_le_scan"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(JNIClassName(rawValue: "android/bluetooth/BluetoothDevice")!),
                        .int,
                        .array(.byte)
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothAdapterLeScanCallback_OnLeScan_Type = AndroidBluetoothAdapterLeScanCallback_onLeScan
            }
        }
    }
}

// MARK: - Private Methods

private typealias AndroidBluetoothAdapterLeScanCallback_OnLeScan_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jobject?) -> ()

private func AndroidBluetoothAdapterLeScanCallback_onLeScan( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ deviceParam: jobject?,
                                                                 _ rssiParam: jint,
                                                                 _ scanRecordParam: jobject? ) -> () {
    
    let device = Android.Bluetooth.Device(javaObject: deviceParam)
    
    let rssi = Int(rssiParam)
    
    let scanRecord = JNIType.toSwift(type: [Int8].self, from: scanRecordParam)
    
    AndroidBluetoothAdapterLeScanCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onLeScan(device: device, rssi: rssi, scanRecord: scanRecord!)
}
