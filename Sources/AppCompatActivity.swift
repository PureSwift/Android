//
//  AppCompatActivity.swift
//  Android
//
//  Created by Marco Estrella on 6/18/18.
//

import Foundation
import java_swift
import JNI

public extension SwiftSupport.App {
    
    public typealias AppCompatActivity = SwiftSupportAppCompatActivity
}

public protocol SwiftSupportAppCompatActivity {
        
    func onCreate(savedInstanceState: Android.OS.Bundle?)
    
    func onResume()
    
    func onPause()
    
    func onRequestPermissionsResult(requestCode: Int, permissions: [String], grantResults: [Int])
}

// MARK: - Local Java Object

internal class SwiftSupportAppCompatActivityLocal: JNIObject {
    
    @_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_bind")
    public static func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?) -> jlong? {
        
        #if os(Android)
        // Ask app for main activity.
        let activity = SwiftAndroidMainActivity()
        
        let local = SwiftSupportAppCompatActivityLocal(activity: activity, javaObject: __this)
        
        // ARC +1
        return jlong(unsafeBitCast(Unmanaged.passRetained(local), to: uintptr_t.self))
        #else
        fatalError("Can only run on Android OS")
        #endif
    }
    
    private(set) var activity: SwiftSupportAppCompatActivity!
    
    private init(javaObject: jobject?, activity: SwiftSupportAppCompatActivity) {
        
        self.activity = activity
        super.init(javaObject: javaObject)
    }
    
    required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
        
        assertionFailure("Not designated initializer)")
    }
    
    static func swiftObject( jniEnv: UnsafeMutablePointer<JNIEnv?>?, javaObject: jobject?, swiftObject: jlong ) -> SwiftSupportAppCompatActivityLocal {
        
        return unsafeBitCast( recoverPointer( swiftObject ), to: SwiftSupportAppCompatActivityLocal.self )
    }
    
    deinit {
        
        // deallocated
        NSLog("\(SwiftSupportAppCompatActivityLocal.self) \(#function)")
    }
}

// MARK: - Native Methods

#if os(Android)
/// Needs to be implemented by app.
@_silgen_name("SwiftAndroidMainActivity")
internal func SwiftAndroidMainActivity() -> SwiftSupportAppCompatActivity
#endif

fileprivate func recoverPointer( _ swiftObject: jlong, _ file: StaticString = #file, _ line: Int = #line ) -> uintptr_t {
    #if os(Android)
    let swiftPointer = uintptr_t(swiftObject&0xffffffff)
    #else
    let swiftPointer = uintptr_t(swiftObject)
    #endif
    if swiftPointer == 0 {
        JNI.report( "WTF dude", file, line )
    }
    return swiftPointer
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onCreateNative")
public func SwiftSupportAppCompatActivityLocal_onCreate( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                         _ __this: jobject?,
                                                         _ __swiftObject: jlong,
                                                         _ __savedInstanceState: jobject?) -> () {
    
    NSLog("\(#function) \(__env) \(__this) \(__swiftObject) \(__savedInstanceState)")
    
    let bundle = __savedInstanceState != nil ? Android.OS.Bundle(javaObject: __savedInstanceState) : nil
    
    let local = SwiftSupportAppCompatActivityLocal.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    local.activity.onCreate(savedInstanceState: bundle)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_finalizeNative")
public func SwiftSupportAppCompatActivityLocal_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                           _ __this: jobject?,
                                                           _ __swiftObject: jlong) -> () {
    
    let local = SwiftSupportAppCompatActivityLocal.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    Unmanaged.passUnretained(local).release()
}
