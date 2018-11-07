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
import Android

public extension Android.Bluetooth.LE {
    
    public typealias AdvertisingSetCallback = AndroidBluetoothLowEnergyAdvertisingSetCallback
}

public extension Android.Bluetooth.LE.AdvertisingSetCallback {
    
    public typealias Status = AndroidBluetoothLowEnergyAdvertisingStatus
}

/// Bluetooth LE advertising set callbacks, used to deliver advertising operation status.
public protocol AndroidBluetoothLowEnergyAdvertisingSetCallback: JavaProtocol {
    
    /**
     * Callback triggered in response to setAdvertisingData(AdvertiseData) indicating result of the operation.
     */
    func onAdvertisingDataSet(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, status: Status)
    
    /**
     * Callback triggered in response to startAdvertisingSet(AdvertisingSetParameters, AdvertiseData, AdvertiseData, PeriodicAdvertisingParameters,
     * AdvertiseData, AdvertisingSetCallback) indicating result of the operation.
     */
    func onAdvertisingEnabled(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, enable: Bool, status: Status)
    
    /**
     * Callback triggered in response to setAdvertisingParameters(AdvertisingSetParameters) indicating result of the operation.
     */
    func onAdvertisingParametersUpdated(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, txPower: Int, status: Status)
    
    /**
     * Callback triggered in response to startAdvertisingSet(AdvertisingSetParameters, AdvertiseData, AdvertiseData, PeriodicAdvertisingParameters,
     * AdvertiseData, AdvertisingSetCallback) indicating result of the operation.
     */
    func onAdvertisingSetStarted(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, txPower: Int, status: Status)

    /**
     * Callback triggered in response to stopAdvertisingSet(AdvertisingSetCallback) indicating advertising set is stopped.
     */
    func onAdvertisingSetStopped(advertisingSet: Android.Bluetooth.LE.AdvertisingSet)
    
    /**
     * Callback triggered in response to setPeriodicAdvertisingData(AdvertiseData) indicating result of the operation.
     */
    func onPeriodicAdvertisingDataSet(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, status: Status)
    
    /**
     * Callback triggered in response to setPeriodicAdvertisingEnabled(boolean) indicating result of the operation.
     */
    func onPeriodicAdvertisingEnabled(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, enable: Bool, status: Status)
    
    /**
     * Callback triggered in response to setPeriodicAdvertisingParameters(PeriodicAdvertisingParameters) indicating result of the operation.
     */
    func onPeriodicAdvertisingParametersUpdated(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, status: Status)
    
    /**
     * Callback triggered in response to setAdvertisingData(AdvertiseData) indicating result of the operation.
     */
    func onScanResponseDataSet(advertisingSet: Android.Bluetooth.LE.AdvertisingSet, status: Status)
}

// MARK: - Supporting Type

public struct AndroidBluetoothLowEnergyAdvertisingStatus: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /**
     * Failed to start advertising as the advertising is already started.
     */
    public static let alreadyStarted = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: AndroidBluetoothLowEnergyAdvertisingSetCallbackConstants.ADVERTISE_FAILED_ALREADY_STARTED)
    
    /**
     * Failed to start advertising as the advertise data to be broadcasted is too large.
     */
    public static let dataTooLarge = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: AndroidBluetoothLowEnergyAdvertisingSetCallbackConstants.ADVERTISE_FAILED_DATA_TOO_LARGE)
    
    /**
     * This feature is not supported on this platform.
     */
    public static let featureUnsupported = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: AndroidBluetoothLowEnergyAdvertisingSetCallbackConstants.ADVERTISE_FAILED_FEATURE_UNSUPPORTED)
    
    /**
     * Operation failed due to an internal error.
     */
    public static let internalError = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: AndroidBluetoothLowEnergyAdvertisingSetCallbackConstants.ADVERTISE_FAILED_INTERNAL_ERROR)
    
    /**
     * Failed to start advertising because no advertising instance is available.
     */
    public static let tooManyAdvertisers = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: AndroidBluetoothLowEnergyAdvertisingSetCallbackConstants.ADVERTISE_FAILED_TOO_MANY_ADVERTISERS)
    
    /**
     * The requested operation was successful.
     */
    public static let success = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: AndroidBluetoothLowEnergyAdvertisingSetCallbackConstants.ADVERTISE_SUCCESS)
    
}

// MARK: - Constants

internal class AndroidBluetoothLowEnergyAdvertisingSetCallbackConstants {
    
    /// Failed to start advertising as the advertising is already started.
    internal static var ADVERTISE_FAILED_ALREADY_STARTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_FAILED_ALREADY_STARTED",
                fieldType: "I",
                fieldCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.FieldID.ADVERTISE_FAILED_ALREADY_STARTED,
                className: AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.className,
                classCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Failed to start advertising as the advertise data to be broadcasted is too large.
    internal static var ADVERTISE_FAILED_DATA_TOO_LARGE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_FAILED_DATA_TOO_LARGE",
                fieldType: "I",
                fieldCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.FieldID.ADVERTISE_FAILED_DATA_TOO_LARGE,
                className: AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.className,
                classCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// This feature is not supported on this platform.
    internal static var ADVERTISE_FAILED_FEATURE_UNSUPPORTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_FAILED_FEATURE_UNSUPPORTED",
                fieldType: "I",
                fieldCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.FieldID.ADVERTISE_FAILED_FEATURE_UNSUPPORTED,
                className: AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.className,
                classCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    
    /// Operation failed due to an internal error.
    internal static var ADVERTISE_FAILED_INTERNAL_ERROR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_FAILED_INTERNAL_ERROR",
                fieldType: "I",
                fieldCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.FieldID.ADVERTISE_FAILED_INTERNAL_ERROR,
                className: AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.className,
                classCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Failed to start advertising because no advertising instance is available.
    internal static var ADVERTISE_FAILED_TOO_MANY_ADVERTISERS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_FAILED_TOO_MANY_ADVERTISERS",
                fieldType: "I",
                fieldCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.FieldID.ADVERTISE_FAILED_TOO_MANY_ADVERTISERS,
                className: AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.className,
                classCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// The requested operation was successful.
    internal static var ADVERTISE_SUCCESS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ADVERTISE_SUCCESS",
                fieldType: "I",
                fieldCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.FieldID.ADVERTISE_SUCCESS,
                className: AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.className,
                classCache: &AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
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

internal extension AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Bluetooth.LE.className(["SwiftAdvertiseSetCallback"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            static var ADVERTISE_FAILED_ALREADY_STARTED: jfieldID?
            static var ADVERTISE_FAILED_DATA_TOO_LARGE: jfieldID?
            static var ADVERTISE_FAILED_FEATURE_UNSUPPORTED: jfieldID?
            static var ADVERTISE_FAILED_INTERNAL_ERROR: jfieldID?
            static var ADVERTISE_FAILED_TOO_MANY_ADVERTISERS: jfieldID?
            static var ADVERTISE_SUCCESS: jfieldID?
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
    let status = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: Int(statusParam))
    
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
    let status = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: Int(statusParam))
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
    let status = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: Int(statusParam))
    
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
    let status = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: Int(statusParam))
    
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
    let status = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: Int(statusParam))
    
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
    let status = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: Int(statusParam))
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
    let status = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: Int(statusParam))
    
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
    let status = Android.Bluetooth.LE.AdvertisingSetCallback.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothLowEnergyAdvertiseSetCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onScanResponseDataSet(advertisingSet: advertisingSet, status: status)
}
