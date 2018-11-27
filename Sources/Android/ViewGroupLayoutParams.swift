//
//  ViewGroupLayoutParams.swift
//  Android
//
//  Created by Marco Estrella on 7/13/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View.ViewGroup {
    
    public typealias LayoutParams = AndroidViewGroupLayoutParams
}

open class AndroidViewGroupLayoutParams: JavaObject {
    
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
    
    //Creates a new set of layout parameters with the specified width and height.
    public convenience init(width: Int, height: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(width))
        __args[1] = jvalue(i: jint(height))
        
        let __object = JNIMethod.NewObject(
            className: ViewGroupLayoutParamsJNICache.className,
            classCache: &ViewGroupLayoutParamsJNICache.jniClass,
            methodSig: "(II)V",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.newMethod,
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
            className: ViewGroupLayoutParamsJNICache.className,
            classCache: &ViewGroupLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.newMethod2,
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
            className: ViewGroupLayoutParamsJNICache.className,
            classCache: &ViewGroupLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.newMethod3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    
}

extension AndroidViewGroupLayoutParams {
    
    public func resolveLayoutDirection(_ layoutDirection: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(layoutDirection))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "resolveLayoutDirection",
            methodSig: "(I)V",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.resolveLayoutDirection,
            args: &__args,
            locals: &__locals )
    }
    
    public func setBaseAttributes(a: JavaObject, widthAttr: Int, heightAttr: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: a, locals: &__locals)
        __args[1] = jvalue(i: jint(widthAttr))
        __args[2] = jvalue(i: jint(heightAttr))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setBaseAttributes",
            methodSig: "(Landroid/content/res/TypedArray;II)V",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.setBaseAttributes,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Fields

public extension AndroidViewGroupLayoutParams {
    
    public static var MATCH_PARENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MATCH_PARENT",
                fieldType: "I",
                fieldCache: &ViewGroupLayoutParamsJNICache.FieldID.MATCH_PARENT,
                className: ViewGroupLayoutParamsJNICache.className,
                classCache: &ViewGroupLayoutParamsJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var WRAP_CONTENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WRAP_CONTENT",
                fieldType: "I",
                fieldCache: &ViewGroupLayoutParamsJNICache.FieldID.WRAP_CONTENT,
                className: ViewGroupLayoutParamsJNICache.className,
                classCache: &ViewGroupLayoutParamsJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public var height: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "height",
                                               fieldType: "I",
                                               fieldCache: &ViewGroupLayoutParamsJNICache.FieldID.height,
                                               object: javaObject)
            return Int(__value)
        }
        set {
            
            var __locals = [jobject]()
            
            JNIField.SetIntField(fieldName: "height",
                                 fieldType: "I",
                                 fieldCache: &ViewGroupLayoutParamsJNICache.FieldID.height,
                                 object: javaObject,
                                 value: jint(newValue),
                                 locals: &__locals)
        }
    }
    
    public var width: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "width",
                                               fieldType: "I",
                                               fieldCache: &ViewGroupLayoutParamsJNICache.FieldID.width,
                                               object: javaObject)
            return Int(__value)
        }
        set {
            
            var __locals = [jobject]()
            
            JNIField.SetIntField(fieldName: "width",
                                 fieldType: "I",
                                 fieldCache: &ViewGroupLayoutParamsJNICache.FieldID.width,
                                 object: javaObject,
                                 value: jint(newValue),
                                 locals: &__locals)
        }
    }
}

// MARK: - Private

internal extension AndroidViewGroupLayoutParams {
    
    /// JNI Cache
    struct ViewGroupLayoutParamsJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["ViewGroup$LayoutParams"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var MATCH_PARENT: jfieldID?
            static var WRAP_CONTENT: jfieldID?
            static var height: jfieldID?
            static var width: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var newMethod2: jmethodID?
            static var newMethod3: jmethodID?
            static var resolveLayoutDirection: jmethodID?
            static var setBaseAttributes: jmethodID?
        }
    }
}
