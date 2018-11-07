//
//  OsBuild.swift
//  Android
//
//  Created by Marco Estrella on 7/5/18.
//

import Foundation
import java_swift
import java_util

public extension Android.OS {
    
    public typealias Build = AndroidBuild
}

public class AndroidBuild: JavaObject {
    
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

// MARK: Constants

internal extension AndroidBuild {
    
    internal static var UNKNOWN: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "UNKNOWN",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.UNKNOWN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
}

// MARK: Fields

public extension AndroidBuild {
    
    public var BOARD: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "BOARD",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.BOARD,
                                                  object: javaObject)
    
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var BOOTLOADER: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "BOOTLOADER",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.BOOTLOADER,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var BRAND: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "BRAND",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.BRAND,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var DEVICE: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "DEVICE",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.DEVICE,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var DISPLAY: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "DISPLAY",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.DISPLAY,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var FINGERPRINT: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "FINGERPRINT",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.FINGERPRINT,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var HARDWARE: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "HARDWARE",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.HARDWARE,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var HOST: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "HOST",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.HOST,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var ID: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "ID",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.ID,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var MANUFACTURER: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "MANUFACTURER",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.MANUFACTURER,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var MODEL: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "MODEL",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.MODEL,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var PRODUCT: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "PRODUCT",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.PRODUCT,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var SUPPORTED_32_BIT_ABIS: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "SUPPORTED_32_BIT_ABIS",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.SUPPORTED_32_BIT_ABIS,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var SUPPORTED_64_BIT_ABIS: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "SUPPORTED_64_BIT_ABIS",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.SUPPORTED_64_BIT_ABIS,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var SUPPORTED_ABIS: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "SUPPORTED_ABIS",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.SUPPORTED_ABIS,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var TAGS: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "TAGS",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.TAGS,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var TIME: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "TIME",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.TIME,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var TYPE: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "TYPE",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.PRODUCT,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    public var USER: String {
        
        get {
            let __value = JNIField.GetObjectField(fieldName: "USER",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICache.FieldID.USER,
                                                  object: javaObject)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
}

// MARK: - JNI

internal extension AndroidBuild {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/os/Build"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var UNKNOWN: jfieldID?
            static var BOARD: jfieldID?
            static var BOOTLOADER: jfieldID?
            static var BRAND: jfieldID?
            static var CPU_ABI: jfieldID? //deprecated in Api 21
            static var CPU_ABI2: jfieldID? //deprecated in Api 21
            static var DEVICE: jfieldID?
            static var DISPLAY: jfieldID?
            static var FINGERPRINT: jfieldID?
            static var HARDWARE: jfieldID?
            static var HOST: jfieldID?
            static var ID: jfieldID?
            static var MANUFACTURER: jfieldID?
            static var MODEL: jfieldID?
            static var PRODUCT: jfieldID?
            static var RADIO: jfieldID? //deprecated in Api 14
            static var SERIAL: jfieldID? //deprecated in Api 26
            static var SUPPORTED_32_BIT_ABIS: jfieldID?
            static var SUPPORTED_64_BIT_ABIS: jfieldID?
            static var SUPPORTED_ABIS: jfieldID?
            static var TAGS: jfieldID?
            static var TIME: jfieldID?
            static var TYPE: jfieldID?
            static var USER: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method1: jmethodID?
            static var getRadioVersion: jmethodID?
            static var getSerial: jmethodID?
        }
    }
}
