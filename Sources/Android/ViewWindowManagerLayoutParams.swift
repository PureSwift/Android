//
//  ViewWindowManagerLayoutParams.swift
//  Android
//
//  Created by Marco Estrella on 11/27/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidWindowManager {
    
    public typealias LayoutParams = AndroidWindowManagerLayoutParams
}

open class AndroidWindowManagerLayoutParams: Android.View.ViewGroup.LayoutParams {
    
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
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: JNICacheWindowManagerLayoutParams.className,
            classCache: &JNICacheWindowManagerLayoutParams.jniClass,
            methodSig: "()V",
            methodCache: &JNICacheWindowManagerLayoutParams.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    @discardableResult
    public func copyFrom(_ o: AndroidWindowManagerLayoutParams) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: o, locals: &__locals)
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "copyFrom",
            methodSig: "(L\(AndroidWindowManagerLayoutParams.JNICacheWindowManagerLayoutParams.className);)I",
            methodCache: &JNICacheWindowManagerLayoutParams.MethodID.copyFrom,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
}

extension AndroidWindowManagerLayoutParams {
    
    public static var SOFT_INPUT_ADJUST_UNSPECIFIED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SOFT_INPUT_ADJUST_UNSPECIFIED",
                fieldType: "I",
                fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.SOFT_INPUT_ADJUST_UNSPECIFIED,
                className: JNICacheWindowManagerLayoutParams.className,
                classCache: &JNICacheWindowManagerLayoutParams.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var SOFT_INPUT_ADJUST_RESIZE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SOFT_INPUT_ADJUST_RESIZE",
                fieldType: "I",
                fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.SOFT_INPUT_ADJUST_RESIZE,
                className: JNICacheWindowManagerLayoutParams.className,
                classCache: &JNICacheWindowManagerLayoutParams.jniClass )
            
            return Int(__value)
        }
    }
    
    public var x: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "x",
                                               fieldType: "I",
                                               fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.x,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var y: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "y",
                                               fieldType: "I",
                                               fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.y,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var softInputMode: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "softInputMode",
                                               fieldType: "I",
                                               fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.softInputMode,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var screenOrientation: Int {
        
        get {
            
            let __value = JNIField.GetIntField(fieldName: "screenOrientation",
                                               fieldType: "I",
                                               fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.screenOrientation,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var packageName: String {
        
        get {
            
            let __value = JNIField.GetObjectField(fieldName: "packageName",
                                                  fieldType: "Ljava/lang/String;",
                                                  fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.packageName,
                                                  object: javaObject)
            return String(javaObject: __value)
        }
    }
    
    public var screenBrightness: Float {
        
        get {
            
            let __value = JNIField.GetFloatField(fieldName: "screenBrightness",
                                                 fieldType: "F",
                                                 fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.screenBrightness,
                                                 object: javaObject)
            return Float(__value)
        }
    }
    
    public var verticalWeight: Float {
        
        get {
            
            let __value = JNIField.GetFloatField(fieldName: "verticalWeight",
                                                 fieldType: "F",
                                                 fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.verticalWeight,
                                                 object: javaObject)
            return Float(__value)
        }
    }
    
    public var verticalMargin: Float {
        
        get {
            
            let __value = JNIField.GetFloatField(fieldName: "verticalMargin",
                                                 fieldType: "F",
                                                 fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.verticalMargin,
                                                 object: javaObject)
            return Float(__value)
        }
    }
    
    public var horizontalWeight: Float {
        
        get {
            
            let __value = JNIField.GetFloatField(fieldName: "horizontalWeight",
                                                 fieldType: "F",
                                                 fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.horizontalWeight,
                                                 object: javaObject)
            return Float(__value)
        }
    }
    
    public var horizontalMargin: Float {
        
        get {
            
            let __value = JNIField.GetFloatField(fieldName: "horizontalMargin",
                                                 fieldType: "F",
                                                 fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.horizontalMargin,
                                                 object: javaObject)
            return Float(__value)
        }
    }
    
    public var alpha: Float {
        
        get {
            
            let __value = JNIField.GetFloatField(fieldName: "alpha",
                                                 fieldType: "F",
                                                 fieldCache: &JNICacheWindowManagerLayoutParams.FieldID.alpha,
                                                 object: javaObject)
            return Float(__value)
        }
    }
}

// MARK: - Private

internal extension AndroidWindowManagerLayoutParams {
    
    /// JNI Cache
    struct JNICacheWindowManagerLayoutParams {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["WindowManager$LayoutParams"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var SOFT_INPUT_ADJUST_RESIZE: jfieldID?
            static var SOFT_INPUT_ADJUST_UNSPECIFIED: jfieldID?
            
            static var x: jfieldID?
            static var y: jfieldID?
            static var softInputMode: jfieldID?
            static var screenOrientation: jfieldID?
            static var packageName: jfieldID?
            static var screenBrightness: jfieldID?
            static var verticalWeight: jfieldID?
            static var verticalMargin: jfieldID?
            static var horizontalWeight: jfieldID?
            static var horizontalMargin: jfieldID?
            static var alpha: jfieldID?
            
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var copyFrom: jmethodID?
        }
    }
}
