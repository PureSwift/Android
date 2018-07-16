//
//  Button.swift
//  Android
//
//  Created by Killian Greene on 7/16/18.
//

import Foundation
import java_swift

public extension Android.Widget {
    public typealias Button = AndroidButton
}

open class AndroidButton: AndroidTextView {
    // MARK: - Initialization
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init(context: Android.Content.Context) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheTextView.className,
            classCache: &JNICacheTextView.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheTextView.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension Android.Widget.Button {
    
    // MARK: - Methods
    public func getAccessibilityClassName() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getAccessibilityClassName",
            methodSig: "()Ljava/lang/String;",
            methodCache: &JNICache.MethodID.getAccessibilityClassName,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
}

// MARK: - Private
internal extension Android.Widget.Button {
    
    // JNI cache
    struct JNICacheButton {
        
        // JNI Java class signature
        static let classSignature = Android.Widget.className(["Button"])
        
        // JNI Java class
        static let className = classSignature.rawValue
        
        // JNI FieldID cache
        struct FieldID {
            
        }
        
        // JNI MethodID cache
        struct MethodID {
            static var getAccessibilityClassName: jmethodID?
        }
    }
}
