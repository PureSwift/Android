//
//  AndroidBluetoothLEScanResult.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import java_util
import JNI

public extension Android.Bluetooth.LE {
    
    public typealias ScanResult = AndroidBluetoothLowEnergyScanResult
}

public final class AndroidBluetoothLowEnergyScanResult: JavaObject {
    
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
    internal func getDevice() -> Android.Bluetooth.Device {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getDevice",
                                                  methodSig: "()Landroid/bluetooth/BluetoothDevice;",
                                                  methodCache: &JNICache.MethodID.getDevice,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.Device( javaObject: __return )
    }
    
    /**
     * Returns the remote bluetooth device identified by the bluetooth device address.
     */
    public var device: Android.Bluetooth.Device {
        
        @inline(__always)
        get { return getDevice() }
    }
    
    /**
     * Returns the scan record, which is a combination of advertisement and scan response.
     */
    public var scanRecord: JavaObject? {
        
        @inline(__always)
        get { return nil }
    }
}

// MARK: - JNI

internal extension Android.Bluetooth.LE.ScanResult {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["ScanResult"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getDevice: jmethodID?
        }
    }
}
