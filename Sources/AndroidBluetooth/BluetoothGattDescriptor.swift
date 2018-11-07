//
//  BluetoothGattDescriptor.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth {
    
    public typealias GattDescriptor = AndroidBluetoothGattDescriptor
}

public extension Android.Bluetooth.GattDescriptor {
    
    public typealias Permission = AndroidBluetoothPermission
}

/**
 * Represents a Bluetooth GATT Descriptor
 *
 * GATT Descriptors contain additional information and attributes of a GATT characteristic, BluetoothGattCharacteristic.
 * They can be used to describe the characteristic's features or to control certain behaviours of the characteristic.
 */
public final class AndroidBluetoothGattDescriptor: JavaObject {
    
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
    
    /**
     * Create a new BluetoothGattDescriptor.
     *
     * Requires BLUETOOTH permission.
     */
    public convenience init(uuid: java_util.UUID, permissions: Permission){
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: uuid, locals: &__locals),
            jvalue(i: jint(permissions.rawValue))
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
}

// MARK: Constants

public extension AndroidBluetoothGattDescriptor {
    
    /// Descriptor read permission
    internal static var PERMISSION_READ: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_READ",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_READ,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Descriptor permission: Allow encrypted read operations
    internal static var PERMISSION_READ_ENCRYPTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_READ_ENCRYPTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_READ_ENCRYPTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Descriptor permission: Allow reading with man-in-the-middle protection
    internal static var PERMISSION_READ_ENCRYPTED_MITM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_READ_ENCRYPTED_MITM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_READ_ENCRYPTED_MITM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Descriptor write permission
    internal static var PERMISSION_WRITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Descriptor permission: Allow encrypted writes
    internal static var PERMISSION_WRITE_ENCRYPTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE_ENCRYPTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE_ENCRYPTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Descriptor permission: Allow encrypted writes with man-in-the-middle protection
    internal static var PERMISSION_WRITE_ENCRYPTED_MITM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE_ENCRYPTED_MITM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE_ENCRYPTED_MITM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Descriptor permission: Allow signed write operations
    internal static var PERMISSION_WRITE_SIGNED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE_SIGNED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE_SIGNED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Descriptor permission: Allow signed write operations with man-in-the-middle protection
    internal static var PERMISSION_WRITE_SIGNED_MITM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PERMISSION_WRITE_SIGNED_MITM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PERMISSION_WRITE_SIGNED_MITM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Value used to disable notifications or indicatinos
    public static var DISABLE_NOTIFICATION_VALUE: [Int8] {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "DISABLE_NOTIFICATION_VALUE",
                fieldType: "[B",
                fieldCache: &JNICache.FieldID.DISABLE_NOTIFICATION_VALUE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )

            return JNIType.toSwift(type: [Int8].self, from: __value)!
        }
    }
    
    /// Value used to enable indication for a client configuration descriptor
    public static var ENABLE_INDICATION_VALUE: [Int8] {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ENABLE_INDICATION_VALUE",
                fieldType: "[B",
                fieldCache: &JNICache.FieldID.ENABLE_INDICATION_VALUE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return JNIType.toSwift(type: [Int8].self, from: __value)!
        }
    }
    
    /// Value used to enable notification for a client configuration descriptor
    public static var ENABLE_NOTIFICATION_VALUE: [Int8] {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ENABLE_NOTIFICATION_VALUE",
                fieldType: "[B",
                fieldCache: &JNICache.FieldID.ENABLE_NOTIFICATION_VALUE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return JNIType.toSwift(type: [Int8].self, from: __value)!
        }
    }
    
}

// MARK: Methods

public extension AndroidBluetoothGattDescriptor {
    
