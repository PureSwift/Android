//
//  Toolbar.swift
//  Android
//
//  Created by Marco Estrella on 8/28/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias Toolbar = AndroidToolbar
}

public final class AndroidToolbar: AndroidViewGroup {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init(context: Android.Content.Context) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: ToolbarJNICache.className,
            classCache: &ToolbarJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &ToolbarJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var title: String? {
        
        get { return getTitle() }
        set { setTitle(newValue) }
    }
    
    public var subTitle: String? {
        
        get { return getSubtitle() }
        set { setSubtitle(newValue) }
    }
    
    public var navigationIcon: Android.Graphics.Drawable.Drawable? {
        
        get { return getNavigationIcon() }
        set { setNavigationIcon(newValue) }
    }
    
    public var logo: Android.Graphics.Drawable.Drawable? {
        
        get { return getLogo() }
        set { setLogo(newValue) }
    }
    
    public var popupTheme: Int {
        get { return getPopupTheme() }
        set { setPopupTheme(resId: newValue) }
    }
    
    public var menu: AndroidMenuForward {
        get { return getMenu() }
    }
}

public extension AndroidToolbar {
    
    @inline(__always)
    internal func setPopupTheme(resId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPopupTheme",
            methodSig: "(I)V",
            methodCache: &ToolbarJNICache.MethodID.setPopupTheme,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getPopupTheme() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getPopupTheme",
            methodSig: "()I",
            methodCache: &ToolbarJNICache.MethodID.getPopupTheme,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func setTitle(resId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTitle",
            methodSig: "(I)V",
            methodCache: &ToolbarJNICache.MethodID.setTitle1,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func setTitle(_ title: String?)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: title, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTitle",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &ToolbarJNICache.MethodID.setTitle2,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getTitle() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTitle",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &ToolbarJNICache.MethodID.getTitle,
            args: &__args,
            locals: &__locals )
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    public func setSubtitle(resId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSubtitle",
            methodSig: "(I)V",
            methodCache: &ToolbarJNICache.MethodID.setSubtitle1,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func setSubtitle(_ title: String?)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: title, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSubtitle",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &ToolbarJNICache.MethodID.setSubtitle2,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getSubtitle() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getSubtitle",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &ToolbarJNICache.MethodID.getSubtitle,
            args: &__args,
            locals: &__locals )
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    public func setNavigationIcon(resId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNavigationIcon",
            methodSig: "(I)V",
            methodCache: &ToolbarJNICache.MethodID.setNavigationIcon1,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func setNavigationIcon(_ icon: Android.Graphics.Drawable.Drawable?)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: icon, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNavigationIcon",
            methodSig: "(Landroid/graphics/drawable/Drawable;)V",
            methodCache: &ToolbarJNICache.MethodID.setNavigationIcon2,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getNavigationIcon() -> Android.Graphics.Drawable.Drawable? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getNavigationIcon",
            methodSig: "()Landroid/graphics/drawable/Drawable;",
            methodCache: &ToolbarJNICache.MethodID.getNavigationIcon,
            args: &__args,
            locals: &__locals )
        
        return __return != nil ? Android.Graphics.Drawable.Drawable(javaObject: __return) : nil
    }
    
    public func setNavigationOnClickListener(_ block: @escaping () -> ()) {
        
        let onClickListener = Android.View.View.OnClickListener(block: block)
        
        setNavigationOnClickListener(onClickListener)
    }
    
    private func setNavigationOnClickListener(_ listener: AndroidViewOnClickListener){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNavigationOnClickListener",
            methodSig: "(Landroid/view/View$OnClickListener;)V",
            methodCache: &ToolbarJNICache.MethodID.setNavigationOnClickListener,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func setLogo(_ icon: Android.Graphics.Drawable.Drawable?)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: icon, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLogo",
            methodSig: "(Landroid/graphics/drawable/Drawable;)V",
            methodCache: &ToolbarJNICache.MethodID.setLogo,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getLogo() -> Android.Graphics.Drawable.Drawable? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getLogo",
            methodSig: "()Landroid/graphics/drawable/Drawable;",
            methodCache: &ToolbarJNICache.MethodID.getLogo,
            args: &__args,
            locals: &__locals )
        
        return __return != nil ? Android.Graphics.Drawable.Drawable(javaObject: __return) : nil
    }
    
    public func setOnMenuItemClickListener(_ block: @escaping (AndroidMenuItemForward?) -> (Bool)) {
        
        let onMenuItemClickListener = Android.Widget.Toolbar.OnMenuItemClickListener(block: block)
        
        setOnMenuItemClickListener(onMenuItemClickListener)
    }
    
    private func setOnMenuItemClickListener(_ listener: Android.Widget.Toolbar.OnMenuItemClickListener) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnMenuItemClickListener",
            methodSig: "(Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;)V",
            methodCache: &ToolbarJNICache.MethodID.setOnMenuItemClickListener,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getMenu() -> Android.View.MenuForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getMenu",
            methodSig: "()Landroid/view/Menu;",
            methodCache: &ToolbarJNICache.MethodID.getMenu,
            args: &__args,
            locals: &__locals )
        
        return Android.View.MenuForward(javaObject: __return)
    }
    
    public func setTitleTextColor(color: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTitleTextColor",
            methodSig: "(I)V",
            methodCache: &ToolbarJNICache.MethodID.setTitleTextColor,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidToolbar {
    
    /// JNI Cache
    struct ToolbarJNICache {
        
        static let classSignature = SupportV7.Widget.className(["Toolbar"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var setPopupTheme: jmethodID?
            static var getPopupTheme: jmethodID?
            static var setTitle1: jmethodID?
            static var setTitle2: jmethodID?
            static var getTitle: jmethodID?
            static var setSubtitle1: jmethodID?
            static var setSubtitle2: jmethodID?
            static var getSubtitle: jmethodID?
            static var setNavigationIcon1: jmethodID?
            static var setNavigationIcon2: jmethodID?
            static var getNavigationIcon: jmethodID?
            static var setNavigationOnClickListener: jmethodID?
            static var setLogo: jmethodID?
            static var getLogo: jmethodID?
            static var getMenu: jmethodID?
            static var setOnMenuItemClickListener: jmethodID?
            static var setTitleTextColor: jmethodID?
        }
    }
}
