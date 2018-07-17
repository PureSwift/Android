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
    
    
}

// MARK: - Private

internal extension AndroidViewGroupMarginLayoutParams {
    
    /// JNI Cache
    struct ViewGroupLayoutParamsJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["ViewGroup$MarginLayoutParams"])
        
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
