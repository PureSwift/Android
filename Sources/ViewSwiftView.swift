//
//  ViewSwiftView.swift
//  Android
//
//  Created by Marco Estrella on 7/13/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View {
    
    public typealias SwiftView = AndroidSwiftView
}

open class AndroidSwiftView: JavaObject {
    
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
    
    public var x: Float {
        
        get { return getX() ?? 0.0 }
        
        set { setX(newValue) }
    }
    
    public var y: Float {
        
        get { return getY() ?? 0.0 }
        
        set { setY(newValue) }
    }
    
    public var layoutParams: Android.View.ViewParamsLayout? {
        
        get { return getLayoutParams() }
        
        set { setLayoutParams(newValue) }
    }
}

// MARK: - Methods

public extension AndroidSwiftView {
    
    @inline(__always)
    internal func getX() -> Float? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getX",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getX,
            args: &__args,
            locals: &__locals )
        
        return __return
    }
    
    @inline(__always)
    internal func setX(_ x: Float) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(x))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setX",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setX,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getY() -> Float? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getY",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getY,
            args: &__args,
            locals: &__locals )
        
        return __return
    }
    
    @inline(__always)
    internal func setY(_ y: Float) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(y))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setY",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setY,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getLayoutParams() -> Android.View.ViewParamsLayout? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getLayoutParams",
            methodSig: "()Lorg/pureswift/swiftandroidsupport/view/SwiftViewLayoutParams;",
            methodCache: &JNICache.MethodID.getLayoutParams,
            args: &__args,
            locals: &__locals )
        
        return Android.View.ViewParamsLayout.init(javaObject: __return)
    }
    
    @inline(__always)
    internal func setLayoutParams(_ layoutParams: Android.View.ViewParamsLayout?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: layoutParams, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLayoutParams",
            methodSig: "(Lorg/pureswift/swiftandroidsupport/view/SwiftViewLayoutParams;)V",
            methodCache: &JNICache.MethodID.setLayoutParams,
            args: &__args,
            locals: &__locals )
    }
    
    public func setBackgroundColor(_ color: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setBackgroundColor",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setBackgroundColor,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - JNICache

internal extension AndroidSwiftView {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = SwiftSupport.View.className(["SwiftView"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var INVISIBLE: jfieldID?
            static var VISIBLE: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var newMethod: jmethodID?
            static var setBackgroundColor: jmethodID?
            static var setX: jmethodID?
            static var getX: jmethodID?
            static var setY: jmethodID?
            static var getY: jmethodID?
            static var setLayoutParams: jmethodID?
            static var getLayoutParams: jmethodID?
        }
    }
}
