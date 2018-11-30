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
    
    public func getName() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getName",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getName,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    public func getParent() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getParent",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getParent,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    public func isDirectory() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isDirectory",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isDirectory,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func isFile() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isFile",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isFile,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func list() -> [String]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "list",
                                                  methodSig: "()[Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.list,
                                                  args: &__args,
                                                  locals: &__locals)
        
        return JNIType.toSwift(type: [String].self, from: __return)
    }
    
    public func listFiles() -> [JavaFile]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "listFiles",
                                                  methodSig: "()[L\(JavaFile.JNICache.className);",
            methodCache: &JNICache.MethodID.listFiles,
            args: &__args,
            locals: &__locals)
        
        return JNIType.toSwift(type: [JavaFile].self, from: __return)
    }
    
    public func mkdir() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "mkdir",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.mkdir,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func delete() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "delete",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.delete,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func exists() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "exists",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.exists,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func createNewFile() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "createNewFile",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.createNewFile,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func length() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallLongMethod(object: javaObject,
                                                methodName: "length",
                                                methodSig: "()J",
                                                methodCache: &JNICache.MethodID.length,
                                                args: &__args,
                                                locals: &__locals)
        return Int64(__return)
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
            static var getName: jmethodID?
            static var getParent: jmethodID?
            static var isDirectory: jmethodID?
            static var isFile: jmethodID?
            static var list: jmethodID?
            static var listFiles: jmethodID?
            static var mkdir: jmethodID?
            static var delete: jmethodID?
            static var exists: jmethodID?
            static var createNewFile: jmethodID?
            static var length: jmethodID?
        }
    }
}
