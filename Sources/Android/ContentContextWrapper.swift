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

open class AndroidContextWrapper: AndroidContext {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public override func registerReceiver(receiver: Android.Content.BroadcastReceiver, filter: Android.Content.IntentFilter) -> Android.Content.Intent {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2)
        
        __args[0] = JNIType.toJava( value: receiver, locals: &__locals )
        __args[1] = JNIType.toJava( value: filter, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "registerReceiver",
                                                  methodSig: "(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;",
                                                  methodCache: &JNICacheContextWrapper.MethodID.registerReceiver,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    public override func unregisterReceiver(receiver: Android.Content.BroadcastReceiver){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: receiver, locals: &__locals )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "unregisterReceiver",
                                 methodSig: "(Landroid/content/BroadcastReceiver;)V",
                                 methodCache: &JNICacheContextWrapper.MethodID.unregisterReceiver,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func checkSelfPermission(permission: String)-> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: permission, locals: &__locals )
        
        var result: Int?
        
        withJavaObject {
            
            let __return = JNIMethod.CallIntMethod(object: $0,
                                                   methodName: "checkSelfPermission",
                                                   methodSig: "(Ljava/lang/String;)I",
                                                   methodCache: &JNICacheContextWrapper.MethodID.checkSelfPermission,
                                                   args: &__args,
                                                   locals: &__locals)
            
            result = Int(__return)
        }
        
        return result!
    }
    
    public func requestPermissions(permissions: [String], requestCode: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2)
        
        __args[0] = JNIType.toJava( value: permissions, locals: &__locals )
        __args[1] = jvalue(i: jint(requestCode))
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "requestPermissions",
                                     methodSig: "([Ljava/lang/String;I)V",
                                     methodCache: &JNICacheContextWrapper.MethodID.requestPermissions,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
}

// MARK: - Constants

private extension AndroidContextWrapper {
    
    /// JNI Cache
    struct JNICacheContextWrapper {
        
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
            static var checkSelfPermission: jmethodID?
            static var requestPermissions: jmethodID?
        }
    }
}
