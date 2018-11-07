//
//  OsHandler.swift
//  Android
//
//  Created by Marco Estrella on 8/10/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.OS {
    
    public typealias Handler = AndroidHandler
}

/// `Android.View.View`
open class AndroidHandler: JavaObject {
    
    // MARK: - Initialization
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init() {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension Android.OS.Handler {
    
    public func post(rectangle: SwiftRunnable) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: rectangle, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "post",
            methodSig: "(Ljava/lang/Runnable;)Z",
            methodCache: &JNICache.MethodID.post,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
}

internal extension Android.OS.Handler {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.OS.className(["Handler"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
        
        }
        
        struct MethodID {
            static var init_method_1: jmethodID?
            static var post: jmethodID?
        }
    }
}
