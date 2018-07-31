//
//  WidgetFragmentLayoutLayoutParams.swift
//  Android
//
//  Created by Marco Estrella on 7/18/18.
//

import java_swift
import java_lang
import JNI

public extension AndroidWidgetFrameLayout {
    
    public typealias FLayoutParams = AndroidFrameLayoutLayoutParams
}

open class AndroidFrameLayoutLayoutParams: Android.View.ViewGroup.MarginLayoutParams {
    
    // Creates a new set of layout parameters with the specified width, height and weight.
    public convenience init(width: Int, height: Int, gravity: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = jvalue(i: jint(width))
        __args[1] = jvalue(i: jint(height))
        __args[2] = jvalue(i: jint(gravity))
        
        let __object = JNIMethod.NewObject(
            className: FLayoutParamsJNICache.className,
            classCache: &FLayoutParamsJNICache.jniClass,
            methodSig: "(III)V",
            methodCache: &FLayoutParamsJNICache.MethodID.newMethod2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Copy constructor.
    public convenience init(source: Android.Widget.FrameLayout.FLayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: FLayoutParamsJNICache.className,
            classCache: &FLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/widget/FrameLayout$LayoutParams;)V",
            methodCache: &FLayoutParamsJNICache.MethodID.newMethod1,
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
            className: FLayoutParamsJNICache.className,
            classCache: &FLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$MarginLayoutParams;)V",
            methodCache: &FLayoutParamsJNICache.MethodID.newMethod3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    //Creates a new set of layout parameters with the specified width and height.
    public convenience init(width: Int, height: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(width))
        __args[1] = jvalue(i: jint(height))
        
        let __object = JNIMethod.NewObject(
            className: FLayoutParamsJNICache.className,
            classCache: &FLayoutParamsJNICache.jniClass,
            methodSig: "(II)V",
            methodCache: &FLayoutParamsJNICache.MethodID.newMethod4,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Copy constructor.
    public convenience init(source: Android.View.ViewGroup.LayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: FLayoutParamsJNICache.className,
            classCache: &FLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &FLayoutParamsJNICache.MethodID.newMethod5,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Creates a new set of layout parameters.
    public convenience init(context: Android.Content.Context, attrs: JavaObject){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: attrs, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: FLayoutParamsJNICache.className,
            classCache: &FLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
            methodCache: &FLayoutParamsJNICache.MethodID.newMethod6,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidFrameLayoutLayoutParams {
    
    public static var UNSPECIFIED_GRAVITY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "UNSPECIFIED_GRAVITY",
                fieldType: "I",
                fieldCache: &FLayoutParamsJNICache.FieldID.UNSPECIFIED_GRAVITY,
                className: FLayoutParamsJNICache.className,
                classCache: &FLayoutParamsJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public var gravity: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "gravity",
                                               fieldType: "I",
                                               fieldCache: &FLayoutParamsJNICache.FieldID.gravity,
                                               object: javaObject)
            return Int(__value)
        }
    }
}

// MARK: - JNICache

internal extension AndroidFrameLayoutLayoutParams {
    
    /// JNI Cache
    struct FLayoutParamsJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["FrameLayout$LayoutParams"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            static var UNSPECIFIED_GRAVITY: jfieldID?
            static var gravity: jfieldID?
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
