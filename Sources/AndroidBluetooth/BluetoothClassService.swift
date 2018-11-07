//
//  BluetoothClassService.swift
//  Android
//
//  Created by Marco Estrella on 6/6/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth.Class {
    
    public typealias Service = AndroidBluetoothClassService
}

/**
 * Defines all service class constants.
 *
 * Each BluetoothClass encodes zero or more service classes.
 */
public struct AndroidBluetoothClassService: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let audio = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.AUDIO)
    
    public static let capture = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.CAPTURE)
    
    public static let information = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.INFORMATION)
    
    public static let limitedDiscoverability = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.LIMITED_DISCOVERABILITY)
    
    public static let networking = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.NETWORKING)
    
    public static let objectTransfer = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.OBJECT_TRANSFER)
    
    public static let positioning = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.POSITIONING)
    
    public static let render = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.RENDER)
    
    public static let telephony = Android.Bluetooth.Class.Service(rawValue: AndroidBluetoothClassServiceConstants.TELEPHONY)
}

// MARK: - Constants

fileprivate class AndroidBluetoothClassServiceConstants {
    
    fileprivate static var AUDIO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var CAPTURE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CAPTURE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CAPTURE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var INFORMATION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "INFORMATION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.INFORMATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var LIMITED_DISCOVERABILITY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LIMITED_DISCOVERABILITY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LIMITED_DISCOVERABILITY,
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
    
    fileprivate static var OBJECT_TRANSFER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "OBJECT_TRANSFER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.OBJECT_TRANSFER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var POSITIONING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "POSITIONING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.POSITIONING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var RENDER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "RENDER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.RENDER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var TELEPHONY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TELEPHONY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TELEPHONY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - JNI Cache

fileprivate extension AndroidBluetoothClassServiceConstants {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothClass$Service"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var AUDIO: jfieldID?
            static var CAPTURE: jfieldID?
            static var INFORMATION: jfieldID?
            static var LIMITED_DISCOVERABILITY: jfieldID?
            static var NETWORKING: jfieldID?
            static var OBJECT_TRANSFER: jfieldID?
            static var POSITIONING: jfieldID?
            static var RENDER: jfieldID?
            static var TELEPHONY: jfieldID?
        }
    }
}

