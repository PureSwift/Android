//
//  ViewAnimationInterpolator.swift
//  Android
//
//  Created by Marco Estrella on 5/15/19.
//

import Foundation
import java_swift
import java_lang
import JNI

/// An interpolator defines the rate of change of an animation. This allows the basic animation effects (alpha, scale, translate, rotate) to be accelerated, decelerated, repeated, etc.
open class AndroidInterpolator: JavaObject {
    
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
    
    //// Maps a value representing the elapsed fraction of an animation to a value that represents the interpolated fraction.
    open func getInterpolation(input: Float) -> Float {
        return 0.0
    }
}

extension AndroidInterpolator: JNIListener { }

// MARK: - Private

fileprivate extension AndroidInterpolator {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.View.Animation.className(["SwiftInterpolator"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
           let getInterpolationThunk: AndroidInterpolator_getInterpolation_type = AndroidInterpolator_getInterpolation
            
            natives.append( JNINativeMethod(name: strdup("__getInterpolation"),
                                            signature: strdup("(JF)F"),
                                            fnPtr: unsafeBitCast( getInterpolationThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidInterpolator_finalize_type = AndroidInterpolator_finalize
            
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

private typealias AndroidInterpolator_getInterpolation_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jfloat) -> (jfloat)

public func AndroidInterpolator_getInterpolation ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                         _ __this: jobject?,
                                                         _ __swiftObject: jlong,
                                                         _ __input: jfloat) -> (jfloat) {
    let input = Float(__input)
    
    let interpolationValue = AndroidInterpolator
        .swiftObject(from: __swiftObject)?
        .getInterpolation(input: input)
    
    return jfloat(interpolationValue ?? 0.0)
}

private typealias AndroidInterpolator_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidInterpolator_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                    _ __this: jobject?,
                                                    _ __swiftObject: jlong) -> () {
    
    AndroidOnFocusChangeListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
