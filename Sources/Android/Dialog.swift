//
//  Dialog.swift
//  Android
//
//  Created by Marco Estrella on 11/26/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.App {
    
    public typealias Dialog = AndroidDialog
}

open class AndroidDialog: JavaObject {
    
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
            className: DialogJNICache.className,
            classCache: &DialogJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &DialogJNICache.MethodID.init_method_1,
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
            className: DialogJNICache.className,
            classCache: &DialogJNICache.jniClass,
            methodSig: "(Landroid/content/Context;I)V",
            methodCache: &DialogJNICache.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var window: AndroidWindow {
        get {
            return getWindow()
        }
    }
}

public extension AndroidDialog {
    
    public func cancel() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "cancel",
            methodSig: "()V",
            methodCache: &DialogJNICache.MethodID.cancel,
            args: &__args,
            locals: &__locals )
    }
    
    public func dismiss() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dismiss",
            methodSig: "()V",
            methodCache: &DialogJNICache.MethodID.dismiss,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    private func getWindow() -> AndroidWindow {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getWindow",
            methodSig: "()L\(AndroidWindow.JNICache.className);",
            methodCache: &DialogJNICache.MethodID.getWindow,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidWindow(javaObject: __return)
    }
    
    public func findViewById(_ id: Int) -> Android.View.View? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: id, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "findViewById",
            methodSig: "(I)Landroid/view/View;",
            methodCache: &DialogJNICache.MethodID.findViewById,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.View.View(javaObject: __return) : nil
    }
    
    public func getContext() -> AndroidContext {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getContext",
            methodSig: "()L\(AndroidContext.JNICache.className);",
            methodCache: &DialogJNICache.MethodID.getContext,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidContext(javaObject: __return)
    }
    
    public func setCancelable(cancelable: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean( cancelable ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setCancelable",
            methodSig: "(Z)V",
            methodCache: &DialogJNICache.MethodID.setCancelable,
            args: &__args,
            locals: &__locals )
    }
    
    public func setContentView(view: AndroidView) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setContentView",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &DialogJNICache.MethodID.setContentView,
            args: &__args,
            locals: &__locals )
    }
    
    public func show() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "show",
            methodSig: "()V",
            methodCache: &DialogJNICache.MethodID.show,
            args: &__args,
            locals: &__locals )
    }
    
    @discardableResult
    public func requestWindowFeature(featureId: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: featureId, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestWindowFeature",
            methodSig: "(I)Z",
            methodCache: &DialogJNICache.MethodID.requestWindowFeature,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
}

internal extension AndroidDialog {
    
    /// JNI Cache
    struct DialogJNICache {
        
        static let classSignature = Android.App.className(["Dialog"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            
            static var setTitle: jmethodID?
            static var cancel: jmethodID?
            static var dismiss: jmethodID?
            static var getWindow: jmethodID?
            static var findViewById: jmethodID?
            static var getContext: jmethodID?
            static var setCancelable: jmethodID?
            static var setContentView: jmethodID?
            static var show: jmethodID?
            static var requestWindowFeature: jmethodID?
        }
    }
}
