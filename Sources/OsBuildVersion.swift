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

// MARK: Fields

public extension AndroidBuildVersion {
    
    public var BASE_OS: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "BASE_OS",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.BASE_OS,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var CODENAME: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "CODENAME",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.CODENAME,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var INCREMENTAL: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "INCREMENTAL",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.INCREMENTAL,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var PREVIEW_SDK_INT: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "PREVIEW_SDK_INT",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.PREVIEW_SDK_INT,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var RELEASE: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "RELEASE",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.RELEASE,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var SDK_INT: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "SDK_INT",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.SDK_INT,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var SECURITY_PATCH: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "SECURITY_PATCH",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.SECURITY_PATCH,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
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
