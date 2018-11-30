//
//  ioBufferedReader.swift
//  Android
//
//  Created by Marco Estrella on 11/30/18.
//

import Foundation
import java_swift
import java_lang

/**
 * Reads text from a character-input stream, buffering characters so as to provide for the efficient reading of characters, arrays, and lines.
 **/
open class JavaBufferedReader: JavaReader {
    
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
    
    public convenience init(reader: JavaReader) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: reader, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheBufferedReader.className,
            classCache: &JNICacheBufferedReader.jniClass,
            methodSig: "(L\(JavaReader.JNICacheReader.className);)V",
            methodCache: &JNICacheBufferedReader.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public func readLine() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "readLine",
            methodSig: "()Ljava/lang/String;",
            methodCache: &JNICacheBufferedReader.MethodID.readLine,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    open override func close() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "close",
                                 methodSig: "()V",
                                 methodCache: &JNICacheBufferedReader.MethodID.close,
                                 args: &__args,
                                 locals: &__locals)
    }
}

// MARK: - JNICache

internal extension JavaBufferedReader {
    
    /// JNI Cache
    struct JNICacheBufferedReader {
        
        /// JNI Java class name
        static let className = "java/io/BufferedReader"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            
            static var readLine: jmethodID?
            static var close: jmethodID?
        }
    }
}
