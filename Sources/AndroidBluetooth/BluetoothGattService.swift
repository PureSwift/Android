//
//  BluetoothGattService.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth {
    
    public typealias GattService = AndroidBluetoothGattService
}

public extension Android.Bluetooth.GattService {
    
    public typealias ServiceType = AndroidBluetootServiceType
}

/**
 * Represents a Bluetooth GATT Service
 *
 * Gatt Service contains a collection of BluetoothGattCharacteristic, as well as referenced services.
 */
public final class AndroidBluetoothGattService: JavaObject {
    
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
    
    /**
     * Create a new BluetoothGattService.
     *
     * Requires BLUETOOTH permission.
     */
    public convenience init(uuid: java_util.UUID, serviceType: ServiceType){
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: uuid, locals: &__locals),
            jvalue(i: jint(serviceType.rawValue))
        ]
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Ljava/util/UUID;I)V",
            methodCache: &JNICache.MethodID.init_method,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    internal var mCharacteristics: java_util.List? {
        get {
            let __value = JNIField.GetObjectField(fieldName: "mCharacteristics",
                                                  fieldType: "L",
                                                  fieldCache: &JNICache.FieldID.mCharacteristics,
                                                  object: javaObject)
            defer { JNI.DeleteLocalRef(__value) }
            
            return java_util.ListForward(javaObject: __value)
        }
    }
    
    internal var mIncludedServices: java_util.List? {
        get {
            let __value = JNIField.GetObjectField(fieldName: "mIncludedServices",
                                                  fieldType: "L",
                                                  fieldCache: &JNICache.FieldID.mIncludedServices,
                                                  object: javaObject)
            defer { JNI.DeleteLocalRef(__value) }
            
            return java_util.ListForward(javaObject: __value)
        }
    }
}

// MARK: Constants

public extension AndroidBluetoothGattService {
    
    /// RFCOMM socket
    internal static var SERVICE_TYPE_PRIMARY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SERVICE_TYPE_PRIMARY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SERVICE_TYPE_PRIMARY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// RFCOMM socket
    internal static var SERVICE_TYPE_SECONDARY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SERVICE_TYPE_SECONDARY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SERVICE_TYPE_SECONDARY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: Methods

public extension AndroidBluetoothGattService {
    
    public func addCharacteristic(characteristic: Android.Bluetooth.GattCharacteristic) -> Bool {
        
        var __locals = [jobject]()
        
        var __args:[jvalue] = [
            JNIType.toJava(value: characteristic, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "addCharacteristic",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattCharacteristic;)Z",
                                                   methodCache: &JNICache.MethodID.addCharacteristic,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func addService(service: Android.Bluetooth.GattService) -> Bool {
        
        var __locals = [jobject]()
        
        var __args:[jvalue] = [
            JNIType.toJava(value: service, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "addCharacteristic",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattService;)Z",
                                                   methodCache: &JNICache.MethodID.addService,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    public func getCharacteristic(uuid: java_util.UUID) -> Android.Bluetooth.GattCharacteristic {
        
        var __locals = [jobject]()
        
        var __args:[jvalue] = [
            JNIType.toJava(value: uuid, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                   methodName: "getCharacteristic",
                                                   methodSig: "(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;",
                                                   methodCache: &JNICache.MethodID.getCharacteristic,
                                                   args: &__args,
                                                   locals: &__locals)
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Bluetooth.GattCharacteristic(javaObject: __return)
    }
    
    public func getCharacteristics() -> [Android.Bluetooth.GattCharacteristic] {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getCharacteristics",
                                                  methodSig: "()Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getCharacteristics,
                                                  args: &__args,
                                                  locals: &__locals)
        defer { JNI.DeleteLocalRef(__return) }
        
        if(__return == nil){
            return []
        }
        
        let arrayListCharacteristics = ArrayList(javaObject: __return)
        
        if(arrayListCharacteristics.size() == 0){
            return []
        }
        
        var swiftCharacteristics = [Android.Bluetooth.GattCharacteristic]()
        
        arrayListCharacteristics.forEach { item in
            let characteristic = Android.Bluetooth.GattCharacteristic(javaObject: item.javaObject)
            swiftCharacteristics.append(characteristic)
        }
        
        return swiftCharacteristics
    }
    
    public func getIncludedServices() -> java_util.List? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getIncludedServices",
                                                  methodSig: "()Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getIncludedServices,
                                                  args: &__args,
                                                  locals: &__locals)
        defer { JNI.DeleteLocalRef(__return) }
        
        return java_util.ListForward(javaObject: __return)
    }
    
    public func getInstanceId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                   methodName: "getInstanceId",
                                                   methodSig: "()I",
                                                   methodCache: &JNICache.MethodID.getInstanceId,
                                                   args: &__args,
                                                   locals: &__locals)
        return Int(__return)
    }
    
    public func getType() -> Android.Bluetooth.GattService.ServiceType {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getType",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getType,
                                               args: &__args,
                                               locals: &__locals)
        
        return Android.Bluetooth.GattService.ServiceType(rawValue: Int(__return))
    }
    
    public func getUuid() -> java_util.UUID {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                               methodName: "getUuid",
                                               methodSig: "()Ljava/util/UUID;",
                                               methodCache: &JNICache.MethodID.getUuid,
                                               args: &__args,
                                               locals: &__locals)
        defer { JNI.DeleteLocalRef(__return) }
        
        return java_util.UUID(javaObject: __return)
    }
}

// MARK: - Supportinh types

public extension AndroidBluetoothGattService {
    
    /// LE Secondary Phy
    public struct AndroidBluetootServiceType: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Primary service.
         */
        public static let primary = AndroidBluetoothGattService.ServiceType(rawValue: AndroidBluetoothGattService.SERVICE_TYPE_PRIMARY)
        
        /**
         * Secondary service (included by primary services).
         */
        public static let secondary = AndroidBluetoothGattService.ServiceType(rawValue: AndroidBluetoothGattService.SERVICE_TYPE_SECONDARY)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothGattService {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGattService"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var SERVICE_TYPE_PRIMARY: jfieldID?
            static var SERVICE_TYPE_SECONDARY: jfieldID?
            
            static var mCharacteristics: jfieldID?
            static var mIncludedServices: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method: jmethodID?
            static var addCharacteristic: jmethodID?
            static var addService: jmethodID?
            static var getCharacteristic: jmethodID?
            static var getCharacteristics: jmethodID?
            static var getIncludedServices: jmethodID?
            static var getInstanceId: jmethodID?
            static var getType: jmethodID?
            static var getUuid: jmethodID?
        }
    }
}


