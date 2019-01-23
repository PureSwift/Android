//
//  ViewOnFocusChangeListener.swift
//  Android
//
//  Created by Marco Estrella on 1/22/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidView {
    
    public typealias OnFocusChangeListener = AndroidOnFocusChangeListener
}

/// Interface definition for a callback to be invoked when the focus state of a view changed.
open class AndroidOnFocusChangeListener: JavaObject {
    
    ///closure / block of code to execute.
    public var block: (AndroidView?, Bool) -> () = { _,_ in }
    
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
    
    public convenience init(block: @escaping (AndroidView?, Bool) -> () ) {
        
        self.init()
        self.block = block
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
    
    fileprivate func onFocusChange(view: AndroidView?, hasFocus: Bool) {
        // execute block
        self.block(view, hasFocus)
    }
}

extension AndroidOnFocusChangeListener: JNIListener { }

// MARK: - Private

fileprivate extension AndroidOnFocusChangeListener {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.View.className(["SwiftViewOnFocusChangeListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onFocusChangeThunk: AndroidOnFocusChangeListener_onFocusChange_type = AndroidOnFocusChangeListener_onFocusChange
            
            natives.append( JNINativeMethod(name: strdup("__onFocusChange"),
                                            signature: strdup("(JL\(AndroidView.JNICache.className);Z)V"),
                                            fnPtr: unsafeBitCast( onFocusChangeThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidOnFocusChangeListener_finalize_type = AndroidOnFocusChangeListener_finalize
            
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

private typealias AndroidOnFocusChangeListener_onFocusChange_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _:jboolean) -> ()

public func AndroidOnFocusChangeListener_onFocusChange ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                         _ __this: jobject?,
                                                         _ __swiftObject: jlong,
                                                         _ __view: jobject?,
                                                         _ __hasFocus: jboolean) -> () {
    
    let view = __view != nil ? AndroidView(javaObject: __view) : nil
    let hasFocus = __hasFocus != jboolean(JNI_FALSE)
    
    AndroidOnFocusChangeListener
        .swiftObject(from: __swiftObject)?
        .onFocusChange(view: view, hasFocus: hasFocus)
}

private typealias AndroidOnFocusChangeListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidOnFocusChangeListener_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                    _ __this: jobject?,
                                                    _ __swiftObject: jlong) -> () {
    
    AndroidOnFocusChangeListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
