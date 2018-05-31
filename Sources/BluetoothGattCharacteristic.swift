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
