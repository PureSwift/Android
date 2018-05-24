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

public extension Android.Bluetooth.LE.ScanFilter {
    
    public typealias Builder = AndroidBluetoothLowEnergyScanFilterBuilder
}

public final class AndroidBluetoothLowEnergyScanFilter: JavaObject {
    
    fileprivate static let javaClassName = "android/bluetooth/le/ScanFilter"
    
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
            className: type(of: self).javaClassName,
            classCache: &type(of: self).JNIClass,
            methodSig: "()V",
            methodCache: &type(of: self).new_MethodID_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    private static var SCAN_MODE_BALANCED_MethodID: jmethodID?
    
    internal static var SCAN_MODE_BALANCED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_MODE_BALANCED",
                fieldType: "I",
                fieldCache: &SCAN_MODE_BALANCED_MethodID,
                className: javaClassName,
                classCache: &JNIClass )
            
            return Int(__value)
        }
    }
}

// MARK: - Builder

public final class AndroidBluetoothLowEnergyScanFilterBuilder: JavaObject {
    
    private static let javaClassName = Android.Bluetooth.LE.ScanFilter.javaClassName + "$Builder"
    
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
            methodSig: "(Ljava/lang/String;)Landroid/bluetooth/le/ScanFilter$Builder;",
            methodCache: &type(of: self).setManufacturerData_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setManufacturerData",
                                                  methodSig: "(Ljava/lang/String;)Landroid/bluetooth/le/ScanFilter$Builder;",
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
            methodSig: "(Ljava/lang/String;)Landroid/bluetooth/le/ScanFilter$Builder;",
            methodCache: &type(of: self).setManufacturerData2_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setManufacturerData",
                                                  methodSig: "(Ljava/lang/String;)Landroid/bluetooth/le/ScanFilter$Builder;",
                                                  methodCache: &type(of: self).setManufacturerData2_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanFilterBuilder(javaObject: __return)
    }
}
