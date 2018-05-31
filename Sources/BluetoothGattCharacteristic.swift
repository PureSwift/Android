//
//  BluetoothGattCharacteristic.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias GattCharacteristic = AndroidBluetoothGattCharacteristic
}

/**
 * Represents a Bluetooth GATT Characteristic
 *
 * A GATT characteristic is a basic data element used to construct a GATT service, BluetoothGattService. The characteristic contains a value
 * as well as additional information and optional GATT descriptors, BluetoothGattDescriptor.
 */
public final class AndroidBluetoothGattCharacteristic: JavaObject {
    
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

// MARK: Constants

public extension AndroidBluetoothGattCharacteristic {
    
    /// Characteristic value format type float (32-bit float)
    internal static var FORMAT_FLOAT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_FLOAT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_FLOAT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type sfloat (16-bit float)
    internal static var FORMAT_SFLOAT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_SFLOAT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_SFLOAT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type sint16
    internal static var FORMAT_SINT16: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_SINT16",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_SINT16,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type sint32
    internal static var FORMAT_SINT32: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_SINT32",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_SINT32,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type sint8
    internal static var FORMAT_SINT8: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_SINT8",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_SINT8,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type uint16
    internal static var FORMAT_UINT16: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_UINT16",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_UINT16,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type uint32
    internal static var FORMAT_UINT32: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_UINT32",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_UINT32,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type uint8
    internal static var FORMAT_UINT8: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_UINT8",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_UINT8,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic read permission
    internal static var PERMISSION_READ: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_READ",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_READ,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic permission: Allow encrypted read operations
    internal static var PERMISSION_READ_ENCRYPTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_READ_ENCRYPTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_READ_ENCRYPTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic permission: Allow reading with man-in-the-middle protection
    internal static var PERMISSION_READ_ENCRYPTED_MITM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_READ_ENCRYPTED_MITM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_READ_ENCRYPTED_MITM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic write permission
    internal static var PERMISSION_WRITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic permission: Allow encrypted writes
    internal static var PERMISSION_WRITE_ENCRYPTE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE_ENCRYPTE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE_ENCRYPTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic permission: Allow encrypted writes with man-in-the-middle protection
    internal static var PERMISSION_WRITE_ENCRYPTED_MITM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE_ENCRYPTED_MITM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE_ENCRYPTED_MITM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic permission: Allow signed write operations
    internal static var PERMISSION_WRITE_SIGNED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE_SIGNED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE_SIGNED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic permission: Allow signed write operations with man-in-the-middle protection.
    internal static var PERMISSION_WRITE_SIGNED_MITM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE_SIGNED_MITM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE_SIGNED_MITM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic proprty: Characteristic is broadcastable.
    internal static var PROPERTY_BROADCAST: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_BROADCAST",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_BROADCAST,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic has extended properties.
    internal static var PROPERTY_EXTENDED_PROPS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_EXTENDED_PROPS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_EXTENDED_PROPS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic supports indication.
    internal static var PROPERTY_INDICATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_INDICATE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_INDICATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic supports notification.
    internal static var PROPERTY_NOTIFY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_NOTIFY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_NOTIFY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic is readable.
    internal static var PROPERTY_READ: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_READ",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_READ,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic supports write with signature.
    internal static var PROPERTY_SIGNED_WRITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_SIGNED_WRITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_SIGNED_WRITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic can be written.
    internal static var PROPERTY_WRITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_WRITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_WRITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic can be written without response.
    internal static var PROPERTY_WRITE_NO_RESPONSE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_WRITE_NO_RESPONSE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_WRITE_NO_RESPONSE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Write characteristic, requesting acknoledgement by the remote device.
    internal static var WRITE_TYPE_DEFAULT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WRITE_TYPE_DEFAULT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WRITE_TYPE_DEFAULT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Write characteristic without requiring a response by the remote device
    internal static var WRITE_TYPE_NO_RESPONSE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WRITE_TYPE_NO_RESPONSE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WRITE_TYPE_NO_RESPONSE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Write characteristic including authentication signature.
    internal static var WRITE_TYPE_SIGNED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WRITE_TYPE_SIGNED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WRITE_TYPE_SIGNED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: Methods

public extension AndroidBluetoothGattCharacteristic {
    
}

// MARK: - JNICache

internal extension AndroidBluetoothGattCharacteristic {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGattCharacteristic"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var FORMAT_FLOAT: jfieldID?
            static var FORMAT_SFLOAT: jfieldID?
            static var FORMAT_SINT16: jfieldID?
            static var FORMAT_SINT32: jfieldID?
            static var FORMAT_SINT8: jfieldID?
            static var FORMAT_UINT16: jfieldID?
            static var FORMAT_UINT32: jfieldID?
            static var FORMAT_UINT8: jfieldID?
            static var PERMISSION_READ: jfieldID?
            static var PERMISSION_READ_ENCRYPTED: jfieldID?
            static var PERMISSION_READ_ENCRYPTED_MITM: jfieldID?
            static var PERMISSION_WRITE: jfieldID?
            static var PERMISSION_WRITE_ENCRYPTED: jfieldID?
            static var PERMISSION_WRITE_ENCRYPTED_MITM: jfieldID?
            static var PERMISSION_WRITE_SIGNED: jfieldID?
            static var PERMISSION_WRITE_SIGNED_MITM: jfieldID?
            static var PROPERTY_BROADCAST: jfieldID?
            static var PROPERTY_EXTENDED_PROPS: jfieldID?
            static var PROPERTY_INDICATE: jfieldID?
            static var PROPERTY_NOTIFY: jfieldID?
            static var PROPERTY_READ: jfieldID?
            static var PROPERTY_SIGNED_WRITE: jfieldID?
            static var PROPERTY_WRITE: jfieldID?
            static var PROPERTY_WRITE_NO_RESPONSE: jfieldID?
            static var WRITE_TYPE_DEFAULT: jfieldID?
            static var WRITE_TYPE_NO_RESPONSE: jfieldID?
            static var WRITE_TYPE_SIGNED: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var addDescriptor: jmethodID?
            static var getDescriptor: jmethodID?
            static var getDescriptors: jmethodID?
            static var getFloatValue: jmethodID?
            static var getInstanceId: jmethodID?
            static var getIntValue: jmethodID?
            static var getPermissions: jmethodID?
            static var getProperties: jmethodID?
            static var getService: jmethodID?
            static var getStringValue: jmethodID?
            static var getUuid: jmethodID?
            static var getValue: jmethodID?
            static var getWriteType: jmethodID?
            static var setValue: jmethodID?
            static var setValue2: jmethodID?
            static var setValue3: jmethodID?
            static var setValue4: jmethodID?
            static var setWriteType: jmethodID?
        }
    }
}
