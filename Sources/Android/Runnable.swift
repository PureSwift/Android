//
//  LangRunnable.swift
//  Android
//
//  Created by Marco Estrella on 8/10/18.
//

import Foundation
import java_swift

public final class SwiftRunnable: JavaObject {
    
    /// Async closure / block of code to execute.
    public var block: () -> () = {  }

    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        self.bindNewObject()
    }
    
    public convenience init(block: @escaping () -> ()) {
        
        self.init()
        self.block = block
    }
    
    public func bindNewObject() {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var methodID: jmethodID?
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: JNICache.className,
                                                          classObject: JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &methodID,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
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
    
    fileprivate func run() {
        
        // execute block
        self.block()
    }
}

extension SwiftRunnable: JNIListener { }

// MARK: - Private

fileprivate extension SwiftRunnable {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "org/pureswift/swiftandroidsupport/lang/SwiftRunnable"
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()

            let runThunk: SwiftRunnable_run_type = SwiftRunnable_run
            
            natives.append( JNINativeMethod( name: strdup("__run"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( runThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let finalizeThunk: SwiftRunnable_finalize_type = SwiftRunnable_finalize
            
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
            
            //static var run: jmethodID?
        }
    }
}

private typealias SwiftRunnable_run_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func SwiftRunnable_run ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                     _ __this: jobject?,
                                     _ __swiftObject: jlong) -> () {
    
    SwiftRunnable.swiftObject(from: __swiftObject)?.run()
}

private typealias SwiftRunnable_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func SwiftRunnable_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                _ __this: jobject?,
                                                _ __swiftObject: jlong) -> () {
    
    SwiftRunnable.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}

