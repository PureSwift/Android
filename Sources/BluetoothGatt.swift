//
//  BluetoothGatt.swift
//  Android
//
//  Created by Marco Estrella on 6/1/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias Gatt = AndroidBluetoothGatt
}

/**
 * Public API for the Bluetooth GATT Profile.
 *
 * This class provides Bluetooth GATT functionality to enable communication with Bluetooth Smart or Smart Ready devices.
 *
 * To connect to a remote peripheral device, create a BluetoothGattCallback and call connectGatt(Context, boolean, BluetoothGattCallback) to
 * get a instance of this class. GATT capable devices can be discovered using the Bluetooth device discovery or BLE scan process.
 */
public final class AndroidBluetoothGatt: JavaObject {
    
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

// Mark: - Constants

internal extension AndroidBluetoothGatt {
    
    /// Connection paramter update - Use the connection paramters recommended by the Bluetooth SIG.
    internal static var CONNECTION_PRIORITY_BALANCED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CONNECTION_PRIORITY_BALANCED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CONNECTION_PRIORITY_BALANCED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Connection paramter update - Request a high priority, low latency connection.
    internal static var CONNECTION_PRIORITY_HIGH: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CONNECTION_PRIORITY_HIGH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CONNECTION_PRIORITY_HIGH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Connection paramter update - Request low power, reduced data rate connection parameters.
    internal static var CONNECTION_PRIORITY_LOW_POWER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CONNECTION_PRIORITY_LOW_POWER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CONNECTION_PRIORITY_LOW_POWER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// A remote device connection is congested.
    internal static var GATT_CONNECTION_CONGESTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_CONNECTION_CONGESTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_CONNECTION_CONGESTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Insufficient authentication for a given operation.
    internal static var GATT_INSUFFICIENT_AUTHENTICATION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_INSUFFICIENT_AUTHENTICATION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_INSUFFICIENT_AUTHENTICATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Insufficient encryption for a given operation.
    internal static var GATT_INSUFFICIENT_ENCRYPTION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_INSUFFICIENT_ENCRYPTION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_INSUFFICIENT_ENCRYPTION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// A write operation exceeds the maximum length of the attribute
    internal static var GATT_INVALID_ATTRIBUTE_LENGTH: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_INVALID_ATTRIBUTE_LENGTH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_INVALID_ATTRIBUTE_LENGTH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// A read or write operation was requested with an invalid offset.
    internal static var GATT_INVALID_OFFSET: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_INVALID_OFFSET",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_INVALID_OFFSET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// GATT read operation is not permitted.
    internal static var GATT_READ_NOT_PERMITTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_READ_NOT_PERMITTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_READ_NOT_PERMITTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// The given request is not supported.
    internal static var GATT_REQUEST_NOT_SUPPORTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_REQUEST_NOT_SUPPORTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_REQUEST_NOT_SUPPORTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// A GATT operation completed successfully.
    internal static var GATT_SUCCESS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_SUCCESS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_SUCCESS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// GATT write operation is not permitted.
    internal static var GATT_WRITE_NOT_PERMITTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_WRITE_NOT_PERMITTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_WRITE_NOT_PERMITTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// Mark: - Methods

public extension AndroidBluetoothGatt {
    
}

// MARK: - JNICache

internal extension AndroidBluetoothGatt {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGatt"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var CONNECTION_PRIORITY_BALANCED: jfieldID?
            static var CONNECTION_PRIORITY_HIGH: jfieldID?
            static var CONNECTION_PRIORITY_LOW_POWER: jfieldID?
            static var GATT_CONNECTION_CONGESTED: jfieldID?
            static var GATT_FAILURE: jfieldID?
            static var GATT_INSUFFICIENT_AUTHENTICATION: jfieldID?
            static var GATT_INSUFFICIENT_ENCRYPTION: jfieldID?
            static var GATT_INVALID_ATTRIBUTE_LENGTH: jfieldID?
            static var GATT_INVALID_OFFSET: jfieldID?
            static var GATT_READ_NOT_PERMITTED: jfieldID?
            static var GATT_REQUEST_NOT_SUPPORTED: jfieldID?
            static var GATT_SUCCESS: jfieldID?
            static var GATT_WRITE_NOT_PERMITTED: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var abortReliableWrite: jmethodID?
            static var abortReliableWrite2: jmethodID?
            static var beginReliableWrite: jmethodID?
            static var close: jmethodID?
            static var connect: jmethodID?
            static var disconnect: jmethodID?
            static var discoverServices: jmethodID?
            static var executeReliableWrite: jmethodID?
            static var getConnectedDevices: jmethodID?
            static var getConnectionState: jmethodID?
            static var getDevice: jmethodID?
            static var getDevicesMatchingConnectionStates: jmethodID?
            static var getService: jmethodID?
            static var getServices2: jmethodID?
            static var readCharacteristic: jmethodID?
            static var readDescriptor: jmethodID?
            static var readPhy: jmethodID?
            static var readRemoteRssi: jmethodID?
            static var requestConnectionPriority: jmethodID?
            static var requestMtu: jmethodID?
            static var setCharacteristicNotification: jmethodID?
            static var setPreferredPhy: jmethodID?
            static var writeCharacteristic: jmethodID?
            static var writeDescriptor: jmethodID?
        }
    }
}



