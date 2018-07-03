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

public final class AndroidWidgetRecyclerView: JavaObject {
    
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
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidWidgetRecyclerView {
    
    public func getAdapter() -> AndroidWidgetRecyclerViewAdapter {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getAdapter",
                                                  methodSig: "()Lorg/pureswift/swiftandroidsupport/recyclerview/SwiftRecyclerViewAdapter;",
                                                  methodCache: &JNICache.MethodID.getAdapter,
                                                  args: &__args,
                                                  locals: &__locals)
        
        return Android.Widget.RecyclerViewAdapter(javaObject: __return)
    }
    
    public func setAdapter(_ adapter: AndroidWidgetRecyclerViewAdapter) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: adapter, locals: &__locals)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setAdapter",
                                 methodSig: "(Lorg/pureswift/swiftandroidsupport/recyclerview/SwiftRecyclerViewAdapter;)V",
                                 methodCache: &JNICache.MethodID.setAdapter,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    
}

internal extension AndroidWidgetRecyclerView {
    
    /// JNI Cache
    struct JNICache {
        
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
            static var setLayoutManager: jmethodID?
            static var setItemAnimator: jmethodID?
            static var addItemDecoration: jmethodID?
            static var setHasFixedSize: jmethodID?
            static var setNestedScrollingEnabled: jmethodID?
            static var setOnFlingListener: jmethodID?
        }
    }
}