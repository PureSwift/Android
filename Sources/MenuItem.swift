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
}

public extension AndroidMenuItemForward {
    
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
            methodSig: "(Ljava/lang/CharSecuence;)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setTitle2,
            args: &__args,
            locals: &__locals )
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func getTitle() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTitle",
            methodSig: "()Ljava/lang/CharSecuence;",
            methodCache: &MenuItemJNICache.MethodID.getTitle,
            args: &__args,
            locals: &__locals )
        
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
            methodSig: "(Ljava/lang/CharSecuence;)Landroid/view/MenuItem;",
            methodCache: &MenuItemJNICache.MethodID.setTitleCondensed,
            args: &__args,
            locals: &__locals )
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func getTitleCondensed() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTitleCondensed",
            methodSig: "()Ljava/lang/CharSecuence;",
            methodCache: &MenuItemJNICache.MethodID.getTitleCondensed,
            args: &__args,
            locals: &__locals )
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    public func setIcon(resId: Int) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setIcon",
            methodSig: "(I)V",
            methodCache: &MenuItemJNICache.MethodID.setIcon1,
            args: &__args,
            locals: &__locals )
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func setIcon(_ icon: Android.Graphics.Drawable.Drawable?) -> AndroidMenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: icon, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setIcon",
            methodSig: "(Landroid/graphics/drawable/Drawable;)V",
            methodCache: &MenuItemJNICache.MethodID.setIcon2,
            args: &__args,
            locals: &__locals )
        
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
}

internal extension AndroidMenuItemForward {
    
    /// JNI Cache
    struct MenuItemJNICache {
        
        static let classSignature = Android.View.className(["MenuItem"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
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
        }
    }
}
