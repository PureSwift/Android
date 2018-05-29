//
//  BluetoothLeAdvertisingSetCallback.swift
//  Android
//
//  Created by Marco Estrella on 5/28/18.
//

import Foundation
import java_swift
import java_util
import JNI

public extension Android.Bluetooth.LE {
    
    public typealias AdvertisingSetCallback = AndroidBluetoothLowEnergyAdvertisingSetCallback
}

/// Bluetooth LE advertising set callbacks, used to deliver advertising operation status.
public protocol AndroidBluetoothLowEnergyAdvertisingSetCallback: JavaProtocol {
    
    
    /**
     * Callback triggered in response to setAdvertisingData(AdvertiseData) indicating result of the operation.
     */
    func onAdvertisingDataSet(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, status: Int)
    
    /**
     * Callback triggered in response to startAdvertisingSet(AdvertisingSetParameters, AdvertiseData, AdvertiseData, PeriodicAdvertisingParameters,
     * AdvertiseData, AdvertisingSetCallback) indicating result of the operation.
     */
    func onAdvertisingEnabled(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, enable: Bool, status: Int)
    
    /**
     * Callback triggered in response to setAdvertisingParameters(AdvertisingSetParameters) indicating result of the operation.
     */
    func onAdvertisingParametersUpdated(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, txPower: Int, status: Int)
    
    /**
     * Callback triggered in response to startAdvertisingSet(AdvertisingSetParameters, AdvertiseData, AdvertiseData, PeriodicAdvertisingParameters,
     * AdvertiseData, AdvertisingSetCallback) indicating result of the operation.
     */
    func onAdvertisingSetStarted(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, txPower: Int, status: Int)

    /**
     * Callback triggered in response to stopAdvertisingSet(AdvertisingSetCallback) indicating advertising set is stopped.
     */
    func onAdvertisingSetStopped(advertisingSet: Android.Bluetooth.LE.AdvertisingSet)
    
    /**
     * Callback triggered in response to setPeriodicAdvertisingData(AdvertiseData) indicating result of the operation.
     */
    func onPeriodicAdvertisingDataSet(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, status: Int)
    
    /**
     * Callback triggered in response to setPeriodicAdvertisingEnabled(boolean) indicating result of the operation.
     */
    func onPeriodicAdvertisingEnabled(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, enable: Bool, status: Int)
    
    /**
     * Callback triggered in response to setPeriodicAdvertisingParameters(PeriodicAdvertisingParameters) indicating result of the operation.
     */
    func onPeriodicAdvertisingParametersUpdated(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, status: Int)
    
    /**
     * Callback triggered in response to setAdvertisingData(AdvertiseData) indicating result of the operation.
     */
    func onScanResponseDataSet(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, status: Int)
}

// MARK: - Local Listener

extension AndroidBluetoothLowEnergyAdvertisingSetCallback {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal class AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal: JNILocalProxy<AndroidBluetoothLowEnergyAdvertisingSetCallback, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
            JNICache.Method.onAdvertisingDataSet.method,
            .finalize
        ]
        
        let clazz = JNI.FindClass( proxyClassName() )
        
        withUnsafePointer(to: &natives[0]) {
            nativesPtr in
            if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, jint(natives.count) ) != jint(JNI_OK) {
                JNI.report( "Unable to register java natives" )
            }
        }
        
        defer { JNI.DeleteLocalRef( clazz ) }
        
        return JNI.api.NewGlobalRef( JNI.env, clazz )!
    }()
    
    override open class func proxyClassName() -> String { return JNICache.className }
    
    override open class func proxyClass() -> jclass? { return _proxyClass }
}

internal extension AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.SwiftSupport.Bluetooth.LE.className(["SwiftAdvertiseSetCallback"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        struct FieldID {
            static var DATA_COMPLETE: jfieldID?
        }
        
        /// JNI Method cache
        fileprivate enum Method {
            internal
            enum onAdvertisingDataSet: JNINativeMethodEntry {
                
                static let name = "__on_advertising_dataSet"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingDataSet_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingDataSet
            }
            
            enum onAdvertisingEnabled: JNINativeMethodEntry {
                
                static let name = "__on_advertising_enabled"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature),
                        .boolean,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingEnabled_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingEnabled
            }
            
            enum onAdvertisingParametersUpdated: JNINativeMethodEntry {
                
                static let name = "__on_avertising_parameters_updated"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature),
                        .int,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingParametersUpdated_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingParametersUpdated
            }
            
            enum onAdvertisingSetStarted: JNINativeMethodEntry {
                
                static let name = "__on_advertising_set_started"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature),
                        .int,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingSetStarted_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingSetStarted
            }
            
            enum onAdvertisingSetStopped: JNINativeMethodEntry {
                
                static let name = "__on_advertising_set_stopped"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature)
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingSetStopped_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingSetStopped
            }
            
            enum onPeriodicAdvertisingDataSet: JNINativeMethodEntry {
                
                static let name = "__on_periodic_advertising_dataSet"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnPeriodicAdvertisingDataSet_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onPeriodicAdvertisingDataSet
            }
            
            enum onPeriodicAdvertisingEnabled: JNINativeMethodEntry {
                
                static let name = "__on_periodic_advertising_enabled"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature),
                        .boolean,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnPeriodicAdvertisingEnabled_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onPeriodicAdvertisingEnabled
            }
            
            enum onPeriodicAdvertisingParametersUpdated: JNINativeMethodEntry {
                
                static let name = "__on_periodic_advertising_parameters_updated"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnPeriodicAdvertisingParametersUpdated_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onPeriodicAdvertisingParametersUpdated
            }
            
            enum onScanResponsaDataset: JNINativeMethodEntry {
                
                static let name = "__on_scan_response_dataSet"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertisingSet.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseSetCallback_OnScanResponsaDataset_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onScanResponsaDataset
            }
        }
    }
}

