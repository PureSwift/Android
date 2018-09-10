//
//  Menu.swift
//  Android
//
//  Created by Marco Estrella on 8/28/18.
//

import Foundation
import java_swift
import JNI

public extension Android.View {
    
    public typealias MenuForward = AndroidMenuForward
}

open class AndroidMenuForward: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
}

public extension AndroidMenuForward {
    
    public func add(titleRes: Int) -> Android.View.MenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(titleRes))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "add",
            methodSig: "(I)Landroid/view/MenuItem;",
            methodCache: &MenuJNICache.MethodID.add1,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func add(_ title: String?) -> Android.View.MenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: title, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "add",
            methodSig: "(Ljava/lang/CharSequence;)Landroid/view/MenuItem;",
            methodCache: &MenuJNICache.MethodID.add2,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func add(groupId: Int, itemId: Int, order: Int, titleRes: Int) -> Android.View.MenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(groupId))
        __args[1] = jvalue(i: jint(itemId))
        __args[2] = jvalue(i: jint(order))
        __args[3] = jvalue(i: jint(titleRes))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "add",
            methodSig: "(IIII)Landroid/view/MenuItem;",
            methodCache: &MenuJNICache.MethodID.add3,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func add(groupId: Int, itemId: Int, order: Int, title: String) -> Android.View.MenuItemForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(groupId))
        __args[1] = jvalue(i: jint(itemId))
        __args[2] = jvalue(i: jint(order))
        __args[3] = JNIType.toJava(value: title, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "add",
            methodSig: "(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;",
            methodCache: &MenuJNICache.MethodID.add4,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return AndroidMenuItemForward(javaObject: __return)
    }
    
    public func clear(){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clear",
            methodSig: "()V",
            methodCache: &MenuJNICache.MethodID.clear,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidMenuForward {
    
    /// JNI Cache
    struct MenuJNICache {
        
        static let classSignature = Android.View.className(["Menu"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var add1: jmethodID?
            static var add2: jmethodID?
            static var add3: jmethodID?
            static var add4: jmethodID?
            static var clear: jmethodID?
        }
    }
}

