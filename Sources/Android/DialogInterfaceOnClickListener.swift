//
//  DialogInterfaceOnClickListener.swift
//  Android
//
//  Created by Marco Estrella on 9/7/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidDialogInterfaceForward {
    
    public typealias OnClickListener = AndroidDialogInterfaceOnClickListener
}

open class AndroidDialogInterfaceOnClickListener: JavaObject {
    
    ///closure / block of code to execute.
    public var block: (AndroidDialogInterfaceForward?, Int) -> () = { _,_  in }
    
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
    
    public convenience init(block: @escaping (AndroidDialogInterfaceForward?, Int) -> () ) {
        
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
    
    fileprivate func onClick(dialog: AndroidDialogInterfaceForward?, which: Int) {
        // execute block
        self.block(dialog, which)
    }
}

extension AndroidDialogInterfaceOnClickListener: JNIListener { }

// MARK: - Private

fileprivate extension AndroidDialogInterfaceOnClickListener {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.App.className(["DialogInterfaceOnClickListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onClickThunk: AndroidDialogInterfaceOnClickListener_onClick_type = AndroidDialogInterfaceOnClickListener_onClick
            
            natives.append( JNINativeMethod(name: strdup("__onClick"),
                                            signature: strdup("(JLandroid/content/DialogInterface;I)V"),
                                            fnPtr: unsafeBitCast( onClickThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidDialogInterfaceOnClickListener_finalize_type = AndroidDialogInterfaceOnClickListener_finalize
            
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

private typealias AndroidDialogInterfaceOnClickListener_onClick_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

public func AndroidDialogInterfaceOnClickListener_onClick ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                             _ __this: jobject?,
                                                             _ __swiftObject: jlong,
                                                             _ __dialog: jobject?,
                                                             _ __which: jint) -> () {
    
    let dialog = __dialog != nil ? AndroidDialogInterfaceForward(javaObject: __dialog) : nil
    let which = Int(__which)
    
    AndroidDialogInterfaceOnClickListener
        .swiftObject(from: __swiftObject)?
        .onClick(dialog: dialog, which: which)
}

private typealias AndroidDialogInterfaceOnClickListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidDialogInterfaceOnClickListener_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                      _ __this: jobject?,
                                                      _ __swiftObject: jlong) -> () {
    
    AndroidDialogInterfaceOnClickListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}


