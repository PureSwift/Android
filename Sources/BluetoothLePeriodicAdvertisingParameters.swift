//
//  BluetoothLePeriodicAdvertisingParameters.swift
//  Android
//
//  Created by Marco Estrella on 5/24/18.
//

import Foundation
import java_swift

public extension Android.Bluetooth.LE {
    
    public typealias PeriodicAdvertisingParameters = AndroidBluetoothLowEnergyPeriodicAdvertisingParameters
}

/**
 * The PeriodicAdvertisingParameters provide a way to adjust periodic advertising preferences for each Bluetooth LE
 * advertising set. Use AdvertisingSetParameters.Builder to create an instance of this class.
 */
public final class AndroidBluetoothLowEnergyPeriodicAdvertisingParameters: JavaObject {
    
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

// MARK: - JNICache

internal extension Android.Bluetooth.LE.PeriodicAdvertisingParameters {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["PeriodicAdvertisingParameters"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getDeviceAddress: jmethodID?
        }
    }
}
