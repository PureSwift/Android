//
//  viewGravity.swift
//  Android
//
//  Created by Marco Estrella on 9/10/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View {
    
    public typealias Gravity = AndroidGravity
}

public class AndroidGravity: JavaObject {
    
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
    
    public static var NO_GRAVITY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "NO_GRAVITY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.NO_GRAVITY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var CENTER_VERTICAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CENTER_VERTICAL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CENTER_VERTICAL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var CENTER_HORIZONTAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CENTER_HORIZONTAL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CENTER_HORIZONTAL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var CENTER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CENTER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CENTER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

internal extension AndroidGravity {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.View.className(["Gravity"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var NO_GRAVITY: jfieldID?
            static var CENTER_VERTICAL: jfieldID?
            static var CENTER_HORIZONTAL: jfieldID?
            static var CENTER: jfieldID?
        }
    }
}
