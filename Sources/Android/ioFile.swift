//
//  ioFile.swift
//  Android
//
//  Created by Marco Estrella on 11/26/18.
//

import Foundation
import java_swift
import java_lang

open class JavaFile: JavaObject {
    
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
    
    public convenience init(pathname: String) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: pathname, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Ljava/lang/String;)V",
            methodCache: &JNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(parent: String, child: String) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: parent, locals: &__locals)
        __args[1] = JNIType.toJava(value: child, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Ljava/lang/String;Ljava/lang/String;)V",
            methodCache: &JNICache.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(parent: JavaFile, child: String) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: parent, locals: &__locals)
        __args[1] = JNIType.toJava(value: child, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Ljava/io/File;Ljava/lang/String;)V",
            methodCache: &JNICache.MethodID.init_method_3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension JavaFile {
    
    /**
     * Converts this abstract pathname into a pathname string.
     */
    public func getPath() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getPath",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getPath,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension JavaFile {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "java/io/File"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            //static var LENGTH_LONG: jfieldID?
            //static var LENGTH_SHORT: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var init_method_3: jmethodID?
            static var init_method_4: jmethodID?
            
            static var getPath: jmethodID?
        }
    }
}
