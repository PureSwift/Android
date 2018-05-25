//
//  BluetoothLeAdvertisingSetParameters.swift
//  Android
//
//  Created by Marco Estrella on 5/25/18.
//

import Foundation
import java_swift

public extension Android.Bluetooth.LE {
    
    public typealias AdvertisingSetParameters = AndroidBluetoothLowEnergyAdvertisingSetParameters
}

public final class AndroidBluetoothLowEnergyAdvertisingSetParameters: JavaObject {
    
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

// MARK: CONSTANTS

public extension Android.Bluetooth.LE.AdvertisingSetParameters {
    
}

// MARK: INTERNAL METHODS

internal extension Android.Bluetooth.LE.AdvertisingSetParameters {
    
}

// MARK: - JNICache

internal extension Android.Bluetooth.LE.AdvertisingSetParameters {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["AdvertisingParameters"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var INTERVAL_HIGH: jfieldID?
            static var INTERVAL_LOW: jfieldID?
            static var INTERVAL_MAX: jfieldID?
            static var INTERVAL_MEDIUM: jfieldID?
            static var INTERVAL_MIN: jfieldID?
            static var TX_POWER_HIGH: jfieldID?
            static var TX_POWER_LOW: jfieldID?
            static var TX_POWER_MAX: jfieldID?
            static var TX_POWER_MEDIUM: jfieldID?
            static var TX_POWER_MIN: jfieldID?
            static var TX_POWER_ULTRA_LOW: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getInterval: jmethodID?
            static var getPrimaryPhy: jmethodID?
            static var getSecondaryPhy: jmethodID?
            static var getTxPowerLevel: jmethodID?
            static var includeTxPower: jmethodID?
            static var isAnonymous: jmethodID?
            static var isConnectable: jmethodID?
            static var isLegacy: jmethodID?
            static var isScannable: jmethodID?
            
        }
    }
}
