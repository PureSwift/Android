//
//  BluetoothLowEnergyAdvertiser.swift
//  Android
//
//  Created by Marco Estrella on 5/29/18.
//

import Foundation
import java_swift
import java_util
import JNI
import Android

public extension Android.Bluetooth.LE {
    
    public typealias Advertiser = AndroidBluetoothLowEnergyAdvertiser
}

/**
 * This class provides a way to perform Bluetooth LE advertise operations, such as starting and stopping advertising. An
 * advertiser can broadcast up to 31 bytes of advertisement data represented by AdvertiseData.
 *
 * To get an instance of BluetoothLeAdvertiser, call the getBluetoothLeAdvertiser() method.
 *
 * Note: Most of the methods here require BLUETOOTH_ADMIN permission.
 */
public final class AndroidBluetoothLowEnergyAdvertiser: JavaObject {
    
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

// MARK: - Methods

public extension AndroidBluetoothLowEnergyAdvertiser {
    
    /**
     * Start Bluetooth LE Advertising. On success, the advertiseData will be broadcasted. Returns immediately, the operation status is delivered through callback.
     *
     * Requires BLUETOOTH_ADMIN permission.
     */
    public func startAdvertising(settings: Android.Bluetooth.LE.AdvertiseSettings,
                          advertiseData: Android.Bluetooth.LE.AdvertiseData,
                          callback: Android.Bluetooth.LE.AdvertiseCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: settings, locals: &__locals ),
            JNIType.toJava( value: advertiseData, locals: &__locals ),
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startAdvertising",
            methodSig: "(Landroid/bluetooth/le/AdvertiseSettings;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/ScanCallback;)V",
            methodCache: &JNICache.MethodID.startAdvertising,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Start Bluetooth LE Advertising. The advertiseData will be broadcasted if the operation succeeds. The scanResponse
     * is returned when a scanning device sends an active scan request. This method returns immediately, the operation status
     * is delivered through callback.
     *
     * Requires BLUETOOTH_ADMIN
     */
    public func startAdvertising(settings: Android.Bluetooth.LE.AdvertiseSettings,
                          advertiseData: Android.Bluetooth.LE.AdvertiseData,
                          scanResponse: Android.Bluetooth.LE.AdvertiseData,
                          callback: Android.Bluetooth.LE.AdvertiseCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: settings, locals: &__locals ),
            JNIType.toJava( value: advertiseData, locals: &__locals ),
            JNIType.toJava( value: scanResponse, locals: &__locals ),
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startAdvertising",
            methodSig: "(Landroid/bluetooth/le/AdvertiseSettings;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/ScanCallback;)V",
            methodCache: &JNICache.MethodID.startAdvertising2,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Creates a new advertising set. If operation succeed, device will start advertising. This method returns immediately, the
     * operation status is delivered through callback.onAdvertisingSetStarted().
     */
    public func startAdvertisingSet(parameters: Android.Bluetooth.LE.AdvertisingSetParameters,
                                 advertiseData: Android.Bluetooth.LE.AdvertiseData,
                                 scanResponse: Android.Bluetooth.LE.AdvertiseData,
                                 periodicParameters: Android.Bluetooth.LE.PeriodicAdvertisingParameters,
                                 periodicData: Android.Bluetooth.LE.AdvertiseData,
                                 duration: Int,
                                 maxExtendedAdvertisingEvents: Int,
                                 callback: Android.Bluetooth.LE.AdvertisingSetCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: parameters, locals: &__locals ),
            JNIType.toJava( value: advertiseData, locals: &__locals ),
            JNIType.toJava( value: scanResponse, locals: &__locals ),
            JNIType.toJava( value: periodicParameters, locals: &__locals ),
            JNIType.toJava( value: periodicData, locals: &__locals ),
            jvalue(i: jint(duration) ),
            jvalue(i: jint(maxExtendedAdvertisingEvents) ),
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startAdvertisingSet",
            methodSig: "(Landroid/bluetooth/le/AdvertisingSetParameters;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/PeriodicAdvertisingParameters;Landroid/bluetooth/le/AdvertiseData;IILandroid/bluetooth/le/AdvertisingSetCallback;)V",
            methodCache: &JNICache.MethodID.startAdvertisingSet,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Creates a new advertising set. If operation succeed, device will start advertising. This method returns immediately, the
     * operation status is delivered through callback.onAdvertisingSetStarted().
     */
    public func startAdvertisingSet(parameters: Android.Bluetooth.LE.AdvertisingSetParameters,
                                    advertiseData: Android.Bluetooth.LE.AdvertiseData,
                                    scanResponse: Android.Bluetooth.LE.AdvertiseData,
                                    periodicParameters: Android.Bluetooth.LE.PeriodicAdvertisingParameters,
                                    periodicData: Android.Bluetooth.LE.AdvertiseData,
                                    duration: Int,
                                    maxExtendedAdvertisingEvents: Int,
                                    callback: Android.Bluetooth.LE.AdvertisingSetCallback,
                                    handler: JavaObject) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: parameters, locals: &__locals ),
            JNIType.toJava( value: advertiseData, locals: &__locals ),
            JNIType.toJava( value: scanResponse, locals: &__locals ),
            JNIType.toJava( value: periodicParameters, locals: &__locals ),
            JNIType.toJava( value: periodicData, locals: &__locals ),
            jvalue(i: jint(duration) ),
            jvalue(i: jint(maxExtendedAdvertisingEvents) ),
            JNIType.toJava( value: callback, locals: &__locals ),
            JNIType.toJava( value: handler, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startAdvertisingSet",
            methodSig: "(Landroid/bluetooth/le/AdvertisingSetParameters;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/PeriodicAdvertisingParameters;Landroid/bluetooth/le/AdvertiseData;IILandroid/bluetooth/le/AdvertisingSetCallback;Landroid/os/Handler;)V",
            methodCache: &JNICache.MethodID.startAdvertisingSet2,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Creates a new advertising set. If operation succeed, device will start advertising. This method returns immediately, the
     * operation status is delivered through callback.onAdvertisingSetStarted().
     */
    public func startAdvertisingSet(parameters: Android.Bluetooth.LE.AdvertisingSetParameters,
                                    advertiseData: Android.Bluetooth.LE.AdvertiseData,
                                    scanResponse: Android.Bluetooth.LE.AdvertiseData,
                                    periodicParameters: Android.Bluetooth.LE.PeriodicAdvertisingParameters,
                                    periodicData: Android.Bluetooth.LE.AdvertiseData,
                                    callback: Android.Bluetooth.LE.AdvertisingSetCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: parameters, locals: &__locals ),
            JNIType.toJava( value: advertiseData, locals: &__locals ),
            JNIType.toJava( value: scanResponse, locals: &__locals ),
            JNIType.toJava( value: periodicParameters, locals: &__locals ),
            JNIType.toJava( value: periodicData, locals: &__locals ),
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startAdvertisingSet",
            methodSig: "(Landroid/bluetooth/le/AdvertisingSetParameters;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/PeriodicAdvertisingParameters;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/AdvertisingSetCallback;)V",
            methodCache: &JNICache.MethodID.startAdvertisingSet3,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Creates a new advertising set. If operation succeed, device will start advertising. This method returns immediately, the
     * operation status is delivered through callback.onAdvertisingSetStarted().
     */
    public func startAdvertisingSet(parameters: Android.Bluetooth.LE.AdvertisingSetParameters,
                                    advertiseData: Android.Bluetooth.LE.AdvertiseData,
                                    scanResponse: Android.Bluetooth.LE.AdvertiseData,
                                    periodicParameters: Android.Bluetooth.LE.PeriodicAdvertisingParameters,
                                    periodicData: Android.Bluetooth.LE.AdvertiseData,
                                    callback: Android.Bluetooth.LE.AdvertisingSetCallback,
                                    handler: JavaObject) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: parameters, locals: &__locals ),
            JNIType.toJava( value: advertiseData, locals: &__locals ),
            JNIType.toJava( value: scanResponse, locals: &__locals ),
            JNIType.toJava( value: periodicParameters, locals: &__locals ),
            JNIType.toJava( value: periodicData, locals: &__locals ),
            JNIType.toJava( value: callback, locals: &__locals ),
            JNIType.toJava( value: handler, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startAdvertisingSet",
            methodSig: "(Landroid/bluetooth/le/AdvertisingSetParameters;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/PeriodicAdvertisingParameters;Landroid/bluetooth/le/AdvertiseData;Landroid/bluetooth/le/AdvertisingSetCallback;Landroid/os/Handler;)V",
            methodCache: &JNICache.MethodID.startAdvertisingSet4,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Stop Bluetooth LE advertising. The callback must be the same one use in startAdvertising(AdvertiseSettings, AdvertiseData, AdvertiseCallback).
     *
     * Requires BLUETOOTH_ADMIN permission.
     */
    public func stopAdvertising(callback: Android.Bluetooth.LE.AdvertiseCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "stopAdvertising",
            methodSig: "(Landroid/bluetooth/le/AdvertiseCallback;)V",
            methodCache: &JNICache.MethodID.stopAdvertising,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Used to dispose of a AdvertisingSet object, obtained with startAdvertisingSet(AdvertisingSetParameters,
     * AdvertiseData, AdvertiseData, PeriodicAdvertisingParameters, AdvertiseData, AdvertisingSetCallback).
     */
    public func stopAdvertising(callback: Android.Bluetooth.LE.AdvertisingSetCallback) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: callback, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "stopAdvertising",
            methodSig: "(Landroid/bluetooth/le/AdvertisingSetCallback;)V",
            methodCache: &JNICache.MethodID.stopAdvertisingSet,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Private

private extension AndroidBluetoothLowEnergyAdvertiser {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/le/BluetoothLeAdvertiser"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var startAdvertising: jmethodID?
            static var startAdvertising2: jmethodID?
            static var startAdvertisingSet: jmethodID?
            static var startAdvertisingSet2: jmethodID?
            static var startAdvertisingSet3: jmethodID?
            static var startAdvertisingSet4: jmethodID?
            static var stopAdvertising: jmethodID?
            static var stopAdvertisingSet: jmethodID?
        }
    }
}

