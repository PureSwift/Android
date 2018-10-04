//
//  WidgetLinearLayoutLayoutParams.swift
//  Android
//
//  Created by Marco Estrella on 10/4/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidLinearLayout {
    
    public typealias LayoutParams = AndroidLinearLayoutLayoutParams
}

open class AndroidLinearLayoutLayoutParams: Android.View.ViewGroup.MarginLayoutParams {
    
    // Creates a new set of layout parameters.
    public convenience init(context: Android.Content.Context, attrs: JavaObject){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: attrs, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LayoutParamsJNICache.className,
            classCache: &LayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
            methodCache: &LayoutParamsJNICache.MethodID.newMethod1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Creates a new set of layout parameters with the specified width, height and weight.
    public convenience init(width: Int, height: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = jvalue(i: jint(width))
        __args[1] = jvalue(i: jint(height))
        
        let __object = JNIMethod.NewObject(
            className: LayoutParamsJNICache.className,
            classCache: &LayoutParamsJNICache.jniClass,
            methodSig: "(II)V",
            methodCache: &LayoutParamsJNICache.MethodID.newMethod2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Creates a new set of layout parameters with the specified width, height and weight.
    public convenience init(width: Int, height: Int, weight: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = jvalue(i: jint(width))
        __args[1] = jvalue(i: jint(height))
        __args[2] = jvalue(i: jint(weight))
        
        let __object = JNIMethod.NewObject(
            className: LayoutParamsJNICache.className,
            classCache: &LayoutParamsJNICache.jniClass,
            methodSig: "(III)V",
            methodCache: &LayoutParamsJNICache.MethodID.newMethod3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Copy constructor.
    public convenience init(p: Android.View.ViewGroup.LayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: p, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LayoutParamsJNICache.className,
            classCache: &LayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &LayoutParamsJNICache.MethodID.newMethod4,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Copy constructor.
    public convenience init(source: Android.View.ViewGroup.MarginLayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LayoutParamsJNICache.className,
            classCache: &LayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$MarginLayoutParams;)V",
            methodCache: &LayoutParamsJNICache.MethodID.newMethod5,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Copy constructor.
    public convenience init(source: AndroidLinearLayoutLayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LayoutParamsJNICache.className,
            classCache: &LayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/widget/LinearLayout$LayoutParams;)V",
            methodCache: &LayoutParamsJNICache.MethodID.newMethod6,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidLinearLayoutLayoutParams {
    
    public var gravity: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "gravity",
                                               fieldType: "I",
                                               fieldCache: &LayoutParamsJNICache.FieldID.gravity,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var weight: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "weight",
                                               fieldType: "I",
                                               fieldCache: &LayoutParamsJNICache.FieldID.weight,
                                               object: javaObject)
            return Int(__value)
        }
    }
}

// MARK: - JNICache

internal extension AndroidLinearLayoutLayoutParams {
    
    /// JNI Cache
    struct LayoutParamsJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["LinearLayout$LayoutParams"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            static var gravity: jfieldID?
            static var weight: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var newMethod1: jmethodID?
            static var newMethod2: jmethodID?
            static var newMethod3: jmethodID?
            static var newMethod4: jmethodID?
            static var newMethod5: jmethodID?
            static var newMethod6: jmethodID?
        }
    }
}

