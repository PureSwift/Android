//
//  AndroidWidgetAdapter.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias Adapter = AndroidWidgetAdapter
}

public protocol AndroidWidgetAdapter: JavaProtocol {
    
    func getCount() -> Int
    
    func getView(position: Int, convertView: Android.View.View?, parent: Android.View.ViewGroup) -> Android.View.View
}

// MARK: - Private

private typealias AndroidWidgetAdapter_getCount_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> (jint)

private func AndroidWidgetAdapter_getCount( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                            _ __this: jobject?,
                                            _ __swiftObject: jlong) -> jint {
    
    let result = AndroidWidgetAdapterListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .getCount()
    
    return jint(result)
}

private typealias AndroidWidgetAdapter_getView_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint, _: jobject?, _: jobject?) -> jobject?

private func AndroidWidgetAdapter_getView( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                            _ __this: jobject?,
                                            _ __swiftObject: jlong,
                                            _ __position: jint,
                                            _ __convertView: jobject?,
                                            _ __parent: jobject?) -> jobject? {
    
    let convertView = __convertView != nil ? Android.View.View(javaObject: __convertView) : nil
    
    let parentView = Android.View.ViewGroup(javaObject: __parent)
    
    let result = AndroidWidgetAdapterListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .getView(position: Int(__position), convertView: convertView, parent: parentView)
    
    var __locals = [jobject]()
    
    return result.localJavaObject(&__locals)
}

internal class AndroidWidgetAdapterListenerLocal: JNILocalProxy<AndroidWidgetAdapter, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
            JNICache.Method.getCount.method,
            JNICache.Method.getView.method,
            .finalize
        ]
        
        let clazz = JNI.FindClass( proxyClassName() )
        
        withUnsafePointer(to: &natives[0]) {
            nativesPtr in
            if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, jint(natives.count) ) != jint(JNI_OK) {
                JNI.report( "Unable to register java natives" )
            }
        }
        
        defer { JNI.DeleteLocalRef( clazz ) }
        
        return JNI.api.NewGlobalRef( JNI.env, clazz )!
    }()
    
    override open class func proxyClassName() -> String { return JNICache.className }
    
    override open class func proxyClass() -> jclass? { return _proxyClass }
}

extension AndroidWidgetAdapter {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return AndroidWidgetAdapterListenerLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal extension AndroidWidgetAdapterListenerLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.SwiftSupport.className(["SwiftBaseAdapter"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Method cache
        fileprivate enum Method {
            
            enum getCount: JNINativeMethodEntry {
                
                static let name = "__get_count"
                
                /// "(J)I"
                static let signature = JNIMethodSignature(argumentTypes: [.long], returnType: .int)
                
                static let thunk: AndroidWidgetAdapter_getCount_type = AndroidWidgetAdapter_getCount
            }
            
            enum getView: JNINativeMethodEntry {
                
                static let name = "__get_view"
                
                /// "(JILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;"
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .int,
                        .object(Android.View.View.JNICache.classSignature),
                        .object(Android.View.ViewGroup.ViewGroupJNICache.classSignature)
                        ],
                    returnType: .object(Android.View.View.JNICache.classSignature)
                )
                
                static let thunk: AndroidWidgetAdapter_getView_type = AndroidWidgetAdapter_getView
            }
            
        }
    }
}
