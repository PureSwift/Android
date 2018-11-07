//
//  OsBundle.swift
//  Android
//
//  Created by Marco Estrella on 6/21/18.
//

import Foundation
import java_swift
import java_util

public extension Android.OS {
    
    public typealias Bundle = AndroidBundle
}

public final class AndroidBundle: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init() {
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject( className: JNICache.className,
                                            classCache: &JNICache.jniClass,
                                            methodSig: "()V",
                                            methodCache: &JNICache.MethodID.init_Method,
                                            args: &__args, locals: &__locals )
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - JNI

internal extension Android.OS.Bundle {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/os/Bundle"
        
        /// JNI Java class
        static var jniClass: jclass?
    
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_Method: jmethodID?
            
        }
    }
}
