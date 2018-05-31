//
//  BluetoothGattDescriptor.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias GattDescriptor = AndroidBluetoothGattDescriptor
}

/**
 * Represents a Bluetooth GATT Descriptor
 *
 * GATT Descriptors contain additional information and attributes of a GATT characteristic, BluetoothGattCharacteristic.
 * They can be used to describe the characteristic's features or to control certain behaviours of the characteristic.
 */
public final class AndroidBluetoothGattDescriptor: JavaObject {
    
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

public extension AndroidBluetoothGattDescriptor {
    
}

// MARK: Methods

public extension AndroidBluetoothGattDescriptor {
    
}

// MARK: - JNICache

internal extension AndroidBluetoothGattDescriptor {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGattDescriptor"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var PERMISSION_READ: jfieldID?
            static var PERMISSION_READ_ENCRYPTED: jfieldID?
            static var PERMISSION_READ_ENCRYPTED_MITM: jfieldID?
            static var PERMISSION_WRITE: jfieldID?
            static var PERMISSION_WRITE_ENCRYPTED: jfieldID?
            static var PERMISSION_WRITE_ENCRYPTED_MITM: jfieldID?
            static var PERMISSION_WRITE_SIGNED: jfieldID?
            static var PERMISSION_WRITE_SIGNED_MITM: jfieldID?
            static var DISABLE_NOTIFICATION_VALUE: jfieldID?
            static var ENABLE_INDICATION_VALUE: jfieldID?
            static var ENABLE_NOTIFICATION_VALUE: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getCharacteristic: jmethodID?
            static var getPermissions: jmethodID?
            static var getUuid: jmethodID?
            static var getValue: jmethodID?
            static var setValue: jmethodID?
        }
    }
}
