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

/**
 * An activity is a single, focused thing that the user can do. Almost all activities interact with the user,
 * so the Activity class takes care of creating a window for you in which you can place your UI with setContentView(View).
 * While activities are often presented to the user as full-screen windows, they can also be used in other ways: as
 * floating windows (via a theme with R.attr.windowIsFloating set) or embedded inside of another activity (using ActivityGroup).
 * There are two methods almost all subclasses of Activity will implement:
 *
 * - onCreate(Bundle) is where you initialize your activity. Most importantly, here you will usually call setContentView(int) with
 * a layout resource defining your UI, and using findViewById(int) to retrieve the widgets in that UI that you need to interact with programmatically.
 *
 * - onPause() is where you deal with the user leaving your activity. Most importantly, any changes made by the user should at
 * this point be committed (usually to the ContentProvider holding the data).
 *
 * To be of use with Context.startActivity(), all activity classes must have a corresponding <activity> declaration in their package's AndroidManifest.xml.
 */
open class SwiftSupportAppCompatActivity: AndroidContextWrapper {
    
    @_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_bind")
    public static func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?) -> jlong? {
        
        #if os(Android)
        // Ask app for main activity type.
        let objectType = SwiftAndroidMainActivity()
        
        let swiftObject = objectType.init(javaObject: __this)
        
        //var locals = [jobject]()
        //return swiftObject.localJavaObject( &locals )
        return swiftObject.swiftValue().j
        #else
        fatalError("Can only run on Android OS")
        #endif
    }
    
    // MARK: - Listener
    
    open func onCreate(savedInstanceState: Android.OS.Bundle?) {
    
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onStart(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onResume(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onPause(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onRestart(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onStop(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onDestroy(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onActivityResult(requestCode: Int, resultCode: Int, data: Android.Content.Intent?) {
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onRequestPermissionsResult(requestCode: Int, permissions: [String], grantResults: [Int]) {
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    // MARK: - Responder
    /*
    public func registerReceiver(receiver: Android.Content.BroadcastReceiver, filter: Android.Content.IntentFilter) -> Android.Content.Intent? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2)
        
        __args[0] = JNIType.toJava( value: receiver, locals: &__locals )
        __args[1] = JNIType.toJava( value: filter, locals: &__locals )
        
        var intent: Android.Content.Intent?
        
        withJavaObject {
            
            var __return = JNIMethod.CallObjectMethod(object: $0,
                                                      methodName: "registerReceiver",
                                                      methodSig: "(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;",
                                                      methodCache: &SwiftActivityJNICache.MethodID.registerReceiver,
                                                      args: &__args,
                                                      locals: &__locals)
            defer {
                JNI.DeleteLocalRef(__return)
            }
            
            intent = Android.Content.Intent(javaObject: __return)
        }
        return intent
    }
    
    public func unregisterReceiver(receiver: Android.Content.BroadcastReceiver){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: receiver, locals: &__locals )
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "unregisterReceiver",
                                     methodSig: "(Landroid/content/BroadcastReceiver;)V",
                                     methodCache: &SwiftActivityJNICache.MethodID.unregisterReceiver,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    */
    public func checkSelfPermission(permission: String)-> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: permission, locals: &__locals )
        
        var result: Int?
        
        withJavaObject {
            
            let __return = JNIMethod.CallIntMethod(object: $0,
                                     methodName: "checkSelfPermission",
                                     methodSig: "(Ljava/lang/String;)I",
                                     methodCache: &SwiftActivityJNICache.MethodID.checkSelfPermission,
                                     args: &__args,
                                     locals: &__locals)
            
            result = Int(__return)
        }
        
        return result!
    }
    
    public func startActivity(intent: Android.Content.Intent){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: intent, locals: &__locals )
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "startActivity",
                                     methodSig: "(Landroid/content/Intent;)V",
                                     methodCache: &SwiftActivityJNICache.MethodID.startActivity,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    
    public func startActivityForResult(intent: Android.Content.Intent, requestCode: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2)
        
        __args[0] = JNIType.toJava( value: intent, locals: &__locals )
        __args[1] = jvalue(i: jint(requestCode))
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "startActivityForResult",
                                     methodSig: "(Landroid/content/Intent;I)V",
                                     methodCache: &SwiftActivityJNICache.MethodID.startActivityForResult,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    
    public func requestPermissions(permissions: [String], requestCode: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2)
        
        __args[0] = JNIType.toJava( value: permissions, locals: &__locals )
        __args[1] = jvalue(i: jint(requestCode))
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "askPermissions",
                                     methodSig: "([Ljava/lang/String;I)V",
                                     methodCache: &SwiftActivityJNICache.MethodID.askPermissions,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    
    public func finish() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "finish",
                                     methodSig: "()V",
                                     methodCache: &SwiftActivityJNICache.MethodID.finish,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    
    public func isFinishing()-> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        var result: Bool?
        
        withJavaObject {
            
            let __return = JNIMethod.CallBooleanMethod(object: $0,
                                                   methodName: "isFinishing",
                                                   methodSig: "()Z",
                                                   methodCache: &SwiftActivityJNICache.MethodID.isFinishing,
                                                   args: &__args,
                                                   locals: &__locals)
            
            result = __return != jboolean(JNI_FALSE)
        }
        
        return result!
    }
    
    public func startService(service: Android.Content.Intent) -> JavaObject? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: service, locals: &__locals )
        
        var componentName: JavaObject?
        
        withJavaObject {
            
            var __return = JNIMethod.CallObjectMethod(object: $0,
                                                      methodName: "startService",
                                                      methodSig: "(Landroid/content/Intent;)Landroid/content/ComponentName;",
                                                      methodCache: &SwiftActivityJNICache.MethodID.startService,
                                                      args: &__args,
                                                      locals: &__locals)
            defer {
                JNI.DeleteLocalRef(__return)
            }
            
            componentName = JavaObject(javaObject: __return)
        }
        return componentName
    }
    
    public func stopService(name: Android.Content.Intent)-> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        var result: Bool?
        
        withJavaObject {
            
            let __return = JNIMethod.CallBooleanMethod(object: $0,
                                                       methodName: "stopService",
                                                       methodSig: "(Landroid/content/Intent;)Z",
                                                       methodCache: &SwiftActivityJNICache.MethodID.stopService,
                                                       args: &__args,
                                                       locals: &__locals)
            
            result = __return != jboolean(JNI_FALSE)
        }
        
        return result!
    }
    
    public func getIdentifier(name: String, type: String) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: name, locals: &__locals )
        __args[1] = JNIType.toJava( value: type, locals: &__locals )
        
        var result: Int?
        
        withJavaObject {
            
            let __return = JNIMethod.CallIntMethod(object: $0,
                                                   methodName: "getIdentifier",
                                                   methodSig: "(Ljava/lang/String;Ljava/lang/String;)I",
                                                   methodCache: &SwiftActivityJNICache.MethodID.getIdentifier,
                                                   args: &__args,
                                                   locals: &__locals)
            
            result = Int(__return)
        }
        
        return result!
    }
    
}

