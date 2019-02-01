//
//  GraphicsRect.swift
//  Android
//
//  Created by Marco Estrella on 1/24/19.
//

import Foundation

import Foundation
import java_lang

public extension Android.Graphics {
    
    public typealias Rect = AndroidRect
}

public class AndroidRect: JavaObject {
    
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
            methodCache: &JNICache.MethodID.newMethod1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(left: Int, top: Int, right: Int, bottom: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        __args[0] = jvalue(i: jint(left))
        __args[1] = jvalue(i: jint(top))
        __args[2] = jvalue(i: jint(right))
        __args[3] = jvalue(i: jint(bottom))
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(IIII)V",
            methodCache: &JNICache.MethodID.newMethod2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(r: AndroidRect){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: r, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(L\(AndroidRect.JNICache.className);)V",
            methodCache: &JNICache.MethodID.newMethod3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidRect {
    
    public func height() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "height",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.height,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    public func width() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "width",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.width,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    public func centerX() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "centerX",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.centerX,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    public func centerY() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "centerY",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.centerY,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
}

public extension AndroidRect {
    
    public var bottom: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "bottom",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.bottom,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var left: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "left",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.left,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var right: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "right",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.right,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var top: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "top",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.top,
                                               object: javaObject)
            return Int(__value)
        }
    }
}

// MARK: - JNICache

internal extension AndroidRect {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Graphics.className(["Rect"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct FieldID {
            
            static var bottom: jfieldID?
            static var left: jfieldID?
            static var right: jfieldID?
            static var top: jfieldID?
        }
        
        struct MethodID {
            static var newMethod1: jmethodID?
            static var newMethod2: jmethodID?
            static var newMethod3: jmethodID?
            static var height: jmethodID?
            static var width: jmethodID?
            static var centerX: jmethodID?
            static var centerY: jmethodID?
        }
    }
}
