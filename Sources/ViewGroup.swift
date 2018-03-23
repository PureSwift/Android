//
//  AndroidViewGroup.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_lang

public extension Android.View {
    
    public typealias ViewGroup = AndroidViewGroup
}

/// `Android.View.View`
open class AndroidViewGroup: Android.View.View {
    
    
}

// MARK: - JNICache

internal extension Android.View.ViewGroup {
    
    /// JNI Cache
    struct ViewGroupJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["ViewGroup"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var findViewById: jmethodID?
        }
    }
}
