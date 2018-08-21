//
//  UtilDisplayMetrics.swift
//  Android
//
//  Created by Marco Estrella on 7/20/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Util {
    
    public typealias DisplayMetrics = AndroidUtilDisplayMetrics
}

public class AndroidUtilDisplayMetrics: JavaObject {
    
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

public extension AndroidUtilDisplayMetrics {
    
    public var density: Float {
        get {
            let __value = JNIField.GetFloatField(fieldName: "density",
                                               fieldType: "F",
                                               fieldCache: &JNICache.FieldID.density,
                                               object: javaObject)
            return Float(__value)
        }
    }
    
    /// The screen density expressed as dots-per-inch.
    public var densityDpi: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "densityDpi",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.densityDpi,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    /// The absolute height of the available display size in pixels.
    public var heightPixels: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "heightPixels",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.heightPixels,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    /// A scaling factor for fonts displayed on the display. This is the same as density,
    /// except that it may be adjusted in smaller increments at runtime based on a user preference for the font size.
    public var scaledDensity: Float {
        get {
            let __value = JNIField.GetFloatField(fieldName: "scaledDensity",
                                                 fieldType: "F",
                                                 fieldCache: &JNICache.FieldID.scaledDensity,
                                                 object: javaObject)
            return Float(__value)
        }
    }
    
    /// The absolute width of the available display size in pixels.
    public var widthPixels: Int {
        get {
            let __value = JNIField.GetIntField(fieldName: "widthPixels",
                                               fieldType: "I",
                                               fieldCache: &JNICache.FieldID.widthPixels,
                                               object: javaObject)
            return Int(__value)
        }
    }
    
    /// The exact physical pixels per inch of the screen in the X dimension.
    public var xdpi: Float {
        get {
            let __value = JNIField.GetFloatField(fieldName: "xdpi",
                                                 fieldType: "F",
                                                 fieldCache: &JNICache.FieldID.xdpi,
                                                 object: javaObject)
            return Float(__value)
        }
    }
    
    /// The exact physical pixels per inch of the screen in the Y dimension.
    public var ydpi: Float {
        get {
            let __value = JNIField.GetFloatField(fieldName: "ydpi",
                                                 fieldType: "F",
                                                 fieldCache: &JNICache.FieldID.ydpi,
                                                 object: javaObject)
            return Float(__value)
        }
    }
}

// MARK: - JNICache

internal extension AndroidUtilDisplayMetrics {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Util.className(["DisplayMetrics"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct FieldID {
            static var density: jmethodID?
            static var densityDpi: jmethodID?
            static var heightPixels: jmethodID?
            static var scaledDensity: jmethodID?
            static var widthPixels: jmethodID?
            static var xdpi: jmethodID?
            static var ydpi: jmethodID?
        }
    }
}
