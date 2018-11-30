//
//  ioFileReader.swift
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
open class JavaFileReader: JavaInputStreamReader {
    
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
    
    public convenience init(fileName: String) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: fileName, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheFileReader.className,
            classCache: &JNICacheFileReader.jniClass,
            methodSig: "(Ljava/lang/String;)V",
            methodCache: &JNICacheFileReader.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(file: JavaFile) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: file, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheFileReader.className,
            classCache: &JNICacheFileReader.jniClass,
            methodSig: "(L\(JavaFile.JNICache.className);)V",
            methodCache: &JNICacheFileReader.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(fd: JavaObject) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: fd, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheFileReader.className,
            classCache: &JNICacheFileReader.jniClass,
            methodSig: "(Ljava/io/FileDescriptor;)V",
            methodCache: &JNICacheFileReader.MethodID.init_method_3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - JNICache

internal extension JavaFileReader {
    
    /// JNI Cache
    struct JNICacheFileReader {
        
        /// JNI Java class name
        static let className = "java/io/FileReader"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var init_method_3: jmethodID?
        }
    }
}
