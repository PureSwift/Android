//
//  ViewAnimation.swift
//  Android
//
//  Created by Marco Estrella on 5/15/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View.Animation {
    
    public typealias Animation = AndroidAnimation
}

/// Abstraction for an Animation that can be applied to Views, Surfaces, or other objects. See the animation package description file.
open class AndroidAnimation: JavaObject {
    
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
    
    public convenience init() {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    func cancel()  {
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )

        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "cancel",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.cancel,
            args: &__args,
            locals: &__locals )
    }
    
    func getDuration() -> Int64 {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getDuration",
            methodSig: "()L",
            methodCache: &JNICache.MethodID.getDuration,
            args: &__args,
            locals: &__locals )
        
        return Int64(__return)
    }
    
    func start()  {
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "start",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.start,
            args: &__args,
            locals: &__locals )
    }
    
    func startNow()  {
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startNow",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.startNow,
            args: &__args,
            locals: &__locals )
    }
    
    func reset()  {
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "reset",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.reset,
            args: &__args,
            locals: &__locals )
    }
    
    /// When this animation should start relative to the start time.
    public func setStartOffset(startOffset: Int64)  {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(j: jlong(startOffset))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setStartOffset",
            methodSig: "(J)V",
            methodCache: &JNICache.MethodID.startOffset,
            args: &__args,
            locals: &__locals )
    }
    
    /// When this animation should start.
    public func setStartTime(startTimeMillis: Int64)  {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(j: jlong(startTimeMillis))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setStartTime",
            methodSig: "(J)V",
            methodCache: &JNICache.MethodID.setStartTime,
            args: &__args,
            locals: &__locals )
    }
    
    /// How long this animation should last.
    public func setDuration(durationMillis: Int64)  {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(j: jlong(durationMillis))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDuration",
            methodSig: "(J)V",
            methodCache: &JNICache.MethodID.setDuration,
            args: &__args,
            locals: &__locals )
    }
}


// MARK: - JNICache

internal extension AndroidAnimation {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/view/animation/Animation"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var cancel: jmethodID?
            static var getDuration: jmethodID?
            static var start: jmethodID?
            static var startNow: jmethodID?
            static var reset: jmethodID?
            static var startOffset: jmethodID?
            static var setStartTime: jmethodID?
            static var setDuration: jmethodID?
        }
    }
}
