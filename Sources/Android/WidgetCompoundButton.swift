//
//  WidgetCompoundButton.swift
//  Android
//
//  Created by Marco Estrella on 11/27/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias CompoundButton = AndroidCompoundButton
}

open class AndroidCompoundButton: AndroidButton {
    
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
            className: JNICacheCompoundButton.className,
            classCache: &JNICacheCompoundButton.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheCompoundButton.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.javaObject = __object
        
        JNI.DeleteLocalRef( __object )
    }
    
    open override func performClick() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "performClick",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICacheCompoundButton.MethodID.performClick,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    open func toggle(_ checked: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "toggle",
            methodSig: "()V",
            methodCache: &JNICacheCompoundButton.MethodID.toggle,
            args: &__args,
            locals: &__locals )
    }
    
    open func setChecked(_ checked: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(checked ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setChecked",
            methodSig: "(Z)V",
            methodCache: &JNICacheCompoundButton.MethodID.setChecked,
            args: &__args,
            locals: &__locals )
    }
}

public extension Android.Widget.CompoundButton {
    
    public func isChecked() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isChecked",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICacheCompoundButton.MethodID.isChecked,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func setOnCheckedChangeListener(_ block: @escaping (AndroidCompoundButton?, Bool) -> ()) {
        
        let OnCheckedChangeListener = AndroidCompoundButton.OnCheckedChangeListener(block: block)
        
        setOnCheckedChangeListener(OnCheckedChangeListener)
    }
    
    public func setOnCheckedChangeListener(_ listener: AndroidCompoundButton.OnCheckedChangeListener?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnCheckedChangeListener",
            methodSig: "(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V",
            methodCache: &JNICacheCompoundButton.MethodID.setOnCheckedChangeListener,
            args: &__args,
            locals: &__locals )
    }
}

internal extension Android.Widget.CompoundButton {
    
    /// JNI Cache
    struct JNICacheCompoundButton {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["CompoundButton"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var setChecked: jmethodID?
            static var toggle: jmethodID?
            static var isChecked: jmethodID?
            static var performClick: jmethodID?
            static var setOnCheckedChangeListener: jmethodID?
        }
    }
}
