//
//  textEditable.swift
//  Android
//
//  Created by Marco Estrella on 12/18/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Text {
    
    public typealias EditableForward = AndroidEditableForward
}

/**
 * This is the interface for text whose content and markup can be changed (as opposed to immutable text like Strings).
 * If you make a DynamicLayout of an Editable, the layout will be reflowed as the text is changed.
 */
open class AndroidEditableForward: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    @discardableResult
    public func append(_ text: String, start: Int, end: Int) -> AndroidEditableForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        __args[1] = jvalue(i: jint(start))
        __args[2] = jvalue(i: jint(end))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "append",
            methodSig: "(Ljava/lang/CharSequence;II)L\(AndroidEditableForward.JNIEditableForward.className);",
            methodCache: &JNIEditableForward.MethodID.append2,
            args: &__args,
            locals: &__locals )
        
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidEditableForward(javaObject: __return)
    }
    
    @discardableResult
    public func append(_ text: String) -> AndroidEditableForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "append",
            methodSig: "(Ljava/lang/CharSequence;)L\(AndroidEditableForward.JNIEditableForward.className);",
            methodCache: &JNIEditableForward.MethodID.append3,
            args: &__args,
            locals: &__locals )
        
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidEditableForward(javaObject: __return)
    }
    
    public func clear() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clear",
            methodSig: "()V",
            methodCache: &JNIEditableForward.MethodID.clear,
            args: &__args,
            locals: &__locals )
    }
    
    public func clearSpans() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clearSpans",
            methodSig: "()V",
            methodCache: &JNIEditableForward.MethodID.clearSpans,
            args: &__args,
            locals: &__locals )
    }
    
    public func delete(st: Int, en: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(st))
        __args[1] = jvalue(i: jint(en))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "delete",
            methodSig: "(II)V",
            methodCache: &JNIEditableForward.MethodID.delete,
            args: &__args,
            locals: &__locals )
    }
    
    @discardableResult
    public func insert(where w: Int, text: String) -> AndroidEditableForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(w))
        __args[1] = JNIType.toJava(value: text, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "insert",
            methodSig: "(ILjava/lang/CharSequence;)L\(AndroidEditableForward.JNIEditableForward.className);",
            methodCache: &JNIEditableForward.MethodID.insert1,
            args: &__args,
            locals: &__locals )
        
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidEditableForward(javaObject: __return)
    }
    
    @discardableResult
    public func insert(where w: Int, text: String, start: Int, end: Int) -> AndroidEditableForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        __args[0] = jvalue(i: jint(w))
        __args[1] = JNIType.toJava(value: text, locals: &__locals)
        __args[2] = jvalue(i: jint(start))
        __args[3] = jvalue(i: jint(end))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "insert",
            methodSig: "(ILjava/lang/CharSequence;II)L\(AndroidEditableForward.JNIEditableForward.className);",
            methodCache: &JNIEditableForward.MethodID.insert2,
            args: &__args,
            locals: &__locals )
        
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidEditableForward(javaObject: __return)
    }
    
    @discardableResult
    public func replace(st: Int, en: Int, source: String, start: Int, end: Int) -> AndroidEditableForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 5 )
        __args[0] = jvalue(i: jint(st))
        __args[1] = jvalue(i: jint(en))
        __args[2] = JNIType.toJava(value: source, locals: &__locals)
        __args[3] = jvalue(i: jint(start))
        __args[4] = jvalue(i: jint(end))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "replace",
            methodSig: "(IILjava/lang/CharSequence;II)L\(AndroidEditableForward.JNIEditableForward.className);",
            methodCache: &JNIEditableForward.MethodID.replace1,
            args: &__args,
            locals: &__locals )
        
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidEditableForward(javaObject: __return)
    }
    
    @discardableResult
    public func replace(st: Int, en: Int, source: String) -> AndroidEditableForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = jvalue(i: jint(st))
        __args[1] = jvalue(i: jint(en))
        __args[2] = JNIType.toJava(value: source, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "replace",
            methodSig: "(IILjava/lang/CharSequence;)L\(AndroidEditableForward.JNIEditableForward.className);",
            methodCache: &JNIEditableForward.MethodID.replace2,
            args: &__args,
            locals: &__locals )
        
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidEditableForward(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension AndroidEditableForward {
    
    /// JNI Cache
    struct JNIEditableForward {
        
        /// JNI Java class name
        static let className = "android/text/Editable"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            
            static var append1: jmethodID?
            static var append2: jmethodID?
            static var append3: jmethodID?
            static var clear: jmethodID?
            static var clearSpans: jmethodID?
            static var delete: jmethodID?
            static var getFilters: jmethodID?
            static var insert1: jmethodID?
            static var insert2: jmethodID?
            static var replace1: jmethodID?
            static var replace2: jmethodID?
            static var setFilters: jmethodID?
        }
    }
}
