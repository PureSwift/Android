//
//  AndroidContext.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/20/18.
//

import Foundation
import java_swift
import java_util

public extension Android.Content {
    
    public typealias Context = AndroidContext
}

open class AndroidContext: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
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
                                 methodSig: "(Landroid/content/BroadcastReceiver;)",
                                 methodCache: &JNICache.MethodID.unregisterReceiver,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    open func getFilesDir() -> JavaFile {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getFilesDir",
                                                  methodSig: "()L\(JavaFile.JNICache.className);",
            methodCache: &JNICache.MethodID.getFilesDir,
            args: &__args,
            locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JavaFile(javaObject: __return)
    }
}

// MARK: - Constants

internal extension AndroidContext {
    
    internal static var bluetoothService: String? {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BLUETOOTH_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BLUETOOTH_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef( __value ) }
            
            return __value != nil ? String( javaObject: __value ) : nil
        }
    }
    
    internal static var layoutInflaterService: String? {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "LAYOUT_INFLATER_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.LAYOUT_INFLATER_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef( __value ) }
            
            return __value != nil ? String( javaObject: __value ) : nil
        }
    }
    
    internal static var inputMethodService: String? {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "INPUT_METHOD_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.INPUT_METHOD_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef( __value ) }
            
            return __value != nil ? String( javaObject: __value ) : nil
        }
    }
}

// MARK: - Constants

public extension AndroidContext {
    
    public func systemService <T> (_ service: T.Type) -> T? where T: JavaObject, T: Android.Content.Context.SystemService {
        
        let serviceName = service.systemServiceName.rawValue
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: serviceName, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getSystemService",
                                                  methodSig: "(Ljava/lang/String;)Ljava/lang/Object;",
                                                  methodCache: &JNICache.MethodID.getSystemService,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? T( javaObject: __return ) : nil
    }
    
    public func setTheme(resId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTheme",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setTheme,
            args: &__args,
            locals: &__locals )
    }
    
    public func getExternalFilesDirs(type: String?) -> [JavaFile]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: type, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getExternalFilesDirs",
                                                  methodSig: "(Ljava/lang/String;)[Ljava/io/File;",
                                                  methodCache: &JNICache.MethodID.getExternalFilesDirs,
                                                  args: &__args,
                                                  locals: &__locals)
        
        return JNIType.toSwift( type: [JavaFile].self, from: __return )
    }
    
    public func getPackageName() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getPackageName",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getPackageName,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return String(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension AndroidContext {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Content.className(["Context"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var BLUETOOTH_SERVICE: jfieldID?
            static var LAYOUT_INFLATER_SERVICE: jfieldID?
            static var INPUT_METHOD_SERVICE: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getSystemService: jmethodID?
            static var registerReceiver: jmethodID?
            static var unregisterReceiver: jmethodID?
            static var setTheme: jmethodID?
            static var getExternalFilesDirs: jmethodID?
            static var getFilesDir: jmethodID?
            static var getPackageName: jmethodID?
        }
    }
}
