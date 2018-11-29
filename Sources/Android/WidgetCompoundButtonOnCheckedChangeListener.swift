//
//  WidgetCompoundButtonOnCheckedChangeListener.swift
//  Android
//
//  Created by Marco Estrella on 11/28/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidCompoundButton {
    
    public typealias OnCheckedChangeListener = AndroidOnCheckedChangeListener
}

open class AndroidOnCheckedChangeListener: JavaObject {
    
    ///closure / block of code to execute.
    public var block: (AndroidCompoundButton?, Bool) -> () = {_,_ in  }
    
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
    
    public convenience init(block: @escaping (AndroidCompoundButton?, Bool) -> ()) {
        
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
    
    fileprivate func onCheckedChanged(buttonView: AndroidCompoundButton?, isChecked: Bool){
        // execute block
        self.block(buttonView, isChecked)
    }
}

extension AndroidOnCheckedChangeListener: JNIListener { }

// MARK: - Private

fileprivate extension AndroidOnCheckedChangeListener {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["CompoundButtonOnCheckedChangeListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onClickThunk: AndroidOnCheckedChangeListener_onCheckedChanged_type = AndroidOnCheckedChangeListener_onCheckedChanged
            
            natives.append( JNINativeMethod(name: strdup("__onCheckedChanged"),
                                            signature: strdup("(JL\(AndroidCompoundButton.JNICacheCompoundButton.className);Z)V"),
                                            fnPtr: unsafeBitCast( onClickThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidOnCheckedChangeListener_finalize_type = AndroidOnCheckedChangeListener_finalize
            
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

private typealias AndroidOnCheckedChangeListener_onCheckedChanged_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jboolean) -> ()

public func AndroidOnCheckedChangeListener_onCheckedChanged ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                              _ __this: jobject?,
                                                              _ __swiftObject: jlong,
                                                              _ __buttonView: jobject?,
                                                              _ __isChecked: jboolean) -> () {
    
    let isChecked = __isChecked != jboolean(JNI_FALSE)
    
    let buttonView : AndroidCompoundButton? = __buttonView != nil ? AndroidCompoundButton(javaObject: __buttonView) : nil
    
    AndroidOnCheckedChangeListener
        .swiftObject(from: __swiftObject)?
        .onCheckedChanged(buttonView: buttonView, isChecked: isChecked)
}

private typealias AndroidOnCheckedChangeListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidOnCheckedChangeListener_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                      _ __this: jobject?,
                                                      _ __swiftObject: jlong) -> () {
    
    AndroidViewOnClickListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
