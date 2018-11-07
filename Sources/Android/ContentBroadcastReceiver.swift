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

open class AndroidBroadcastReceiver: JavaObject {
    
    /// Initialize a new Java instance and bind to this Swift object.
    public func bindNewJavaObject() {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var methodID: jmethodID?
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: JNICache.className,
                                                          classObject: JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &methodID,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    public convenience init() {
        
        self.init(javaObject: nil)
        self.bindNewJavaObject()
    }
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    // MARK: - Listener
    
    open func onReceive(context: Android.Content.Context?, intent: Android.Content.Intent?){
        
        fatalError("\(#function) must be implemented in subclass")
    }
    
     // MARK: - Responder
    
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
                                     methodCache: &BroadcastReceiverJNICache.Method.abortBroadcast,
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
                                     methodCache: &BroadcastReceiverJNICache.Method.clearAbortBroadcast,
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
                                                   methodCache: &BroadcastReceiverJNICache.Method.getAbortBroadcast,
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
                                                   methodCache: &BroadcastReceiverJNICache.Method.getDebugUnregister,
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
                                                   methodCache: &BroadcastReceiverJNICache.Method.getResultCode,
                                                   args: &__args,
                                                   locals: &__locals)
            returnValue = Int(__return)
        }
        
        return returnValue
    }
}

extension AndroidBroadcastReceiver: JNIListener { }

// MARK: - Private

fileprivate extension AndroidBroadcastReceiver {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Content.className(["SwiftBroadcastReceiver"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onReceiveThunk: AndroidBroadcastReceiver_onReceive_type = AndroidBroadcastReceiver_onReceive
            
            natives.append( JNINativeMethod(name: strdup("__onReceive"),
                                            signature: strdup("(JLandroid/content/Context;Landroid/content/Intent;)V"),
                                            fnPtr: unsafeBitCast( onReceiveThunk, to: UnsafeMutableRawPointer.self ) ))
            
            
            let finalizeThunk: AndroidBroadcastReceiver_finalize_type = AndroidBroadcastReceiver_finalize
            
            natives.append( JNINativeMethod( name: strdup("__finalize"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( finalizeThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let clazz = JNI.FindClass( className )
            
            let nativesCount = jint(natives.count)
        withUnsafePointer(to: &natives[0]) { nativesPtr in
            if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, nativesCount ) != jint(JNI_OK) {
                JNI.report( "Unable to register java natives" )
            }
        }
            
            defer { JNI.DeleteLocalRef( clazz ) }
            
            return JNI.api.NewGlobalRef( JNI.env, clazz )!
        }()
    }
    
    /// JNI Cache
    struct BroadcastReceiverJNICache {
        
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
    
    let context = __context != nil ? Android.Content.Context(javaObject: __context) : nil
    let intent = __intent != nil ? Android.Content.Intent(javaObject: __intent) : nil
    
    AndroidBroadcastReceiver
        .swiftObject(from: __swiftObject)?
        .onReceive(context: context, intent: intent)
}

private typealias AndroidBroadcastReceiver_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()


public func AndroidBroadcastReceiver_finalize( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                _ __this: jobject?,
                                                _ __swiftObject: jlong) -> () {
    
    AndroidBroadcastReceiver.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
