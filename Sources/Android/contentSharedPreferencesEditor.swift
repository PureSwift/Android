//
//  contentSharedPreferencesEditor.swift
//  Android
//
//  Created by Marco Estrella on 12/27/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidSharedPreferences {
    
    public typealias Editor = AndroidSharedPreferencesEditor
}

open class AndroidSharedPreferencesEditor: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /// Commit your preferences changes back from this Editor to the SharedPreferences object it is editing.
    public func apply() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "apply",
            methodSig: "()V",
            methodCache: &JNICacheSPEditor.MethodID.apply,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
    }
    
    /// Mark in the editor to remove all values from the preferences.
    public func clear() -> AndroidSharedPreferences.Editor {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "clear",
            methodSig: "()L\(AndroidSharedPreferences.Editor.JNICacheSPEditor.className);",
            methodCache: &JNICacheSPEditor.MethodID.clear,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JavaObject(javaObject: __return) as! AndroidSharedPreferences.Editor
    }
    
    /// Commit your preferences changes back from this Editor to the SharedPreferences object it is editing.
    public func commit() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "commit",
            methodSig: "()Z",
            methodCache: &JNICacheSPEditor.MethodID.commit,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /// Set a boolean value in the preferences editor, to be written back once commit() or apply() are called.
    public func putBoolean(key: String, value: Bool) -> AndroidSharedPreferences.Editor {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = jvalue(z: jboolean(value ? JNI_TRUE : JNI_FALSE))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "putBoolean",
            methodSig: "(Ljava/lang/String;Z)L\(AndroidSharedPreferences.Editor.JNICacheSPEditor.className);",
            methodCache: &JNICacheSPEditor.MethodID.putBoolean,
            args: &__args,
            locals: &__locals )
        
        return JavaObject(javaObject: __return) as! AndroidSharedPreferences.Editor
    }
    
    /// Set a float value in the preferences editor, to be written back once commit() or apply() are called.
    public func putFloat(key: String, value: Float) -> AndroidSharedPreferences.Editor {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = jvalue(f: jfloat(value))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "putFloat",
            methodSig: "(Ljava/lang/String;F)L\(AndroidSharedPreferences.Editor.JNICacheSPEditor.className);",
            methodCache: &JNICacheSPEditor.MethodID.putFloat,
            args: &__args,
            locals: &__locals )
        
        return JavaObject(javaObject: __return) as! AndroidSharedPreferences.Editor
    }
    
    /// Set a int value in the preferences editor, to be written back once commit() or apply() are called.
    public func putInt(key: String, value: Float) -> AndroidSharedPreferences.Editor {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = jvalue(i: jint(value))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "putInt",
            methodSig: "(Ljava/lang/String;I)L\(AndroidSharedPreferences.Editor.JNICacheSPEditor.className);",
            methodCache: &JNICacheSPEditor.MethodID.putInt,
            args: &__args,
            locals: &__locals )
        
        return JavaObject(javaObject: __return) as! AndroidSharedPreferences.Editor
    }
    
    /// Set a long value in the preferences editor, to be written back once commit() or apply() are called.
    public func putLong(key: String, value: Int64) -> AndroidSharedPreferences.Editor {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = jvalue(j: jlong(value))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "putLong",
            methodSig: "(Ljava/lang/String;I)L\(AndroidSharedPreferences.Editor.JNICacheSPEditor.className);",
            methodCache: &JNICacheSPEditor.MethodID.putLong,
            args: &__args,
            locals: &__locals )
        
        return JavaObject(javaObject: __return) as! AndroidSharedPreferences.Editor
    }
    
    /// Set a String value in the preferences editor, to be written back once commit() or apply() are called.
    public func putString(key: String, value: String) -> AndroidSharedPreferences.Editor {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = JNIType.toJava(value: value, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "putString",
            methodSig: "(Ljava/lang/String;Ljava/lang/String;)L\(AndroidSharedPreferences.Editor.JNICacheSPEditor.className);",
            methodCache: &JNICacheSPEditor.MethodID.putString,
            args: &__args,
            locals: &__locals )
        
        return JavaObject(javaObject: __return) as! AndroidSharedPreferences.Editor
    }
    
    ///
    public func putStringSet(key: String, value: [String]) -> AndroidSharedPreferences.Editor {
        
         var __locals = [jobject]()
        
        /* Swift.Set<String>
         
         let javaValue = JavaSetForward()
        
        value.forEach { item in
            
            javaValue.add(e: JavaObject(javaObject: JNIType.toJava(value: item, locals: &__locals).l))
        }*/
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: key, locals: &__locals)
        __args[1] = JNIType.toJava(value: value, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "putStringSet",
            methodSig: "(Ljava/lang/String;Ljava/util/Set;)L\(AndroidSharedPreferences.Editor.JNICacheSPEditor.className);",
            methodCache: &JNICacheSPEditor.MethodID.putStringSet,
            args: &__args,
            locals: &__locals )
        
        return JavaObject(javaObject: __return) as! AndroidSharedPreferences.Editor
    }
}

internal extension AndroidSharedPreferencesEditor {
    
    /// JNI Cache
    struct JNICacheSPEditor {
        
        static let classSignature = Android.Content.className(["SharedPreferences$Editor"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var apply: jmethodID?
            static var clear: jmethodID?
            static var commit: jmethodID?
            static var putBoolean: jmethodID?
            static var putFloat: jmethodID?
            static var putInt: jmethodID?
            static var putLong: jmethodID?
            static var putString: jmethodID?
            static var putStringSet: jmethodID?
            static var remove: jmethodID?
        }
    }
}
