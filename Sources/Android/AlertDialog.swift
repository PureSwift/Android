//
//  AlertDialog.swift
//  Android
//
//  Created by Marco Estrella on 9/7/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.App {
    
    public typealias AlertDialog = AndroidAlertDialog
}

open class AndroidAlertDialog: AppCompatDialog {
    
    // MARK: - Initialization
    
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
    
    public convenience init(context: Android.Content.Context) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, themeResId: Int) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(themeResId))
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/Context;I)V",
            methodCache: &JNICache.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public func setView(view: AndroidView) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setView",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &JNICache.MethodID.setView,
            args: &__args,
            locals: &__locals )
    }
    
    public func setTitle(_ title: String) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: title, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTitle",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &JNICache.MethodID.setTitle,
            args: &__args,
            locals: &__locals )
    }
    
    public func setMessage(_ message: String) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: message, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMessage",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &JNICache.MethodID.setMessage,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidAlertDialog {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SupportV7.App.className(["AlertDialog"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var setTitle: jmethodID?
            static var setMessage: jmethodID?
            static var setView: jmethodID?
        }
    }
}
