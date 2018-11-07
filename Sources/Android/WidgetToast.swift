//
//  widgetToast.swift
//  Android
//
//  Created by Marco Estrella on 9/10/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias Toast = AndroidToast
}

open class AndroidToast: JavaObject {
    
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
            className: ToastJNICache.className,
            classCache: &ToastJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &ToastJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var view: AndroidView? {
        
        get { return getView() }
        set { setView(newValue) }
    }
    
    public var duration: AndroidToast.Dutation {
        
        get { return getDuration() }
        set { setDuration(newValue) }
    }
    
    public var gravity: Int {
        
        get { return getGravity() }
        set { setGravity(newValue) }
    }
}

// MARK: - Constants

internal extension AndroidToast {
    
    internal static var LENGTH_LONG: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LENGTH_LONG",
                fieldType: "I",
                fieldCache: &ToastJNICache.FieldID.LENGTH_LONG,
                className: ToastJNICache.className,
                classCache: &ToastJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var LENGTH_SHORT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LENGTH_SHORT",
                fieldType: "I",
                fieldCache: &ToastJNICache.FieldID.LENGTH_SHORT,
                className: ToastJNICache.className,
                classCache: &ToastJNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - Methods

public extension AndroidToast {
    
    @inline(__always)
    internal func setView(_ view: AndroidView?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setView",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ToastJNICache.MethodID.setView,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func setDuration(_ duration: AndroidToast.Dutation) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(duration.rawValue))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDuration",
            methodSig: "(I)V",
            methodCache: &ToastJNICache.MethodID.setDuration,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func setGravity(_ gravity: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(gravity))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getGravity",
            methodSig: "(I)V",
            methodCache: &ToastJNICache.MethodID.setGravity,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getGravity() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getGravity",
            methodSig: "()I",
            methodCache: &ToastJNICache.MethodID.getGravity,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    @inline(__always)
    internal func getView() -> AndroidView? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getView",
            methodSig: "()Landroid/view/View;",
            methodCache: &ToastJNICache.MethodID.getView,
            args: &__args,
            locals: &__locals )
        
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidView.init(javaObject: __return)
    }
    
    @inline(__always)
    internal func getDuration() -> AndroidToast.Dutation {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getDuration",
            methodSig: "()I",
            methodCache: &ToastJNICache.MethodID.getDuration,
            args: &__args,
            locals: &__locals )
        
        return AndroidToast.Dutation.init(rawValue: Int(__return))
    }
    
    public func show()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "show",
            methodSig: "()V",
            methodCache: &ToastJNICache.MethodID.show,
            args: &__args,
            locals: &__locals )
    }
    
    public func cancel()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "cancel",
            methodSig: "()V",
            methodCache: &ToastJNICache.MethodID.cancel,
            args: &__args,
            locals: &__locals )
    }
    
    public static func makeText(context: AndroidContext, resId: Int, duration: AndroidToast.Dutation) -> AndroidToast {
    
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(resId))
        __args[2] = jvalue(i: jint(duration.rawValue))
        
        let __return = JNIMethod.CallStaticObjectMethod(className: ToastJNICache.className,
                                                        classCache: &ToastJNICache.jniClass,
                                                        methodName: "makeText",
                                                        methodSig: "(Landroid/content/Context;II)Landroid/widget/Toast;",
                                                        methodCache: &ToastJNICache.MethodID.makeText1,
                                                        args: &__args,
                                                        locals: &__locals)
        return AndroidToast(javaObject: __return)
    }
    
    public static func makeText(context: AndroidContext, text: String, duration: AndroidToast.Dutation) -> AndroidToast {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: text, locals: &__locals)
        __args[2] = jvalue(i: jint(duration.rawValue))
        
        let __return = JNIMethod.CallStaticObjectMethod(className: ToastJNICache.className,
                                                        classCache: &ToastJNICache.jniClass,
                                                        methodName: "makeText",
                                                        methodSig: "(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;",
                                                        methodCache: &ToastJNICache.MethodID.makeText2,
                                                        args: &__args,
                                                        locals: &__locals)
        return AndroidToast(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension AndroidToast {
    
    /// JNI Cache
    struct ToastJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["Toast"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var LENGTH_LONG: jfieldID?
            static var LENGTH_SHORT: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var makeText1: jmethodID?
            static var makeText2: jmethodID?
            
            static var init_method_1: jmethodID?
            static var show: jmethodID?
            static var setView: jmethodID?
            static var getView: jmethodID?
            static var cancel: jmethodID?
            static var getDuration: jmethodID?
            static var getGravity: jmethodID?
            static var setDuration: jmethodID?
            static var setGravity: jmethodID?
            static var getHorizontalMargin: jmethodID?
            static var getVerticalMargin: jmethodID?
            static var getXOffset: jmethodID?
            static var getYOffset: jmethodID?
            static var setMargin: jmethodID?
            static var setText1: jmethodID?
            static var setText2: jmethodID?
        }
    }
}

public extension AndroidToast {
    
    public struct Dutation: RawRepresentable, Equatable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public static let short = AndroidToast.Dutation(rawValue: AndroidToast.LENGTH_SHORT)
        
        public static let long = AndroidToast.Dutation(rawValue: AndroidToast.LENGTH_LONG)
    }
}
