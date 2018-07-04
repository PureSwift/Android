//
//  ContentContextWrapper.swift
//  Android
//
//  Created by Marco Estrella on 6/25/18.
//

import Foundation
import java_swift
import java_util

public extension Android.Content {
    
    public typealias ContextWrapper = AndroidContextWrapper
}

open class AndroidContextWrapper: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
}

public extension AndroidContextWrapper {
    
    public func registerReceiver(receiver: Android.Content.BroadcastReceiver, filter: Android.Content.IntentFilter) -> Android.Content.Intent {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2)
        
        __args[0] = JNIType.toJava( value: receiver, locals: &__locals )
        __args[1] = JNIType.toJava( value: filter, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "registerReceiver",
                                                  methodSig: "(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.registerReceiver,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    public func unregisterReceiver(receiver: Android.Content.BroadcastReceiver){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: receiver, locals: &__locals )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "unregisterReceiver",
                                 methodSig: "(Landroid/content/BroadcastReceiver;)V",
                                 methodCache: &JNICache.MethodID.unregisterReceiver,
                                 args: &__args,
                                 locals: &__locals)
    }
}

// MARK: - Constants

internal extension AndroidContextWrapper {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Content.className(["ContextWrapper"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getSystemService: jmethodID?
            static var registerReceiver: jmethodID?
            static var unregisterReceiver: jmethodID?
        }
    }
}
