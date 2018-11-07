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
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidGraphicsColor {
    
    public static var BLACK: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "BLACK",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.BLACK,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var DKGRAY: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DKGRAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DKGRAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var GRAY: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GRAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GRAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var LTGRAY: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LTGRAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LTGRAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var WHITE: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WHITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WHITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var RED: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "RED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.RED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var GREEN: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GREEN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GREEN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var BLUE: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "BLUE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.BLUE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var YELLOW: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "YELLOW",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.YELLOW,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var CYAN: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CYAN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CYAN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var MAGENTA: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MAGENTA",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.MAGENTA,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
    
    public static var TRANSPARENT: Int64 {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TRANSPARENT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TRANSPARENT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int64(__value)
        }
    }
}

public extension AndroidGraphicsColor {
    
    public static func valueOf(color: Int) -> Android.Graphics.Color {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(color))
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICache.className,
                                         classCache: &JNICache.jniClass,
                                         methodName: "valueOf",
                                         methodSig: "(I)Landroid/graphics/Color;",
                                         methodCache: &JNICache.MethodID.valueOf,
                                         args: &__args,
                                         locals: &__locals)
        
        defer{ JNI.DeleteLocalRef(__return) }
        
        return Android.Graphics.Color(javaObject: __return)
    }
    
    /*
    /// Return a color-int from alpha, red, green, blue components.
    public static func argb(alpha: Int, red: Int, green: Int, blue: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        __args[0] = jvalue(i: jint(alpha))
        __args[1] = jvalue(i: jint(red))
        __args[2] = jvalue(i: jint(green))
        __args[3] = jvalue(i: jint(blue))
        
        let __return = JNIMethod.CallStaticIntMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "argb",
                                                        methodSig: "(IIII)I",
                                                        methodCache: &JNICache.MethodID.argb1,
                                                        args: &__args,
                                                        locals: &__locals)
        
        return Int(__return)
    }
    */
    
    /** Custom method which receive float but internaly is using the (IIII)I method.
     * The original (FFFF)I just is supported over api 26.
     * Return a color-int from alpha, red, green, blue float components in the range [0..1].
     */
    public static func argb(alpha: Float, red: Float, green: Float, blue: Float) -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        __args[0] = jvalue(i: jint(Int(alpha*255)))
        __args[1] = jvalue(i: jint(Int(red*255)))
        __args[2] = jvalue(i: jint(Int(green*255)))
        __args[3] = jvalue(i: jint(Int(blue*255)))
    
        let __return = JNIMethod.CallStaticIntMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "argb",
                                                        methodSig: "(IIII)I",
                                                        methodCache: &JNICache.MethodID.argb2,
                                                        args: &__args,
                                                        locals: &__locals)
        
        return Int64(__return)
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
        
        struct MethodID {
            static var newMethod: jmethodID?
            static var valueOf: jmethodID?
            static var argb1: jmethodID?
            static var argb2: jmethodID?
        }
    }
}
