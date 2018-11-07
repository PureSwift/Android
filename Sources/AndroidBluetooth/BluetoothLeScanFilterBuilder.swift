//
//  BluetoothLeScanFilterBuilder.swift
//  Android
//
//  Created by Marco Estrella on 5/24/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth.LE.ScanFilter {
    
    public typealias Builder = AndroidBluetoothLowEnergyScanFilterBuilder
}

/**
 * Builder class for ScanFilter.
 */
public final class AndroidBluetoothLowEnergyScanFilterBuilder: JavaObject {
    
    private static let javaClassName = "android/bluetooth/le/ScanFilter$Builder"
    
    private static var JNIClass: jclass?
    
    private static var init_MethodID: jmethodID?
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
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
            className: type(of: self).javaClassName,
            classCache: &type(of: self).JNIClass,
            methodSig: "()V",
            methodCache: &type(of: self).init_MethodID,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: METHODS

public extension Android.Bluetooth.LE.ScanFilter {
    private static var build_MethodID: jmethodID?
    
    public func build() -> Android.Bluetooth.LE.ScanSettings {
        
        var __locals = [jobject]()
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "build",
                                                  methodSig: "()Landroid/bluetooth/le/ScanSettings;",
                                                  methodCache: &type(of: self).build_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettings( javaObject: __return )
    }
    
    private static var setDeviceAddress_MethodID: jmethodID?
    
    /// Set filter on device address.
    public func setDeviceAddress(_ deviceAddress: String) -> Android.Bluetooth.LE.ScanFilter.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava( value: deviceAddress, locals: &__locals )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDeviceAddress",
            methodSig: "(Ljava/lang/String;)Landroid/bluetooth/le/ScanFilter$Builder;",
            methodCache: &type(of: self).setDeviceAddress_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setDeviceAddress",
                                                  methodSig: "(Ljava/lang/String;)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setDeviceAddress_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
    
    private static var setDeviceName_MethodID: jmethodID?
    
    /// Set filter on device name.
    public func setDeviceName(_ deviceName: String) -> Android.Bluetooth.LE.ScanFilter.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava( value: deviceName, locals: &__locals )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDeviceName",
            methodSig: "(Ljava/lang/String;)Landroid/bluetooth/le/ScanFilter$Builder;",
            methodCache: &type(of: self).setDeviceName_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setDeviceName",
                                                  methodSig: "(Ljava/lang/String;)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setDeviceName_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
    
    private static var setManufacturerData_MethodID: jmethodID?
    
    /// Set filter on on manufacturerData.
    public func setManufacturerData(_ manufacturerId: Int, _ manufacturerData: [Int8]) -> Android.Bluetooth.LE.ScanFilter.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(manufacturerId))
        __args[1] = JNIType.toJava( value: manufacturerData, locals: &__locals )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setManufacturerData",
            methodSig: "(I[B)Landroid/bluetooth/le/ScanFilter$Builder;",
            methodCache: &type(of: self).setManufacturerData_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setManufacturerData",
                                                  methodSig: "(I[B)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setManufacturerData_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
    
    private static var setManufacturerData2_MethodID: jmethodID?
    
    /// Set filter on partial manufacture data.
    public func setManufacturerData(_ manufacturerId: Int, _ manufacturerData: [Int8], _ manufacturerDataMask: [Int8]) -> Android.Bluetooth.LE.ScanFilter.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = jvalue(i: jint(manufacturerId))
        __args[1] = JNIType.toJava( value: manufacturerData, locals: &__locals )
        __args[2] = JNIType.toJava( value: manufacturerDataMask, locals: &__locals )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setManufacturerData",
            methodSig: "(I[B[B)Landroid/bluetooth/le/ScanFilter$Builder;",
            methodCache: &type(of: self).setManufacturerData2_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setManufacturerData",
                                                  methodSig: "(I[B[B)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setManufacturerData2_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
    
    private static var setServiceData_MethodID: jmethodID?
    /**
     * Set filtering on service data.
     */
    public func setServiceData(serviceDataUuid: Android.OS.ParcelUuid, serviceData: [Int8]) -> Android.Bluetooth.LE.ScanFilter.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] =  JNIType.toJava( value: serviceDataUuid, locals: &__locals )
        __args[1] = JNIType.toJava( value: serviceData, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setServiceData",
                                                  methodSig: "(Landroid/os/ParcelUuid;[B)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setServiceData_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
    
    private static var setServiceData2_MethodID: jmethodID?
    /**
     * Set filtering on service data.
     */
    public func setServiceData(serviceDataUuid: Android.OS.ParcelUuid, serviceData: [Int8], serviceDataMask: [Int8]) -> Android.Bluetooth.LE.ScanFilter.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] =  JNIType.toJava( value: serviceDataUuid, locals: &__locals )
        __args[1] = JNIType.toJava( value: serviceData, locals: &__locals )
        __args[2] = JNIType.toJava( value: serviceDataMask, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setServiceData",
                                                  methodSig: "(Landroid/os/ParcelUuid;[B[B)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setServiceData2_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
    
    /// Set filter on partial service uuid.
    private static var setServiceUuuid_MethodID: jmethodID?
    public func setServiceUuuid(serviceUuid: Android.OS.ParcelUuid, uuidMask: Android.OS.ParcelUuid) -> Android.Bluetooth.LE.ScanFilter.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] =  JNIType.toJava( value: serviceUuid, locals: &__locals )
        __args[1] = JNIType.toJava( value: uuidMask, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setServiceUuid",
                                                  methodSig: "(Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setServiceUuuid_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
    
    /// Set filter on service uuid.
    private static var setServiceUuuid2_MethodID: jmethodID?
    public func setServiceUuuid(serviceUuid: Android.OS.ParcelUuid) -> Android.Bluetooth.LE.ScanFilter.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] =  JNIType.toJava( value: serviceUuid, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setServiceUuid",
                                                  methodSig: "(Landroid/os/ParcelUuid;)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setServiceUuuid2_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
}
