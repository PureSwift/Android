//
//  RecyclerViewLinearLayoutManager.swift
//  Android
//
//  Created by Marco Estrella on 7/3/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget.RecyclerView {
    
    public typealias LinearLayoutManager = AndroidWidgetRecyclerViewLinearLayoutManager
}

public final class AndroidWidgetRecyclerViewLinearLayoutManager: AndroidWidgetRecyclerViewLayoutManager {
    
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
            className: LinearLMJNICache.className,
            classCache: &LinearLMJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &LinearLMJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, orientation: Int, reverseLayout: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(orientation))
        __args[2] = jvalue(z: jboolean(reverseLayout ? JNI_TRUE : JNI_FALSE) )
        
        let __object = JNIMethod.NewObject(
            className: LinearLMJNICache.className,
            classCache: &LinearLMJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &LinearLMJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

internal extension AndroidWidgetRecyclerViewLinearLayoutManager {
    
    /// JNI Cache
    struct LinearLMJNICache {
        
        static let classSignature = SupportV7.Widget.className(["LinearLayoutManager"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
        }
    }
}
