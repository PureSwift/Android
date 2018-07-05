//
//  ContentPmPackageManager.swift
//  Android
//
//  Created by Marco Estrella on 7/5/18.
//

import Foundation
import java_swift
import java_util

public extension Android.Content.PM {
    
    public typealias PackageManager = AndroidPackageManager
}

public extension Android.Content.PM.PackageManager {
    
    public typealias Permission = AndroidPackageManagerPermission
}

public struct AndroidPackageManagerPermission: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let granted = Android.Content.PM.PackageManager.Permission(rawValue: AndroidPackageManager.PERMISSION_GRANTED)
    
    public static let denied = Android.Content.PM.PackageManager.Permission(rawValue: AndroidPackageManager.PERMISSION_DENIED)
}

public final class AndroidPackageManager: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString =  #file,
                              _ line: Int = #line) {
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
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

internal extension AndroidPackageManager {
    
    internal static var PERMISSION_DENIED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_DENIED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_DENIED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
        
    internal static var PERMISSION_GRANTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_GRANTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_GRANTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

private extension AndroidPackageManager {
    // JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Content.PM.className(["PackageManager"])
        
        // JNI Java class name
        static let className = classSignature.rawValue
        
        // JNI Java class
        static var jniClass: jclass?
        
        // JNI Field ID cache
        struct FieldID {
            
            static var PERMISSION_DENIED: jfieldID?
            static var PERMISSION_GRANTED: jfieldID?
        }
        
        // JNI Method ID cache
        struct MethodID {
            
            static var init_method1: jmethodID?
        }
    }
}

