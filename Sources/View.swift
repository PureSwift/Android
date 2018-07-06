//
//  AndroidView.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View {
    
    public typealias View = AndroidView
}

/// `Android.View.View`
open class AndroidView: JavaObject {
    
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
    
    public var context: Android.Content.Context {
        
        get {
            return getContext()
        }
    }
    
    open func findViewById(_ id: Int) -> Android.View.View? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: id, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "findViewById",
            methodSig: "(I)Landroid/view/View;",
            methodCache: &JNICache.MethodID.findViewById,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.View.View(javaObject: __return) : nil
    }
    
    open func findViewWithTag(_ tag: JavaObject) -> Android.View.View? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: tag, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "findViewWithTag",
            methodSig: "(Ljava/lang/Object;)Landroid/view/View;",
            methodCache: &JNICache.MethodID.findViewWithTag,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.View.View(javaObject: __return) : nil
    }
}

// MARK: - Methods

public extension Android.View.View {
    
    @inline(__always)
    public func findViewById(_ id: Android.R.ID) -> Android.View.View? {
        
        return findViewById(id.rawValue)
    }
    
    private func setId(_ id: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: id, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setId,
            args: &__args,
            locals: &__locals )
    }
    
    private func getId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public var identifier: Int {
        
        get { return getId() }
        
        set { setId(newValue) }
    }
    
    private func getTag() -> JavaObject? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTag",
            methodSig: "()Ljava/lang/Object;",
            methodCache: &JNICache.MethodID.getTag,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? JavaObject(javaObject: __return) : nil
    }
    
    private func setTag(_ tag: JavaObject?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: tag, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTag",
            methodSig: "(Ljava/lang/Object;)V",
            methodCache: &JNICache.MethodID.setTag,
            args: &__args,
            locals: &__locals )
    }
    
    public var tag: JavaObject? {
        
        get { return getTag() }
        
        set { setTag(newValue) }
    }
    
    @inline(__always)
    internal func getContext() -> Android.Content.Context {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getContext",
            methodSig: "()Landroid/content/Context;",
            methodCache: &JNICache.MethodID.getContext,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Content.Context(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension Android.View.View {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["View"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var findViewById: jmethodID?
            static var findViewWithTag: jmethodID?
            static var setId: jmethodID?
            static var getId: jmethodID?
            static var getTag: jmethodID?
            static var setTag: jmethodID?
            static var getContext: jmethodID?
        }
    }
}
