//
//  BluetoothLePeriodicAdvertisingParametersBuilder.swift
//  Android
//
//  Created by Marco Estrella on 5/24/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth.LE.PeriodicAdvertisingParameters {
    
    public typealias Builder = AndroidBluetoothLowEnergyPeriodicAdvertisingParametersBuilder
}

public final class AndroidBluetoothLowEnergyPeriodicAdvertisingParametersBuilder: JavaObject {
    
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

public extension Android.Bluetooth.LE.PeriodicAdvertisingParameters.Builder {
    
    public func build() -> Android.Bluetooth.LE.PeriodicAdvertisingParameters {
        
        var __locals = [jobject]()
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "build",
                                                  methodSig: "()Landroid/bluetooth/le/PeriodicAdvertisingParameters;",
                                                  methodCache: &JNICache.MethodID.build,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.LE.PeriodicAdvertisingParameters( javaObject: __return )
    }
    
    /**
     * Whether the transmission power level should be included in the periodic packet.
     */
    public func setIncludeTxPower(includeTxPower: Bool) -> Android.Bluetooth.LE.PeriodicAdvertisingParameters.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(includeTxPower ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setIncludeTxPower",
            methodSig: "(Z)Landroid/bluetooth/le/PeriodicAdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setIncludeTxPower,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setIncludeTxPower",
                                                  methodSig: "(Z)Landroid/bluetooth/le/PeriodicAdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setIncludeTxPower,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.LE.PeriodicAdvertisingParameters.Builder(javaObject: __return)
    }
    
    /**
     * Set advertising interval for periodic advertising, in 1.25ms unit.
     */
    public func setInterval(interval: Int) -> Android.Bluetooth.LE.PeriodicAdvertisingParameters.Builder {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(interval) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setInterval",
            methodSig: "(I)Landroid/bluetooth/le/PeriodicAdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setInterval,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setInterval",
                                                  methodSig: "(I)Landroid/bluetooth/le/PeriodicAdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setInterval,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.LE.PeriodicAdvertisingParameters.Builder(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension Android.Bluetooth.LE.PeriodicAdvertisingParameters.Builder {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/le/PeriodicAdvertisingParameters$Builder"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var initMethod: jmethodID?
            static var build: jmethodID?
            static var setIncludeTxPower: jmethodID?
            static var setInterval: jmethodID?
        }
    }
}
