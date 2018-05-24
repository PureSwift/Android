//
//  AndroidBluetoothLowEnergyScanFilter.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift

public extension Android.Bluetooth.LE {
    
    public typealias ScanFilter = AndroidBluetoothLowEnergyScanFilter
}

/**
 *    Criteria for filtering result from Bluetooth LE scans. A ScanFilter allows clients to restrict scan results to only those that are of interest to them.
 *
 *    Current filtering on the following fields are supported:
 *
 *    Service UUIDs which identify the bluetooth gatt services running on the device.
 *    Name of remote Bluetooth LE device.
 *    Mac address of the remote device.
 *    Service data which is the data associated with a service.
 *    Manufacturer specific data which is the data associated with a particular manufacturer.
 */
public final class AndroidBluetoothLowEnergyScanFilter: JavaObject {

    private static var JNIClass: jclass?
    
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
    
    private static var new_MethodID_1: jmethodID?
    
    public convenience init() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &type(of: self).JNIClass,
            methodSig: "()V",
            methodCache: &type(of: self).new_MethodID_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var deviceAddress: String {
        
        get { return getDeviceAddress() }
    }
}

// MARK: METHODS

public extension Android.Bluetooth.LE.ScanFilter {
    
    @_versioned
    internal func getDeviceAddress() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getDeviceAddress",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getDeviceAddress,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    
}

// MARK: - JNICache

internal extension Android.Bluetooth.LE.ScanFilter {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["ScanFilter"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getDeviceAddress: jmethodID?
            static var getDeviceName: jmethodID?
            static var getManufacturerData: jmethodID?
            static var getManufacturerDataMask: jmethodID?
            static var getManufacturerId: jmethodID?
            static var getServiceData: jmethodID?
            static var getServiceDataMask: jmethodID?
            static var getServiceDataUuid: jmethodID?
            static var getServiceUuid: jmethodID?
            static var getServiceUuidMask: jmethodID?
            static var matches: jmethodID?
        }
    }
}

