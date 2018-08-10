//
//  LinearLayoutLayoutParams.swift
//  Android
//
//  Created by Killian Greene on 8/10/18.
//

import Foundation
import java_util
import java_swift
import JNI

public extension AndroidLinearLayout {
    public typealias LLayoutParams = AndroidLinearLayoutLayoutParams
}

open class AndroidLinearLayoutLayoutParams: Android.View.ViewGroup.MarginLayoutParams {
    
    /**
     * Creates a new set of layout parameters with the specified width, height and weight.
     */
    public convenience init(width: Int, height: Int, weight: Float){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = jvalue(i: jint(width))
        __args[1] = jvalue(i: jint(height))
        __args[2] = jvalue(f: jfloat(weight))
        
        let __object = JNIMethod.NewObject(
            className: LLayoutParamsJNICache.className,
            classCache: &LLayoutParamsJNICache.jniClass,
            methodSig: "(IIF)V",
            methodCache: &LLayoutParamsJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(source: Android.Widget.LinearLayout.LLayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LLayoutParamsJNICache.className,
            classCache: &LLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/widget/LinearLayout$LayoutParams;)V",
            methodCache: &LLayoutParamsJNICache.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(source: Android.View.ViewGroup.MarginLayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LLayoutParamsJNICache.className,
            classCache: &LLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$MarginLayoutParams;)V",
            methodCache: &LLayoutParamsJNICache.MethodID.init_method_3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    /**
     * Creates a new set of layout parameters with the specified width and height.
     */
    public convenience init(width: Int, height: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(width))
        __args[1] = jvalue(i: jint(height))
        
        let __object = JNIMethod.NewObject(
            className: LLayoutParamsJNICache.className,
            classCache: &LLayoutParamsJNICache.jniClass,
            methodSig: "(II)V",
            methodCache: &LLayoutParamsJNICache.MethodID.init_method_4,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    /**
     * Copy constructor.
     */
    public convenience init(source: Android.View.ViewGroup.LayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LLayoutParamsJNICache.className,
            classCache: &LLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &LLayoutParamsJNICache.MethodID.init_method_5,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, attrs: JavaObject){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: attrs, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LLayoutParamsJNICache.className,
            classCache: &LLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
            methodCache: &LLayoutParamsJNICache.MethodID.init_method_6,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - JNICache

internal extension AndroidLinearLayoutLayoutParams {
    
    /// JNI Cache
    struct LLayoutParamsJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["LinearLayout$LayoutParams"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var init_method_3: jmethodID?
            static var init_method_4: jmethodID?
            static var init_method_5: jmethodID?
            static var init_method_6: jmethodID?
        }
    }
}
