//
//  WidgetEditText.swift
//  Android
//
//  Created by Marco Estrella on 10/4/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias EditText = AndroidEditText
}

open class AndroidEditText: AndroidTextView {
    
    // MARK: - Initialization
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init(context: Android.Content.Context){
        
        self.init(javaObject: nil)
        bindNewJavaObject(context: context)
    }
    
    public override func bindNewJavaObject(context: Android.Content.Context){
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheEditText.className,
            classCache: &JNICacheEditText.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheEditText.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.javaObject = __object
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension Android.Widget.EditText {
    
    public func extendSelection(_ index: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(index))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "extendSelection",
            methodSig: "(I)V",
            methodCache: &JNICacheEditText.MethodID.extendSelection,
            args: &__args,
            locals: &__locals )
    }
    
    public func getAccessibilityClassName() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getAccessibilityClassName",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &JNICacheEditText.MethodID.getAccessibilityClassName,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    public func getFreezesText() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getFreezesText",
            methodSig: "()Z",
            methodCache: &JNICacheEditText.MethodID.getFreezesText,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func getText() -> JavaObject? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getText",
            methodSig: "()Landroid/text/Editable;",
            methodCache: &JNICacheEditText.MethodID.getText,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? JavaObject(javaObject: __return) : nil
    }
    
    public func selectAll() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "selectAll",
            methodSig: "()V",
            methodCache: &JNICacheEditText.MethodID.selectAll,
            args: &__args,
            locals: &__locals )
    }
    
    public func setSelection(_ index: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(index))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSelection",
            methodSig: "(I)V",
            methodCache: &JNICacheEditText.MethodID.setSelection,
            args: &__args,
            locals: &__locals )
    }
}

internal extension Android.Widget.EditText {
    
    /// JNI Cache
    struct JNICacheEditText {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["EditText"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var extendSelection: jmethodID?
            static var getAccessibilityClassName: jmethodID?
            static var getFreezesText: jmethodID?
            static var getText: jmethodID?
            static var selectAll: jmethodID?
            static var setEllipsize: jmethodID?
            static var setSelection: jmethodID?
            static var setSelection2: jmethodID?
            static var setText: jmethodID?
        }
    }
}

