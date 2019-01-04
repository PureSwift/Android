//
//  MenuItem.swift
//  Android
//
//  Created by Marco Estrella on 8/28/18.
//

import Foundation
import java_swift
import JNI

public extension Android.View {
    
    public typealias MenuItemForward = AndroidMenuItemForward
}

open class AndroidMenuItemForward: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public var title: String? {
        
        @inline(__always)
        get { return getTitle() }
    }
    
    public var titleCondensed: String? {
        
        @inline(__always)
        get { return getTitleCondensed() }
    }
    
    public var icon: AndroidGraphicsDrawableDrawable? {
        
        @inline(__always)
        get { return getIcon() }
    }
    
    public var itemId: Int {
        
        @inline(__always)
        get { return getItemId() }
    }
    
    public var groupId: Int {
        
        @inline(__always)
        get { return getGroupId() }
    }
    
    public var order: Int {
        
        @inline(__always)
        get { return getOrder() }
    }
    
    public var isCollapseActionView: Bool {
        
        get { return collapseActionView() }
    }
    
    public var isExpandActionView: Bool {
        
        get { return expandActionView() }
    }
    
    public var actionView: AndroidView? {
        
        get { return getActionView() }
        
        set { setActionView(newValue) }
    }
}

public extension AndroidMenuItemForward {
    
    @inline(__always)
    internal func collapseActionView() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "collapseActionView",
            methodSig: "()Z",
            methodCache: &MenuItemJNICache.MethodID.collapseActionView,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    @inline(__always)
    internal func expandActionView() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "expandActionView",
            methodSig: "()Z",
            methodCache: &MenuItemJNICache.MethodID.expandActionView,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    @inline(__always)
    internal func getActionView() -> AndroidView? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getActionView",
            methodSig: "()L\(AndroidView.JNICache.className);",
            methodCache: &MenuItemJNICache.MethodID.getActionView,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return __return != nil ? AndroidView(javaObject: __return) : nil
    }
    
    public func setActionView(resId: Int) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setActionView",
            methodSig: "(I)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setActionView1,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    @inline(__always)
    internal func setActionView(_ view: AndroidView?) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setActionView",
            methodSig: "(L\(AndroidView.JNICache.className);)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setActionView2,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func setTitle(resId: Int) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setTitle",
            methodSig: "(I)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setTitle1,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    @inline(__always)
    internal func setTitle(_ title: String?) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: title, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setTitle",
            methodSig: "(Ljava/lang/CharSequence;)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setTitle2,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func getTitle() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTitle",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &MenuItemJNICache.MethodID.getTitle,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    @inline(__always)
    internal func setTitleCondensed(_ title: String?) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: title, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setTitleCondensed",
            methodSig: "(Ljava/lang/CharSequence;)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setTitleCondensed,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func getTitleCondensed() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTitleCondensed",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &MenuItemJNICache.MethodID.getTitleCondensed,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    @discardableResult
    public func setIcon(resId: Int) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setIcon",
            methodSig: "(I)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setIcon1,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func setIcon(_ icon: Android.Graphics.Drawable.Drawable?) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: icon, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setIcon",
            methodSig: "(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setIcon2,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func getIcon() -> Android.Graphics.Drawable.Drawable? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getIcon",
            methodSig: "()Landroid/graphics/drawable/Drawable;",
            methodCache: &MenuItemJNICache.MethodID.getIcon,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return __return != nil ? Android.Graphics.Drawable.Drawable(javaObject: __return) : nil
    }
    
    public func getOrder() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getOrder",
            methodSig: "()I",
            methodCache: &MenuItemJNICache.MethodID.getOrder,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func getItemId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getItemId",
            methodSig: "()I",
            methodCache: &MenuItemJNICache.MethodID.getItemId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func getGroupId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getGroupId",
            methodSig: "()I",
            methodCache: &MenuItemJNICache.MethodID.getGroupId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func setShowAsAction(action: ShowAsAction) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(action.rawValue))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setShowAsAction",
            methodSig: "(I)V",
            methodCache: &MenuItemJNICache.MethodID.setShowAsAction,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidMenuItemForward {
    
    internal static var SHOW_AS_ACTION_NEVER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_AS_ACTION_NEVER",
                fieldType: "I",
                fieldCache: &MenuItemJNICache.FieldID.SHOW_AS_ACTION_NEVER,
                className: MenuItemJNICache.className,
                classCache: &MenuItemJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var SHOW_AS_ACTION_IF_ROOM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_AS_ACTION_IF_ROOM",
                fieldType: "I",
                fieldCache: &MenuItemJNICache.FieldID.SHOW_AS_ACTION_IF_ROOM,
                className: MenuItemJNICache.className,
                classCache: &MenuItemJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var SHOW_AS_ACTION_ALWAYS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_AS_ACTION_ALWAYS",
                fieldType: "I",
                fieldCache: &MenuItemJNICache.FieldID.SHOW_AS_ACTION_ALWAYS,
                className: MenuItemJNICache.className,
                classCache: &MenuItemJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var SHOW_AS_ACTION_WITH_TEXT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_AS_ACTION_WITH_TEXT",
                fieldType: "I",
                fieldCache: &MenuItemJNICache.FieldID.SHOW_AS_ACTION_WITH_TEXT,
                className: MenuItemJNICache.className,
                classCache: &MenuItemJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    internal static var SHOW_AS_ACTION_COLLAPSE_ACTION_VIEW: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SHOW_AS_ACTION_COLLAPSE_ACTION_VIEW",
                fieldType: "I",
                fieldCache: &MenuItemJNICache.FieldID.SHOW_AS_ACTION_COLLAPSE_ACTION_VIEW,
                className: MenuItemJNICache.className,
                classCache: &MenuItemJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
}

