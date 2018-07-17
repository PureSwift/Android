//
//  GraphicsColor.swift
//  Android
//
//  Created by Marco Estrella on 7/17/18.
//

import Foundation
import java_lang

public extension Android.Graphics {
    
    public typealias Color = AndroidGraphicsColor
}

public class AndroidGraphicsColor: JavaObject {
    
    
}

public extension AndroidGraphicsColor {
    
    public static var BLACK: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "BLACK",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.BLACK,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var DKGRAY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DKGRAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DKGRAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var GRAY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GRAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GRAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var LTGRAY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LTGRAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LTGRAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var WHITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WHITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WHITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var RED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "RED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.RED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var GREEN: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GREEN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GREEN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var BLUE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "BLUE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.BLUE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var YELLOW: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "YELLOW",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.YELLOW,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var CYAN: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CYAN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CYAN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var MAGENTA: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MAGENTA",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.MAGENTA,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var TRANSPARENT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TRANSPARENT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TRANSPARENT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - JNICache

internal extension AndroidGraphicsColor {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Graphics.className(["Color"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct FieldID {
            
            static var BLACK: jfieldID?
            static var DKGRAY: jfieldID?
            static var GRAY: jfieldID?
            static var LTGRAY: jfieldID?
            static var WHITE: jfieldID?
            static var RED: jfieldID?
            static var GREEN: jfieldID?
            static var BLUE: jfieldID?
            static var YELLOW: jfieldID?
            static var CYAN: jfieldID?
            static var MAGENTA: jfieldID?
            static var TRANSPARENT: jfieldID?
        }
    }
}
