//
//  WidgetTabLayoutOnTabSelectedListener.swift
//  Android
//
//  Created by Marco Estrella on 10/18/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidTabLayout {
    
    public typealias OnTabSelectedListener = AndroidOnTabSelectedListener
}

open class AndroidOnTabSelectedListener: JavaObject {
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        self.bindNewJavaObject()
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
    
    // Initialize a new Java instance and bind to this Swift object.
    public func bindNewJavaObject() {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: JNICache.className,
                                                          classObject: JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &JNICache.MethodID.newMethod,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    /// Called when a tab that is already selected is chosen again by the user.
    open func onTabReselected(tab: AndroidTab) {
        
    }
    
    /// Called when a tab enters the selected state.
    open func onTabSelected(tab: AndroidTab) {
        
    }
    
    /// Called when a tab exits the selected state.
    open func onTabUnselected(tab: AndroidTab) {
        
    }
}

extension AndroidOnTabSelectedListener: JNIListener { }

// MARK: - Private

internal extension AndroidOnTabSelectedListener {
    
    /// JNI Cache
    internal struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["TabLayoutOnTabSelectedListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onTabReselectedThunk: AndroidSwipeRefreshLayoutOnRefreshListener_onTabReselected_type = AndroidOnTabSelectedListener_onTabReselected
            natives.append( JNINativeMethod(name: strdup("__onTabReselected"),
                                            signature: strdup("(JL\(AndroidTab.JNICacheTab.className);)V"),
                                            fnPtr: unsafeBitCast( onTabReselectedThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let onTabUnselectedThunk: AndroidSwipeRefreshLayoutOnRefreshListener_onTabUnselected_type = AndroidOnTabSelectedListener_onTabUnselected
            natives.append( JNINativeMethod(name: strdup("__onTabUnselected"),
                                            signature: strdup("(JL\(AndroidTab.JNICacheTab.className);)V"),
                                            fnPtr: unsafeBitCast( onTabUnselectedThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let onTabSelectedThunk: AndroidSwipeRefreshLayoutOnRefreshListener_onTabSelected_type = AndroidOnTabSelectedListener_onTabSelected
            natives.append( JNINativeMethod(name: strdup("__onTabSelected"),
                                            signature: strdup("(JL\(AndroidTab.JNICacheTab.className);)V"),
                                            fnPtr: unsafeBitCast( onTabSelectedThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidOnTabSelectedListener_finalize_type = AndroidOnTabSelectedListener_finalize
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
            
            static var newMethod: jmethodID?
        }
    }
}

private typealias AndroidSwipeRefreshLayoutOnRefreshListener_onTabReselected_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> ()
public func AndroidOnTabSelectedListener_onTabReselected( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                   _ __this: jobject?,
                                                                   _ __swiftObject: jlong,
                                                                   _ __tab: jobject?) -> () {
    let tab = AndroidTab.init(javaObject: __tab)
    
    AndroidOnTabSelectedListener
        .swiftObject(from: __swiftObject)?
        .onTabReselected(tab: tab)
}

private typealias AndroidSwipeRefreshLayoutOnRefreshListener_onTabUnselected_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> ()
public func AndroidOnTabSelectedListener_onTabUnselected( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                           _ __this: jobject?,
                                                           _ __swiftObject: jlong,
                                                           _ __tab: jobject?) -> () {
    let tab = AndroidTab.init(javaObject: __tab)
    
    AndroidOnTabSelectedListener
        .swiftObject(from: __swiftObject)?
        .onTabUnselected(tab: tab)
}

private typealias AndroidSwipeRefreshLayoutOnRefreshListener_onTabSelected_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> ()
public func AndroidOnTabSelectedListener_onTabSelected( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                           _ __this: jobject?,
                                                           _ __swiftObject: jlong,
                                                           _ __tab: jobject?) -> () {
    let tab = AndroidTab.init(javaObject: __tab)
    
    AndroidOnTabSelectedListener
        .swiftObject(from: __swiftObject)?
        .onTabSelected(tab: tab)
}

private typealias AndroidOnTabSelectedListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()
public func AndroidOnTabSelectedListener_finalize( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                  _ __this: jobject?,
                                                                  _ __swiftObject: jlong) -> () {
    
    AndroidOnTabSelectedListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}


