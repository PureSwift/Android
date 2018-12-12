//
//  ProgressDialog.swift
//  Android
//
//  Created by Marco Estrella on 12/11/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.App {
    
    public typealias ProgressDialog = AndroidProgressDialog
}

open class AndroidProgressDialog: AndroidAlertDialog {
    
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
    
    /// Creates a Progress dialog.
    public convenience init(context: Android.Content.Context) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheProgressDialog.className,
            classCache: &JNICacheProgressDialog.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheProgressDialog.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    /// Creates a Progress dialog.
    public convenience init(context: Android.Content.Context, themeResId: Int) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(themeResId))
        
        let __object = JNIMethod.NewObject(
            className: JNICacheProgressDialog.className,
            classCache: &JNICacheProgressDialog.jniClass,
            methodSig: "(Landroid/content/Context;I)V",
            methodCache: &JNICacheProgressDialog.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidProgressDialog {
    
    public var STYLE_HORIZONTAL: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "STYLE_HORIZONTAL",
                                               fieldType: "I",
                                               fieldCache: &JNICacheProgressDialog.FieldID.STYLE_HORIZONTAL,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    public var STYLE_SPINNER: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "STYLE_SPINNER",
                                               fieldType: "I",
                                               fieldCache: &JNICacheProgressDialog.FieldID.STYLE_SPINNER,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
}

public extension AndroidProgressDialog {
    
    /// Gets the maximum allowed progress value.
    public func getMax() -> Int {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMax",
            methodSig: "()I",
            methodCache: &JNICacheProgressDialog.MethodID.getMax,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /// Gets the current progress.
    public func getProgress() -> Int {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getProgress",
            methodSig: "()I",
            methodCache: &JNICacheProgressDialog.MethodID.getProgress,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /// Gets the current secondary progress.
    public func getSecondaryProgress() -> Int {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getSecondaryProgress",
            methodSig: "()I",
            methodCache: &JNICacheProgressDialog.MethodID.getSecondaryProgress,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /// Increments the current progress value.
    public func incrementProgressBy(diff: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: diff, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "incrementProgressBy",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressDialog.MethodID.incrementProgressBy,
            args: &__args,
            locals: &__locals )
    }
    
    /// Increments the current secondary progress value.
    public func incrementSecondaryProgressBy(diff: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: diff, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "incrementSecondaryProgressBy",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressDialog.MethodID.incrementSecondaryProgressBy,
            args: &__args,
            locals: &__locals )
    }
    
    /// Whether this ProgressDialog is in indeterminate mode.
    public func isIndeterminate() -> Bool {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isIndeterminate",
            methodSig: "()Z",
            methodCache: &JNICacheProgressDialog.MethodID.isIndeterminate,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /// Called when the dialog is starting.
    public func onStart() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onStart",
            methodSig: "()V",
            methodCache: &JNICacheProgressDialog.MethodID.onStart,
            args: &__args,
            locals: &__locals )
    }
    
    public func setIndeterminate(_ indeterminate: Bool) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(indeterminate ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setIndeterminate",
            methodSig: "(Z)V",
            methodCache: &JNICacheProgressDialog.MethodID.setIndeterminate,
            args: &__args,
            locals: &__locals )
    }
    
    /// Sets the drawable to be used to display the progress value.
    public func setProgressDrawable(_ drawable: AndroidGraphicsDrawableDrawable){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: drawable, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setProgressDrawable",
            methodSig: "(L\(AndroidGraphicsDrawableDrawable.DrawableJNICache.className);)V",
            methodCache: &JNICacheProgressDialog.MethodID.setProgressDrawable,
            args: &__args,
            locals: &__locals )
    }
    
    /// Change the format of the small text showing current and maximum units of progress.
    public func setProgressNumberFormat( _ format: String) {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: format, locals: &__locals)
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setProgressNumberFormat",
                                 methodSig: "(Ljava/lang/String;)V",
                                 methodCache: &JNICacheProgressDialog.MethodID.setProgressNumberFormat,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /// Change the format of the small text showing current and maximum units of progress.
    public func setProgressPercentFormat( _ format: JavaObject) {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: format, locals: &__locals)
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setProgressPercentFormat",
                                 methodSig: "(Ljava/text/NumberFormat;)V",
                                 methodCache: &JNICacheProgressDialog.MethodID.setProgressPercentFormat,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /// Sets the maximum allowed progress value.
    public func setMax(_ max: Int) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(max))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMax",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressDialog.MethodID.setMax,
            args: &__args,
            locals: &__locals )
    }
    
    /// Sets the current progress.
    public func setProgress(_ value: Int) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(value))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setProgress",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressDialog.MethodID.setProgress,
            args: &__args,
            locals: &__locals )
    }
    
    /// Sets the style of this ProgressDialog, either STYLE_SPINNER or STYLE_HORIZONTAL.
    public func setProgressStyle(style: Int) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(style))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setProgressStyle",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressDialog.MethodID.setProgressStyle,
            args: &__args,
            locals: &__locals )
    }
    
    public func setSecondaryProgress(_ secondaryProgress: Int) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(secondaryProgress))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSecondaryProgress",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressDialog.MethodID.setSecondaryProgress,
            args: &__args,
            locals: &__locals )
    }
    
    /// Creates and shows a ProgressDialog.
    @discardableResult
    public static func show(context: AndroidContext, title: String, message: String) -> AndroidProgressDialog {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: title, locals: &__locals)
        __args[2] = JNIType.toJava(value: message, locals: &__locals)
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICacheProgressDialog.className,
                                                        classCache: &JNICacheProgressDialog.jniClass,
                                                        methodName: "show",
                                                        methodSig: "(L\(AndroidContext.JNICache.className);Ljava/lang/CharSequence;Ljava/lang/CharSequence;)L\(AndroidProgressDialog.JNICacheProgressDialog.className);",
            methodCache: &JNICacheProgressDialog.MethodID.show1,
            args: &__args,
            locals: &__locals)
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidProgressDialog(javaObject: __return)
    }
    
    /// Creates and shows a ProgressDialog.
    @discardableResult
    public static func show(context: AndroidContext, title: String, message: String, indeterminate: Bool, cancelable: Bool, cancelListener: JavaObject) -> AndroidProgressDialog {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 6 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: title, locals: &__locals)
        __args[2] = JNIType.toJava(value: message, locals: &__locals)
        __args[3] = jvalue(z: jboolean(indeterminate ? JNI_TRUE : JNI_FALSE ))
        __args[4] = jvalue(z: jboolean(cancelable ? JNI_TRUE : JNI_FALSE ))
        __args[5] = JNIType.toJava(value: cancelListener, locals: &__locals)
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICacheProgressDialog.className,
                                                        classCache: &JNICacheProgressDialog.jniClass,
                                                        methodName: "show",
                                                        methodSig: "(L\(AndroidContext.JNICache.className);Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)L\(AndroidProgressDialog.JNICacheProgressDialog.className);",
            methodCache: &JNICacheProgressDialog.MethodID.show2,
            args: &__args,
            locals: &__locals)
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidProgressDialog(javaObject: __return)
    }
    
    /// Creates and shows a ProgressDialog.
    @discardableResult
    public static func show(context: AndroidContext, title: String, message: String, indeterminate: Bool, cancelable: Bool) -> AndroidProgressDialog {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 5 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: title, locals: &__locals)
        __args[2] = JNIType.toJava(value: message, locals: &__locals)
        __args[3] = jvalue(z: jboolean(indeterminate ? JNI_TRUE : JNI_FALSE ))
        __args[4] = jvalue(z: jboolean(cancelable ? JNI_TRUE : JNI_FALSE ))
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICacheProgressDialog.className,
                                                        classCache: &JNICacheProgressDialog.jniClass,
                                                        methodName: "show",
                                                        methodSig: "(L\(AndroidContext.JNICache.className);Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)L\(AndroidProgressDialog.JNICacheProgressDialog.className);",
            methodCache: &JNICacheProgressDialog.MethodID.show3,
            args: &__args,
            locals: &__locals)
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidProgressDialog(javaObject: __return)
    }
    
    /// Creates and shows a ProgressDialog.
    @discardableResult
    public static func show(context: AndroidContext, title: String, message: String, indeterminate: Bool) -> AndroidProgressDialog {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: title, locals: &__locals)
        __args[2] = JNIType.toJava(value: message, locals: &__locals)
        __args[3] = jvalue(z: jboolean(indeterminate ? JNI_TRUE : JNI_FALSE ))
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICacheProgressDialog.className,
                                                        classCache: &JNICacheProgressDialog.jniClass,
                                                        methodName: "show",
                                                        methodSig: "(L\(AndroidContext.JNICache.className);Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)L\(AndroidProgressDialog.JNICacheProgressDialog.className);",
            methodCache: &JNICacheProgressDialog.MethodID.show4,
            args: &__args,
            locals: &__locals)
        defer{ JNI.DeleteLocalRef(__return) }
        
        return AndroidProgressDialog(javaObject: __return)
    }
}

internal extension AndroidProgressDialog {
    
    /// JNI Cache
    struct JNICacheProgressDialog {
        
        static let classSignature = Android.App.className(["ProgressDialog"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var STYLE_HORIZONTAL: jfieldID?
            static var STYLE_SPINNER: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var getMax: jmethodID?
            static var getProgress: jmethodID?
            static var getSecondaryProgress: jmethodID?
            static var incrementProgressBy: jmethodID?
            static var incrementSecondaryProgressBy: jmethodID?
            static var isIndeterminate: jmethodID?
            static var onStart: jmethodID?
            static var setIndeterminate: jmethodID?
            static var setIndeterminateDrawable: jmethodID?
            static var setMax: jmethodID?
            static var setMessage: jmethodID?
            static var setProgress: jmethodID?
            static var setProgressDrawable: jmethodID?
            static var setProgressNumberFormat: jmethodID?
            static var setProgressPercentFormat: jmethodID?
            static var setProgressStyle: jmethodID?
            static var setSecondaryProgress: jmethodID?
            static var show1: jmethodID?
            static var show2: jmethodID?
            static var show3: jmethodID?
            static var show4: jmethodID?
        }
    }
}