extension SwiftSupportAppCompatActivity: JNIListener { }

// MARK: - Constants

public extension SwiftSupportAppCompatActivity {
    
    public static var RESULT_OK: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "RESULT_OK",
                fieldType: "I",
                fieldCache: &ActivityJNICache.FieldID.RESULT_OK,
                className: ActivityJNICache.className,
                classCache: &ActivityJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var RESULT_FIRST_USER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "RESULT_FIRST_USER",
                fieldType: "I",
                fieldCache: &ActivityJNICache.FieldID.RESULT_FIRST_USER,
                className: ActivityJNICache.className,
                classCache: &ActivityJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var RESULT_CANCELED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "RESULT_CANCELED",
                fieldType: "I",
                fieldCache: &ActivityJNICache.FieldID.RESULT_CANCELED,
                className: ActivityJNICache.className,
                classCache: &ActivityJNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    
}

// MARK: - Private

fileprivate extension SwiftSupport.App.AppCompatActivity {
    
    /// JNI Cache
    struct ActivityJNICache {
        
        static let classSignature = Android.App.className(["Activity"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var RESULT_FIRST_USER: jfieldID?
            static var RESULT_OK: jfieldID?
            static var RESULT_CANCELED: jfieldID?
        }
    }
    
    /// JNI Cache
    struct SwiftActivityJNICache {
        
        static let classSignature = SwiftSupport.App.className(["SwiftAppCompatActivity"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var registerReceiver: jmethodID?
            static var unregisterReceiver: jmethodID?
            static var checkSelfPermission: jmethodID?
            static var startActivity: jmethodID?
            static var startActivityForResult: jmethodID?
            static var askPermissions: jmethodID?
            static var startService: jmethodID?
            static var stopService: jmethodID?
            static var finish: jmethodID?
            static var isFinishing: jmethodID?
            static var getIdentifier: jmethodID?
        }
    }
}

// MARK: - Native Methods

#if os(Android)
/// Needs to be implemented by app.
@_silgen_name("SwiftAndroidMainActivity")
internal func SwiftAndroidMainActivity() -> SwiftSupportAppCompatActivity.Type
#endif

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onCreateNative")
public func SwiftSupportAppCompatActivity_onCreate( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                         _ __this: jobject?,
                                                         _ __swiftObject: jlong,
                                                         _ __savedInstanceState: jobject?) -> () {
    
    let bundle = __savedInstanceState != nil ? Android.OS.Bundle(javaObject: __savedInstanceState) : nil
    
    let activity = SwiftSupportAppCompatActivity.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    activity?.onCreate(savedInstanceState: bundle)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onStartNative")
public func SwiftSupportAppCompatActivity_onStart( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                         _ __this: jobject?,
                                                         _ __swiftObject: jlong) -> () {

    let activity = SwiftSupportAppCompatActivity.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    activity?.onStart()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onResumeNative")
public func SwiftSupportAppCompatActivity_onResume( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                        _ __this: jobject?,
                                                        _ __swiftObject: jlong) -> () {
    
    let activity = SwiftSupportAppCompatActivity.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    activity?.onResume()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onPauseNative")
public func SwiftSupportAppCompatActivity_onPause( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                         _ __this: jobject?,
                                                         _ __swiftObject: jlong) -> () {
    
    let activity = SwiftSupportAppCompatActivity.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    activity?.onPause()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onRestartNative")
public func SwiftSupportAppCompatActivity_onRestart( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                         _ __this: jobject?,
                                                         _ __swiftObject: jlong) -> () {
    
    let activity = SwiftSupportAppCompatActivity.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    activity?.onRestart()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onStopNative")
public func SwiftSupportAppCompatActivity_onStop( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                          _ __this: jobject?,
                                                          _ __swiftObject: jlong) -> () {
    
    let activity = SwiftSupportAppCompatActivity.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    activity?.onStop()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onDestroyNative")
public func SwiftSupportAppCompatActivity_onDestroy( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                       _ __this: jobject?,
                                                       _ __swiftObject: jlong) -> () {
    
    let activity = SwiftSupportAppCompatActivity.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    activity?.onDestroy()
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_onActivityResultNative")
public func SwiftSupportAppCompatActivity_onActivityResultNative( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                          _ __this: jobject?,
                                                          _ __swiftObject: jlong,
                                                          _ __requestCode: jint,
                                                          _ __resultCode: jint,
                                                          _ __data: jobject?) -> () {
    
    let requestCode = Int(__requestCode)
    
    let resultCode = Int(__resultCode)
    
    let data = __data != nil ? Android.Content.Intent(javaObject: __data) : nil
    
    let activity = SwiftSupportAppCompatActivity.swiftObject(jniEnv: __env, javaObject: __this, swiftObject: __swiftObject)
    
    activity?.onActivityResult(requestCode: requestCode, resultCode: resultCode, data: data)
}

@_silgen_name("Java_org_pureswift_swiftandroidsupport_app_SwiftAppCompatActivity_finalizeNative")
public func SwiftSupportAppCompatActivity_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                           _ __this: jobject?,
                                                           _ __swiftObject: jlong) -> () {
    
    SwiftSupportAppCompatActivity.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
