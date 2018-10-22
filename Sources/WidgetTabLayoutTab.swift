//
//  WidgetTabLayoutTab.swift
//  Android
//
//  Created by Marco Estrella on 10/18/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidTabLayout {
    
    public typealias Tab = AndroidTab
}

/// A tab in this layout.
public class AndroidTab: JavaObject {
    
    public var customView: AndroidView? {
        get { return getCustomView() }
        set { setCustomView(newValue) }
    }
    
    public var icon: AndroidGraphicsDrawableDrawable? {
        get { return getIcon() }
        set { setIcon(newValue) }
    }
    
    public var text: String? {
        get { return getText() }
        set { setText(newValue) }
    }
    
    public var tag: JavaObject? {
        get { return getTag() }
        set { setTag(newValue) }
    }
}

extension AndroidTab: Hashable {
    
    public var hashValue: Int {
        return 1
    }
    
    public static func == (lhs: AndroidTab, rhs: AndroidTab) -> Bool {
        
        return lhs.hashValue == lhs.hashValue
    }
}

public extension AndroidTab {
    
    internal static var INVALID_POSITION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "INVALID_POSITION",
                fieldType: "I",
                fieldCache: &AndroidTab.JNICacheTab.FieldID.INVALID_POSITION,
                className: AndroidTab.JNICacheTab.className,
                classCache: &AndroidTab.JNICacheTab.jniClass )
            
            return Int(__value)
        }
    }
}

public extension AndroidTab {
    
    /// Returns the custom view used for this tab.
    @inline(__always)
    internal func getCustomView() -> AndroidView? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getCustomView",
            methodSig: "()L\(AndroidView.JNICache.className);",
            methodCache: &JNICacheTab.MethodID.getCustomView,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? AndroidView(javaObject: __return) : nil
    }
    
    @discardableResult
    @inline(__always)
    internal func setCustomView(_ view: AndroidView?) -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setCustomView",
            methodSig: "(L\(AndroidView.JNICache.className);)L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTab.MethodID.setCustomView1,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    @discardableResult
    public func setCustomView(resId: Int) -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setCustomView",
            methodSig: "(I)L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTab.MethodID.setCustomView2,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    @inline(__always)
    internal func getIcon() -> AndroidGraphicsDrawableDrawable? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getIcon",
            methodSig: "()L\(AndroidGraphicsDrawableDrawable.DrawableJNICache.className);",
            methodCache: &JNICacheTab.MethodID.getIcon,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? AndroidGraphicsDrawableDrawable(javaObject: __return) : nil
    }
    
    @discardableResult
    @inline(__always)
    internal func setIcon(_ drawable: AndroidGraphicsDrawableDrawable?) -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: drawable, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setIcon",
            methodSig: "(L\(AndroidGraphicsDrawableDrawable.DrawableJNICache.className);)L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTab.MethodID.setIcon1,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    @discardableResult
    public func setIcon(resId: Int) -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setIcon",
            methodSig: "(I)L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTab.MethodID.setIcon2,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    @inline(__always)
    internal func getText() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getText",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &JNICacheTab.MethodID.getText,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    @discardableResult
    @inline(__always)
    internal func setText(_ text: String?) -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setText",
            methodSig: "(Ljava/lang/CharSequence;)L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTab.MethodID.setText1,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    @discardableResult
    public func setText(resId: Int) -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resId))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setText",
            methodSig: "(I)L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTab.MethodID.setText2,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    @inline(__always)
    internal func getTag() -> JavaObject? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTag",
            methodSig: "()Ljava/lang/Object;",
            methodCache: &JNICacheTab.MethodID.getTag,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? JavaObject(javaObject: __return) : nil
    }
    
    @discardableResult
    @inline(__always)
    internal func setTag(_ text: JavaObject?) -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "setTag",
            methodSig: "(Ljava/lang/Object;)L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTab.MethodID.setTag,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    public func select()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "select",
            methodSig: "()V",
            methodCache: &JNICacheTab.MethodID.select,
            args: &__args,
            locals: &__locals )
    }
    
    public func isSelected() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isSelected",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICacheTab.MethodID.isSelected,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func getPosition() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getPosition",
                                               methodSig: "()I",
                                               methodCache: &JNICacheTab.MethodID.getPosition,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
}

internal extension AndroidTab {
    
    /// JNI Cache
    struct JNICacheTab {
        
        /// JNI Java class signature
        static let classSignature = SupportDesign.Widget.className(["TabLayout$Tab"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var INVALID_POSITION: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var getCustomView: jmethodID?
            static var setCustomView1: jmethodID?
            static var setCustomView2: jmethodID?
            static var getIcon: jmethodID?
            static var setIcon1: jmethodID?
            static var setIcon2: jmethodID?
            static var setTag: jmethodID?
            static var getTag: jmethodID?
            static var getText: jmethodID?
            static var setText1: jmethodID?
            static var setText2: jmethodID?
            static var isSelected: jmethodID?
            static var select: jmethodID?
            static var getPosition: jmethodID?
        }
    }
}

