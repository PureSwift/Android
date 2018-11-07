//
//  BluetoothA2dp.swift
//  Android
//
//  Created by Marco Estrella on 6/7/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth {
    
    public typealias A2dp = AndroidBluetoothA2dp
}

/**
 * This class provides the public APIs to control the Bluetooth A2DP profile.
 *
 * BluetoothA2dp is a proxy object for controlling the Bluetooth A2DP Service via IPC. Use
 * BluetoothAdapter.getProfileProxy(Context, BluetoothProfile.ServiceListener, int) to get the BluetoothA2dp proxy object.
 *
 * Android only supports one connected Bluetooth A2dp device at a time. Each method is protected with its appropriate permission.
 */
public final class AndroidBluetoothA2dp: JavaObject {
    
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

internal extension AndroidBluetoothA2dp {
    
    internal static var ACTION_CONNECTION_STATE_CHANGED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_CONNECTION_STATE_CHANGED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_CONNECTION_STATE_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var ACTION_PLAYING_STATE_CHANGED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_PLAYING_STATE_CHANGED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_PLAYING_STATE_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var STATE_NOT_PLAYING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_NOT_PLAYING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_NOT_PLAYING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var STATE_PLAYING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_PLAYING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_PLAYING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - Methods

public extension AndroidBluetoothA2dp {
    
    /**
     * Get connected devices for this specific profile.
     */
    public func getConnectedDevices() -> List? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getConnectedDevices",
                                                  methodSig: "()Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getConnectedDevices,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return ListForward(javaObject: __return)
    }
    
    /**
     * Get the current connection state of the profile.
     */
    public func getConnectionState(device: Android.Bluetooth.Device) -> Int {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: device, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                  methodName: "getConnectionState",
                                                  methodSig: "(Landroid/bluetooth/BluetoothDevice;)I",
                                                  methodCache: &JNICache.MethodID.getConnectionState,
                                                  args: &__args,
                                                  locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Get a list of devices that match any of the given connection states.
     */
    public func getDevicesMatchingConnectionStates(states: [Int]) -> List? {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: states, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getDevicesMatchingConnectionStates",
                                                  methodSig: "([I)Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getDevicesMatchingConnectionStates,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return ListForward(javaObject: __return)
    }
    
    /**
     * Check if A2DP profile is streaming music.
     */
    public func isA2dpPlaying(device: Android.Bluetooth.Device) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: device, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                               methodName: "isA2dpPlaying",
                                               methodSig: "(Landroid/bluetooth/BluetoothDevice;)Z",
                                               methodCache: &JNICache.MethodID.isA2dpPlaying,
                                               args: &__args,
                                               locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: - JNI

private extension AndroidBluetoothA2dp {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/BluetoothA2dp"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var ACTION_CONNECTION_STATE_CHANGED: jfieldID?
            static var ACTION_PLAYING_STATE_CHANGED: jfieldID?
            static var STATE_NOT_PLAYING: jfieldID?
            static var STATE_PLAYING: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getConnectedDevices: jmethodID?
            static var getConnectionState: jmethodID?
            static var getDevicesMatchingConnectionStates: jmethodID?
            static var isA2dpPlaying: jmethodID?
        }
    }
}

