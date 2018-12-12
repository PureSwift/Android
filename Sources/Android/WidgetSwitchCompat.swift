//
//  WidgetSwitchCompat.swift
//  Android
//
//  Created by Marco Estrella on 12/11/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias SwitchCompat = AndroidSwitchCompat
}

/* https://developer.android.com/reference/android/support/v7/widget/SwitchCompat
 *
 * SwitchCompat is a version of the Switch widget which on devices back to API v7.
 * It does not make any attempt to use the platform provided widget on those devices which it is available normally.
 */
open class AndroidSwitchCompat: AndroidCompoundButton {
    
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
    
    /// Construct a new Switch with default styling.
    public convenience init(context: Android.Content.Context) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheSwitchCompat.className,
            classCache: &JNICacheSwitchCompat.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheSwitchCompat.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, attrs: JavaObject) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: attrs, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheSwitchCompat.className,
            classCache: &JNICacheSwitchCompat.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
            methodCache: &JNICacheSwitchCompat.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, attrs: JavaObject, defStyleAttr: Int) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: attrs, locals: &__locals)
        __args[2] = jvalue(i: jint(defStyleAttr))
        
        let __object = JNIMethod.NewObject(
            className: JNICacheSwitchCompat.className,
            classCache: &JNICacheSwitchCompat.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
            methodCache: &JNICacheSwitchCompat.MethodID.init_method_3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    open override func toggle(_ checked: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "toggle",
            methodSig: "()V",
            methodCache: &JNICacheSwitchCompat.MethodID.toggle,
            args: &__args,
            locals: &__locals )
    }
    
    open override func setChecked(_ checked: Bool) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(checked ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setChecked",
            methodSig: "(Z)V",
            methodCache: &JNICacheSwitchCompat.MethodID.setChecked,
            args: &__args,
            locals: &__locals )
    }
}

public extension AndroidSwitchCompat {
    
    public func setShowText(_ showText: Bool) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(showText ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setShowText",
            methodSig: "(Z)V",
            methodCache: &JNICacheSwitchCompat.MethodID.setShowText,
            args: &__args,
            locals: &__locals )
    }
    
    public func getShowText() -> Bool {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getShowText",
            methodSig: "()Z",
            methodCache: &JNICacheSwitchCompat.MethodID.getShowText,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func getTextOff() -> String {
        
        var __locals = [jobject]()
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getTextOff",
                                                  methodSig: "()Ljava/lang/CharSequence;",
                                                  methodCache: &JNICacheSwitchCompat.MethodID.getTextOff,
                                                  args: &__args,
                                                  locals: &__locals)
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    public func getTextOn() -> String {
        
        var __locals = [jobject]()
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getTextOn",
                                                  methodSig: "()Ljava/lang/CharSequence;",
                                                  methodCache: &JNICacheSwitchCompat.MethodID.getTextOn,
                                                  args: &__args,
                                                  locals: &__locals)
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    public func setTextOff(_ textOff: String) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: textOff, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTextOff",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &JNICacheSwitchCompat.MethodID.setTextOff,
            args: &__args,
            locals: &__locals )
    }
    
    public func setTextOn(_ textOn: String) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: textOn, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTextOn",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &JNICacheSwitchCompat.MethodID.setTextOn,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidSwitchCompat {
    
    /// JNI Cache
    struct JNICacheSwitchCompat {
        
        static let classSignature = SupportV7.Widget.className(["SwitchCompat"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var init_method_3: jmethodID?
            static var toggle: jmethodID?
            static var setChecked: jmethodID?
            static var setShowText: jmethodID?
            static var getShowText: jmethodID?
            static var getTextOff: jmethodID?
            static var getTextOn: jmethodID?
            static var setTextOff: jmethodID?
            static var setTextOn: jmethodID?
        }
    }
}
