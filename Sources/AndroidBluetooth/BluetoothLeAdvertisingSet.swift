//
//  BluetoothLeAdvertisingSet.swift
//  Android
//
//  Created by Marco Estrella on 5/28/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth.LE {
    
    public typealias AdvertisingSet = AndroidBluetoothLowEnergyAdvertisingSet
}

/**
 * This class provides a way to control single Bluetooth LE advertising instance.
 *
 * To get an instance of AdvertisingSet, call the startAdvertisingSet(AdvertisingSetParameters, AdvertiseData, AdvertiseData,
 * PeriodicAdvertisingParameters, AdvertiseData, AdvertisingSetCallback) method.
 *
 * Note: Most of the methods here require BLUETOOTH_ADMIN permission.
 */
public final class AndroidBluetoothLowEnergyAdvertisingSet: JavaObject {
    
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

// MARK: - METHODS

public extension AndroidBluetoothLowEnergyAdvertisingSet {
    
    /**
     * Enables Advertising.
     *
     * Requires BLUETOOTH_ADMIN
     */
    public func enableAdvertising(enable: Bool, duration: Int, maxExtendedAdvertisingEvents: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 3)
        __args[0] = jvalue(z: jboolean(enable ?  JNI_TRUE : JNI_FALSE) )
        __args[1] = jvalue(i: jint(duration) )
        __args[2] = jvalue(i: jint(maxExtendedAdvertisingEvents) )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                   methodName: "enableAdvertising",
                                   methodSig: "(ZII)V",
                                   methodCache: &JNICache.MethodID.enableAdvertising,
                                   args: &__args,
                                   locals: &__locals)
    }
    
    /**
     * Used to enable/disable periodic advertising.
     */
    public func setPeriodicAdvertisingEnabled(enable: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = jvalue(z: jboolean(enable ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setPeriodicAdvertisingEnabled",
                                 methodSig: "(Z)V",
                                 methodCache: &JNICache.MethodID.setPeriodicAdvertisingEnabled,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Set/update data being Advertised.
     */
    public func setAdvertisingData(advertiseData: Android.Bluetooth.LE.AdvertiseData) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = JNIType.toJava( value: advertiseData, locals: &__locals )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setAdvertisingData",
                                 methodSig: "(Landroid/bluetooth/le/AdvertiseData;)V",
                                 methodCache: &JNICache.MethodID.setAdvertisingData,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Used to set periodic advertising data, must be called after setPeriodicAdvertisingParameters,
     * or after advertising was started with periodic advertising data set.
     */
    public func setAdvertisingParameters(parameters: Android.Bluetooth.LE.AdvertisingSetParameters) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = JNIType.toJava( value: parameters, locals: &__locals )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setAdvertisingParameters",
                                 methodSig: "(Landroid/bluetooth/le/AdvertisingSetParameters;)V",
                                 methodCache: &JNICache.MethodID.setAdvertisingParameters,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Update periodic advertising parameters associated with this set.
     */
    public func setPeriodicAdvertisingParameters(parameters: Android.Bluetooth.LE.PeriodicAdvertisingParameters) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = JNIType.toJava( value: parameters, locals: &__locals )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setPeriodicAdvertisingParameters",
                                 methodSig: "(Landroid/bluetooth/le/PeriodicAdvertisingParameters;)V",
                                 methodCache: &JNICache.MethodID.setPeriodicAdvertisingParameters,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Set/update scan response data.
     */
    public func setScanResponseData(scanResponse: Android.Bluetooth.LE.AdvertiseData) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = JNIType.toJava( value: scanResponse, locals: &__locals )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setScanResponseData",
                                 methodSig: "(Landroid/bluetooth/le/AdvertiseData;)V",
                                 methodCache: &JNICache.MethodID.setScanResponseData,
                                 args: &__args,
                                 locals: &__locals)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothLowEnergyAdvertisingSet {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["AdvertisingSet"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var enableAdvertising: jmethodID?
            static var setAdvertisingData: jmethodID?
            static var setAdvertisingParameters: jmethodID?
            static var setPeriodicAdvertisingData: jmethodID?
            static var setPeriodicAdvertisingEnabled: jmethodID?
            static var setPeriodicAdvertisingParameters: jmethodID?
            static var setScanResponseData: jmethodID?
            
        }
    }
}
