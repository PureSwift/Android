//
//  BluetoothLeAdvertiseData.swift
//  Android
//
//  Created by Marco Estrella on 5/25/18.
//

import Foundation
import java_swift

public extension Android.Bluetooth.LE {
    
    public typealias AdvertiseData = AndroidBluetoothLowEnergyAdvertiseData
}

/**
 * Advertise data packet container for Bluetooth LE advertising. This represents the data to be advertised as well as
 * the scan response data for active scans.
 *
 * Use AdvertiseData.Builder to create an instance of AdvertiseData to be advertised.
 */
public final class AndroidBluetoothLowEnergyAdvertiseData: JavaObject {
    
    
}

// MARK: - JNICache

internal extension AndroidBluetoothLowEnergyAdvertiseData {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["AdvertiseData"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getIncludeDeviceName: jmethodID?
            static var getIncludeTxPowerLevel: jmethodID?
            static var getManufacturerSpecificData: jmethodID?
            static var getServiceData: jmethodID?
            static var getServiceUuids: jmethodID?
        }
    }
}
