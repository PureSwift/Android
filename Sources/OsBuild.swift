//
//  OsBuild.swift
//  Android
//
//  Created by Marco Estrella on 7/5/18.
//

import Foundation
import java_swift
import java_util

public extension Android.OS {
    
    public typealias Build = AndroidBuild
}

public class AndroidBuild: JavaObject {
    
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
    
    public convenience init(){
        
        var __locals = [jobject]()
        var __args = [jvalue](repeating: jvalue(), count: 0)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.init_method1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - JNI

internal extension AndroidBuild {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/os/Build"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var UNKNOWN: jfieldID?
            static var BOARD: jfieldID?
            static var BOOTLOADER: jfieldID?
            static var BRAND: jfieldID?
            static var CPU_ABI: jfieldID? //deprecated in Api 21
            static var CPU_ABI2: jfieldID? //deprecated in Api 21
            static var DEVICE: jfieldID?
            static var DISPLAY: jfieldID?
            static var FINGERPRINT: jfieldID?
            static var HOST: jfieldID?
            static var ID: jfieldID?
            static var MANUFACTURER: jfieldID?
            static var MODEL: jfieldID?
            static var PRODUCT: jfieldID?
            static var RADIO: jfieldID? //deprecated in Api 14
            static var SERIAL: jfieldID? //deprecated in Api 26
            static var SUPPORTED_32_BIT_ABIS: jfieldID?
            static var SUPPORTED_64_BIT_ABIS: jfieldID?
            static var SUPPORTED_ABIS: jfieldID?
            static var TAGS: jfieldID?
            static var TIME: jfieldID?
            static var TYPE: jfieldID?
            static var USER: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method1: jmethodID?
            static var getRadioVersion: jmethodID?
            static var getSerial: jmethodID?
        }
    }
}
