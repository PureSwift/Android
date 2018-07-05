//
//  AndroidManifestPermission.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_swift

public extension Android {
    
    public typealias ManifestPermission = AndroidManifestPermission
}

public struct AndroidManifestPermission {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static let accessCoarseLocation = Android.ManifestPermission(rawValue: AndroidManifestPermissionConstants.ACCESS_COARSE_LOCATION)
    
    public static let accessFineLocation = Android.ManifestPermission(rawValue: AndroidManifestPermissionConstants.ACCESS_FINE_LOCATION)
}

// MARK: - Initialization

fileprivate class AndroidManifestPermissionConstants: JavaObject {
    
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

fileprivate extension AndroidManifestPermissionConstants {
    
    fileprivate static var ACCESS_COARSE_LOCATION: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_COARSE_LOCATION",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_COARSE_LOCATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    fileprivate static var ACCESS_FINE_LOCATION: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_FINE_LOCATION",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_FINE_LOCATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
}


fileprivate extension AndroidManifestPermissionConstants {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/Manifest$permission"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var ACCESS_COARSE_LOCATION: jfieldID?
            static var ACCESS_FINE_LOCATION: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method1: jmethodID?
        }
    }
}
