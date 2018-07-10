//
//  Application.swift
//  Android
//
//  Created by Marco Estrella on 6/27/18.
//

import Foundation
import java_swift
import JNI

public extension SwiftSupport.App {
    
    public typealias Application = SwiftApplication
}

open class SwiftApplication: JavaObject {
    
    @_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_bind")
    public static func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?) -> jlong? {
        
        #if os(Android)
        // Ask app for main activity type.
        let objectType = SwiftAndroidMainApplication()
        
        let swiftObject = objectType.init(javaObject: __this)
        
        //var locals = [jobject]()
        //return swiftObject.localJavaObject( &locals )
        return swiftObject.swiftValue().j
        #else
        fatalError("Can only run on Android OS")
        #endif
    }
    
    open func onConfigurationChanged(newConfig: JavaObject?) {
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onCreate(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onLowMemory(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onTerminate(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onTrimMemory(level: Int){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func registerActivityLifecycleCallbacks(callback: JavaObject?) {
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func unregisterActivityLifecycleCallbacks(callback: JavaObject?) {
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func registerComponentCallbacks(callback: JavaObject?) {
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func unregisterComponentCallbacks(callback: JavaObject?){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func registerOnProvideAssistDataListener(callback: JavaObject?){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func unregisterOnProvideAssistDataListener(callback: JavaObject?){
        
        NSLog("\(type(of: self)) \(#function)")
    }
}

extension SwiftApplication: JNIListener { }

// MARK: - Native Functions

#if os(Android)
/// Needs to be implemented by app.
@_silgen_name("SwiftAndroidMainApplication")
internal func SwiftAndroidMainApplication() -> SwiftApplication.Type
#endif

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_onConfigurationChangedNative")
public func SwiftApplication_onConfigurationChanged( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                         _ __this: jobject?,
                                                         _ __swiftObject: jlong,
                                                         _ __newConfig: jobject?) -> () {
    
    let newConfig = __newConfig != nil ? JavaObject(javaObject: __newConfig) : nil
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.onConfigurationChanged(newConfig: newConfig)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_onCreateNative")
public func SwiftApplication_onCreate( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                       _ __this: jobject?,
                                       _ __swiftObject: jlong) -> () {
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.onCreate()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_onLowMemoryNative")
public func SwiftApplication_onLowMemory( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                       _ __this: jobject?,
                                       _ __swiftObject: jlong) -> () {
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.onLowMemory()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_onTerminateNative")
public func SwiftApplication_onTerminate( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                          _ __this: jobject?,
                                          _ __swiftObject: jlong) -> () {
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.onTerminate()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_onTrimMemoryNative")
public func SwiftApplication_onTrimMemory( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                          _ __this: jobject?,
                                          _ __swiftObject: jlong,
                                          _ __level: jint) -> () {
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    let level = Int(__level)
    
    appication?.onTrimMemory(level: level)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_registerActivityLifecycleCallbacksNative")
public func SwiftApplication_registerActivityLifecycleCallbacks( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                           _ __this: jobject?,
                                           _ __swiftObject: jlong,
                                           _ __callback: jobject?) -> () {
    
    let callback = __callback != nil ? JavaObject(javaObject: __callback) : nil
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.registerActivityLifecycleCallbacks(callback: callback)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_unregisterActivityLifecycleCallbacksNative")
public func SwiftApplication_unregisterActivityLifecycleCallbacks( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ __callback: jobject?) -> () {
    
    let callback = __callback != nil ? JavaObject(javaObject: __callback) : nil
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.unregisterActivityLifecycleCallbacks(callback: callback)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_registerComponentCallbacksNative")
public func SwiftApplication_registerComponentCallbacks( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                         _ __this: jobject?,
                                                                         _ __swiftObject: jlong,
                                                                         _ __callback: jobject?) -> () {
    
    let callback = __callback != nil ? JavaObject(javaObject: __callback) : nil
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.registerComponentCallbacks(callback: callback)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_unregisterComponentCallbacksNative")
public func SwiftApplication_unregisterComponentCallbacks( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                               _ __this: jobject?,
                                                               _ __swiftObject: jlong,
                                                               _ __callback: jobject?) -> () {
    
    let callback = __callback != nil ? JavaObject(javaObject: __callback) : nil
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.unregisterComponentCallbacks(callback: callback)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_registerOnProvideAssistDataListenerNative")
public func SwiftApplication_registerOnProvideAssistDataListener( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ __callback: jobject?) -> () {
    
    let callback = __callback != nil ? JavaObject(javaObject: __callback) : nil
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.registerOnProvideAssistDataListener(callback: callback)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_unregisterOnProvideAssistDataListenerNative")
public func SwiftApplication_unregisterOnProvideAssistDataListener( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                  _ __this: jobject?,
                                                                  _ __swiftObject: jlong,
                                                                  _ __callback: jobject?) -> () {
    
    let callback = __callback != nil ? JavaObject(javaObject: __callback) : nil
    
    let appication = SwiftApplication.swiftObject(from: __swiftObject)
    
    appication?.unregisterOnProvideAssistDataListener(callback: callback)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftApplication_finalizeNative")
public func SwiftApplication_finalize( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                          _ __this: jobject?,
                                                          _ __swiftObject: jlong) -> () {
    
    SwiftApplication.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