// MARK: - Private Methods

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingDataSet_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingDataSet( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                        _ __this: jobject?,
                                                                        _ __swiftObject: jlong,
                                                                        _ advertisingSetParam: jobject?,
                                                                        _ statusParam: jint) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    let status = Int(statusParam)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onAdvertisingDataSet(advertisingSet: advertisingSet, status: status)
}

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingEnabled_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jboolean, _: jint) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingEnabled( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                                 _ __this: jobject?,
                                                                                 _ __swiftObject: jlong,
                                                                                 _ advertisingSetParam: jobject?,
                                                                                 _ enableParam: jboolean,
                                                                                 _ statusParam: jint) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    let status = Int(statusParam)
    let enable = enableParam != jboolean(JNI_FALSE)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onAdvertisingEnabled(advertisingSet: advertisingSet, enable: enable, status: status)
}

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingParametersUpdated_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingParametersUpdated( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                                 _ __this: jobject?,
                                                                                 _ __swiftObject: jlong,
                                                                                 _ advertisingSetParam: jobject?,
                                                                                 _ txPowerParam: jint,
                                                                                 _ statusParam: jint) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    let txPower = Int(txPowerParam)
    let status = Int(statusParam)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onAdvertisingParametersUpdated(advertisingSet: advertisingSet, txPower: txPower, status: status)
}

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingSetStarted_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingSetStarted( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                                           _ __this: jobject?,
                                                                                           _ __swiftObject: jlong,
                                                                                           _ advertisingSetParam: jobject?,
                                                                                           _ txPowerParam: jint,
                                                                                           _ statusParam: jint) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    let txPower = Int(txPowerParam)
    let status = Int(statusParam)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onAdvertisingSetStarted(advertisingSet: advertisingSet, txPower: txPower, status: status)
}

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnAdvertisingSetStopped_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingSetStopped( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                                    _ __this: jobject?,
                                                                                    _ __swiftObject: jlong,
                                                                                    _ advertisingSetParam: jobject?) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onAdvertisingSetStopped(advertisingSet: advertisingSet)
}

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnPeriodicAdvertisingDataSet_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onPeriodicAdvertisingDataSet( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                                 _ __this: jobject?,
                                                                                 _ __swiftObject: jlong,
                                                                                 _ advertisingSetParam: jobject?,
                                                                                 _ statusParam: jint) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    let status = Int(statusParam)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onPeriodicAdvertisingDataSet(advertisingSet: advertisingSet, status: status)
}

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnPeriodicAdvertisingEnabled_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jboolean, _: jint) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onPeriodicAdvertisingEnabled( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                                 _ __this: jobject?,
                                                                                 _ __swiftObject: jlong,
                                                                                 _ advertisingSetParam: jobject?,
                                                                                 _ enableParam: jboolean,
                                                                                 _ statusParam: jint) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    let status = Int(statusParam)
    let enable = enableParam != jboolean(JNI_FALSE)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onPeriodicAdvertisingEnabled(advertisingSet: advertisingSet, enable: enable, status: status)
}

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnPeriodicAdvertisingParametersUpdated_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onPeriodicAdvertisingParametersUpdated( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                                           _ __this: jobject?,
                                                                                           _ __swiftObject: jlong,
                                                                                           _ advertisingSetParam: jobject?,
                                                                                           _ statusParam: jint) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    let status = Int(statusParam)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onPeriodicAdvertisingParametersUpdated(advertisingSet: advertisingSet, status: status)
}

private typealias AndroidBluetoothLowEnergyAdvertiseSetCallback_OnScanResponsaDataset_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

private func AndroidBluetoothLowEnergyAdvertiseSetCallback_onScanResponsaDataset( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                                                   _ __this: jobject?,
                                                                                                   _ __swiftObject: jlong,
                                                                                                   _ advertisingSetParam: jobject?,
                                                                                                   _ statusParam: jint) -> () {
    
    let advertisingSet = Android.Bluetooth.LE.AdvertisingSet(javaObject: advertisingSetParam)
    let status = Int(statusParam)
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onScanResponseDataSet(advertisingSet: advertisingSet, status: status)
}
