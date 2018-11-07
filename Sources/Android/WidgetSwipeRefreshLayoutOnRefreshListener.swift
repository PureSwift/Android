//
//  WidgetSwipeRefreshLayoutOnRefreshListener.swift
//  Android
//
//  Created by Marco Estrella on 9/12/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidSwipeRefreshLayout {
    
    public typealias OnRefreshListener = AndroidSwipeRefreshLayoutOnRefreshListener
}

open class AndroidSwipeRefreshLayoutOnRefreshListener: JavaObject {
    
    ///closure / block of code to execute.
    public var block: () -> () = {  }
    
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
    
    public convenience init(block: @escaping () -> () ) {
        
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
    
    fileprivate func onRefresh() {
        // execute block
        self.block()
    }
}

extension AndroidSwipeRefreshLayoutOnRefreshListener: JNIListener { }

// MARK: - Private

fileprivate extension AndroidSwipeRefreshLayoutOnRefreshListener {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["SwipeRefreshLayoutOnRefreshListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onRefreshThunk: AndroidSwipeRefreshLayoutOnRefreshListener_onRefresh_type = AndroidSwipeRefreshLayoutOnRefreshListener_onRefresh
            
            natives.append( JNINativeMethod(name: strdup("__onRefresh"),
                                            signature: strdup("(J)V"),
                                            fnPtr: unsafeBitCast( onRefreshThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidSwipeRefreshLayoutOnRefreshListener_finalize_type = AndroidSwipeRefreshLayoutOnRefreshListener_finalize
            
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

private typealias AndroidSwipeRefreshLayoutOnRefreshListener_onRefresh_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidSwipeRefreshLayoutOnRefreshListener_onRefresh ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                            _ __this: jobject?,
                                                            _ __swiftObject: jlong) -> () {
    
    AndroidSwipeRefreshLayoutOnRefreshListener
        .swiftObject(from: __swiftObject)?
        .onRefresh()
}

private typealias AndroidSwipeRefreshLayoutOnRefreshListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidSwipeRefreshLayoutOnRefreshListener_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                             _ __this: jobject?,
                                                             _ __swiftObject: jlong) -> () {
    
    AndroidSwipeRefreshLayoutOnRefreshListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}


