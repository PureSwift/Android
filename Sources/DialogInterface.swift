//
//  DialogInterfaceForward.swift
//  Android
//
//  Created by Marco Estrella on 9/7/18.
//

import Foundation
import java_swift

public extension Android.Content {
    
    public typealias DialogInterfaceForward = AndroidDialogInterfaceForward
}

/**
 * Interface that defines a dialog-type class that can be shown, dismissed, or canceled, and may have buttons that can be clicked.
 */
public class AndroidDialogInterfaceForward: JavaObject {
    
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
    
    public static var BUTTON_POSITIVE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "BUTTON_POSITIVE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.BUTTON_POSITIVE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var BUTTON_NEUTRAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "BUTTON_NEUTRAL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.BUTTON_NEUTRAL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var BUTTON_NEGATIVE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "BUTTON_NEGATIVE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.BUTTON_NEGATIVE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public func cancel() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "cancel",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.cancel,
            args: &__args,
            locals: &__locals )
    }
    
    public func dismiss() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dismiss",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.dismiss,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidDialogInterfaceForward {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Content.className(["DialogInterface"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
        
            static var BUTTON_NEGATIVE: jfieldID?
            static var BUTTON_NEUTRAL: jfieldID?
            static var BUTTON_POSITIVE: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var cancel: jmethodID?
            static var dismiss: jmethodID?
        }
    }
}
