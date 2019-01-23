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
    
    public func hideSoftInputFromWindow(windowToken: JavaObject, flags: Int) -> Bool {
        
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

internal extension AndroidInputMethodManager {
    
    /// JNI Cache
    struct JNIInputMethodManager {
        
        static let classSignature = Android.View.Inputmethod.className(["InputMethodManager"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
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