internal extension AndroidMenuItemForward {
    
    /// JNI Cache
    struct MenuItemJNICache {
        
        static let classSignature = Android.View.className(["MenuItem"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var SHOW_AS_ACTION_NEVER: jfieldID?
            static var SHOW_AS_ACTION_IF_ROOM: jfieldID?
            static var SHOW_AS_ACTION_ALWAYS: jfieldID?
            static var SHOW_AS_ACTION_WITH_TEXT: jfieldID?
            static var SHOW_AS_ACTION_COLLAPSE_ACTION_VIEW: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getOrder: jmethodID?
            static var setTitle1: jmethodID?
            static var setTitle2: jmethodID?
            static var getTitle: jmethodID?
            static var setIcon1: jmethodID?
            static var setIcon2: jmethodID?
            static var getIcon: jmethodID?
            static var getItemId: jmethodID?
            static var getGroupId: jmethodID?
            static var setTitleCondensed: jmethodID?
            static var getTitleCondensed: jmethodID?
            static var setShowAsAction: jmethodID?
            static var setActionView1: jmethodID?
            static var setActionView2: jmethodID?
            static var getActionView: jmethodID?
            static var collapseActionView: jmethodID?
            static var expandActionView: jmethodID?
        }
    }
}

public extension AndroidMenuItemForward {
    
    public struct ShowAsAction: RawRepresentable, Equatable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public static let never = AndroidMenuItemForward.ShowAsAction(rawValue: AndroidMenuItemForward.SHOW_AS_ACTION_NEVER)
        
        public static let ifRoom = AndroidMenuItemForward.ShowAsAction(rawValue: AndroidMenuItemForward.SHOW_AS_ACTION_IF_ROOM)
        
        public static let always = AndroidMenuItemForward.ShowAsAction(rawValue: AndroidMenuItemForward.SHOW_AS_ACTION_ALWAYS)
        
        public static let withText = AndroidMenuItemForward.ShowAsAction(rawValue: AndroidMenuItemForward.SHOW_AS_ACTION_WITH_TEXT)
        
        public static let collapseActionView = AndroidMenuItemForward.ShowAsAction(rawValue: AndroidMenuItemForward.SHOW_AS_ACTION_COLLAPSE_ACTION_VIEW)
    }
}

