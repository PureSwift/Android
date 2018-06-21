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

public protocol SwiftSupportAppCompatActivity: JavaProtocol {
    
    func onCreate(savedInstanceState: Android.OS.Bundle)
    
    func onResume()
    
    func onPause()
    
    func onRequestPermissionsResult(requestCode: Int, permissions: [String], grantResults: [Int])
}

// MARK: - Local Java Object

extension SwiftSupportAppCompatActivity {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return SwiftSupportAppCompatActivityLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal class SwiftSupportAppCompatActivityLocal: JNILocalProxy<SwiftSupportAppCompatActivity, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
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

// MARK: - JNI Cache

internal extension SwiftSupportAppCompatActivityLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.App.className(["SwiftAppCompatActivity"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Method cache
        fileprivate enum Method {
            
            /*
            enum onCreate: JNINativeMethodEntry {
                
                static let name = "__onCreate"
                
                /// "(J)I"
                static let signature = JNIMethodSignature(argumentTypes: [.long], returnType: .int)
                
                static let thunk: SwiftSupportAppCompatActivity_onCreate_type = SwiftSupportAppCompatActivity_onCreate
            }*/
        }
    }
}

// MARK: - Native Methods

private typealias SwiftSupportAppCompatActivityLocal_onCreate_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jobject?) -> ()

private func SwiftSupportAppCompatActivityLocal_onCreate( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                 _ __this: jobject?,
                                                 _ __savedInstanceState: jobject?) -> () {
    
    let bundle = Android.OS.Bundle(javaObject: __savedInstanceState)
    /*
    SwiftSupportAppCompatActivityLocal
        .takeOwnership()
        .*/
}
