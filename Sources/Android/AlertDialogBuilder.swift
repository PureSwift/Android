//
//  AlertDialogBuilder.swift
//  Android
//
//  Created by Marco Estrella on 9/7/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidAlertDialog {
    
    public typealias Builder = AndroidAlertDialogBuilder
}

open class AndroidAlertDialogBuilder: JavaObject {
    
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
    
    public convenience init(context: Android.Content.Context) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, themeResId: Int) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(themeResId))
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/Context;I)V",
            methodCache: &JNICache.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public func create() -> AndroidAlertDialog {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "create",
            methodSig: "()Landroid/support/v7/app/AlertDialog;",
            methodCache: &JNICache.MethodID.create,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialog(javaObject: __return)
    }
    
    public func getContext() -> AndroidContext {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getContext",
            methodSig: "()Landroid/content/Context;",
            methodCache: &JNICache.MethodID.getContext,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidContext(javaObject: __return)
    }
    
    @discardableResult
    public func setCancelable(cancelable: Bool) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean( cancelable ? JNI_TRUE : JNI_FALSE ))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setCancelable",
            methodSig: "(Z)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setCancelable,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setMessage(message: String) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: message, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setMessage",
            methodSig: "(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setMessage1,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setMessage(messageId: Int) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(messageId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setMessage",
            methodSig: "(I)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setMessage2,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setNegativeButton(text: String, _ block: @escaping (AndroidDialogInterfaceForward?, Int) -> ()) -> AndroidAlertDialogBuilder  {
        
        let onClickListener = AndroidDialogInterfaceOnClickListener(block: block)
        
        return setNegativeButton(text: text, listener: onClickListener)
    }
    
    @discardableResult
    public func setNegativeButton(textId: Int, _ block: @escaping (AndroidDialogInterfaceForward?, Int) -> ()) -> AndroidAlertDialogBuilder  {
        
        let onClickListener = AndroidDialogInterfaceOnClickListener(block: block)
        
        return setNegativeButton(textId: textId, listener: onClickListener)
    }
    
    internal func setNegativeButton(text: String, listener: AndroidDialogInterfaceOnClickListener) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        __args[1] = JNIType.toJava(value: listener, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setNegativeButton",
            methodSig: "(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setNegativeButton1,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    internal func setNegativeButton(textId: Int, listener: AndroidDialogInterfaceOnClickListener) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(textId))
        __args[1] = JNIType.toJava(value: listener, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setNegativeButton",
            methodSig: "(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setNegativeButton2,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setNeutralButton(text: String, _ block: @escaping (AndroidDialogInterfaceForward?, Int) -> ()) -> AndroidAlertDialogBuilder  {
        
        let onClickListener = AndroidDialogInterfaceOnClickListener(block: block)
        
        return setNeutralButton(text: text, listener: onClickListener)
    }
    
    public func setNeutralButton(textId: Int, _ block: @escaping (AndroidDialogInterfaceForward?, Int) -> ()) -> AndroidAlertDialogBuilder  {
        
        let onClickListener = AndroidDialogInterfaceOnClickListener(block: block)
        
        return setNeutralButton(textId: textId, listener: onClickListener)
    }
    
    @discardableResult
    internal func setNeutralButton(text: String, listener: AndroidDialogInterfaceOnClickListener) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        __args[1] = JNIType.toJava(value: listener, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setNeutralButton",
            methodSig: "(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setNeutralButton1,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    internal func setNeutralButton(textId: Int, listener: AndroidDialogInterfaceOnClickListener) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(textId))
        __args[1] = JNIType.toJava(value: listener, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setNeutralButton",
            methodSig: "(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setNeutralButton2,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setPositiveButton(text: String, _ block: @escaping (AndroidDialogInterfaceForward?, Int) -> ()) -> AndroidAlertDialogBuilder  {
        
        let onClickListener = AndroidDialogInterfaceOnClickListener(block: block)
        
        return setPositiveButton(text: text, listener: onClickListener)
    }
    
    @discardableResult
    public func setPositiveButton(textId: Int, _ block: @escaping (AndroidDialogInterfaceForward?, Int) -> ()) -> AndroidAlertDialogBuilder  {
        
        let onClickListener = AndroidDialogInterfaceOnClickListener(block: block)
        
        return setPositiveButton(textId: textId, listener: onClickListener)
    }
    
    internal func setPositiveButton(text: String, listener: AndroidDialogInterfaceOnClickListener) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        __args[1] = JNIType.toJava(value: listener, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setPositiveButton",
            methodSig: "(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setPositiveButton1,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    internal func setPositiveButton(textId: Int, listener: AndroidDialogInterfaceOnClickListener) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(textId))
        __args[1] = JNIType.toJava(value: listener, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setPositiveButton",
            methodSig: "(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setPositiveButton2,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setNeutralButtonIcon(icon: AndroidGraphicsDrawableDrawable) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: icon, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setNeutralButtonIcon",
            methodSig: "(Landroid/graphics/drawable/Drawable;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setNeutralButtonIcon,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setNegativeButtonIcon(icon: AndroidGraphicsDrawableDrawable) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: icon, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setNegativeButtonIcon",
            methodSig: "(Landroid/graphics/drawable/Drawable;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setNegativeButtonIcon,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setPositiveButtonIcon(icon: AndroidGraphicsDrawableDrawable) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: icon, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setPositiveButtonIcon",
            methodSig: "(Landroid/graphics/drawable/Drawable;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setPositiveButtonIcon,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setTitle(title: String) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: title, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setTitle",
            methodSig: "(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setTitle1,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setTitle(titleId: Int) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(titleId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setTitle",
            methodSig: "(I)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setTitle2,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setView(layoutResId: Int) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(layoutResId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setView",
            methodSig: "(I)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setView1,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func setView(view: AndroidView) -> AndroidAlertDialogBuilder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setView",
            methodSig: "(Landroid/view/View;)Landroid/support/v7/app/AlertDialog$Builder;",
            methodCache: &JNICache.MethodID.setView2,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialogBuilder(javaObject: __return)
    }
    
    @discardableResult
    public func show() -> AndroidAlertDialog {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "show",
            methodSig: "()Landroid/support/v7/app/AlertDialog;",
            methodCache: &JNICache.MethodID.show,
            args: &__args,
            locals: &__locals )
        
        defer {
            JNI.DeleteLocalRef(__return)
        }
        
        return AndroidAlertDialog(javaObject: __return)
    }
}

internal extension AndroidAlertDialogBuilder {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SupportV7.App.className(["AlertDialog$Builder"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var create: jmethodID?
            static var getContext: jmethodID?
            static var setCancelable: jmethodID?
            static var setMessage1: jmethodID?
            static var setMessage2: jmethodID?
            static var setNegativeButton1: jmethodID?
            static var setNegativeButton2: jmethodID?
            static var setNegativeButtonIcon: jmethodID?
            static var setNeutralButton1: jmethodID?
            static var setNeutralButton2: jmethodID?
            static var setNeutralButtonIcon: jmethodID?
            static var setPositiveButton1: jmethodID?
            static var setPositiveButton2: jmethodID?
            static var setPositiveButtonIcon: jmethodID?
            static var setTitle1: jmethodID?
            static var setTitle2: jmethodID?
            static var setView1: jmethodID?
            static var setView2: jmethodID?
            static var show: jmethodID?
        }
    }
}

