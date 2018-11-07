//
//  BluetoothClassDeviceMajor.swift
//  Android
//
//  Created by Marco Estrella on 6/6/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension AndroidBluetoothClassDevice {
    
    public typealias Major = AndroidBluetoothClassDeviceMajor
}

/**
 * Defines all major device class constants.
 *
 * See BluetoothClass.Device for minor classes.
 */
public struct AndroidBluetoothClassDeviceMajor: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let audioVideo = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.AUDIO_VIDEO)
    
    public static let computer = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.COMPUTER)
    
    public static let health = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.HEALTH)
    
    public static let imaging = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.IMAGING)
    
    public static let misc = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.MISC)
    
    public static let networking = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.NETWORKING)
    
    public static let peripheral = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.PERIPHERAL)
    
    public static let phone = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.PHONE)
    
    public static let toy = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.TOY)
    
    public static let uncategorized = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.UNCATEGORIZED)
    
    public static let wearable = Android.Bluetooth.Class.Device.Major(rawValue: AndroidBluetoothClassDeviceMajorConstants.WEARABLE)
}

// MARK: - Constants

fileprivate class AndroidBluetoothClassDeviceMajorConstants {
    
    fileprivate static var AUDIO_VIDEO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var COMPUTER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "COMPUTER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.COMPUTER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var HEALTH: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var IMAGING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMAGING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMAGING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var MISC: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MISC",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.MISC,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var NETWORKING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "NETWORKING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.NETWORKING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var PERIPHERAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERIPHERAL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERIPHERAL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var PHONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHONE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var TOY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TOY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TOY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var UNCATEGORIZED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "UNCATEGORIZED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.UNCATEGORIZED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var WEARABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WEARABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WEARABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - JNI Cache

fileprivate extension AndroidBluetoothClassDeviceMajorConstants {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothClass$Device$Major"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var AUDIO_VIDEO: jfieldID?
            static var COMPUTER: jfieldID?
            static var HEALTH: jfieldID?
            static var IMAGING: jfieldID?
            static var MISC: jfieldID?
            static var NETWORKING: jfieldID?
            static var PERIPHERAL: jfieldID?
            static var PHONE: jfieldID?
            static var TOY: jfieldID?
            static var UNCATEGORIZED: jfieldID?
            static var WEARABLE: jfieldID?
        }
    }
}

