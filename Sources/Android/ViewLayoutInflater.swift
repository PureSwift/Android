//
//  AndroidLayoutInflater.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_swift

public extension Android.View {
    
    public typealias LayoutInflater = AndroidLayoutInflater
}

public final class AndroidLayoutInflater: JavaObject {
    
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
}

// MARK: - Methods

extension Android.View.LayoutInflater {
    
    /// Inflate a new view hierarchy from the specified xml resource.
    public func inflate(resource: Android.R.Layout, root: Android.View.ViewGroup? = nil) -> Android.View.View {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: resource.rawValue, locals: &__locals)
        __args[1] = JNIType.toJava(value: root, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "inflate",
            methodSig: "(ILandroid/view/ViewGroup;)Landroid/view/View;",
            methodCache: &JNICache.MethodID.inflate0,
            args: &__args,
            locals: &__locals )
        
        guard __return != nil
            else { fatalError("Could not deflate \(resource)") }
        
        return Android.View.View(javaObject: __return)
    }
    
    /// Inflate a new view hierarchy from the specified xml resource.
    public func inflate(resource: Android.R.Layout, root: Android.View.ViewGroup? = nil, attachToRoot: Bool? = nil) -> Android.View.View {
        
        let attachToRoot = attachToRoot ?? (root != nil)
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: resource.rawValue, locals: &__locals)
        __args[1] = JNIType.toJava(value: root, locals: &__locals)
        __args[2] = JNIType.toJava(value: attachToRoot, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "inflate",
            methodSig: "(ILandroid/view/ViewGroup;Z)Landroid/view/View;",
            methodCache: &JNICache.MethodID.inflate1,
            args: &__args,
            locals: &__locals )
        
        guard __return != nil
            else { fatalError("Could not deflate \(resource)") }
        
        return Android.View.View(javaObject: __return)
    }
    
    /// Obtains the LayoutInflater from the given context.
    public static func from(context: Android.Content.Context) -> Android.View.LayoutInflater {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "from",
                                                        methodSig: "(Landroid/content/Context;)Landroid/view/LayoutInflater;",
                                                        methodCache: &JNICache.MethodID.from,
                                                        args: &__args,
                                                        locals: &__locals)
        return Android.View.LayoutInflater(javaObject: __return)
    }
}

// MARK: - Android.Content.Context.SystemService

extension Android.View.LayoutInflater: Android.Content.Context.SystemService {
    
    public static var systemServiceName: Android.Content.Context.SystemService.Name { return .layoutInflater }
}

// MARK: - Private

fileprivate extension Android.View.LayoutInflater {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/view/LayoutInflater"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var inflate0: jmethodID?
            static var inflate1: jmethodID?
            static var from: jmethodID?
            
        }
    }
}
