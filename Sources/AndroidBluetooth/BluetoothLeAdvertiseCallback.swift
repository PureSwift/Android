//
//  BluetoothLeAdvertiseCallback.swift
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
    
    public typealias AdvertiseCallback = AndroidBluetoothLowEnergyAdvertiseCallback
}

public extension Android.Bluetooth.LE.AdvertiseCallback {
    
    public typealias Error = AndroidBluetoothLowEnergyAdvertiseCallbackError
}

/// Bluetooth LE advertising callbacks, used to deliver advertising operation status.
public protocol AndroidBluetoothLowEnergyAdvertiseCallback: JavaProtocol {
    
    func onStartSuccess(settingsInEffect: Android.Bluetooth.LE.AdvertiseSettings)
    
    func onStartFailure(error: Android.Bluetooth.LE.AdvertiseCallback.Error)
}

// MARK: - Supporting Types

public struct AndroidBluetoothLowEnergyAdvertiseCallbackError: RawRepresentable, Swift.Error {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        
        self.rawValue = rawValue
    }
}
// MARK: - Local Listener

extension AndroidBluetoothLowEnergyAdvertiseCallback {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return AndroidBluetoothLowEnergyAdvertiseCallbackListenerLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal class AndroidBluetoothLowEnergyAdvertiseCallbackListenerLocal: JNILocalProxy<AndroidBluetoothLowEnergyAdvertiseCallback, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
            JNICache.Method.onStartFailure.method,
            JNICache.Method.onStartFailure.method,
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

internal extension AndroidBluetoothLowEnergyAdvertiseCallbackListenerLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Bluetooth.LE.className(["SwiftAdvertiseCallback"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Method cache
        fileprivate enum Method {
            internal
            enum onStartSuccess: JNINativeMethodEntry {
                
                static let name = "__on_start_success"
                
                /// "(JILandroid/bluetooth/le/AdvertiseSettings;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.LE.AdvertiseSettings.JNICache.classSignature)
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseCallback_OnStartSuccess_Type = AndroidBluetoothLowEnergyAdvertiseCallback_onStartSuccess
            }
            
            enum onStartFailure: JNINativeMethodEntry {
                
                static let name = "__on_start_failure"
                
                /// "(JI)V"
                static let signature = JNIMethodSignature(argumentTypes: [.long, .int], returnType: .void)
                
                static let thunk: AndroidBluetoothLowEnergyAdvertiseCallback_OnStartFailure_Type = AndroidBluetoothLowEnergyScanCallback_onStartFailure
            }
        }
    }
}

// MARK: - Private Methods

private typealias AndroidBluetoothLowEnergyAdvertiseCallback_OnStartSuccess_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> ()

private func AndroidBluetoothLowEnergyAdvertiseCallback_onStartSuccess( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ settingsInEffect: jobject? ) -> () {
    
    let swiftSettingsInEffect = AndroidBluetoothLowEnergyAdvertiseSettings(javaObject: settingsInEffect)
    
    AndroidBluetoothLowEnergyAdvertiseCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onStartSuccess(settingsInEffect: swiftSettingsInEffect)
}

private typealias AndroidBluetoothLowEnergyAdvertiseCallback_OnStartFailure_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint) -> ()

private func AndroidBluetoothLowEnergyScanCallback_onStartFailure( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ __errorCode: jint) -> () {
    
    let error = AndroidBluetoothLowEnergyAdvertiseCallbackError(rawValue: Int(__errorCode))
    
    AndroidBluetoothLowEnergyAdvertiseCallbackListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onStartFailure(error: error)
}
