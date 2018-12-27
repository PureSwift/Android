//
//  contentSharedPreferences.swift
//  Android
//
//  Created by Marco Estrella on 12/27/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Content {
    
    public typealias SharedPreferences = AndroidSharedPreferences
}

open class AndroidSharedPreferences: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /// Checks whether the preferences contains a preference.
    public func contains(_ key: String) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "contains",
            methodSig: "(Ljava/lang/CharSequence;)Z",
            methodCache: &JNICacheSharedPreferences.MethodID.contains,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /** Create a new Editor for these preferences, through which you can make modifications to the data
     * in the preferences and atomically commit those changes back to the SharedPreferences object.
     */
    public func edit() -> AndroidSharedPreferences.Editor {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "edit",
            methodSig: "()L\(AndroidSharedPreferences.Editor.JNICacheSPEditor.className);",
            methodCache: &JNICacheSharedPreferences.MethodID.edit,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JavaObject(javaObject: __return) as! AndroidSharedPreferences.Editor
    }
    
    public func getAll() -> JavaMap? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getAll",
            methodSig: "()Ljava/lang/Map;",
            methodCache: &JNICacheSharedPreferences.MethodID.getAll,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? JavaMapForward(javaObject: __return) : nil
    }
    
    public func getBoolean(key: String, defValue: Bool  = false) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = jvalue(z: jboolean(defValue ? JNI_TRUE : JNI_FALSE))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getBoolean",
            methodSig: "(Ljava/lang/String;Z)Z",
            methodCache: &JNICacheSharedPreferences.MethodID.getBoolean,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func getFloat(key: String, defValue: Float  = 0.0) -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = jvalue(f: jfloat(defValue))
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getFloat",
            methodSig: "(Ljava/lang/String;F)Z",
            methodCache: &JNICacheSharedPreferences.MethodID.getFloat,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    public func getInt(key: String, defValue: Int  = 0) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = jvalue(i: jint(defValue))
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getInt",
            methodSig: "(Ljava/lang/String;I)Z",
            methodCache: &JNICacheSharedPreferences.MethodID.getInt,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func getLong(key: String, defValue: Int64  = 0) -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = jvalue(j: jlong(defValue))
        
        let __return = JNIMethod.CallLongMethod(
            object: javaObject,
            methodName: "getLong",
            methodSig: "(Ljava/lang/String;J)Z",
            methodCache: &JNICacheSharedPreferences.MethodID.getLong,
            args: &__args,
            locals: &__locals )
        
        return Int64(__return)
    }
    
    public func getString(key: String, defValue: String  = "") -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = JNIType.toJava(value: defValue, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getString",
            methodSig: "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
            methodCache: &JNICacheSharedPreferences.MethodID.getString,
            args: &__args,
            locals: &__locals )
        
        return String(__return)
    }
    
    public func getStringSet(key: String, defValue: [String] = []) -> JavaSetForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = JNIType.toJava(value: defValue, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getStringSet",
            methodSig: "(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;",
            methodCache: &JNICacheSharedPreferences.MethodID.getStringSet,
            args: &__args,
            locals: &__locals )
        
        return JavaSetForward(javaObject: __return)
    }
}

internal extension AndroidSharedPreferences {
    
    /// JNI Cache
    struct JNICacheSharedPreferences {
        
        static let classSignature = Android.Content.className(["SharedPreferences"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var contains: jmethodID?
            static var edit: jmethodID?
            static var getAll: jmethodID?
            static var getBoolean: jmethodID?
            static var getFloat: jmethodID?
            static var getInt: jmethodID?
            static var getLong: jmethodID?
            static var getString: jmethodID?
            static var getStringSet: jmethodID?
            static var registerOnSharedPreferenceChangeListener: jmethodID?
            static var unregisterOnSharedPreferenceChangeListener: jmethodID?
        }
    }
}
