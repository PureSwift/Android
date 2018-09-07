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
    public var block: (AndroidDialogInterfaceForward?, Int) -> () = { _ in }
    
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
        
        static let classSignature = SwiftSupport.View.className(["SwiftOnMenuItemClickListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onMenuItemClickThunk: AndroidDialogInterfaceOnClickListener_onClick_type = AndroidDialogInterfaceOnClickListener_onClick
            
            natives.append( JNINativeMethod(name: strdup("__onClick"),
                                            signature: strdup("(JLandroid/content/DialogInterface;I)V"),
                                            fnPtr: unsafeBitCast( onMenuItemClickThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidDialogInterfaceOnClickListener_finalize_type = AndroidDialogInterfaceOnClickListener_finalize
            
            natives.append( JNINativeMethod( name: strdup("__finalize"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( finalizeThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let clazz = JNI.FindClass( className )
            
            withUnsafePointer(to: &natives[0]) {
                nativesPtr in
                if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, jint(natives.count) ) != jint(JNI_OK) {
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
    
    AndroidOnMenuItemClickListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}


