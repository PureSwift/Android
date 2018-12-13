//
//  RecyclerViewViewHolder.swift
//  Android
//
//  Created by Marco Estrella on 7/2/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget.RecyclerView {
    
    public typealias ViewHolder = AndroidWidgetRecyclerViewViewHolder
}

/**
 * A ViewHolder describes an item view and metadata about its place within the RecyclerView.
 *
 * RecyclerView.Adapter implementations should subclass ViewHolder and add fields for caching potentially expensive findViewById(int) results.
 *
 * While RecyclerView.LayoutParams belong to the RecyclerView.LayoutManager, ViewHolders belong to the adapter. Adapters should feel free to
 * use their own custom ViewHolder implementations to store data that makes binding view contents easier. Implementations should assume that
 * individual item views will hold strong references to ViewHolder objects and that RecyclerView instances may hold strong references to extra off-screen item views for caching purposes.
 */
open class AndroidWidgetRecyclerViewViewHolder: JavaObject {
    
    public convenience init(itemView: Android.View.View) {
        
        self.init(javaObject: nil)
        self.bindNewJavaObject(itemView: itemView)
    }
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /// Initialize a new Java instance and bind to this Swift object.
    public func bindNewJavaObject(itemView: Android.View.View) {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var methodID: jmethodID?
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = self.swiftValue()
        __args[1] = JNIType.toJava(value: itemView, locals: &locals)
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: JNICache.className,
                                                          classObject: JNICache.jniClass,
                                                          methodSig: "(JLandroid/view/View;)V",
                                                          methodCache: &methodID,
                                                          args: &__args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
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
        
        return __return != jboolean(JNI_FALSE)
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

extension AndroidWidgetRecyclerViewViewHolder: JNIListener { }

// MARK: - Private

fileprivate extension AndroidWidgetRecyclerViewViewHolder {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.RecyclerView.className(["SwiftRecyclerViewViewHolder"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass? = {
            
            var natives = [JNINativeMethod]()
            
            let finalizeThunk: AndroidWidgetRecyclerViewViewHolder_finalize_type = AndroidWidgetRecyclerViewViewHolder_finalize
            
            natives.append( JNINativeMethod( name: strdup("__finalize"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( finalizeThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let clazz = JNI.FindClass( className )
            
            let nativesCount = jint(natives.count)
        withUnsafePointer(to: &natives[0]) { nativesPtr in
            if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, nativesCount ) != jint(JNI_OK) {
                JNI.report( "Unable to register java natives" )
            }
        }
            
            defer { JNI.DeleteLocalRef( clazz ) }
            
            return JNI.api.NewGlobalRef( JNI.env, clazz )!
        }()
        
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

private typealias AndroidWidgetRecyclerViewViewHolder_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidWidgetRecyclerViewViewHolder_finalize( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                        _ __this: jobject?,
                                                        _ __swiftObject: jlong) -> () {
    
    AndroidWidgetRecyclerViewViewHolder.release(swiftObject: __swiftObject )
}

