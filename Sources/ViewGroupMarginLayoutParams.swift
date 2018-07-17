//
//  ViewGroupMarginLayoutParams.swift
//  Android
//
//  Created by Marco Estrella on 7/17/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidViewGroup {
    
    public typealias MarginLayoutParams = AndroidViewGroupMarginLayoutParams
}

open class AndroidViewGroupMarginLayoutParams: Android.View.ViewGroup.LayoutParams {
    
    
}

// MARK: - Private

internal extension AndroidViewGroupMarginLayoutParams {
    
    /// JNI Cache
    struct ViewGroupLayoutParamsJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["ViewGroup$MarginLayoutParams"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            static var MATCH_PARENT: jfieldID?
            static var WRAP_CONTENT: jfieldID?
            static var height: jfieldID?
            static var width: jfieldID?
            
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var setMargins: jmethodID?
            static var setMarginStart: jmethodID?
            static var setMarginEnd: jmethodID?
            static var getMarginEnd: jmethodID?
            static var getMarginStart: jmethodID?
            static var getLayoutDirection: jmethodID?
            static var setLayoutDirection: jmethodID?
            static var isMarginRelative: jmethodID?
            static var resolveLayoutDirection: jmethodID?
            static var setBaseAttributes: jmethodID?
        }
    }
}
