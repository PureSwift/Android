//
//  ContentResResources.swift
//  Android
//
//  Created by Marco Estrella on 7/20/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Content.Res {
    
    public typealias Resources = AndroidContentResResources
}

public class AndroidContentResResources: JavaObject {
    
    // MARK: - Initialization
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
}

// MARK: - Methods

public extension AndroidContentResResources {
    
    public func getDisplayMetrics() -> Android.Util.DisplayMetrics? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getDisplayMetrics",
            methodSig: "()Landroid/util/DisplayMetrics;",
            methodCache: &JNICache.MethodID.getDisplayMetrics,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.Util.DisplayMetrics(javaObject: __return) : nil
    }
    
    public func getIdentifier(name: String, type: String, defPackage: String) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3)
        
        __args[0] = JNIType.toJava( value: name, locals: &__locals )
        __args[1] = JNIType.toJava( value: type, locals: &__locals )
        __args[2] = JNIType.toJava( value: defPackage, locals: &__locals )
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getIdentifier",
                                               methodSig: "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I",
                                               methodCache: &JNICache.MethodID.getIdentifier,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int(__return)
    }
}

// MARK: - JNICache

internal extension AndroidContentResResources {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Content.Res.className(["Resources"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var getString: jmethodID?
            static var getDisplayMetrics: jmethodID?
            static var getIdentifier: jmethodID?
        }
    }
}
