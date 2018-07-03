//
//  RecyclerViewViewHolder.swift
//  Android
//
//  Created by Marco Estrella on 7/2/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias RecyclerViewViewHolder = AndroidWidgetRecyclerViewViewHolder
}

open class AndroidWidgetRecyclerViewViewHolder: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init(itemView: Android.View.View) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: itemView, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/view/View;)V",
            methodCache: &JNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var adapterPosition: Int {
        
        @inline(__always)
        get { return obtainAdapterPosition() }
    }
    
    public var itemViewType: Int {
        
        @inline(__always)
        get { return obtainItemViewType() }
    }
    
    public var layoutPosition: Int {
        
        @inline(__always)
        get { return obtainLayoutPosition() }
    }
    
    public var oldPosition: Int {
        
        @inline(__always)
        get { return obtainOldPosition() }
    }
    
    public var itemId: Int64 {
        
        @inline(__always)
        get { return obtainItemId() }
    }
    
    public var isRecyclable: Bool {
        
        @inline(__always)
        get { return itemIsRecyclable() }
    }
    
    @_versioned
    internal func obtainAdapterPosition() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "obtainAdapterPosition",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.obtainAdapterPosition,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func obtainItemViewType() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "obtainItemViewType",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.obtainItemViewType,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func obtainLayoutPosition() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "obtainLayoutPosition",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.obtainLayoutPosition,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func obtainOldPosition() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "obtainOldPosition",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.obtainOldPosition,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int(__return)
    }
    
    @_versioned
    internal func obtainItemId() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallLongMethod(object: javaObject,
                                               methodName: "obtainItemId",
                                               methodSig: "()J",
                                               methodCache: &JNICache.MethodID.obtainItemId,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int64(__return)
    }
    
    @_versioned
    internal func itemIsRecyclable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                methodName: "itemIsRecyclable",
                                                methodSig: "()Z",
                                                methodCache: &JNICache.MethodID.itemIsRecyclable,
                                                args: &__args,
                                                locals: &__locals)
        
        return jboolean(__return) != JNI_FALSE
    }
    
    public func putIsRecyclable(recyclable: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = jvalue(z: jboolean(recyclable ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                       methodName: "putIsRecyclable",
                                       methodSig: "(Z)V",
                                       methodCache: &JNICache.MethodID.putIsRecyclable,
                                       args: &__args,
                                       locals: &__locals)
    }
}

internal extension AndroidWidgetRecyclerViewViewHolder {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.RecyclerView.className(["SwiftRecyclerViewViewHolder"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var obtainAdapterPosition: jmethodID?
            static var obtainItemId: jmethodID?
            static var obtainItemViewType: jmethodID?
            static var obtainLayoutPosition: jmethodID?
            static var obtainOldPosition: jmethodID?
            static var itemIsRecyclable: jmethodID?
            static var putIsRecyclable: jmethodID?
        }
    }
}
