//
//  BluetoothProfile.swift
//  Android
//
//  Created by Marco Estrella on 6/7/18.
//

import Foundation
import Bluetooth
import java_swift
import java_util
import JNI

public extension Android.Bluetooth {
    
    public typealias Profile = AndroidBluetoothProfile
}

/**
 * Public APIs for the Bluetooth Profiles.
 *
 * Clients should call BluetoothAdapter.getProfileProxy(Context, BluetoothProfile.ServiceListener, int),
 * to get the Profile Proxy. Each public profile implements this interface.
 */
public protocol AndroidBluetoothProfile: JavaProtocol {
    
    /**
     * Get connected devices for this specific profile.
     */
    func getConnectedDevices() -> List?
    
    /**
     * Get the current connection state of the profile.
     */
    func getConnectionState(device: Android.Bluetooth.Device) -> Int
    
    /**
     * Get a list of devices that match any of the given connection states.
     */
    func getDevicesMatchingConnectionStates(states: [Int]) -> List?
}

// MARK: - Constants

internal extension AndroidBluetoothProfile {
    
    internal static var A2DP: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "A2DP",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.A2DP,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var EXTRA_PREVIOUS_STATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_PREVIOUS_STATE",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.EXTRA_PREVIOUS_STATE,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var EXTRA_STATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_STATE",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.EXTRA_STATE,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var GATT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.GATT,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var GATT_SERVER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_SERVER",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.GATT_SERVER,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var HEADSET: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEADSET",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.HEADSET,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var HEALTH: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.HEALTH,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var HID_DEVICE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HID_DEVICE",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.HID_DEVICE,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var SAP: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SAP",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.SAP,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var STATE_CONNECTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_CONNECTED",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.STATE_CONNECTED,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    internal static var STATE_CONNECTING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_CONNECTING",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.STATE_CONNECTING,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var STATE_DISCONNECTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_DISCONNECTED",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.STATE_DISCONNECTED,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var STATE_DISCONNECTING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_DISCONNECTING",
                fieldType: "I",
                fieldCache: &AndroidBluetoothProfileLocal.JNICache.FieldID.STATE_DISCONNECTING,
                className: AndroidBluetoothProfileLocal.JNICache.className,
                classCache: &AndroidBluetoothProfileLocal.JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - Local Listener

extension AndroidBluetoothProfile {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return AndroidBluetoothProfileLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal class AndroidBluetoothProfileLocal: JNILocalProxy<AndroidBluetoothProfile, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
            JNICache.Method.getConnectedDevices.method,
            //JNICache.Method.onBatchScanResults.method,
            //JNICache.Method.onScanFailed.method,
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

// MARK: - JNI

private extension AndroidBluetoothProfileLocal {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/BluetoothProfile"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var A2DP: jfieldID?
            static var EXTRA_PREVIOUS_STATE: jfieldID?
            static var EXTRA_STATE: jfieldID?
            static var GATT: jfieldID?
            static var GATT_SERVER: jfieldID?
            static var HEADSET: jfieldID?
            static var HEALTH: jfieldID?
            static var HID_DEVICE: jfieldID?
            static var SAP: jfieldID?
            static var STATE_CONNECTED: jfieldID?
            static var STATE_CONNECTING: jfieldID?
            static var STATE_DISCONNECTED: jfieldID?
            static var STATE_DISCONNECTING: jfieldID?
        }
        
        /// JNI Method cache
        fileprivate enum Method {
            internal
            enum getConnectedDevices: JNINativeMethodEntry {
                
                static let name = "__get_connected_devices"
                
                /// "(J)Ljava/util/List;"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long
                        ], returnType: .object(JNIClassName(rawValue: "java/util/List")!))
                
                static let thunk: AndroidBluetoothProfile_GetConnectedDevices_type = AndroidBluetoothProfile_getConnectedDevices
            }
        
            enum getConnectionState: JNINativeMethodEntry {
                
                static let name = "__get_connection_state"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(JNIClassName(rawValue: "android/bluetooth/BluetoothDevice")!)
                    ], returnType: .object(JNIClassName(rawValue: "java/util/List")!))
                
                static let thunk: AndroidBluetoothProfile_GetConnectionState_type = AndroidBluetoothProfile_getConnectionState
            }
            
            enum getDevicesMatchingConnectionStates: JNINativeMethodEntry {
                
                static let name = "__get_devices_matching_connection_states"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .array(.int)
                    ], returnType: .object(JNIClassName(rawValue: "java/util/List")!))
                
                static let thunk: AndroidBluetoothProfile_GetDevicesMatchingConnectionStates_type = AndroidBluetoothProfile_getDevicesMatchingConnectionStates
            }
        }
    }
}

// MARK: - Private Methods

private typealias AndroidBluetoothProfile_GetConnectedDevices_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> jobject?

private func AndroidBluetoothProfile_getConnectedDevices( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                          _ __this: jobject?,
                                                          _ __swiftObject: jlong ) -> jobject? {
    
    let __return = AndroidBluetoothProfileLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .getConnectedDevices()
    
    var __locals = [jobject]()
    
    return __return?.localJavaObject(&__locals)
}

private typealias AndroidBluetoothProfile_GetConnectionState_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> (jint)

private func AndroidBluetoothProfile_getConnectionState( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                          _ __this: jobject?,
                                                          _ __swiftObject: jlong,
                                                          _ __device: jobject?) -> jint {
    
    let device = Android.Bluetooth.Device(javaObject: __device)
    
    let __return = AndroidBluetoothProfileLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .getConnectionState(device: device)
    
    return jint(__return)
}

private typealias AndroidBluetoothProfile_GetDevicesMatchingConnectionStates_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> jobject?

private func AndroidBluetoothProfile_getDevicesMatchingConnectionStates( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                          _ __this: jobject?,
                                                          _ __swiftObject: jlong,
                                                          _ __states: jobject?) -> jobject? {
    
    let states: [Int]? = JNIType.toSwift(type: [Int].self, from: __states)
    
    let __return = AndroidBluetoothProfileLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .getDevicesMatchingConnectionStates(states: states!)
    
    var __locals = [jobject]()
    
    return __return?.localJavaObject(&__locals)
}
