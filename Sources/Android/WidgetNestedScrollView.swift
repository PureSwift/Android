//
//  WidgetNestedScrollView.swift
//  ClimateConfig
//
//  Created by Marco Estrella on 1/17/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias NestedScrollView = AndroidNestedScrollView
}

open class AndroidNestedScrollView: AndroidWidgetFrameLayout {
    
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
            className: JNICacheNestedScrollView.className,
            classCache: &JNICacheNestedScrollView.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheNestedScrollView.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    open override func addView(_ child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &JNICacheNestedScrollView.MethodID.addView,
            args: &__args,
            locals: &__locals )
    }
    
    public func setFillViewport(_ fillViewport: Bool) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(fillViewport ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFillViewport",
            methodSig: "(Z)V",
            methodCache: &JNICacheNestedScrollView.MethodID.setFillViewport,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidNestedScrollView {
    
    /// JNI Cache
    struct JNICacheNestedScrollView {
        
        /// JNI Java class signature
        static let classSignature = SupportV4.Widget.className(["NestedScrollView"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var addView: jmethodID?
            static var setFillViewport: jmethodID?
        }
    }
}
