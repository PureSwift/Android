//
//  BluetoothLeAdvertisingSetParametersBuilder.swift
//  Android
//
//  Created by Marco Estrella on 5/25/18.
//

import Foundation
import java_swift
import Android

public extension AndroidBluetoothLowEnergyAdvertisingSetParameters {
    
    public typealias Builder = AndroidBluetoothLowEnergyAdvertisingSetParametersBuilder
}

public final class AndroidBluetoothLowEnergyAdvertisingSetParametersBuilder: JavaObject {
    
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

public extension AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
    
    public func build() -> AndroidBluetoothLowEnergyAdvertisingSetParameters {
        
        var __locals = [jobject]()
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "build",
                                                  methodSig: "()Landroid/bluetooth/le/AdvertisingParameters;",
                                                  methodCache: &JNICache.MethodID.build,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters( javaObject: __return )
    }
    
    /**
     * Set whether advertiser address should be ommited from all packets.
     */
    public func setConnectable(connectable: Bool) -> AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(connectable ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setConnectable",
            methodSig: "(Z)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setIncludeTxPower,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setConnectable",
                                                  methodSig: "(Z)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setConnectable,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder(javaObject: __return)
    }
    
    /**
     * Set whether TX power should be included in the extended header.
     */
    public func setIncludeTxPower(includeTxPower: Bool) -> AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(includeTxPower ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setIncludeTxPower",
            methodSig: "(Z)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setIncludeTxPower,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setIncludeTxPower",
                                                  methodSig: "(Z)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setIncludeTxPower,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder(javaObject: __return)
    }
    
    /**
     * Set advertising interval.
     *
     * interval - int: Bluetooth LE Advertising interval, in 0.625ms unit. Valid range is from 160 (100ms) to 16777215 (10,485.759375 s).
     * Recommended values are: INTERVAL_LOW, INTERVAL_MEDIUM, or INTERVAL_HIGH.
     */
    public func setInterval(interval: Int) -> AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(interval) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setInterval",
            methodSig: "(I)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setInterval,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setInterval",
                                                  methodSig: "(I)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setInterval,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder(javaObject: __return)
    }
    
    /**
     * When set to true, advertising set will advertise 4.x Spec compliant advertisements.
     */
    public func setLegacyMode( isLegacy: Bool) -> AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(isLegacy ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLegacyMode",
            methodSig: "(Z)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setLegacyMode,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setLegacyMode",
                                                  methodSig: "(Z)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setLegacyMode,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder(javaObject: __return)
    }
    
    /**
     * Set the primary physical channel used for this advertising set. This is used only if legacy mode is not used.
     * Use isLeCodedPhySupported() to determine if LE Coded PHY is supported on this device.
     */
    public func setPrimaryPhy(primaryphy: Android.Bluetooth.LE.AdvertisingSetParameters.PrimaryPhy) -> AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(primaryphy.rawValue) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPrimaryPhy",
            methodSig: "(I)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setPrimaryPhy,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setPrimaryPhy",
                                                  methodSig: "(I)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setPrimaryPhy,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder(javaObject: __return)
    }
    
    /**
     * Set whether the advertisement type should be scannable.
     */
    public func setScannable( scannable: Bool) -> AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(scannable ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScannable",
            methodSig: "(Z)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setScannable,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setScannable",
                                                  methodSig: "(Z)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setScannable,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder(javaObject: __return)
    }
    
    /**
     * Set the secondary physical channel used for this advertising set.
     */
    public func setSecondaryPhy(secondaryPhy: Android.Bluetooth.LE.AdvertisingSetParameters.SecondaryPhy) -> AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(secondaryPhy.rawValue) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSecondaryPhy",
            methodSig: "(I)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setSecondaryPhy,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setSecondaryPhy",
                                                  methodSig: "(I)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setSecondaryPhy,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder(javaObject: __return)
    }
    
    /**
     * Set the transmission power level for the advertising.
     */
    public func setTxPowerLevel(txPowerLevel: Android.Bluetooth.LE.AdvertisingSetParameters.TxPowerLevel) -> AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(txPowerLevel.rawValue) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTxPowerLevel",
            methodSig: "(I)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
            methodCache: &JNICache.MethodID.setTxPowerLevel,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setTxPowerLevel",
                                                  methodSig: "(I)Landroid/bluetooth/le/AdvertisingParameters$Builder;",
                                                  methodCache: &JNICache.MethodID.setTxPowerLevel,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothLowEnergyAdvertisingSetParameters.Builder {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/le/AdvertisingParameters$Builder"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var initMethod: jmethodID?
            static var build: jmethodID?
            static var setAnonymous: jmethodID?
            static var setConnectable: jmethodID?
            static var setIncludeTxPower: jmethodID?
            static var setInterval: jmethodID?
            static var setLegacyMode: jmethodID?
            static var setPrimaryPhy: jmethodID?
            static var setScannable: jmethodID?
            static var setSecondaryPhy: jmethodID?
            static var setTxPowerLevel: jmethodID?
        }
    }
}
