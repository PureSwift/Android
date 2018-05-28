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
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseCallback_OnStartSuccess_Type = AndroidBluetoothLowEnergyAdvertiseSetCallback_onAdvertisingDataSet
            }
        }
    }
}

// MARK: - Private Methods

private typealias AndroidBluetoothLowEnergyAdvertiseCallback_OnStartSuccess_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

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
