//
//  textTextUtilsTruncateAt.swift
//  Android
//
//  Created by Marco Estrella on 11/28/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Text {
    
    public typealias TruncateAt = AndroidTextUtilsTruncateAt
}

open class AndroidTextUtilsTruncateAt: JavaObject {
    
    public static var END: AndroidTextUtilsTruncateAt {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(fieldName: "END",
                                                        fieldType: "L\(AndroidTextUtilsTruncateAt.JNICache.className);",
                fieldCache: &JNICache.FieldID.END,
                className: JNICache.className,
                classCache: &JNICache.jniClass)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return AndroidTextUtilsTruncateAt(javaObject: __value)
        }
    }
    
    public static var MARQUEE: AndroidTextUtilsTruncateAt {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(fieldName: "MARQUEE",
                                                        fieldType: "L\(AndroidTextUtilsTruncateAt.JNICache.className);",
                fieldCache: &JNICache.FieldID.MARQUEE,
                className: JNICache.className,
                classCache: &JNICache.jniClass)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return AndroidTextUtilsTruncateAt(javaObject: __value)
        }
    }
    
    public static var MIDDLE: AndroidTextUtilsTruncateAt {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(fieldName: "MIDDLE",
                                                        fieldType: "L\(AndroidTextUtilsTruncateAt.JNICache.className);",
                fieldCache: &JNICache.FieldID.MIDDLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return AndroidTextUtilsTruncateAt(javaObject: __value)
        }
    }
    
    public static var START: AndroidTextUtilsTruncateAt {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(fieldName: "START",
                                                        fieldType: "L\(AndroidTextUtilsTruncateAt.JNICache.className);",
                fieldCache: &JNICache.FieldID.START,
                className: JNICache.className,
                classCache: &JNICache.jniClass)
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return AndroidTextUtilsTruncateAt(javaObject: __value)
        }
    }
}

// MARK: - JNICache

internal extension AndroidTextUtilsTruncateAt {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Text.className(["TextUtils$TruncateAt"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var END: jfieldID?
            static var MARQUEE: jfieldID?
            static var MIDDLE: jfieldID?
            static var START: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var values: jmethodID?
            static var valueOf: jmethodID?
        }
    }
}
