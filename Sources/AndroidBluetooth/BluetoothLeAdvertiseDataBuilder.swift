//
//  BluetoothLeAdvertiseDataBuilder.swift
//  Android
//
//  Created by Marco Estrella on 5/25/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth.LE.AdvertiseData {
    
    public typealias Builder = AndroidBluetoothLowEnergyAdvertiseDataBuilder
}

/**
 * Builder for AdvertiseData.
 */
public final class AndroidBluetoothLowEnergyAdvertiseDataBuilder: JavaObject {
    
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

// MARK: - METHODS

public extension AndroidBluetoothLowEnergyAdvertiseDataBuilder {
    
    public func build() -> AndroidBluetoothLowEnergyAdvertiseData {
        
        var __locals = [jobject]()
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "build",
                                                  methodSig: "()Landroid/bluetooth/le/AdvertiseData;",
                                                  methodCache: &JNICache.MethodID.build,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseData( javaObject: __return )
    }
    
    /**
     * Add manufacturer specific data.
     */
    public func addManufacturerData(_ manufacturerId: Int, _ manufacturerSpecificData: [Int8]) -> AndroidBluetoothLowEnergyAdvertiseData.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(manufacturerId))
        __args[1] = JNIType.toJava( value: manufacturerSpecificData, locals: &__locals )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addManufacturerData",
            methodSig: "(I[B)Landroid/bluetooth/le/AdvertiseData$Builder;",
            methodCache: &JNICache.MethodID.addManufacturerData,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setManufacturerData",
                                                  methodSig: "(I[B)Landroid/bluetooth/le/AdvertiseData$Builder;",
                                                  methodCache: &JNICache.MethodID.addManufacturerData,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseData.Builder(javaObject: __return)
    }
    
    public func addServiceData(serviceDataUuid: Android.OS.ParcelUuid, serviceData: [Int8]) -> AndroidBluetoothLowEnergyAdvertiseData.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] =  JNIType.toJava( value: serviceDataUuid, locals: &__locals )
        __args[1] = JNIType.toJava( value: serviceData, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "addServiceData",
                                                  methodSig: "(Landroid/os/ParcelUuid;[B)Landroid/bluetooth/le/AdvertiseData$Builder;",
                                                  methodCache: &JNICache.MethodID.addServiceData2Params,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseData.Builder(javaObject: __return)
    }
    
    public func addServiceData(serviceDataUuid: Android.OS.ParcelUuid) -> AndroidBluetoothLowEnergyAdvertiseData.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] =  JNIType.toJava( value: serviceDataUuid, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "addServiceData",
                                                  methodSig: "(Landroid/os/ParcelUuid;)Landroid/bluetooth/le/AdvertiseData$Builder;",
                                                  methodCache: &JNICache.MethodID.addServiceData,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseData.Builder(javaObject: __return)
    }
    
    public func setIncludeDeviceName( includeDeviceName: Bool) -> AndroidBluetoothLowEnergyAdvertiseData.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(includeDeviceName ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setIncludeDeviceName",
            methodSig: "(Z)Landroid/bluetooth/le/AdvertiseData$Builder;",
            methodCache: &JNICache.MethodID.setIncludeDeviceName,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setIncludeDeviceName",
                                                  methodSig: "(Z)Landroid/bluetooth/le/AdvertiseData$Builder;",
                                                  methodCache: &JNICache.MethodID.setIncludeDeviceName,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseData.Builder(javaObject: __return)
    }
    
    public func setIncludeTxPowerLevel( includeTxPowerLevel: Bool) -> AndroidBluetoothLowEnergyAdvertiseData.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(includeTxPowerLevel ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setIncludeTxPowerLevel",
            methodSig: "(Z)Landroid/bluetooth/le/AdvertiseData$Builder;",
            methodCache: &JNICache.MethodID.setIncludeTxPowerLevel,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setIncludeTxPowerLevel",
                                                  methodSig: "(Z)Landroid/bluetooth/le/AdvertiseData$Builder;",
                                                  methodCache: &JNICache.MethodID.setIncludeTxPowerLevel,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertiseData.Builder(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothLowEnergyAdvertiseDataBuilder {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/le/AdvertiseData$Builder"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var initMethod: jmethodID?
            static var build: jmethodID?
            static var addManufacturerData: jmethodID?
            static var addServiceData: jmethodID?
            static var addServiceData2Params: jmethodID?
            static var addServiceUuid: jmethodID?
            static var setIncludeDeviceName: jmethodID?
            static var setIncludeTxPowerLevel: jmethodID?
        }
    }
}
