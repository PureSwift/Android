//
//  OsBuildVersionCodes.swift
//  Android
//
//  Created by Marco Estrella on 7/5/18.
//

import Foundation
import java_swift
import java_util

public extension AndroidBuild {
    
    public typealias BuildVersionCodes = AndroidBuildVersionCodes
}

public class AndroidBuildVersionCodes: JavaObject {
    
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

internal extension AndroidBuildVersionCodes {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/os/Build$VERSION_CODES"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var BASE: jfieldID?
            static var BASE_1_1: jfieldID?
            static var CUPCAKE: jfieldID?
            static var CUR_DEVELOPMENT: jfieldID?
            static var DONUT: jfieldID?
            static var ECLAIR: jfieldID? //deprecated in Api 4
            static var ECLAIR_0_1: jfieldID?
            static var ECLAIR_MR1: jfieldID?
            static var FROYO: jfieldID?
            static var GINGERBREAD: jfieldID?
            static var GINGERBREAD_MR1: jfieldID?
            static var HONEYCOMB: jfieldID?
            static var HONEYCOMB_MR1: jfieldID?
            static var HONEYCOMB_MR2: jfieldID?
            static var ICE_CREAM_SANDWICH: jfieldID?
            static var ICE_CREAM_SANDWICH_MR1: jfieldID?
            static var JELLY_BEAN: jfieldID?
            static var JELLY_BEAN_MR1: jfieldID?
            static var JELLY_BEAN_MR2: jfieldID?
            static var KITKAT: jfieldID?
            static var KITKAT_WATCH: jfieldID?
            static var LOLLIPOP: jfieldID?
            static var LOLLIPOP_MR1: jfieldID?
            static var M: jfieldID?
            static var N: jfieldID?
            static var N_MR1: jfieldID?
            static var O: jfieldID?
            static var O_MR1: jfieldID?
            static var p: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method1: jmethodID?
        }
    }
}
