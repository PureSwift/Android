//
//  ioInputStream.swift
//  Android
//
//  Created by Marco Estrella on 11/30/18.
//

import Foundation
import java_swift
import java_lang

/**
 * 
 **/
open class JavaInputStream: JavaObject {
    
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
            className: JNICacheInputStream.className,
            classCache: &JNICacheInputStream.jniClass,
            methodSig: "()V",
            methodCache: &JNICacheInputStream.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension JavaInputStream {
    
    
}

// MARK: - JNICache

internal extension JavaInputStream {
    
    /// JNI Cache
    struct JNICacheInputStream {
        
        /// JNI Java class name
        static let className = "java/io/InputStream"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            
            static var close: jmethodID?
        }
    }
}
