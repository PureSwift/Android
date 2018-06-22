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
    
    init()
    
    func onCreate(savedInstanceState: Android.OS.Bundle?)
    
    func onResume()
    
    func onPause()
    
    func onRequestPermissionsResult(requestCode: Int, permissions: [String], grantResults: [Int])
}

public extension SwiftSupportAppCompatActivity {
    
    /// The activity type that gets initialized by Java.
    public static var activityType: SwiftSupportAppCompatActivity.Type {
        
        get { return _activityType }
        
        set { _activityType = newValue }
    }
}

private var _activityType: SwiftSupportAppCompatActivity.Type = MainActivity.self

internal final class MainActivity: SwiftSupportAppCompatActivity {
    
    init() {
        
    }
    
    func onCreate(savedInstanceState: Android.OS.Bundle?) {
        
        NSLog("Swift \(#function)")
    }
    
    func onResume() {
        
        NSLog("Swift \(#function)")
    }
    
    func onPause() {
        
        NSLog("Swift \(#function)")
    }
    
    func onRequestPermissionsResult(requestCode: Int, permissions: [String], grantResults: [Int]) {
        
        NSLog("Swift \(#function)")
    }
}

// MARK: - Local Java Object

internal class SwiftSupportAppCompatActivityLocal {
    
    @_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_bind")
    public static func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?) -> jlong? {
        
        let activity = _activityType.init()
        
        let local = SwiftSupportAppCompatActivityLocal(activity: activity, javaObject: __this)
        
        // ARC +1
        return jlong(unsafeBitCast(Unmanaged.passRetained(local), to: uintptr_t.self))
    }
    
    let activity: SwiftSupportAppCompatActivity
    
    let javaObject: jobject?
    
    private init(activity: SwiftSupportAppCompatActivity, javaObject: jobject?) {
        
        self.activity = activity
        self.javaObject = javaObject
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
                                                         _ __swiftObject: jlong?,
                                                         _ __savedInstanceState: jobject?) -> () {
    
    NSLog("\(#function) \(__env) \(__this) \(__swiftObject) \(__savedInstanceState)")
    
    var bundle: Android.OS.Bundle? = nil
    
    if(__savedInstanceState != nil){
        bundle = Android.OS.Bundle(javaObject: __savedInstanceState)
    }
    
    let local = SwiftSupportAppCompatActivityLocal.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject!)
    
    local.activity.onCreate(savedInstanceState: bundle)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_finalizeNative")
public func SwiftSupportAppCompatActivityLocal_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                           _ __this: jobject?,
                                                           _ __swiftObject: jlong) -> () {
    
    let local = SwiftSupportAppCompatActivityLocal.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    Unmanaged.passUnretained(local).release()
}
