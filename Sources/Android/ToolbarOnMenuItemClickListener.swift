//
//  ToolbarOnMenuItemClickListener.swift
//  Android
//
//  Created by Marco Estrella on 8/28/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget.Toolbar {
    
    public typealias OnMenuItemClickListener = AndroidOnMenuItemClickListener
}

open class AndroidOnMenuItemClickListener: JavaObject {
    
    ///closure / block of code to execute.
    public var block: (AndroidMenuItemForward?) -> (Bool) = { _ in false }
    
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
    
    public convenience init(block: @escaping (AndroidMenuItemForward?) -> (Bool)) {
        
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
    
    fileprivate func onMenuItemClick(item: AndroidMenuItemForward?) -> Bool {
        // execute block
        return self.block(item)
    }
}

extension AndroidOnMenuItemClickListener: JNIListener { }

// MARK: - Private

fileprivate extension AndroidOnMenuItemClickListener {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.View.className(["SwiftOnMenuItemClickListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onMenuItemClickThunk: AndroidOnMenuItemClickListener_onMenuItemClick_type = AndroidOnMenuItemClickListener_onMenuItemClick
            
            natives.append( JNINativeMethod(name: strdup("__onMenuItemClick"),
                                            signature: strdup("(JLandroid/view/MenuItem;)Z"),
                                            fnPtr: unsafeBitCast( onMenuItemClickThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidOnMenuItemClickListener_finalize_type = AndroidOnMenuItemClickListener_finalize
            
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

private typealias AndroidOnMenuItemClickListener_onMenuItemClick_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> (jboolean)

public func AndroidOnMenuItemClickListener_onMenuItemClick ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                             _ __this: jobject?,
                                                             _ __swiftObject: jlong,
                                                             _ __menuItem: jobject?) -> (jboolean) {
    
    let menuItem = __menuItem != nil ? AndroidMenuItemForward.init(javaObject: __menuItem) : nil
    
    let __return = AndroidOnMenuItemClickListener
        .swiftObject(from: __swiftObject)?
        .onMenuItemClick(item: menuItem)
    
    guard let _return = __return
        else { return jboolean(JNI_FALSE) }
    
    return _return ? jboolean(JNI_TRUE) : jboolean(JNI_FALSE)
}

private typealias AndroidOnMenuItemClickListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidOnMenuItemClickListener_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                      _ __this: jobject?,
                                                      _ __swiftObject: jlong) -> () {
    
    AndroidOnMenuItemClickListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}


