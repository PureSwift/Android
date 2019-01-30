//
//  inputmethodInputMethodManager.swift
//  Android
//
//  Created by Marco Estrella on 1/23/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View.Inputmethod {
    
    public typealias InputMethodManager = AndroidInputMethodManager
}

open class AndroidInputMethodManager: JavaObject {
    
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
    
    public static var SHOW_IMPLICIT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_IMPLICIT",
                fieldType: "I",
                fieldCache: &JNIInputMethodManager.FieldID.SHOW_IMPLICIT,
                className: JNIInputMethodManager.className,
                classCache: &JNIInputMethodManager.jniClass )
            
            return Int(__value)
        }
    }
    
    @discardableResult
    public func hideSoftInputFromWindow(windowToken: JavaObject?, flags: Int) -> Bool {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: windowToken, locals: &__locals)
        __args[1] = jvalue(i: jint(flags))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hideSoftInputFromWindow",
            methodSig: "(Landroid/os/IBinder;I)Z",
            methodCache: &JNIInputMethodManager.MethodID.hideSoftInputFromWindow,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    @discardableResult
    public func showSoftInput(view: AndroidView, flags: Int) -> Bool {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        __args[1] = jvalue(i: jint(flags))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "showSoftInput",
            methodSig: "(Landroid/view/View;I)Z",
            methodCache: &JNIInputMethodManager.MethodID.showSoftInput,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: - Android.Content.Context.SystemService

extension AndroidInputMethodManager: Android.Content.Context.SystemService {
    
    public static var systemServiceName: Android.Content.Context.SystemService.Name { return .inputMethodService }
}

internal extension AndroidInputMethodManager {
    
    /// JNI Cache
    struct JNIInputMethodManager {
        
        static let classSignature = Android.View.Inputmethod.className(["InputMethodManager"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var SHOW_IMPLICIT: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var init_method_3: jmethodID?
            static var hideSoftInputFromWindow: jmethodID?
            static var showSoftInput: jmethodID?
        }
    }
}
