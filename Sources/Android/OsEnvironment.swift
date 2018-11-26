//
//  OsEnvironment.swift
//  Android
//
//  Created by Marco Estrella on 11/26/18.
//

import Foundation
import java_swift
import java_util

public extension Android.OS {
    
    public typealias Environment = AndroidEnvironment
}

public final class AndroidEnvironment: JavaObject {
    
    
}

public extension Android.OS.Environment {
    
    public static func getExternalStorageDirectory() -> JavaFile? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "getExternalStorageDirectory",
                                                        methodSig: "()L\(JavaFile.JNICache.className);",
            methodCache: &JNICache.MethodID.getExternalStorageDirectory,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? JavaFile(javaObject: __return) : nil
    }
    
    /*
     * Returns whether the shared/external storage media at the given path is physically removable.
     */
    public static func isExternalStorageRemovable(path: JavaFile) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: path, locals: &__locals )
        
        let __return = JNIMethod.CallStaticBooleanMethod(className: JNICache.className,
                                                         classCache: &JNICache.jniClass,
                                                         methodName: "isExternalStorageRemovable",
                                                         methodSig: "(L\(JavaFile.JNICache.className);)Z",
            methodCache: &JNICache.MethodID.isExternalStorageRemovable,
            args: &__args,
            locals: &__locals )
        return __return != jboolean(JNI_FALSE)
    }
}

internal extension Android.OS.Environment {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.OS.className(["Environment"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
        }
        
        struct MethodID {
            static var init_method_1: jmethodID?
            
            static var getExternalStorageDirectory: jmethodID? //internal storage
            static var isExternalStorageRemovable: jmethodID?
        }
    }
}
