//
//  WidgetFragmentLayoutLayoutParams.swift
//  Android
//
//  Created by Marco Estrella on 7/18/18.
//

import java_swift
import java_lang
import JNI

public extension AndroidWidgetFragmentLayout {
    
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
            className: LayoutParamsJNICache.className,
            classCache: &LayoutParamsJNICache.jniClass,
            methodSig: "(III)V",
            methodCache: &LayoutParamsJNICache.MethodID.newMethod2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    // Copy constructor.
    public convenience init(source: Android.Widget.FragmentLayout.FLayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: LayoutParamsJNICache.className,
            classCache: &LayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/widget/FrameLayout$LayoutParams;)V",
            methodCache: &LayoutParamsJNICache.MethodID.newMethod1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public static var UNSPECIFIED_GRAVITY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "UNSPECIFIED_GRAVITY",
                fieldType: "I",
                fieldCache: &LayoutParamsJNICache.FieldID.UNSPECIFIED_GRAVITY,
                className: LayoutParamsJNICache.className,
                classCache: &LayoutParamsJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public var gravity: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "gravity",
                                               fieldType: "I",
                                               fieldCache: &LayoutParamsJNICache.FieldID.gravity,
                                               object: javaObject)
            return Int(__value)
        }
    }
}

// MARK: - JNICache

internal extension AndroidFrameLayoutLayoutParams {
    
    /// JNI Cache
    struct LayoutParamsJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["FragmentLayout$LayoutParams"])
        
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
        }
    }
}
