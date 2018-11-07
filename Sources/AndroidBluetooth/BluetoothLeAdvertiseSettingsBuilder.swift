//
//  BluetoothLeAdvertiseSettingsBuilder.swift
//  Android
//
//  Created by Marco Estrella on 5/28/18.
//

import Foundation
import java_swift
import Android

public extension AndroidBluetoothLowEnergyAdvertiseSettings {
    
    public typealias Builder = AndroidBluetoothLowEnergyAdvertiseSettingsBuilder
}

/**
 * Builder class for AdvertiseSettings.
 */
public final class AndroidBluetoothLowEnergyAdvertiseSettingsBuilder: JavaObject {
    
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
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.initMethod,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: METHODS

public extension AndroidBluetoothLowEnergyAdvertiseSettings.Builder {
    
    /**
     * Set advertise mode to control the advertising power and latency.
     */
    public func setAdvertiseMode(advertiseMode: Android.Bluetooth.LE.AdvertiseSettings.AdvertiseMode) -> AndroidBluetoothLowEnergyAdvertiseSettings.Builder {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(advertiseMode.rawValue) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAdvertiseMode",
            methodSig: "(I)Landroid/bluetooth/le/AdvertiseSettings$Builder;",
            methodCache: &JNICache.MethodID.setAdvertiseMode,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setAdvertiseMode",
                                                  methodSig: "(I)Landroid/bluetooth/le/AdvertiseSettings$Builder;",
                                                  methodCache: &JNICache.MethodID.setAdvertiseMode,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseSettings.Builder(javaObject: __return)
    }
    
    /**
     * Set whether the advertisement type should be connectable or non-connectable.
     */
    public func setConnectable( connectable: Bool) -> AndroidBluetoothLowEnergyAdvertiseData.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(connectable ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setConnectable",
            methodSig: "(Z)Landroid/bluetooth/le/AdvertiseSettings$Builder;",
            methodCache: &JNICache.MethodID.setConnectable,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setConnectable",
                                                  methodSig: "(Z)Landroid/bluetooth/le/AdvertiseSettings$Builder;",
                                                  methodCache: &JNICache.MethodID.setConnectable,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseData.Builder(javaObject: __return)
    }
    
    /**
     * Limit advertising to a given amount of time.
     */
    public func setTimeout(timeoutMillis: Int) -> AndroidBluetoothLowEnergyAdvertiseSettings.Builder {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(timeoutMillis) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTimeout",
            methodSig: "(I)Landroid/bluetooth/le/AdvertiseSettings$Builder;",
            methodCache: &JNICache.MethodID.setTimeout,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setTimeout",
                                                  methodSig: "(I)Landroid/bluetooth/le/AdvertiseSettings$Builder;",
                                                  methodCache: &JNICache.MethodID.setTimeout,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseSettings.Builder(javaObject: __return)
    }
    
    /**
     * Set advertise mode to control the advertising power and latency.
     */
    public func setTxPowerLevel(txPowerLevel: Android.Bluetooth.LE.AdvertiseSettings.TxPowerLevel) -> AndroidBluetoothLowEnergyAdvertiseSettings.Builder {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(txPowerLevel.rawValue) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTxPowerLevel",
            methodSig: "(I)Landroid/bluetooth/le/AdvertiseSettings$Builder;",
            methodCache: &JNICache.MethodID.setTxPowerLevel,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setTxPowerLevel",
                                                  methodSig: "(I)Landroid/bluetooth/le/AdvertiseSettings$Builder;",
                                                  methodCache: &JNICache.MethodID.setTxPowerLevel,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseSettings.Builder(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothLowEnergyAdvertiseSettings.Builder {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/le/AdvertiseSettings$Builder"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var initMethod: jmethodID?
            static var build: jmethodID?
            static var setAdvertiseMode: jmethodID?
            static var setConnectable: jmethodID?
            static var setTimeout: jmethodID?
            static var setTxPowerLevel: jmethodID?
        }
    }
}
