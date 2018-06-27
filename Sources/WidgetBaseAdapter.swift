//
//  WidgetBaseAdapter.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias BaseAdapter = AndroidWidgetBaseAdapter
}

open class AndroidWidgetBaseAdapter: JavaObject {
    
    // MARK: - Initialization
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        
        var locals = [jobject]()
        
        var methodID: jmethodID?
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: AndroidWidgetBaseAdapter.JNICache.className,
                                                          classObject: AndroidWidgetBaseAdapter.JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &methodID,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object
        
        JNI.DeleteLocalRef( __object ) // delete local ref
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
    
    // MARK: - Responder
    
    open func notifyDataSetChanged() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "notifyDataSetChanged",
                                     methodSig: "()V",
                                     methodCache: &Android.Widget.BaseAdapter.JNICache.MethodID.notifyDataSetChanged,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    
    // MARK: - Listener
    
    open func getCount() -> Int { return 0 }
    
    open func getView(position: Int, convertView: Android.View.View?, parent: Android.View.ViewGroup) -> Android.View.View {
        
        fatalError("\(#function) must be implemented in subclass")
    }
}

extension AndroidWidgetBaseAdapter: JNIListener { }

// MARK: - Private

fileprivate extension Android.Widget.BaseAdapter {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["SwiftBaseAdapter"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let getCountThunk: AndroidWidgetBaseAdapter_getCount_type = AndroidWidgetBaseAdapter_getCount
            
            natives.append( JNINativeMethod(name: strdup("__getCount"),
                                            signature: strdup("(J)I"),
                                            fnPtr: unsafeBitCast( getCountThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let getViewThunk: AndroidWidgetBaseAdapter_getView_type = AndroidWidgetBaseAdapter_getView
            
            natives.append( JNINativeMethod(name: strdup("__getView"),
                                            signature: strdup("(JILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;"),
                                            fnPtr: unsafeBitCast( getViewThunk, to: UnsafeMutableRawPointer.self ) ))
            
            natives.append( JNINativeMethod( name: strdup("__finalize"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( JNIReleasableProxy__finalize_thunk, to: UnsafeMutableRawPointer.self ) ) )
            
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

private typealias AndroidWidgetBaseAdapter_getCount_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> (jint)

private func AndroidWidgetBaseAdapter_getCount( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                            _ __this: jobject?,
                                            _ __swiftObject: jlong) -> jint {
    
    let result = AndroidWidgetBaseAdapter
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )?
        .getCount() ?? 0
    
    return jint(result)
}

private typealias AndroidWidgetBaseAdapter_getView_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint, _: jobject?, _: jobject?) -> jobject?

private func AndroidWidgetBaseAdapter_getView( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                           _ __this: jobject?,
                                           _ __swiftObject: jlong,
                                           _ __position: jint,
                                           _ __convertView: jobject?,
                                           _ __parent: jobject?) -> jobject? {
    
    let convertView = __convertView != nil ? Android.View.View(javaObject: __convertView) : nil
    
    let parentView = Android.View.ViewGroup(javaObject: __parent)
    
    let result = AndroidWidgetBaseAdapter
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )?
        .getView(position: Int(__position), convertView: convertView, parent: parentView)
    
    var __locals = [jobject]()
    
    return result?.localJavaObject(&__locals)
}
