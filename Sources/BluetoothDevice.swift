//
//  AndroidBluetoothDevice.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias Device = AndroidBluetoothDevice
}

public final class AndroidBluetoothDevice: JavaObject {
    
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

    @_versioned
    internal func getAddress() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getAddress",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getAddress,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    public var address: Bluetooth.Address {
        
        get { return Address(rawValue: getAddress())! }
    }
}

// MARK: - CONSTANTS

public extension Android.Bluetooth.Device {
    
    /// Bluetooth LE 1M PHY.
    internal static var PHY_LE_1M: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_LE_1M",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_LE_1M,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Bluetooth LE 1M PHY mask.
    internal static var PHY_LE_1M_MASK: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_LE_1M_MASK",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_LE_1M_MASK,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Bluetooth LE 2M PHY.
    internal static var PHY_LE_2M: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_LE_2M",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_LE_2M,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Bluetooth LE 2M PHY mask.
    internal static var PHY_LE_2M_MASK: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_LE_2M_MASK",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_LE_2M_MASK,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Bluetooth LE Coded PHY.
    internal static var PHY_LE_CODED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_LE_CODED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_LE_CODED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Bluetooth LE Coded PHY mask.
    internal static var PHY_LE_CODED_MASK: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_LE_CODED_MASK",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_LE_CODED_MASK,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// No preferred coding when transmitting on the LE Coded PHY.
    internal static var PHY_OPTION_NO_PREFERRED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_OPTION_NO_PREFERRED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_OPTION_NO_PREFERRED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Prefer the S=2 coding to be used when transmitting on the LE Coded PHY.
    internal static var PHY_OPTION_S2: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_OPTION_S2",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_OPTION_S2,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Prefer the S=8 coding to be used when transmitting on the LE Coded PHY.
    internal static var PHY_OPTION_S8: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHY_OPTION_S8",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHY_OPTION_S8,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - JNI

private extension Android.Bluetooth.Device {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/BluetoothDevice"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var PHY_LE_1M: jfieldID?
            static var PHY_LE_1M_MASK: jfieldID?
            static var PHY_LE_2M: jfieldID?
            static var PHY_LE_2M_MASK: jfieldID?
            static var PHY_LE_CODED: jfieldID?
            static var PHY_LE_CODED_MASK: jfieldID?
            static var PHY_OPTION_NO_PREFERRED: jfieldID?
            static var PHY_OPTION_S2: jfieldID?
            static var PHY_OPTION_S8: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getAddress: jmethodID?
        }
    }
}
