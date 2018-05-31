//
//  BluetoothGattService.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias GattService = AndroidBluetoothGattService
}

/**
 * Represents a Bluetooth GATT Service
 *
 * Gatt Service contains a collection of BluetoothGattCharacteristic, as well as referenced services.
 */
public final class AndroidBluetoothGattService: JavaObject {
    
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

public extension AndroidBluetoothGattService {
    
}

// MARK: Methods

public extension AndroidBluetoothGattService {
    
}

// MARK: - JNICache

internal extension AndroidBluetoothGattService {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGattService"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var SERVICE_TYPE_PRIMARY: jfieldID?
            static var SERVICE_TYPE_SECONDARY: jfieldID?
            static var mCharacteristics: jfieldID?
            static var mIncludedServices: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method: jmethodID?
            static var addCharacteristic: jmethodID?
            static var addService: jmethodID?
            static var getCharacteristic: jmethodID?
            static var getCharacteristics: jmethodID?
            static var getIncludedServices: jmethodID?
            static var getInstanceId: jmethodID?
            static var getType: jmethodID?
            static var getUuid: jmethodID?
        }
    }
}


