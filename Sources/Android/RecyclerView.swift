//
//  RecyclerView.swift
//  Android
//
//  Created by Marco Estrella on 7/3/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias RecyclerView = AndroidWidgetRecyclerView
}

/**
 * A flexible view for providing a limited window into a large data set.
 *
 */
public final class AndroidWidgetRecyclerView: AndroidViewGroup {
    
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
            className: RecyclerViewJNICache.className,
            classCache: &RecyclerViewJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &RecyclerViewJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var adapter: AndroidWidgetRecyclerViewAdapter {
        
        @inline(__always)
        get { return getAdapter() }
        set { setAdapter(newValue) }
    }
    
    public var layoutManager: Android.Widget.RecyclerView.LayoutManager {
        
        @inline(__always)
        get { return getLayoutManager() }
        set { setLayoutManager(newValue) }
    }
}

public extension AndroidWidgetRecyclerView {
    
    @_versioned
    internal func getAdapter() -> AndroidWidgetRecyclerViewAdapter {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getAdapter",
                                                  methodSig: "()Landroid/support/v7/widget/RecyclerView$Adapter;",
                                                  methodCache: &RecyclerViewJNICache.MethodID.getAdapter,
                                                  args: &__args,
                                                  locals: &__locals)
        
        return Android.Widget.RecyclerView.Adapter(javaObject: __return)
    }
    
    @_versioned
    internal func setAdapter(_ adapter: AndroidWidgetRecyclerViewAdapter) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: adapter, locals: &__locals)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setAdapter",
                                 methodSig: "(Landroid/support/v7/widget/RecyclerView$Adapter;)V",
                                 methodCache: &RecyclerViewJNICache.MethodID.setAdapter,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    @_versioned
    internal func getLayoutManager() -> Android.Widget.RecyclerView.LayoutManager {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getLayoutManager",
                                                  methodSig: "()Landroid/support/v7/widget/RecyclerView$LayoutManager;",
                                                  methodCache: &RecyclerViewJNICache.MethodID.getLayoutManager,
                                                  args: &__args,
                                                  locals: &__locals)
        
        return Android.Widget.RecyclerView.LayoutManager(javaObject: __return)
    }
    
    @_versioned
    internal func setLayoutManager(_ layoutManager: Android.Widget.RecyclerView.LayoutManager) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: layoutManager, locals: &__locals)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setLayoutManager",
                                 methodSig: "(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V",
                                 methodCache: &RecyclerViewJNICache.MethodID.setLayoutManager,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func addItemDecoration(_ decor: Android.Widget.RecyclerView.ItemDecoration) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: decor, locals: &__locals)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "addItemDecoration",
                                 methodSig: "(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V",
                                 methodCache: &RecyclerViewJNICache.MethodID.addItemDecoration1,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func addItemDecoration(_ decor: Android.Widget.RecyclerView.ItemDecoration, index: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: decor, locals: &__locals)
        __args[1] = jvalue(i: jint(index))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "addItemDecoration",
                                 methodSig: "(Landroid/support/v7/widget/RecyclerView$ItemDecoration;I)V",
                                 methodCache: &RecyclerViewJNICache.MethodID.addItemDecoration2,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func removeItemDecoration(_ decor: Android.Widget.RecyclerView.ItemDecoration) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        __args[0] = JNIType.toJava(value: decor, locals: &__locals)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "removeItemDecoration",
                                 methodSig: "(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V",
                                 methodCache: &RecyclerViewJNICache.MethodID.removeItemDecoration,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setNestedScrollingEnabled(_ enabled: Bool) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNestedScrollingEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setNestedScrollingEnabled,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidWidgetRecyclerView {
    
    /// JNI Cache
    struct RecyclerViewJNICache {
        
        static let classSignature = SupportV7.Widget.className(["RecyclerView"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var getAdapter: jmethodID?
            static var setAdapter: jmethodID?
            static var getLayoutManager: jmethodID?
            static var setLayoutManager: jmethodID?
            static var setItemAnimator: jmethodID?
            static var addItemDecoration1: jmethodID?
            static var addItemDecoration2: jmethodID?
            static var setHasFixedSize: jmethodID?
            static var setNestedScrollingEnabled: jmethodID?
            static var setOnFlingListener: jmethodID?
            static var removeItemDecoration: jmethodID?
        }
    }
}
