//
//  WidgetBottomNavigationView.swift
//  Android
//
//  Created by Marco Estrella on 10/16/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias BottomNavigationView = AndroidBottomNavigationView
}

open class AndroidBottomNavigationView: AndroidWidgetFrameLayout {
    
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
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheBottomBar.className,
            classCache: &JNICacheBottomBar.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheBottomBar.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.init(javaObject: __object)
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var menu: AndroidMenuForward {
        get { return getMenu() }
    }
    
    public var selectedItemId: Int {
        get { return getSelectedItemId() }
        set { setSelectedItemId(itemId: newValue) }
    }
}

public extension AndroidBottomNavigationView {
    
    @inline(__always)
    internal func getMenu() -> Android.View.MenuForward {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getMenu",
            methodSig: "()Landroid/view/Menu;",
            methodCache: &JNICacheBottomBar.MethodID.getMenu,
            args: &__args,
            locals: &__locals )
        
        return Android.View.MenuForward(javaObject: __return)
    }
    
    @inline(__always)
    internal func setSelectedItemId(itemId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(itemId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSelectedItemId",
            methodSig: "(I)V",
            methodCache: &JNICacheBottomBar.MethodID.setSelectedItemId,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getSelectedItemId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getSelectedItemId",
            methodSig: "()I",
            methodCache: &JNICacheBottomBar.MethodID.getSelectedItemId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func setOnNavigationItemSelectedListener(_ block: @escaping (AndroidMenuItemForward) -> ()) {
        
        let onNavigationItemSelectedListener = AndroidBottomNavigationView.OnNavigationItemSelectedListener.init(block: block)
        
        setOnNavigationItemSelectedListener(onNavigationItemSelectedListener)
    }
    
    private func setOnNavigationItemSelectedListener(_ listener: AndroidBottomNavigationView.OnNavigationItemSelectedListener){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnNavigationItemSelectedListener",
            methodSig: "(Landroid/support/design/widget/BottomNavigationView$OnNavigationItemSelectedListener;)V",
            methodCache: &JNICacheBottomBar.MethodID.setOnNavigationItemSelectedListener,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidBottomNavigationView {
    
    /// JNI Cache
    struct JNICacheBottomBar {
        
        /// JNI Java class signature
        static let classSignature = SupportDesign.Widget.className(["BottomNavigationView"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var getMenu: jmethodID?
            static var getSelectedItemId: jmethodID?
            static var setSelectedItemId: jmethodID?
            static var setOnNavigationItemSelectedListener: jmethodID?
        }
    }
}
