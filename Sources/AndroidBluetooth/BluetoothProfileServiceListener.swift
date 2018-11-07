//
//  BluetoothProfileServiceListener.swift
//  Android
//
//  Created by Marco Estrella on 6/7/18.
//

import Foundation
import java_swift
import java_util
import JNI
import Android

public extension Android.Bluetooth.Profile {
    
    public typealias ServiceListener = AndroidBluetoothProfileServiceListener
}

/**
 * An interface for notifying BluetoothProfile IPC clients when they have been connected or disconnected to the service.
 */
public protocol AndroidBluetoothProfileServiceListener: JavaProtocol {
    
    /**
     * Called to notify the client when the proxy object has been connected to the service.
     */
    func onServiceConnected(profile: Int, proxy: JavaObject)
    
    /**
     * Called to notify the client that this proxy object has been disconnected from the service.
     */
    func onServiceDisconnected(profile: Int)
}

// MARK: - Local

public extension AndroidBluetoothProfileServiceListener {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return AndroidBluetoothProfileServiceListenerLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal class AndroidBluetoothProfileServiceListenerLocal: JNILocalProxy<AndroidBluetoothProfileServiceListener, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
            JNICache.Method.onServiceConnected.method,
            JNICache.Method.onServiceDisconnected.method,
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

// MARK: - JNI

private extension AndroidBluetoothProfileServiceListenerLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Bluetooth.className(["SwiftBluetoothAdapter$LeScanCallback"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method cache
        fileprivate enum Method {
            internal
            enum onServiceConnected: JNINativeMethodEntry {
                
                static let name = "__on_service_connected"
                
                /// "(JILandroid/bluetooth/le/ScanResult;)V"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .int,
                        .object(JNIClassName(rawValue: "android/bluetooth/BluetoothProfile")!)
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothProfileServiceListener_OnServiceConnected_type = AndroidBluetoothProfileServiceListener_onServiceConnected
            }
            
            enum onServiceDisconnected: JNINativeMethodEntry {
                
                static let name = "__on_service_disconnected"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .int,
                        ], returnType: .void)
                
                static let thunk: AndroidBluetoothProfileServiceListener_OnServiceDisconnected_type = AndroidBluetoothProfileServiceListener_onServiceDisconnected
            }
        }
    }
}

// MARK: - Private Methods

private typealias AndroidBluetoothProfileServiceListener_OnServiceConnected_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint, _: jobject?) -> ()

private func AndroidBluetoothProfileServiceListener_onServiceConnected( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ profileParam: jint,
                                                                 _ proxyParam: jobject? ) -> () {
    
    let profile = Int(profileParam)

    let proxy = JavaObject(javaObject: proxyParam)
    
    AndroidBluetoothProfileServiceListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onServiceConnected(profile: profile, proxy: proxy)
}

private typealias AndroidBluetoothProfileServiceListener_OnServiceDisconnected_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint) -> ()

private func AndroidBluetoothProfileServiceListener_onServiceDisconnected( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                        _ __this: jobject?,
                                                                        _ __swiftObject: jlong,
                                                                        _ profileParam: jint) -> () {
    
    let profile = Int(profileParam)
    
    AndroidBluetoothProfileServiceListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onServiceDisconnected(profile: profile)
}
