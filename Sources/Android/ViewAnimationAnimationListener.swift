//
//  ViewAnimationAnimationListener.swift
//  Android
//
//  Created by Marco Estrella on 5/15/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidAnimation {
    
    public typealias AnimationListener = AndroidAnimationListener
}

/// An animation listener receives notifications from an animation.
/// Notifications indicate animation related events, such as the end or the repetition of the animation.
open class AndroidAnimationListener: JavaObject {
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        self.bindNewJavaObject()
    }
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    // Initialize a new Java instance and bind to this Swift object.
    public func bindNewJavaObject() {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: JNICache.className,
                                                          classObject: JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &JNICache.MethodID.newMethod,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    /// Notifies the end of the animation.
    open func onAnimationEnd(animation: AndroidAnimation) {
        
    }
    
    /// Notifies the repetition of the animation.
    open func onAnimationRepeat(animation: AndroidAnimation) {
        
    }
    
    /// Notifies the start of the animation.
    open func onAnimationStart(animation: AndroidAnimation) {
        
    }
}

extension AndroidAnimationListener: JNIListener { }

// MARK: - Private

fileprivate extension AndroidAnimationListener {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.View.Animation.className(["SwiftAnimationListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onAnimationStartThunk: AndroidAnimationListener_onAnimationStart_type = AndroidAnimationListener_onAnimationStart
            
            natives.append( JNINativeMethod(name: strdup("__onAnimationStart"),
                                            signature: strdup("(JL\(AndroidAnimation.JNICache.className);)V"),
                                            fnPtr: unsafeBitCast( onAnimationStartThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let onAnimationRepeatThunk: AndroidAnimationListener_onAnimationRepeat_type = AndroidAnimationListener_onAnimationRepeat
            
            natives.append( JNINativeMethod(name: strdup("__onAnimationRepeat"),
                                            signature: strdup("(JL\(AndroidAnimation.JNICache.className);)V"),
                                            fnPtr: unsafeBitCast( onAnimationRepeatThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let onAnimationEndThunk: AndroidAnimationListener_onAnimationEnd_type = AndroidAnimationListener_onAnimationEnd
            
            natives.append( JNINativeMethod(name: strdup("__onAnimationEnd"),
                                            signature: strdup("(JL\(AndroidAnimation.JNICache.className);)V"),
                                            fnPtr: unsafeBitCast( onAnimationEndThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidAnimationListener_finalize_type = AndroidAnimationListener_finalize
            
            natives.append( JNINativeMethod( name: strdup("__finalize"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( finalizeThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let clazz = JNI.FindClass( className )
            
            let nativesCount = jint(natives.count)
            withUnsafePointer(to: &natives[0]) { nativesPtr in
                if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, nativesCount ) != jint(JNI_OK) {
                    JNI.report( "Unable to register java natives" )
                }
            }
            
            defer { JNI.DeleteLocalRef( clazz ) }
            
            return JNI.api.NewGlobalRef( JNI.env, clazz )!
        }()
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var newMethod: jmethodID?
        }
    }
}

private typealias AndroidAnimationListener_onAnimationEnd_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject) -> ()

public func AndroidAnimationListener_onAnimationEnd ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                        _ __this: jobject?,
                                                        _ __swiftObject: jlong,
                                                        _ __animation: jobject) -> () {
    let animation = AndroidAnimation.init(javaObject: __animation)
    
    AndroidAnimationListener.swiftObject(from: __swiftObject)?
        .onAnimationEnd(animation: animation)
}

private typealias AndroidAnimationListener_onAnimationRepeat_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject) -> ()

public func AndroidAnimationListener_onAnimationRepeat ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                        _ __this: jobject?,
                                                        _ __swiftObject: jlong,
                                                        _ __animation: jobject) -> () {
    let animation = AndroidAnimation.init(javaObject: __animation)
    
    AndroidAnimationListener.swiftObject(from: __swiftObject)?
        .onAnimationRepeat(animation: animation)
}

private typealias AndroidAnimationListener_onAnimationStart_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject) -> ()

public func AndroidAnimationListener_onAnimationStart ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                   _ __this: jobject?,
                                                   _ __swiftObject: jlong,
                                                   _ __animation: jobject) -> () {
    let animation = AndroidAnimation.init(javaObject: __animation)
    
    AndroidAnimationListener.swiftObject(from: __swiftObject)?
        .onAnimationStart(animation: animation)
}

private typealias AndroidAnimationListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidAnimationListener_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                           _ __this: jobject?,
                                           _ __swiftObject: jlong) -> () {
    
    AndroidAnimationListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
