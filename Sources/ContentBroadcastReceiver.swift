//
//  ContentBroadcastReceiver.swift
//  Android
//
//  Created by Marco Estrella on 6/21/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Content {
    
    public typealias BroadcastReceiver = AndroidBroadcastReceiver
}

public protocol AndroidBroadcastReceiver: JavaProtocol {
    
    func onReceive(context: Android.Content.Context, intent: JavaObject)
}

//Mark: Methods

public extension AndroidBroadcastReceiver {
    
    /**
     * Sets the flag indicating that this receiver should abort the current broadcast; only works with broadcasts sent through Context.sendOrderedBroadcast.
     */
    public func abortBroadcast() {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "abortBroadcast",
                                     methodSig: "()V",
                                     methodCache: &AndroidBroadcastReceiverLocal.JNICache.Method.abortBroadcast,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    
    /**
     * Clears the flag indicating that this receiver should abort the current broadcast.
     */
    public func clearAbortBroadcast() {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "clearAbortBroadcast",
                                     methodSig: "()V",
                                     methodCache: &AndroidBroadcastReceiverLocal.JNICache.Method.clearAbortBroadcast,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    
    /**
     * Returns the flag indicating whether or not this receiver should abort the current broadcast.
     */
    public func getAbortBroadcast() -> Bool {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        var __return: jboolean = jboolean(JNI_FALSE)
        
        withJavaObject {
            
            __return = JNIMethod.CallBooleanMethod(object: $0,
                                     methodName: "getAbortBroadcast",
                                     methodSig: "()Z",
                                     methodCache: &AndroidBroadcastReceiverLocal.JNICache.Method.getAbortBroadcast,
                                     args: &__args,
                                     locals: &__locals)
        }
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return the last value given to setDebugUnregister(boolean).
     */
    public func getDebugUnregister() -> Bool {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        var __return: jboolean = jboolean(JNI_FALSE)
        
        withJavaObject {
            
            __return = JNIMethod.CallBooleanMethod(object: $0,
                                                   methodName: "getDebugUnregister",
                                                   methodSig: "()Z",
                                                   methodCache: &AndroidBroadcastReceiverLocal.JNICache.Method.getDebugUnregister,
                                                   args: &__args,
                                                   locals: &__locals)
        }
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Retrieve the current result code, as set by the previous receiver.
     */
    public func getResultCode() -> Int {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        var returnValue : Int = Int.min
        
        withJavaObject {
            
            let __return = JNIMethod.CallIntMethod(object: $0,
                                                   methodName: "getResultCode",
                                                   methodSig: "()Z",
                                                   methodCache: &AndroidBroadcastReceiverLocal.JNICache.Method.getResultCode,
                                                   args: &__args,
                                                   locals: &__locals)
            returnValue = Int(__return)
        }
        
        return returnValue
    }
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
            JNICacheLocal.Method.onReceive.method,
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
    
    override open class func proxyClassName() -> String { return JNICacheLocal.className }
    
    override open class func proxyClass() -> jclass? { return _proxyClass }
}

// MARK: - JNI Cache

internal extension AndroidBroadcastReceiverLocal {
    
    /// JNI Cache
    struct JNICacheLocal {
        
        static let classSignature = SwiftSupport.Content.className(["SwiftBroadcastReceiver"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method cache
        fileprivate enum Method {
            
            enum onReceive: JNINativeMethodEntry {
                
                static let name = "__onReceive"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(JNIClassName(rawValue: Android.Content.Context.JNICache.className)!),
                        .object(JNIClassName(rawValue: "android/content/Intent")!)
                    ],
                    returnType: .object(Android.View.View.JNICache.classSignature)
                )
                
                static let thunk: AndroidBroadcastReceiver_onReceive_type = AndroidBroadcastReceiver_onReceive
            }
        }
    }
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/content/BroadcastReceiver"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method cache
        fileprivate enum Method {
            
            static var abortBroadcast: jmethodID?
            static var clearAbortBroadcast: jmethodID?
            static var getAbortBroadcast: jmethodID?
            static var getDebugUnregister: jmethodID?
            static var getResultCode: jmethodID?
            static var getResultData: jmethodID?
            static var getResultExtras: jmethodID?
            static var goAsync: jmethodID?
            static var isInitialStickyBroadcast: jmethodID?
            static var isOrderedBroadcast: jmethodID?
            static var peekService: jmethodID?
            static var setDebugUnregister: jmethodID?
            static var setOrderedHint: jmethodID?
            static var setResult: jmethodID?
            static var setResultCode: jmethodID?
            static var setResultData: jmethodID?
            static var setResultExtras: jmethodID?
        }
    }
}

// MARK: - Native Methods

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
