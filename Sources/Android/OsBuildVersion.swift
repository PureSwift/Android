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
    
    public typealias Version = AndroidBuildVersion
}

public extension AndroidBuild.Version {
    
    public typealias Sdk = AndroidBuildSdk
}

public struct AndroidBuildSdk: RawRepresentable, Equatable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// The SDK version of the software currently running on this hardware device. This value never changes while a
    /// device is booted, but it may increase when the hardware manufacturer provides an OTA update.
    public static let sdkInt = Android.OS.Build.Version.Sdk(rawValue: AndroidBuildVersionConstants.SDK_INT)
    
    /// The developer preview revision of a prerelease SDK. This value will always be 0 on production platform builds/devices.
    public static let previewSdkInt = Android.OS.Build.Version.Sdk(rawValue: AndroidBuildVersionConstants.PREVIEW_SDK_INT)
}

public struct AndroidBuildVersion: RawRepresentable, Equatable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// The base OS build the product is based on.
    public static let baseOS = Android.OS.Build.Version(rawValue: AndroidBuildVersionConstants.BASE_OS)
    
    /// The current development codename, or the string "REL" if this is a release build.
    public static let codename = Android.OS.Build.Version(rawValue: AndroidBuildVersionConstants.CODENAME)
    
    /// The internal value used by the underlying source control to represent this build. E.g., a perforce changelist number or a git hash.
    public static let incremental = Android.OS.Build.Version(rawValue: AndroidBuildVersionConstants.INCREMENTAL)
    
    /// The user-visible version string. E.g., "1.0" or "3.4b5".
    public static let release = Android.OS.Build.Version(rawValue: AndroidBuildVersionConstants.RELEASE)
    
    /// The user-visible security patch level.
    public static let securityPatch = Android.OS.Build.Version(rawValue: AndroidBuildVersionConstants.SECURITY_PATCH)
}

fileprivate class AndroidBuildVersionConstants: JavaObject {
    
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

fileprivate extension AndroidBuildVersionConstants {
    
    fileprivate static var BASE_OS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BASE_OS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BASE_OS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    fileprivate static var CODENAME: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CODENAME",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CODENAME,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    fileprivate static var INCREMENTAL: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "INCREMENTAL",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.INCREMENTAL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    fileprivate static var PREVIEW_SDK_INT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PREVIEW_SDK_INT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PREVIEW_SDK_INT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var RELEASE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "RELEASE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.RELEASE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    fileprivate static var SDK_INT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SDK_INT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SDK_INT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var SECURITY_PATCH: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SECURITY_PATCH",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SECURITY_PATCH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
}

// MARK: - JNI

fileprivate extension AndroidBuildVersionConstants {
    
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
