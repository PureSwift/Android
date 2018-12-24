//
//  WidgetSwipeRefreshLayout.swift
//  Android
//
//  Created by Marco Estrella on 9/12/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias SwipeRefreshLayout = AndroidSwipeRefreshLayout
}

open class AndroidSwipeRefreshLayout: AndroidViewGroup {
    
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
            className: SwipeRefreshLayoutJNICache.className,
            classCache: &SwipeRefreshLayoutJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &SwipeRefreshLayoutJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var isRefreshing: Bool {
        
        get { return getIsRefreshing() }
        set { setRefreshing(newValue) }
    }
    
    @inline(__always)
    internal func setRefreshing(_ refreshing: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean( refreshing ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setRefreshing",
            methodSig: "(Z)V",
            methodCache: &SwipeRefreshLayoutJNICache.MethodID.setRefreshing,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getIsRefreshing() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isRefreshing",
            methodSig: "()Z",
            methodCache: &SwipeRefreshLayoutJNICache.MethodID.isRefreshing,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func setColorSchemeColors(colors: Int64...) {
        
        var colorsInt = [Int]()
        
        colors.forEach { color in
            colorsInt.append(Int(exactly: color) ?? 0)
        }
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: colorsInt, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setColorSchemeColors",
            methodSig: "([I)V",
            methodCache: &SwipeRefreshLayoutJNICache.MethodID.setColorSchemeColors,
            args: &__args,
            locals: &__locals )
    }
    
    public func setColorSchemeResources(colors: Int...) {
        
        var colorsInt = [Int]()
        
        colors.forEach { color in
            colorsInt.append(Int(exactly: color) ?? 0)
        }
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: colorsInt, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setColorSchemeResources",
            methodSig: "([I)V",
            methodCache: &SwipeRefreshLayoutJNICache.MethodID.setColorSchemeResources,
            args: &__args,
            locals: &__locals )
    }
    
    public func setOnRefreshListener(_ block: @escaping () -> ()) {
        
        let onClickListener = AndroidSwipeRefreshLayoutOnRefreshListener(block: block)
        
        return setOnRefreshListener(listener: onClickListener)
    }
    
    public func setOnRefreshListener(listener: AndroidSwipeRefreshLayoutOnRefreshListener?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnRefreshListener",
            methodSig: "(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V",
            methodCache: &SwipeRefreshLayoutJNICache.MethodID.setOnRefreshListener,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidSwipeRefreshLayout {
    
    /// JNI Cache
    struct SwipeRefreshLayoutJNICache {
        
        static let classSignature = SupportV4.Widget.className(["SwipeRefreshLayout"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var isRefreshing: jmethodID?
            static var setColorSchemeColors: jmethodID?
            static var setColorSchemeResources: jmethodID?
            static var setRefreshing: jmethodID?
            static var setOnRefreshListener: jmethodID?
        }
    }
}
