//
//  OsBuildVersion.swift
//  Android
//
//  Created by Marco Estrella on 7/5/18.
//

import Foundation
import java_swift
import java_util

public extension AndroidBuild {
    
    public typealias BuildVersion = AndroidBuildVersion
}

public class AndroidBuildVersion: JavaObject {
    
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
    
    public convenience init(){
        
        var __locals = [jobject]()
        var __args = [jvalue](repeating: jvalue(), count: 0)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.init_method1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - JNI

internal extension AndroidBuildVersion {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/os/Build$VERSION"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var BASE_OS: jfieldID?
            static var CODENAME: jfieldID?
            static var INCREMENTAL: jfieldID?
            static var PREVIEW_SDK_INT: jfieldID?
            static var RELEASE: jfieldID?
            static var SDK: jfieldID? //deprecated in Api 4
            static var SDK_INT: jfieldID?
            static var SECURITY_PATCH: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method1: jmethodID?
        }
    }
}
