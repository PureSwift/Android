//
//  ioInputStreamReader.swift
//  Android
//
//  Created by Marco Estrella on 11/30/18.
//

import Foundation
import java_swift
import java_lang

/**
 * An InputStreamReader is a bridge from byte streams to character streams: It reads bytes and decodes them into characters
 * using a specified charset. The charset that it uses may be specified by name or may be given explicitly, or the platform's default charset may be accepted.
 *
 * Each invocation of one of an InputStreamReader's read() methods may cause one or more bytes to be read from the underlying byte-input stream.
 * To enable the efficient conversion of bytes to characters, more bytes may be read ahead from the underlying stream than are necessary to satisfy the current read operation.
 **/
open class JavaInputStreamReader: JavaReader {
    
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
    
    public convenience init(in inP: JavaInputStream) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: inP, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheInputStreamReader.className,
            classCache: &JNICacheInputStreamReader.jniClass,
            methodSig: "(L\(JavaInputStream.JNICacheInputStream.className);)V",
            methodCache: &JNICacheInputStreamReader.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension JavaInputStreamReader {
    
    
}

// MARK: - JNICache

internal extension JavaInputStreamReader {
    
    /// JNI Cache
    struct JNICacheInputStreamReader {
        
        /// JNI Java class name
        static let className = "java/io/InputStreamReader"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            
            static var close: jmethodID?
        }
    }
}
