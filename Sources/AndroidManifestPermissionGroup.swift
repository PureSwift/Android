//
//  AndroidManifestPermissionGroup.swift
//  Android
//
//  Created by Killian Greene on 7/6/18.
//

import Foundation
import java_swift

public extension Android {
    
    public typealias ManifestPermissionGroup = AndroidManifestPermissionGroup
    
}

public struct AndroidManifestPermissionGroup {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let calendar = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.CALENDAR)
    
    public static let callLog = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.CALL_LOG)
    
    public static let camera = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.CAMERA)
    
    public static let contacts = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.CONTACTS)
    
    public static let location = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.LOCATION)
    
    public static let microphone = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.MICROPHONE)
    
    public static let phone = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.PHONE)
    
    public static let sensors = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.SENSORS)
    
    public static let sms = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.SMS)
    
    public static let storage = Android.ManifestPermissionGroup(rawValue:
        AndroidManifestPermissionGroupConstants.STORAGE)
}

fileprivate class AndroidManifestPermissionGroupConstants: JavaObject {
    
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

fileprivate extension AndroidManifestPermissionGroupConstants {
    /**
     * Used for runtime permissions related to user's calendar.
     */
    fileprivate static var CALENDAR: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CALENDAR",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CALENDAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for permissions that are associated telephony features.
     */
    fileprivate static var CALL_LOG: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CALL_LOG",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CALL_LOG,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for permissions that are associated with accessing camera or capturing images/video from the device.
     */
    fileprivate static var CAMERA: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CAMERA",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CAMERA,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for runtime permissions related to contacts and profiles on this device.
     */
    fileprivate static var CONTACTS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CONTACTS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CONTACTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for permissions that allow accessing the device location.
     */
    fileprivate static var LOCATION: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "LOCATION",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.LOCATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for permissions that are associated with accessing microphone audio from the device.
     */
    fileprivate static var MICROPHONE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MICROPHONE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MICROPHONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for permissions that are associated telephony features.
     */
    fileprivate static var PHONE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "PHONE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.PHONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for permissions that are associated with accessing body or environmental sensors.
     */
    fileprivate static var SENSORS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SENSORS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SENSORS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for runtime permissions related to user's SMS messages.
     */
    fileprivate static var SMS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SMS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SMS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Used for runtime permissions related to the shared external storage.
     */
    fileprivate static var STORAGE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "STORAGE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.STORAGE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
}

fileprivate extension AndroidManifestPermissionGroupConstants {
    
    // JNI Cache
    struct JNICache {
        
        // JNI Java class name
        static let className = "android/Manifest$permission_group"
        
        // JNI Java class
        static var jniClass: jclass?
        
        // JNI Field ID cache
        struct FieldID {
            static var CALENDAR: jfieldID?
            static var CALL_LOG: jfieldID?
            static var CAMERA: jfieldID?
            static var CONTACTS: jfieldID?
            static var LOCATION: jfieldID?
            static var MICROPHONE: jfieldID?
            static var PHONE: jfieldID?
            static var SENSORS: jfieldID?
            static var SMS: jfieldID?
            static var STORAGE: jfieldID?
        }
        
        // JNI MethodID
        struct MethodID {
        
        static var init_method1: jmethodID?
        }
    }
}
