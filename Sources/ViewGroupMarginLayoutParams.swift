//
//  ViewGroupMarginLayoutParams.swift
//  Android
//
//  Created by Marco Estrella on 7/17/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidViewGroup {
    
    public typealias MarginLayoutParams = AndroidViewGroupMarginLayoutParams
}

open class AndroidViewGroupMarginLayoutParams: Android.View.ViewGroup.LayoutParams {
    
    // Copy constructor.
    public convenience init(source: Android.View.ViewGroup.MarginLayoutParams){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: source, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: ViewGroupMarginLayoutParamsJNICache.className,
            classCache: &ViewGroupMarginLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$MarginLayoutParams;)V",
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.newMethod,
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
            className: ViewGroupMarginLayoutParamsJNICache.className,
            classCache: &ViewGroupMarginLayoutParamsJNICache.jniClass,
            methodSig: "(II)V",
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.newMethod1,
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
            className: ViewGroupMarginLayoutParamsJNICache.className,
            classCache: &ViewGroupMarginLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.newMethod2,
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
            className: ViewGroupMarginLayoutParamsJNICache.className,
            classCache: &ViewGroupMarginLayoutParamsJNICache.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.newMethod3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidViewGroupMarginLayoutParams {
    
    public var bottomMargin: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "bottomMargin",
                                               fieldType: "I",
                                               fieldCache: &ViewGroupMarginLayoutParamsJNICache.FieldID.bottomMargin,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var leftMargin: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "leftMargin",
                                               fieldType: "I",
                                               fieldCache: &ViewGroupMarginLayoutParamsJNICache.FieldID.leftMargin,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var rightMargin: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "rightMargin",
                                               fieldType: "I",
                                               fieldCache: &ViewGroupMarginLayoutParamsJNICache.FieldID.rightMargin,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var topMargin: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "topMargin",
                                               fieldType: "I",
                                               fieldCache: &ViewGroupMarginLayoutParamsJNICache.FieldID.topMargin,
                                               object: javaObject)
            return Int(__value)
        }
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

public extension AndroidViewGroupMarginLayoutParams {
    
    @_versioned
    internal func setMarginStart(_ start: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(start))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMarginStart",
            methodSig: "(I)V",
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.setMarginStart,
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
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.getMarginStart,
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
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.setMarginEnd,
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
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.getMarginEnd,
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
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.setLayoutDirection,
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
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.getLayoutDirection,
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
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.isMarginRelative,
            args: &__args,
            locals: &__locals )
        
        return jboolean(__return) != jboolean(JNI_FALSE)
    }
    
    public func setMargins(left: Int, top: Int, right: Int, bottom: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(left))
        __args[0] = jvalue(i: jint(top))
        __args[0] = jvalue(i: jint(right))
        __args[0] = jvalue(i: jint(bottom))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMargins",
            methodSig: "(IIII)V",
            methodCache: &ViewGroupMarginLayoutParamsJNICache.MethodID.setMargins,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Private

internal extension AndroidViewGroupMarginLayoutParams {
    
    /// JNI Cache
    struct ViewGroupMarginLayoutParamsJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["ViewGroup$MarginLayoutParams"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            static var bottomMargin: jfieldID?
            static var leftMargin: jfieldID?
            static var rightMargin: jfieldID?
            static var topMargin: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var newMethod1: jmethodID?
            static var newMethod2: jmethodID?
            static var newMethod3: jmethodID?
            static var setMargins: jmethodID?
            static var setMarginStart: jmethodID?
            static var setMarginEnd: jmethodID?
            static var getMarginEnd: jmethodID?
            static var getMarginStart: jmethodID?
            static var getLayoutDirection: jmethodID?
            static var setLayoutDirection: jmethodID?
            static var isMarginRelative: jmethodID?
            
        }
    }
}
