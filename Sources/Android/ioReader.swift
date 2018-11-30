//
//  ioReader.swift
//  Android
//
//  Created by Marco Estrella on 11/30/18.
//

import Foundation
import java_swift
import java_lang

open class JavaReader: JavaObject {
    
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
            className: JNICacheReader.className,
            classCache: &JNICacheReader.jniClass,
            methodSig: "()V",
            methodCache: &JNICacheReader.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(lock: JavaObject) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: lock, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheReader.className,
            classCache: &JNICacheReader.jniClass,
            methodSig: "(Ljava/lang/Object;)V",
            methodCache: &JNICacheReader.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    /// Closes the stream and releases any system resources associated with it.
    open func close() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "close",
                                 methodSig: "()V",
                                 methodCache: &JNICacheReader.MethodID.close,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /// Reads characters into a portion of an array.
    open func read(cbuf: [Int8], off: Int, len: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 3)
        __args[0] = JNIType.toJava(value: cbuf, locals: &__locals)
        __args[1] = jvalue(i: jint(off))
        __args[2] = jvalue(i: jint(len))
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "read",
                                               methodSig: "([CII)I",
                                               methodCache: &JNICacheReader.MethodID.read2,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }

}

public extension JavaReader {
    
    /// Marks the present position in the stream.
    public func mark(readAheadLimit: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(readAheadLimit))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "mark",
            methodSig: "(I)V",
            methodCache: &JNICacheReader.MethodID.mark,
            args: &__args,
            locals: &__locals )
    }
    
    /// Tells whether this stream supports the mark() operation.
    public func markSupported() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                 methodName: "markSupported",
                                 methodSig: "()Z",
                                 methodCache: &JNICacheReader.MethodID.markSupported,
                                 args: &__args,
                                 locals: &__locals)
        
        return __return != JNI_FALSE
    }
    
    /// Reads a single character.
    public func read() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                   methodName: "read",
                                                   methodSig: "()I",
                                                   methodCache: &JNICacheReader.MethodID.read1,
                                                   args: &__args,
                                                   locals: &__locals)
        
        return Int(__return)
    }
    
    /// Reads characters into an array.
    public func read(cbuf: [Int8]) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = JNIType.toJava(value: cbuf, locals: &__locals)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "read",
                                               methodSig: "([C)I",
                                               methodCache: &JNICacheReader.MethodID.read3,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /// Attempts to read characters into the specified character buffer.
    public func read(target: JavaObject) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = JNIType.toJava(value: target, locals: &__locals)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "read",
                                               methodSig: "(Ljava/nio/CharBuffer;)I",
                                               methodCache: &JNICacheReader.MethodID.read4,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /// Tells whether this stream is ready to be read.
    public func ready() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "ready",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICacheReader.MethodID.ready,
                                                   args: &__args,
                                                   locals: &__locals)
        
        return __return != JNI_FALSE
    }
    
    /// Resets the stream.
    public func reset() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "reset",
            methodSig: "()V",
            methodCache: &JNICacheReader.MethodID.reset,
            args: &__args,
            locals: &__locals )
    }
    
    /// Tells whether this stream supports the mark() operation.
    public func skip(_ n: Int64) -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = JNIType.toJava(value: n, locals: &__locals)
        
        let __return = JNIMethod.CallLongMethod(object: javaObject,
                                                   methodName: "skip",
                                                   methodSig: "(J)J",
                                                   methodCache: &JNICacheReader.MethodID.skip,
                                                   args: &__args,
                                                   locals: &__locals)
        
        return Int64(__return)
    }
}

// MARK: - JNICache

internal extension JavaReader {
    
    /// JNI Cache
    struct JNICacheReader {
        
        /// JNI Java class name
        static let className = "java/io/Reader"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            
            static var close: jmethodID?
            static var mark: jmethodID?
            static var markSupported: jmethodID?
            static var read1: jmethodID?
            static var read2: jmethodID?
            static var read3: jmethodID?
            static var read4: jmethodID?
            static var ready: jmethodID?
            static var reset: jmethodID?
            static var skip: jmethodID?
        }
    }
}
