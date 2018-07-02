//
//  RecyclerViewAdapter.swift
//  Android
//
//  Created by Marco Estrella on 7/2/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias RecyclerViewAdapter = AndroidWidgetRecyclerViewAdapter
}

open class AndroidWidgetRecyclerViewAdapter: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /// Create a Swift-owned Java Object.
    public convenience init(itemView: Android.View.View) {
        
        self.init(javaObject: nil)
        
        let hasOldJavaObject = javaObject != nil
        
        var locals = [jobject]()
        
        var methodID: jmethodID?
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: AndroidWidgetRecyclerViewAdapter.JNICache.className,
                                                          classObject: AndroidWidgetRecyclerViewAdapter.JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &methodID,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
    }
    
    open func onCreateViewHolder(parent: Android.View.ViewGroup, viewType: Int?) -> Android.Widget.RecyclerViewViewHolder {
        
        fatalError("\(#function) must be implemented in subclass")
    }
    
    open func getItemViewType(position: Int) -> Int {
        
        return 0
    }
    
    open func getItemCount() -> Int {
        
        fatalError("\(#function) must be implemented in subclass")
    }
    
    open func onBindViewHolder(holder: Android.Widget.RecyclerViewViewHolder, position: Int) {
        
        fatalError("\(#function) must be implemented in subclass")
    }
}

extension AndroidWidgetRecyclerViewAdapter: JNIListener { }

// MARK: - Private

fileprivate extension AndroidWidgetRecyclerViewAdapter {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["SwiftRecyclerViewAdapter"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onCreateViewHolder: AndroidWidgetRecyclerViewAdapter_onCreateViewHolder_type = AndroidWidgetRecyclerViewAdapter_onCreateViewHolder
            
            natives.append( JNINativeMethod(name: strdup("__onCreateViewHolder"),
                                            signature: strdup("(JLandroid/view/ViewGroup;I)Lorg/pureswift/swiftandroidsupport/recyclerview/SwiftRecyclerViewViewHolder;"),
                                            fnPtr: unsafeBitCast( onCreateViewHolder, to: UnsafeMutableRawPointer.self ) ))
            
            let getItemViewType: AndroidWidgetRecyclerViewAdapter_getItemViewType_type = AndroidWidgetRecyclerViewAdapter_getItemViewType
            
            natives.append( JNINativeMethod(name: strdup("__getItemViewType"),
                                            signature: strdup("(JI)I"),
                                            fnPtr: unsafeBitCast( getItemViewType, to: UnsafeMutableRawPointer.self ) ))
            
            let getItemCount: AndroidWidgetRecyclerViewAdapter_getItemCount_type = AndroidWidgetRecyclerViewAdapter_getItemCount
            
            natives.append( JNINativeMethod(name: strdup("__getItemCount"),
                                            signature: strdup("(J)I"),
                                            fnPtr: unsafeBitCast( getItemCount, to: UnsafeMutableRawPointer.self ) ))
            
            let onBindViewHolder: AndroidWidgetRecyclerViewAdapter_onBindViewHolder_type = AndroidWidgetRecyclerViewAdapter_onBindViewHolder
            
            natives.append( JNINativeMethod(name: strdup("__onBindViewHolder"),
                                            signature: strdup("(Lorg/pureswift/swiftandroidsupport/recyclerview/SwiftRecyclerViewViewHolder;I)V"),
                                            fnPtr: unsafeBitCast( onBindViewHolder, to: UnsafeMutableRawPointer.self ) ))
            
            
            let finalizeThunk: AndroidWidgetRecyclerViewAdapter_finalize_type = AndroidWidgetRecyclerViewAdapter_finalize
            
            natives.append( JNINativeMethod( name: strdup("__finalize"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( finalizeThunk, to: UnsafeMutableRawPointer.self ) ) )
 
            let clazz = JNI.FindClass( className )
            
            withUnsafePointer(to: &natives[0]) {
                nativesPtr in
                if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, jint(natives.count) ) != jint(JNI_OK) {
                    JNI.report( "Unable to register java natives" )
                }
            }
            
            defer { JNI.DeleteLocalRef( clazz ) }
            
            return JNI.api.NewGlobalRef( JNI.env, clazz )!
        }()
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var notifyDataSetChanged: jmethodID?
        }
    }
}

private typealias AndroidWidgetRecyclerViewAdapter_onCreateViewHolder_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> jobject?

private func AndroidWidgetRecyclerViewAdapter_onCreateViewHolder( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                _ __this: jobject?,
                                                _ __swiftObject: jlong,
                                                _ __parent: jobject?,
                                                _ __viewType: jint) -> jobject? {
    
    let parent = Android.View.ViewGroup(javaObject: __parent)
    let viewType = Int(__viewType)
    
    let result = AndroidWidgetRecyclerViewAdapter
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )?
        .onCreateViewHolder(parent: parent, viewType: viewType)
    
    var __locals = [jobject]()
    
    return result?.localJavaObject(&__locals)
}

private typealias AndroidWidgetRecyclerViewAdapter_getItemViewType_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint) -> jint

private func AndroidWidgetRecyclerViewAdapter_getItemViewType( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                  _ __this: jobject?,
                                                                  _ __swiftObject: jlong,
                                                                  _ __position: jint) -> jint {
    
    let position = Int(__position)
    
    let result = AndroidWidgetRecyclerViewAdapter
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )?
        .getItemViewType(position: position)
    
    return result != nil ? jint(result!) : 0
}

private typealias AndroidWidgetRecyclerViewAdapter_getItemCount_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> jint

private func AndroidWidgetRecyclerViewAdapter_getItemCount( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                               _ __this: jobject?,
                                                               _ __swiftObject: jlong) -> jint {
    
    let result = AndroidWidgetRecyclerViewAdapter
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )?
        .getItemCount()
    
    return result != nil ? jint(result!) : 0
}

private typealias AndroidWidgetRecyclerViewAdapter_onBindViewHolder_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

private func AndroidWidgetRecyclerViewAdapter_onBindViewHolder( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                  _ __this: jobject?,
                                                                  _ __swiftObject: jlong,
                                                                  _ __holder: jobject?,
                                                                  _ __position: jint) -> () {
    
    let holder = Android.Widget.RecyclerViewViewHolder(javaObject: __holder)
    let position = Int(__position)
    
    AndroidWidgetRecyclerViewAdapter
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )?
        .onBindViewHolder(holder: holder, position: position)
}

private typealias AndroidWidgetRecyclerViewAdapter_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidWidgetRecyclerViewAdapter_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                _ __this: jobject?,
                                                _ __swiftObject: jlong) -> () {
    
    AndroidWidgetRecyclerViewAdapter.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
