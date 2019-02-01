//
//  GraphicsPoint.swift
//  Android
//
//  Created by Marco Estrella on 2/1/19.
//

import Foundation
import java_lang

public extension Android.Graphics {
    
    public typealias Point = AndroidPoint
}

public class AndroidPoint: JavaObject {
    
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
    
    public convenience init(x: Int, y: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(x))
        __args[1] = jvalue(i: jint(y))
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(II)V",
            methodCache: &JNICache.MethodID.newMethod2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(src: AndroidPoint){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: src, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(L\(AndroidPoint.JNICache.className);)V",
            methodCache: &JNICache.MethodID.newMethod3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidPoint {
    
    public var x: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "x",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.x,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var y: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "y",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.y,
                                               object: javaObject)
            return Int(__value)
        }
    }
}

// MARK: - JNICache

internal extension AndroidPoint {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Graphics.className(["Point"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct FieldID {
            
            static var x: jfieldID?
            static var y: jfieldID?
        }
        
        struct MethodID {
            static var newMethod1: jmethodID?
            static var newMethod2: jmethodID?
            static var newMethod3: jmethodID?
        }
    }
}