    /**
     * Returns the characteristic this descriptor belongs to.
     */
    public func getCharacteristic() -> Android.Bluetooth.GattCharacteristic {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getCharacteristic",
                                                  methodSig: "()Landroid/bluetooth/BluetoothGattCharacteristic;",
                                                  methodCache: &JNICache.MethodID.getCharacteristic,
                                                  args: &__args,
                                                  locals: &__locals)
        return Android.Bluetooth.GattCharacteristic(javaObject: __return)
    }
    
    /**
     * Returns the permissions for this descriptor.
     */
    public func getPermissions() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getPermissions",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getPermissions,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Returns the UUID of this descriptor.
     */
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
    
    /**
     * Returns the stored value for this descriptor
     *
     * This function returns the stored value for this descriptor as retrieved by calling readDescriptor(BluetoothGattDescriptor).
     */
    public func getValue() -> [Int8]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getValue",
                                                  methodSig: "()[B",
                                                  methodCache: &JNICache.MethodID.getValue,
                                                  args: &__args,
                                                  locals: &__locals)
        defer { JNI.DeleteLocalRef(__return) }
        
        return JNIType.toSwift( type: [Int8].self, from: __return )
    }
    
    public func setValue(_ value: [Int8]) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: value, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "setValue",
                                                   methodSig: "([B)Z",
                                                   methodCache: &JNICache.MethodID.setValue,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
}

// MARKL - Supporting type

public extension AndroidBluetoothGattDescriptor {
    
    public struct AndroidBluetoothPermission: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Descriptor read permission.
         */
        public static let read = AndroidBluetoothGattDescriptor.Permission(rawValue: AndroidBluetoothGattDescriptor.PERMISSION_READ)
        
        /**
         * Descriptor permission: Allow encrypted read operations.
         */
        public static let readEncrypted = AndroidBluetoothGattDescriptor.Permission(rawValue: AndroidBluetoothGattDescriptor.PERMISSION_READ_ENCRYPTED)
        
        /**
         * Descriptor permission: Allow reading with man-in-the-middle protection.
         */
        public static let readEncryptedMITM = AndroidBluetoothGattDescriptor.Permission(rawValue: AndroidBluetoothGattDescriptor.PERMISSION_READ_ENCRYPTED_MITM)
        
        /**
         * Descriptor permission: Allow encrypted read operations.
         */
        public static let write = AndroidBluetoothGattDescriptor.Permission(rawValue: AndroidBluetoothGattDescriptor.PERMISSION_WRITE)
        
        /**
         * Descriptor permission: Allow encrypted writes.
         */
        public static let writeEncrypted = AndroidBluetoothGattDescriptor.Permission(rawValue: AndroidBluetoothGattDescriptor.PERMISSION_WRITE_ENCRYPTED)
        
        /**
         * Descriptor permission: Allow encrypted writes with man-in-the-middle protection.
         */
        public static let writeEncryptedMITM = AndroidBluetoothGattDescriptor.Permission(rawValue: AndroidBluetoothGattDescriptor.PERMISSION_WRITE_ENCRYPTED_MITM)
        
        
        /**
         * Descriptor permission: Allow signed write operations.
         */
        public static let writeSigned = AndroidBluetoothGattDescriptor.Permission(rawValue: AndroidBluetoothGattDescriptor.PERMISSION_WRITE_SIGNED)
        
        /**
         * Descriptor permission: Allow signed write operations with man-in-the-middle protection.
         */
        public static let writeSignedMITM = AndroidBluetoothGattDescriptor.Permission(rawValue: AndroidBluetoothGattDescriptor.PERMISSION_WRITE_SIGNED_MITM)
    }
    
}

// MARK: - JNICache

internal extension AndroidBluetoothGattDescriptor {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGattDescriptor"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var PERMISSION_READ: jfieldID?
            static var PERMISSION_READ_ENCRYPTED: jfieldID?
            static var PERMISSION_READ_ENCRYPTED_MITM: jfieldID?
            static var PERMISSION_WRITE: jfieldID?
            static var PERMISSION_WRITE_ENCRYPTED: jfieldID?
            static var PERMISSION_WRITE_ENCRYPTED_MITM: jfieldID?
            static var PERMISSION_WRITE_SIGNED: jfieldID?
            static var PERMISSION_WRITE_SIGNED_MITM: jfieldID?
            static var DISABLE_NOTIFICATION_VALUE: jfieldID?
            static var ENABLE_INDICATION_VALUE: jfieldID?
            static var ENABLE_NOTIFICATION_VALUE: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method: jmethodID?
            static var getCharacteristic: jmethodID?
            static var getPermissions: jmethodID?
            static var getUuid: jmethodID?
            static var getValue: jmethodID?
            static var setValue: jmethodID?
        }
    }
}

