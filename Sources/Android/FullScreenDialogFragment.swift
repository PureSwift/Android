//
//  FullScreenDialogFragment.swift
//  Android
//
//  Created by Marco Estrella on 8/1/18.
//

import Foundation
import java_swift
import JNI

public extension Android.App {
    
    public typealias FullScreenDialogFragment = AndroidFullScreenDialogFragment
}

open class AndroidFullScreenDialogFragment: JavaObject {
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        self.bindNewJavaObject()
    }
    
    /// Initialize a new Java instance and bind to this Swift object.
    public func bindNewJavaObject() {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: AndroidFullScreenDialogFragment.JNICache.className,
                                                          classObject: AndroidFullScreenDialogFragment.JNICache.jniClass,
                                                          methodSig: "()V",
                                                          methodCache: &AndroidFullScreenDialogFragment.JNICache.MethodID.newMethod,
                                                          args: &__args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
        
        guard self.javaObject != nil else { return }
        
        //Setting swift object
        
        var __locals = [jobject]()
        
        let existing: jlong = JNIField.GetLongField( fieldName: "__swiftObject",
                                                     fieldType: "J",
                                                     fieldCache: &AndroidFullScreenDialogFragment.JNICache.FieldID.swiftObject,
                                                     object: javaObject)
        
        JNIField.SetLongField( fieldName: "__swiftObject",
                               fieldType: "J",
                               fieldCache: &AndroidFullScreenDialogFragment.JNICache.FieldID.swiftObject,
                               object: javaObject,
                               value: self.swiftValue().j,
                               locals: &__locals)
        if existing != 0 {
            JNIReleasableProxy.canrelease( swiftObject: existing )
        }
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
    
    public var context: Android.Content.Context? {
        
        get {
            return getContext()
        }
    }
    
    // MARK: - Listener
    
    open func onCreate(savedInstanceState: Android.OS.Bundle?) {
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onCreateView(inflater: Android.View.LayoutInflater, container: Android.View.ViewGroup?, savedInstanceState: Android.OS.Bundle?) -> Android.View.View {
        
        NSLog("\(type(of: self)) \(#function)")
        
        fatalError("Must be implemented")
    }
    
    open func onViewCreated(view: Android.View.View, savedInstanceState: Android.OS.Bundle?) {
        
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
    
    open func onStop(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onDestroy(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onDestroyView(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
}

public extension AndroidFullScreenDialogFragment {
    
    // MARK: - Responder
    
    public func show(manager: JavaObject, tag: String)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: manager, locals: &__locals)
        __args[1] = JNIType.toJava(value: tag, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "show",
            methodSig: "(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V",
            methodCache: &JNICache.MethodID.show,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getContext() -> Android.Content.Context? {
        
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
        
        return __return != nil ? Android.Content.Context(javaObject: __return) : nil
    }
}

extension AndroidFullScreenDialogFragment: JNIListener { }

// MARK: - Private

fileprivate extension AndroidFullScreenDialogFragment {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.App.className(["SwiftFullScreenDialogFragment"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onCreateThunk: AndroidFullScreenDialogFragment_onCreateNative_type = AndroidFullScreenDialogFragment_onCreateNative
            
            natives.append( JNINativeMethod( name: strdup("onCreateNative"),
                                             signature: strdup("(JLandroid/os/Bundle;)V"),
                                             fnPtr: unsafeBitCast( onCreateThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let onCreateViewThunk: AndroidFullScreenDialogFragment_onCreateViewNative_type = AndroidFullScreenDialogFragment_onCreateViewNative
            
            natives.append( JNINativeMethod( name: strdup("onCreateViewNative"),
                                             signature: strdup("(JLandroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"),
                                             fnPtr: unsafeBitCast( onCreateViewThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let onViewCreatedThunk: AndroidFullScreenDialogFragment_onViewCreatedNative_type = AndroidFullScreenDialogFragment_onViewCreatedNative
            
            natives.append( JNINativeMethod( name: strdup("onViewCreatedNative"),
                                             signature: strdup("(JLandroid/view/View;Landroid/os/Bundle;)V"),
                                             fnPtr: unsafeBitCast( onViewCreatedThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let onStartThunk: AndroidFullScreenDialogFragment_onStart_type = AndroidFullScreenDialogFragment_onStart
            
            natives.append( JNINativeMethod( name: strdup("onStartNative"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( onStartThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let onResumeThunk: AndroidFullScreenDialogFragment_onResume_type = AndroidFullScreenDialogFragment_onResume
            
            natives.append( JNINativeMethod( name: strdup("onResumeNative"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( onResumeThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let onPauseThunk: AndroidFullScreenDialogFragment_onPause_type = AndroidFullScreenDialogFragment_onPause
            
            natives.append( JNINativeMethod( name: strdup("onPauseNative"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( onPauseThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let onStopThunk: AndroidFullScreenDialogFragment_onStop_type = AndroidFullScreenDialogFragment_onStop
            
            natives.append( JNINativeMethod( name: strdup("onStopNative"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( onStopThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let onDestroyThunk: AndroidFullScreenDialogFragment_onDestroy_type = AndroidFullScreenDialogFragment_onDestroy
            
            natives.append( JNINativeMethod( name: strdup("onDestroyNative"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( onDestroyThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let onDestroyViewThunk: AndroidFullScreenDialogFragment_onDestroyView_type = AndroidFullScreenDialogFragment_onDestroyView
            
            natives.append( JNINativeMethod( name: strdup("onDestroyViewNative"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( onDestroyViewThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let finalizeThunk: AndroidFullScreenDialogFragment_finalize_type = AndroidFullScreenDialogFragment_finalize
            
            natives.append( JNINativeMethod( name: strdup("finalizeNative"),
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
        
        struct FieldID {
            static var swiftObject: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var newMethod: jmethodID?
            static var show: jmethodID?
            static var getContext: jmethodID?
        }
    }
}

private typealias AndroidFullScreenDialogFragment_onCreateNative_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong,  _: jobject?) -> ()

public func AndroidFullScreenDialogFragment_onCreateNative( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ __savedInstanceState: jobject?) -> () {
    
    let bundle = __savedInstanceState != nil ? Android.OS.Bundle(javaObject: __savedInstanceState) : nil
    
    AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onCreate(savedInstanceState: bundle)
}

private typealias AndroidFullScreenDialogFragment_onCreateViewNative_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong,  _: jobject,  _: jobject?,  _: jobject?) -> jobject?

public func AndroidFullScreenDialogFragment_onCreateViewNative( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                            _ __this: jobject?,
                                                            _ __swiftObject: jlong,
                                                            _ __inflater: jobject,
                                                            _ __container: jobject?,
                                                            _ __savedInstanceState: jobject?) -> jobject? {
    
    let inflater = Android.View.LayoutInflater.init(javaObject: __inflater)
    let container = __container != nil ? Android.View.ViewGroup.init(javaObject: __container) : nil
    let bundle = __savedInstanceState != nil ? Android.OS.Bundle(javaObject: __savedInstanceState) : nil
    
    let result = AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onCreateView(inflater: inflater, container: container, savedInstanceState: bundle)
    
    var __locals = [jobject]()
    
    return result?.localJavaObject(&__locals)
}

private typealias AndroidFullScreenDialogFragment_onViewCreatedNative_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong,  _: jobject?,  _: jobject?) -> ()

public func AndroidFullScreenDialogFragment_onViewCreatedNative( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ __view: jobject?,
                                                                 _ __savedInstanceState: jobject?) -> () {
    
    let view = Android.View.View(javaObject: __view)
    let bundle = __savedInstanceState != nil ? Android.OS.Bundle(javaObject: __savedInstanceState) : nil
    
    AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onViewCreated(view: view, savedInstanceState: bundle)
}

private typealias AndroidFullScreenDialogFragment_onStart_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidFullScreenDialogFragment_onStart( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                      _ __this: jobject?,
                                                      _ __swiftObject: jlong) -> () {
    
    AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onStart()
}

private typealias AndroidFullScreenDialogFragment_onResume_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidFullScreenDialogFragment_onResume( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                     _ __this: jobject?,
                                                     _ __swiftObject: jlong) -> () {
    
    AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onResume()
}

private typealias AndroidFullScreenDialogFragment_onPause_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidFullScreenDialogFragment_onPause( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                    _ __this: jobject?,
                                                    _ __swiftObject: jlong) -> () {
    
    AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onPause()
}

private typealias AndroidFullScreenDialogFragment_onStop_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidFullScreenDialogFragment_onStop( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                       _ __this: jobject?,
                                                       _ __swiftObject: jlong) -> () {
    
    AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onStop()
}

private typealias AndroidFullScreenDialogFragment_onDestroy_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidFullScreenDialogFragment_onDestroy( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                           _ __this: jobject?,
                                                           _ __swiftObject: jlong) -> () {
    
    AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onDestroy()
}

private typealias AndroidFullScreenDialogFragment_onDestroyView_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidFullScreenDialogFragment_onDestroyView( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                       _ __this: jobject?,
                                                       _ __swiftObject: jlong) -> () {
    
    AndroidFullScreenDialogFragment.swiftObject(from: __swiftObject)?.onDestroyView()
}

private typealias AndroidFullScreenDialogFragment_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidFullScreenDialogFragment_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                _ __this: jobject?,
                                                _ __swiftObject: jlong) -> () {
    
    AndroidFullScreenDialogFragment.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
