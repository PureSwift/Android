//
//  ViewSwiftView.swift
//  Android
//
//  Created by Marco Estrella on 7/13/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias FragmentLayout = AndroidWidgetFragmentLayout
}

open class AndroidWidgetFragmentLayout: Android.View.ViewGroup {
    
    
}

// MARK: - Methods

public extension AndroidWidgetFragmentLayout {
    
    
}

// MARK: - JNICache

internal extension AndroidWidgetFragmentLayout {
    
    /// JNI Cache
    struct FragmentLayoutJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["FragmentLayout"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var generateLayoutParams: jmethodID?
            static var getAccessibilityClassName: jmethodID?
            static var getConsiderGoneChildrenWhenMeasuring: jmethodID?
            static var getMeasureAllChildren: jmethodID?
            static var setForegroundGravity: jmethodID?
            static var setMeasureAllChildren: jmethodID?
            static var shouldDelayChildPressedState: jmethodID?
        }
    }
}
