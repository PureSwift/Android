//
//  AndroidBluetoothLowEnergyScanFilter.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import Android

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
            classCache: &JNICache.jniClass,
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
    
    /**
     * Returns the filter set the device name field of Bluetooth advertisement data.
     */
    public var deviceName: String {
        
        get { return getDeviceAddress() }
    }
    
    public var manufacturerData: [Int8]? {
        
        get { return getManufacturerData() }
    }
    
    public var manufacturerDataMask: [Int8]? {
        
        get { return getManufacturerDataMask() }
    }
    
    /**
     * Returns the manufacturer id.
     */
    public var manufacturerId: Int {
        
        get { return getManufacturerId() }
    }
    
    public var serviceData: [Int8]? {
        
        get { return getServiceData() }
    }
    
    public var serviceDataMask: [Int8]? {
        
        get { return getServiceDataMask() }
    }
    
    public var serviceDataUuid: Android.OS.ParcelUuid? {
        
        get { return getServiceDataUuid() }
    }
    
    public var serviceUuid: Android.OS.ParcelUuid? {
        
        get { return getServiceUuid() }
    }
    
    public var serviceUuidMask: Android.OS.ParcelUuid? {
        
        get { return getServiceUuidMask() }
    }
}

// MARK: METHODS

public extension Android.Bluetooth.LE.ScanFilter {
    
    public func matches(scanResult: Android.Bluetooth.LE.ScanResult) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: scanResult, locals: &__locals )
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "matches",
                                                   methodSig: "(Landroid/bluetooth/le/ScanResult;)Z",
                                                   methodCache: &JNICache.MethodID.matches,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: INTERNAL METHODS

internal extension Android.Bluetooth.LE.ScanFilter {
    
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
    
    @_versioned
    internal func getDeviceName() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getDeviceName",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getDeviceName,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    @_versioned
    internal func getManufacturerData() -> [Int8]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getManufacturerData",
                                                  methodSig: "()[B",
                                                  methodCache: &JNICache.MethodID.getManufacturerData,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JNIType.toSwift( type: [Int8].self, from: __return )
    }
    
    @_versioned
    internal func getManufacturerDataMask() -> [Int8]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getManufacturerDataMask",
                                                  methodSig: "()[B",
                                                  methodCache: &JNICache.MethodID.getManufacturerDataMask,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JNIType.toSwift( type: [Int8].self, from: __return )
    }
    
    @_versioned
    internal func getManufacturerId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getManufacturerId",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getManufacturerId,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    @_versioned
    internal func getServiceData() -> [Int8]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getServiceData",
                                                  methodSig: "()[B",
                                                  methodCache: &JNICache.MethodID.getServiceData,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JNIType.toSwift( type: [Int8].self, from: __return )
    }
    
    @_versioned
    internal func getServiceDataMask() -> [Int8]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getServiceDataMask",
                                                  methodSig: "()[B",
                                                  methodCache: &JNICache.MethodID.getServiceDataMask,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JNIType.toSwift( type: [Int8].self, from: __return )
    }
    
    @_versioned
    internal func getServiceDataUuid() -> Android.OS.ParcelUuid? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallStaticObjectMethod( className: JNICache.className,
                                                         classCache: &JNICache.jniClass,
                                                         methodName: "getServiceDataUuid",
                                                         methodSig: "()Landroid/os/ParcelUuid;",
                                                         methodCache: &JNICache.MethodID.getServiceDataUuid,
                                                         args: &__args, locals: &__locals )
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.OS.ParcelUuid( javaObject: __return ) : nil
    }
    
    @_versioned
    internal func getServiceUuid() -> Android.OS.ParcelUuid? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallStaticObjectMethod( className: JNICache.className,
                                                         classCache: &JNICache.jniClass,
                                                         methodName: "getServiceUuid",
                                                         methodSig: "()Landroid/os/ParcelUuid;",
                                                         methodCache: &JNICache.MethodID.getServiceUuid,
                                                         args: &__args, locals: &__locals )
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.OS.ParcelUuid( javaObject: __return ) : nil
    }
    
    @_versioned
    internal func getServiceUuidMask() -> Android.OS.ParcelUuid? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallStaticObjectMethod( className: JNICache.className,
                                                         classCache: &JNICache.jniClass,
                                                         methodName: "getServiceUuidMask",
                                                         methodSig: "()Landroid/os/ParcelUuid;",
                                                         methodCache: &JNICache.MethodID.getServiceUuidMask,
                                                         args: &__args, locals: &__locals )
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.OS.ParcelUuid( javaObject: __return ) : nil
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
