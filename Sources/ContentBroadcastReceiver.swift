//
//  ContentBroadcastReceiver.swift
//  Android
//
//  Created by Marco Estrella on 6/21/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias BroadcastReceiver = AndroidBroadcastReceiver
}

public protocol AndroidBroadcastReceiver: JavaProtocol {
    
    func onReceive(context: Android.Content.Context, intent: JavaObject)
}

//Mark: Methods

public extension AndroidBroadcastReceiver {
    
}

// MARK: - Local Java Object

extension AndroidBroadcastReceiver {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return AndroidBroadcastReceiverLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal class AndroidBroadcastReceiverLocal: JNILocalProxy<AndroidBroadcastReceiver, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
            JNICache.Method.onReceive.method,
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

// MARK: - JNI Cache

internal extension AndroidBroadcastReceiverLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Content.className(["SwiftBroadcastReceiver"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Method cache
        fileprivate enum Method {
            
            //static var notifyDataSetChanged: jmethodID?
        
            enum onReceive: JNINativeMethodEntry {
                
                static let name = "__onReceive"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(JNIClassName(rawValue: Android.Content.Context.javaClassName)!),
                        .object(JNIClassName(rawValue: "android/content/Intent")!)
                    ],
                    returnType: .object(Android.View.View.JNICache.classSignature)
                )
                
                static let thunk: AndroidBroadcastReceiver_onReceive_type = AndroidBroadcastReceiver_onReceive
            }
        }
    }
}

private typealias AndroidBroadcastReceiver_onReceive_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jobject?) -> ()

private func AndroidBroadcastReceiver_onReceive( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                           _ __this: jobject?,
                                           _ __swiftObject: jlong,
                                           _ __context: jobject?,
                                           _ __intent: jobject?) -> () {
    
    let context = Android.Content.Context(javaObject: __context)
    let intent = JavaObject(javaObject: __intent)
    
    AndroidBroadcastReceiverLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onReceive(context: context, intent: intent)
}
