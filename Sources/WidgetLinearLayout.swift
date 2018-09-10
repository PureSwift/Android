//
//  LinearLayout.swift
//  Android
//
//  Created by Marco Estrella on 9/10/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias LinearLayout = AndroidLinearLayout
}

open class AndroidLinearLayout: Android.View.ViewGroup {
    
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
            className: LinearLayoutJNICache.className,
            classCache: &LinearLayoutJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &LinearLayoutJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var weightSum: Float {
        
        get { return getWeightSum() }
        set { setWeightSum(newValue) }
    }
    
    public var orientation: Int {
        
        get { return getOrientation() }
        set { setOrientation(newValue) }
    }
    
    public var gravity: Int {
        
        get { return getGravity() }
        set { setGravity(newValue) }
    }
}

// MARK: - Constants

public extension AndroidLinearLayout {
    
    public static var HORIZONTAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HORIZONTAL",
                fieldType: "I",
                fieldCache: &LinearLayoutJNICache.FieldID.HORIZONTAL,
                className: LinearLayoutJNICache.className,
                classCache: &LinearLayoutJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var SHOW_DIVIDER_BEGINNING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_DIVIDER_BEGINNING",
                fieldType: "I",
                fieldCache: &LinearLayoutJNICache.FieldID.SHOW_DIVIDER_BEGINNING,
                className: LinearLayoutJNICache.className,
                classCache: &LinearLayoutJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var SHOW_DIVIDER_END: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_DIVIDER_END",
                fieldType: "I",
                fieldCache: &LinearLayoutJNICache.FieldID.SHOW_DIVIDER_END,
                className: LinearLayoutJNICache.className,
                classCache: &LinearLayoutJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var SHOW_DIVIDER_MIDDLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_DIVIDER_MIDDLE",
                fieldType: "I",
                fieldCache: &LinearLayoutJNICache.FieldID.SHOW_DIVIDER_MIDDLE,
                className: LinearLayoutJNICache.className,
                classCache: &LinearLayoutJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var SHOW_DIVIDER_NONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_DIVIDER_NONE",
                fieldType: "I",
                fieldCache: &LinearLayoutJNICache.FieldID.SHOW_DIVIDER_NONE,
                className: LinearLayoutJNICache.className,
                classCache: &LinearLayoutJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var VERTICAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "VERTICAL",
                fieldType: "I",
                fieldCache: &LinearLayoutJNICache.FieldID.VERTICAL,
                className: LinearLayoutJNICache.className,
                classCache: &LinearLayoutJNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - Methods

internal extension AndroidLinearLayout {
    
    @inline(__always)
    internal func setWeightSum(_ weightSum: Float) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(f: jfloat(weightSum))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setWeightSum",
            methodSig: "(F)V",
            methodCache: &LinearLayoutJNICache.MethodID.setWeightSum,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func setOrientation(_ orientation: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(orientation))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOrientation",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.setOrientation,
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
            methodCache: &LinearLayoutJNICache.MethodID.setGravity,
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
            methodCache: &LinearLayoutJNICache.MethodID.getGravity,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    @inline(__always)
    internal func getOrientation() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getOrientation",
            methodSig: "()I",
            methodCache: &LinearLayoutJNICache.MethodID.getOrientation,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    @inline(__always)
    internal func getWeightSum() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getWeightSum",
            methodSig: "()F",
            methodCache: &LinearLayoutJNICache.MethodID.getWeightSum,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
}

// MARK: - JNICache

internal extension AndroidLinearLayout {
    
    /// JNI Cache
    struct LinearLayoutJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["LinearLayout"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var HORIZONTAL: jfieldID?
            static var SHOW_DIVIDER_BEGINNING: jfieldID?
            static var SHOW_DIVIDER_END: jfieldID?
            static var SHOW_DIVIDER_MIDDLE: jfieldID?
            static var SHOW_DIVIDER_NONE: jfieldID?
            static var VERTICAL: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var init_method_1: jmethodID?
            static var getGravity: jmethodID?
            static var getOrientation: jmethodID?
            static var getWeightSum: jmethodID?
            static var setGravity: jmethodID?
            static var setOrientation: jmethodID?
            static var setWeightSum: jmethodID?
        }
    }
}
