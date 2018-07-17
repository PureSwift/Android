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
    
    public var marginStart: Int {
        get{ return getMarginStart() }
        set{
            setMarginStart(newValue)
        }
    }
    
    public var marginEnd: Int {
        get{ return getMarginEnd() }
        set{
            setMarginEnd(newValue)
        }
    }
    
    public var layoutDirection: Int {
        get{ return getLayoutDirection() }
        set{
            setLayoutDirection(newValue)
        }
    }
    
    public var isMarginRelative: Bool {
        get{ return getIsMarginRelative() }
    }
}

extension AndroidViewGroupLayoutParams {
    
    @_versioned
    internal func setMarginStart(_ start: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(start))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMarginStart",
            methodSig: "(I)V",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.setMarginStart,
            args: &__args,
            locals: &__locals )
    }
    
    @_versioned
    internal func getMarginStart() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMarginStart",
            methodSig: "()I",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.getMarginStart,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    @_versioned
    internal func setMarginEnd(_ end: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(end))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMarginEnd",
            methodSig: "(I)V",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.setMarginEnd,
            args: &__args,
            locals: &__locals )
    }
    
    @_versioned
    internal func getMarginEnd() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMarginEnd",
            methodSig: "()I",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.getMarginEnd,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    @_versioned
    internal func setLayoutDirection(_ layoutDirection: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(layoutDirection))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLayoutDirection",
            methodSig: "(I)V",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.setLayoutDirection,
            args: &__args,
            locals: &__locals )
    }
    
    @_versioned
    internal func getLayoutDirection() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getLayoutDirection",
            methodSig: "()I",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.getLayoutDirection,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    @_versioned
    internal func getIsMarginRelative() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isMarginRelative",
            methodSig: "()Z",
            methodCache: &ViewGroupLayoutParamsJNICache.MethodID.isMarginRelative,
            args: &__args,
            locals: &__locals )
        
        return jboolean(__return) != jboolean(JNI_FALSE)
    }
    
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
            static var setMargins: jmethodID?
            static var setMarginStart: jmethodID?
            static var setMarginEnd: jmethodID?
            static var getMarginEnd: jmethodID?
            static var getMarginStart: jmethodID?
            static var getLayoutDirection: jmethodID?
            static var setLayoutDirection: jmethodID?
            static var isMarginRelative: jmethodID?
            static var resolveLayoutDirection: jmethodID?
            static var setBaseAttributes: jmethodID?
        }
    }
}

