//
//  BluetoothClass.swift
//  Android
//
//  Created by Marco Estrella on 6/6/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth {
    
    public typealias Class = AndroidBluetoothClass
}

/**
 * Represents a Bluetooth class, which describes general characteristics and capabilities of a device. For example, a
 * Bluetooth class will specify the general device type such as a phone, a computer, or headset, and whether
 * it's capable of services such as audio or telephony.
 *
 * Every Bluetooth class is composed of zero or more service classes, and exactly one device class. The device class is
 * further broken down into major and minor device class components.
 *
 * BluetoothClass is useful as a hint to roughly describe a device (for example to show an icon in the UI), but does not
 * reliably describe which Bluetooth profiles or services are actually supported by a device. Accurate service discovery is
 * done through SDP requests, which are automatically performed when creating an RFCOMM socket with
 * BluetoothDevice.createRfcommSocketToServiceRecord(UUID) and BluetoothAdapter.listenUsingRfcommWithServiceRecord(String, UUID)
 *
 * Use BluetoothDevice.getBluetoothClass() to retrieve the class for a remote device.
 */
public final class AndroidBluetoothClass: JavaObject {
    
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

// MARK: - Methods

public extension AndroidBluetoothClass {
    
    /**
     * Describe the kinds of special objects contained in this Parcelable instance's marshaled representation.
     */
    func describeContents() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "describeContents",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.describeContents,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Indicates whether some other object is "equal to" this one.
     */
    public func equals(object: Android.Bluetooth.Class) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: object, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "equals",
                                                   methodSig: "(Landroid/bluetooth/BluetoothClass;)Z",
                                                   methodCache: &JNICache.MethodID.equals,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return the (major and minor) device class component of this BluetoothClass.
     */
    func getDeviceClass() -> Android.Bluetooth.Class.Device {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getDeviceClass",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getDeviceClass,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.Class.Device(rawValue: Int(__return))
    }
    
    /**
     * Return the major device class component of this BluetoothClass.
     */
    func getMajorDeviceClass() -> Android.Bluetooth.Class.Device.Major {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getMajorDeviceClass",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getMajorDeviceClass,
                                               args: &__args,
                                               locals: &__locals)
        return Android.Bluetooth.Class.Device.Major(rawValue: Int(__return))
    }
    
    /**
     * Return true if the specified service class is supported by this BluetoothClass.
     */
    public func hasService(service: Android.Bluetooth.Class.Service) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(service.rawValue))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "hasService",
                                                   methodSig: "(I)Z",
                                                   methodCache: &JNICache.MethodID.hasService,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: - JNI

private extension Android.Bluetooth.Class {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/BluetoothClass"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var describeContents: jmethodID?
            static var equals: jmethodID?
            static var getDeviceClass: jmethodID?
            static var getMajorDeviceClass: jmethodID?
            static var hasService: jmethodID?
        }
    }
}

