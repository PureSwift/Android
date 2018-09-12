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

public struct AndroidGravity: RawRepresentable, Equatable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let start = Android.View.Gravity(rawValue: AndroidGravityConstants.START)
    
    public static let end = Android.View.Gravity(rawValue: AndroidGravityConstants.END)
    
    public static let top = Android.View.Gravity(rawValue: AndroidGravityConstants.TOP)
    
    public static let bottom = Android.View.Gravity(rawValue: AndroidGravityConstants.BOTTOM)
    
    public static let center = Android.View.Gravity(rawValue: AndroidGravityConstants.CENTER)
    
    public static let centerVertical = Android.View.Gravity(rawValue: AndroidGravityConstants.CENTER_VERTICAL)
    
    public static let centerHorizontal = Android.View.Gravity(rawValue: AndroidGravityConstants.CENTER_HORIZONTAL)
    
    public static let startCenterVertical = Android.View.Gravity(rawValue: Int(AndroidGravityConstants.START|AndroidGravityConstants.CENTER_VERTICAL))
    
    public static let endCenterVertical = Android.View.Gravity(rawValue: Int(AndroidGravityConstants.END|AndroidGravityConstants.CENTER_VERTICAL))
}

fileprivate class AndroidGravityConstants: JavaObject {
    
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
    
    public static var START: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "START",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.START,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var END: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "END",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.END,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var BOTTOM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "BOTTOM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.BOTTOM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var TOP: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TOP",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TOP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

fileprivate extension AndroidGravityConstants {
    
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
            static var START: jfieldID?
            static var END: jfieldID?
            static var BOTTOM: jfieldID?
            static var TOP: jfieldID?
            
        }
    }
}

