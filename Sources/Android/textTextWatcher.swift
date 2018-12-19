//
//  textTextWatcher.swift
//  Android
//
//  Created by Marco Estrella on 12/18/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Text {
    
    public typealias TextWatcher = AndroidTextWatcher
}

open class AndroidTextWatcher: JavaObject {
    
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
    
    /// This method is called to notify you that, somewhere within s, the text has been changed.
    open func afterTextChanged(s: AndroidEditableForward?){
        
    }
    
    /// This method is called to notify you that, within s, the count characters beginning at start
    /// are about to be replaced by new text with length after
    open func beforeTextChanged(s: String?, start: Int, count: Int, after: Int){
        
    }
    
    /// This method is called to notify you that, within s, the count characters beginning at start have
    /// just replaced old text that had length before.
    open func onTextChanged(s: String?, start: Int, before: Int, count: Int){
        
    }
}

extension AndroidTextWatcher: JNIListener { }

// MARK: - Private

fileprivate extension AndroidTextWatcher {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Text.className(["SwiftTextWatcher"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onTextChangedThunk: AndroidTextWatcher_onTextChanged_type = AndroidTextWatcher_onTextChanged
            
            natives.append( JNINativeMethod(name: strdup("__onTextChanged"),
                                            signature: strdup("(JLjava/lang/CharSequence;III)V"),
                                            fnPtr: unsafeBitCast( onTextChangedThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let beforeTextChangedThunk: AndroidTextWatcher_beforeTextChanged_type = AndroidTextWatcher_beforeTextChanged
            
            natives.append( JNINativeMethod(name: strdup("__beforeTextChanged"),
                                            signature: strdup("(JLjava/lang/CharSequence;III)V"),
                                            fnPtr: unsafeBitCast( beforeTextChangedThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let afterTextChangedThunk: AndroidTextWatcher_afterTextChanged_type = AndroidTextWatcher_afterTextChanged
            
            natives.append( JNINativeMethod(name: strdup("__afterTextChanged"),
                                            signature: strdup("(JLandroid/text/Editable;)V"),
                                            fnPtr: unsafeBitCast( afterTextChangedThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidTextWatcher_finalize_type = AndroidTextWatcher_finalize
            
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

private typealias AndroidTextWatcher_onTextChanged_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint, _: jint) -> ()

public func AndroidTextWatcher_onTextChanged( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                              _ __this: jobject?,
                                              _ __swiftObject: jlong,
                                              _ __s: jobject?,
                                              _ __start: jint,
                                              _ __before: jint,
                                              _ __count: jint) -> () {
    var s : String? = nil
    
    if __s != nil {
        
        let charSeq = CharSequenceForward(javaObject: __s)
        s = charSeq.toString()
    }
    
    AndroidTextWatcher
        .swiftObject(from: __swiftObject)?
        .onTextChanged(s: s, start: Int(__start), before: Int(__before), count: Int(__count))
}

private typealias AndroidTextWatcher_beforeTextChanged_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint, _: jint) -> ()

public func AndroidTextWatcher_beforeTextChanged( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                  _ __this: jobject?,
                                                  _ __swiftObject: jlong,
                                                  _ __s: jobject?,
                                                  _ __start: jint,
                                                  _ __count: jint,
                                                  _ __after: jint) -> () {
    var s : String? = nil
    
    if __s != nil {
        
        let charSeq = CharSequenceForward(javaObject: __s)
        s = charSeq.toString()
    }
    
    AndroidTextWatcher
        .swiftObject(from: __swiftObject)?
        .beforeTextChanged(s: s, start: Int(__start), count: Int(__count), after: Int(__after))
}

private typealias AndroidTextWatcher_afterTextChanged_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject) -> ()

public func AndroidTextWatcher_afterTextChanged( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                 _ __this: jobject?,
                                                 _ __swiftObject: jlong,
                                                 _ __s: jobject) -> () {
    let s = AndroidEditableForward(javaObject: __s)
    
    AndroidTextWatcher
        .swiftObject(from: __swiftObject)?
        .afterTextChanged(s: s)
}


private typealias AndroidTextWatcher_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidTextWatcher_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                          _ __this: jobject?,
                                          _ __swiftObject: jlong) -> () {
    
    AndroidTextWatcher.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
