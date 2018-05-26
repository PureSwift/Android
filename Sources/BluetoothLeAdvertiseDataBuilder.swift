//
//  BluetoothLeAdvertiseDataBuilder.swift
//  Android
//
//  Created by Marco Estrella on 5/25/18.
//

import Foundation
import java_swift

public extension Android.Bluetooth.LE.AdvertiseData {
    
    public typealias Builder = AndroidBluetoothLowEnergyAdvertiseDataBuilder
}

/**
 * Builder for AdvertiseData.
 */
public final class AndroidBluetoothLowEnergyAdvertiseDataBuilder: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.initMethod,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothLowEnergyAdvertiseDataBuilder {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/le/AdvertiseData$Builder"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var initMethod: jmethodID?
            static var build: jmethodID?
            static var addManufacturerData: jmethodID?
            static var addServiceData: jmethodID?
            static var addServiceUuid: jmethodID?
            static var setIncludeDeviceName: jmethodID?
            static var setIncludeTxPowerLevel: jmethodID?
        }
    }
}
