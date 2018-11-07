//
//  BluetoothGattCharacteristic.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth {
    
    public typealias GattCharacteristic = AndroidBluetoothGattCharacteristic
}

public extension Android.Bluetooth.GattCharacteristic {
    
    public typealias FormatType = AndroidBluetoothFormatType
    public typealias Permission = AndroidBluetoothPermission
    public typealias Property = AndroidBluetoothProperty
    public typealias WriteType = AndroidBluetoothWriteType
}


/**
 * Represents a Bluetooth GATT Characteristic
 *
 * A GATT characteristic is a basic data element used to construct a GATT service, BluetoothGattService. The characteristic contains a value
 * as well as additional information and optional GATT descriptors, BluetoothGattDescriptor.
 */
public final class AndroidBluetoothGattCharacteristic: JavaObject {
    
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

// MARK: Constants

public extension AndroidBluetoothGattCharacteristic {
    
    /// Characteristic value format type float (32-bit float)
    internal static var FORMAT_FLOAT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_FLOAT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_FLOAT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type sfloat (16-bit float)
    internal static var FORMAT_SFLOAT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_SFLOAT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_SFLOAT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type sint16
    internal static var FORMAT_SINT16: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_SINT16",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_SINT16,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type sint32
    internal static var FORMAT_SINT32: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_SINT32",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_SINT32,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type sint8
    internal static var FORMAT_SINT8: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_SINT8",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_SINT8,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type uint16
    internal static var FORMAT_UINT16: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_UINT16",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_UINT16,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type uint32
    internal static var FORMAT_UINT32: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_UINT32",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_UINT32,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic value format type uint8
    internal static var FORMAT_UINT8: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FORMAT_UINT8",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FORMAT_UINT8,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic read permission
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
    
    /// Characteristic permission: Allow encrypted read operations
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
    
    /// Characteristic permission: Allow reading with man-in-the-middle protection
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
    
    /// Characteristic write permission
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
    
    /// Characteristic permission: Allow encrypted writes
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
    
    /// Characteristic permission: Allow encrypted writes with man-in-the-middle protection
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
    
    /// Characteristic permission: Allow signed write operations
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
    
    /// Characteristic permission: Allow signed write operations with man-in-the-middle protection.
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
    
    /// Characteristic proprty: Characteristic is broadcastable.
    internal static var PROPERTY_BROADCAST: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_BROADCAST",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_BROADCAST,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic has extended properties.
    internal static var PROPERTY_EXTENDED_PROPS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_EXTENDED_PROPS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_EXTENDED_PROPS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic supports indication.
    internal static var PROPERTY_INDICATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_INDICATE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_INDICATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic supports notification.
    internal static var PROPERTY_NOTIFY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_NOTIFY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_NOTIFY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic is readable.
    internal static var PROPERTY_READ: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_READ",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_READ,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic supports write with signature.
    internal static var PROPERTY_SIGNED_WRITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_SIGNED_WRITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_SIGNED_WRITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic can be written.
    internal static var PROPERTY_WRITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_WRITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_WRITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Characteristic property: Characteristic can be written without response.
    internal static var PROPERTY_WRITE_NO_RESPONSE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PROPERTY_WRITE_NO_RESPONSE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PROPERTY_WRITE_NO_RESPONSE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Write characteristic, requesting acknoledgement by the remote device.
    internal static var WRITE_TYPE_DEFAULT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WRITE_TYPE_DEFAULT",                fieldType: "I",
                fieldCache: &JNICache.FieldID.WRITE_TYPE_DEFAULT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Write characteristic without requiring a response by the remote device
    internal static var WRITE_TYPE_NO_RESPONSE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WRITE_TYPE_NO_RESPONSE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WRITE_TYPE_NO_RESPONSE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Write characteristic including authentication signature.
    internal static var WRITE_TYPE_SIGNED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WRITE_TYPE_SIGNED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WRITE_TYPE_SIGNED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: Methods

public extension AndroidBluetoothGattCharacteristic {
    
    /**
     * Adds a descriptor to this characteristic.
     */
    public func addDescriptor(descriptor: Android.Bluetooth.GattDescriptor) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: descriptor, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "addDescriptor",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattDescriptor;)Z",
                                                   methodCache: &JNICache.MethodID.addDescriptor,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns a descriptor with a given UUID out of the list of descriptors for this characteristic.
     */
    public func getDescriptor(uuid: java_util.UUID) -> Android.Bluetooth.GattDescriptor? {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: uuid, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getDescriptor",
                                                  methodSig: "(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattDescriptor;",
                                                  methodCache: &JNICache.MethodID.getDescriptor,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return __return != nil ? Android.Bluetooth.GattDescriptor(javaObject: __return) : nil
    }
    
    /**
     * Returns a list of descriptors for this characteristic.
     */
    public func getDescriptors() -> List? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getDescriptors",
                                                  methodSig: "()Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getDescriptors,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return ListForward(javaObject: __return)
    }
    
    /**
     * Return the stored value of this characteristic.
     */
    public func getFloatValue(formatType: FormatType, offset: Int) -> Float {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(formatType.rawValue)),
            jvalue(i: jint(offset))
        ]
        
        let __return = JNIMethod.CallFloatMethod(object: javaObject,
                                                 methodName: "getFloatValue",
                                                 methodSig: "(II)F",
                                                 methodCache: &JNICache.MethodID.getFloatValue,
                                                 args: &__args,
                                                 locals: &__locals)
        return __return
    }
    
    /**
     * Returns the instance ID for this characteristic.
     */
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
    
    /**
     * Return the stored value of this characteristic.
     *
     * The formatType parameter determines how the characteristic value is to be interpreted. For example,
     * settting formatType to FORMAT_UINT16 specifies that the first two bytes of the characteristic value
     * at the given offset are interpreted to generate the return value.
     */
    public func getIntValue(formatType: FormatType, offset: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(formatType.rawValue)),
            jvalue(i: jint(offset))
        ]
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getIntValue",
                                               methodSig: "(II)I",
                                               methodCache: &JNICache.MethodID.getIntValue,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Returns the permissions for this characteristic.
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
     * Returns the properties of this characteristic.
     *
     * The properties contain a bit mask of property flags indicating the features of this characteristic.
     */
    public func getProperties() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getProperties",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getProperties,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Returns the service this characteristic belongs to.
     */
    public func getService() -> Android.Bluetooth.GattService {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getService",
                                                  methodSig: "()Landroid/bluetooth/BluetoothGattService;",
                                                  methodCache: &JNICache.MethodID.getService,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Bluetooth.GattService(javaObject: __return)
    }
    
    /**
     * Return the stored value of this characteristic.
     */
    public func getStringValue(offSet: Int) -> String {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(offSet))
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getStringValue",
                                                  methodSig: "(I)Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getStringValue,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return String(javaObject: __return)
    }
    
    /**
     * Returns the UUID of this characteristic.
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
     * Get the stored value for this characteristic.
     *
     * This function returns the stored value for this characteristic as retrieved by calling readCharacteristic(BluetoothGattCharacteristic).
     * The cached value of the characteristic is updated as a result of a read characteristic operation or if a characteristic update notification has been received.
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
        
        if __return != nil {
            
            guard let from: jobject = __return
                else { return nil }
            
            defer { JNI.DeleteLocalRef( from ) }
            
            let length: jsize = JNI.api.GetArrayLength( JNI.env, from )
            
            if length == 0 { return [] }
            
            var value = [Int8]( repeating: Int8(), count: Int(length) )
            
            withUnsafeMutablePointer(to: &value[0]) { valuePtr in
                JNI.api.GetByteArrayRegion( JNI.env, from, 0, length, valuePtr )
            }
            
            return value
        } else {
            
            return nil
        }
    }
    
    /**
     * Gets the write type for this characteristic.
     */
    public func getWriteType() -> WriteType {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getWriteType",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getWriteType,
                                               args: &__args,
                                               locals: &__locals)
        return WriteType(rawValue: Int(__return))
    }
    
    /**
     * Set the locally stored value of this characteristic.
     *
     * See setValue(byte[]) for details.
     */
    public func setValue(value: String) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: value, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "setValue",
                                                   methodSig: "(Ljava/lang/String;)Z",
                                                   methodCache: &JNICache.MethodID.setValue,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Set the locally stored value of this characteristic.
     *
     * See setValue(byte[]) for details.
     */
    public func setValue(value: Int, formatType: FormatType, offset: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(value)),
            jvalue(i: jint(formatType.rawValue)),
            jvalue(i: jint(offset))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "setValue",
                                                   methodSig: "(III)Z",
                                                   methodCache: &JNICache.MethodID.setValue2,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Updates the locally stored value of this characteristic.
     *
     * This function modifies the locally stored cached value of this characteristic. To send the value to the remote device,
     * call writeCharacteristic(BluetoothGattCharacteristic) to send the value to the remote device.
     */
    public func setValue(value: [Int8]) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: value, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "setValue",
                                                   methodSig: "([B)Z",
                                                   methodCache: &JNICache.MethodID.setValue3,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Set the locally stored value of this characteristic.
     *
     * See setValue(byte[]) for details.
     */
    public func setValue(mantissa: Int, exponent: Int, formatType: FormatType, offset: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(mantissa)),
            jvalue(i: jint(exponent)),
            jvalue(i: jint(formatType.rawValue)),
            jvalue(i: jint(offset))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "setValue",
                                                   methodSig: "(IIII)Z",
                                                   methodCache: &JNICache.MethodID.setValue4,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Set the write type for this characteristic
     *
     * Setting the write type of a characteristic determines how the writeCharacteristic(BluetoothGattCharacteristic) function write this characteristic.
     */
    public func setWriteType(writeType: WriteType) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(writeType.rawValue))
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setWriteType",
                                 methodSig: "(I)V",
                                 methodCache: &JNICache.MethodID.setWriteType,
                                 args: &__args,
                                 locals: &__locals)
    }
}

// MARK: - Supporting types

public extension AndroidBluetoothGattCharacteristic {
    
    public struct AndroidBluetoothPermission: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int){
            self.rawValue = rawValue
        }
        
        /**
         * Characteristic read permission.
         */
        public static let read = AndroidBluetoothGattCharacteristic.Permission(rawValue: AndroidBluetoothGattCharacteristic.PERMISSION_READ)
        
        /**
         * Characteristic permission: Allow encrypted read operations.
         */
        public static let readEncrypted = AndroidBluetoothGattCharacteristic.Permission(rawValue: AndroidBluetoothGattCharacteristic.PERMISSION_READ_ENCRYPTED)
        
        /**
         * Characteristic permission: Allow reading with man-in-the-middle protection.
         */
        public static let readEncryptedMITM = AndroidBluetoothGattCharacteristic.Permission(rawValue: AndroidBluetoothGattCharacteristic.PERMISSION_READ_ENCRYPTED_MITM)
        
        /**
         * Characteristic write permission.
         */
        public static let write = AndroidBluetoothGattCharacteristic.Permission(rawValue: AndroidBluetoothGattCharacteristic.PERMISSION_WRITE)
        
        /**
         * Characteristic permission: Allow encrypted writes.
         */
        public static let writeEncrypted = AndroidBluetoothGattCharacteristic.Permission(rawValue: AndroidBluetoothGattCharacteristic.PERMISSION_WRITE_ENCRYPTED)
        
        /**
         * Characteristic permission: Allow encrypted writes with man-in-the-middle protection.
         */
        public static let writeEncryptedMITM = AndroidBluetoothGattCharacteristic.Permission(rawValue: AndroidBluetoothGattCharacteristic.PERMISSION_WRITE_ENCRYPTED_MITM)
        
        /**
         * Characteristic permission: Allow signed write operations.
         */
        public static let writeSigned = AndroidBluetoothGattCharacteristic.Permission(rawValue: AndroidBluetoothGattCharacteristic.PERMISSION_WRITE_SIGNED)
        
        /**
         * Characteristic permission: Allow signed write operations with man-in-the-middle protection.
         */
        public static let writeSignedMITM = AndroidBluetoothGattCharacteristic.Permission(rawValue: AndroidBluetoothGattCharacteristic.PERMISSION_WRITE_SIGNED_MITM)
    }
    
    public struct AndroidBluetoothProperty: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int){
            self.rawValue = rawValue
        }
        
        /**
         * Characteristic proprty: Characteristic is broadcastable.
         */
        public static let broadcast = AndroidBluetoothGattCharacteristic.Property(rawValue: AndroidBluetoothGattCharacteristic.PROPERTY_BROADCAST)
        
        /**
         * Characteristic property: Characteristic has extended properties.
         */
        public static let extendedProps = AndroidBluetoothGattCharacteristic.Property(rawValue: AndroidBluetoothGattCharacteristic.PROPERTY_EXTENDED_PROPS)
        
        /**
         * Characteristic property: Characteristic supports indication.
         */
        public static let indicate = AndroidBluetoothGattCharacteristic.Property(rawValue: AndroidBluetoothGattCharacteristic.PROPERTY_INDICATE)
        
        /**
         * Characteristic property: Characteristic supports notification.
         */
        public static let notify = AndroidBluetoothGattCharacteristic.Property(rawValue: AndroidBluetoothGattCharacteristic.PROPERTY_NOTIFY)
        
        /**
         * Characteristic property: Characteristic is readable.
         */
        public static let read = AndroidBluetoothGattCharacteristic.Property(rawValue: AndroidBluetoothGattCharacteristic.PROPERTY_READ)
        
        /**
         * Characteristic property: Characteristic supports write with signature.
         */
        public static let signedWrite = AndroidBluetoothGattCharacteristic.Property(rawValue: AndroidBluetoothGattCharacteristic.PROPERTY_SIGNED_WRITE)
        
        /**
         * Characteristic property: Characteristic can be written.
         */
        public static let write = AndroidBluetoothGattCharacteristic.Property(rawValue: AndroidBluetoothGattCharacteristic.PROPERTY_WRITE)
        
        /**
         * Characteristic property: Characteristic can be written without response.
         */
        public static let writeNoResponse = AndroidBluetoothGattCharacteristic.Property(rawValue: AndroidBluetoothGattCharacteristic.PROPERTY_WRITE_NO_RESPONSE)
    }
    
    public struct AndroidBluetoothWriteType: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int){
            self.rawValue = rawValue
        }
        
        /**
         * Write characteristic, requesting acknoledgement by the remote device.
         */
        public static let `default` = AndroidBluetoothGattCharacteristic.WriteType(rawValue: AndroidBluetoothGattCharacteristic.WRITE_TYPE_DEFAULT)
        
        /**
         * Write characteristic without requiring a response by the remote device.
         */
        public static let noResponse = AndroidBluetoothGattCharacteristic.WriteType(rawValue: AndroidBluetoothGattCharacteristic.WRITE_TYPE_NO_RESPONSE)
        
        /**
         * Write characteristic including authentication signature.
         */
        public static let signed = AndroidBluetoothGattCharacteristic.WriteType(rawValue: AndroidBluetoothGattCharacteristic.WRITE_TYPE_SIGNED)
    }
    
    public struct AndroidBluetoothFormatType: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int){
            self.rawValue = rawValue
        }
        
        /**
         * Characteristic value format type float (32-bit float).
         */
        public static let float = AndroidBluetoothGattCharacteristic.FormatType(rawValue: AndroidBluetoothGattCharacteristic.FORMAT_FLOAT)
        
        /**
         * Characteristic value format type sfloat (16-bit float).
         */
        public static let sfloat = AndroidBluetoothGattCharacteristic.FormatType(rawValue: AndroidBluetoothGattCharacteristic.FORMAT_SFLOAT)
        
        /**
         * Characteristic value format type sint16.
         */
        public static let sInt16 = AndroidBluetoothGattCharacteristic.FormatType(rawValue: AndroidBluetoothGattCharacteristic.FORMAT_SINT16)
        
        /**
         * Characteristic value format type sint32.
         */
        public static let sInt32 = AndroidBluetoothGattCharacteristic.FormatType(rawValue: AndroidBluetoothGattCharacteristic.FORMAT_SINT32)
        
        /**
         * Characteristic value format type sint8.
         */
        public static let sInt8 = AndroidBluetoothGattCharacteristic.FormatType(rawValue: AndroidBluetoothGattCharacteristic.FORMAT_SINT8)
        
        /**
         * Characteristic value format type uint16.
         */
        public static let uInt16 = AndroidBluetoothGattCharacteristic.FormatType(rawValue: AndroidBluetoothGattCharacteristic.FORMAT_UINT16)
        
        /**
         * Characteristic value format type uint32.
         */
        public static let uInt32 = AndroidBluetoothGattCharacteristic.FormatType(rawValue: AndroidBluetoothGattCharacteristic.FORMAT_UINT32)
        
        /**
         * Characteristic value format type uint8.
         */
        public static let uInt8 = AndroidBluetoothGattCharacteristic.FormatType(rawValue: AndroidBluetoothGattCharacteristic.FORMAT_UINT8)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothGattCharacteristic {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGattCharacteristic"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var FORMAT_FLOAT: jfieldID?
            static var FORMAT_SFLOAT: jfieldID?
            static var FORMAT_SINT16: jfieldID?
            static var FORMAT_SINT32: jfieldID?
            static var FORMAT_SINT8: jfieldID?
            static var FORMAT_UINT16: jfieldID?
            static var FORMAT_UINT32: jfieldID?
            static var FORMAT_UINT8: jfieldID?
            static var PERMISSION_READ: jfieldID?
            static var PERMISSION_READ_ENCRYPTED: jfieldID?
            static var PERMISSION_READ_ENCRYPTED_MITM: jfieldID?
            static var PERMISSION_WRITE: jfieldID?
            static var PERMISSION_WRITE_ENCRYPTED: jfieldID?
            static var PERMISSION_WRITE_ENCRYPTED_MITM: jfieldID?
            static var PERMISSION_WRITE_SIGNED: jfieldID?
            static var PERMISSION_WRITE_SIGNED_MITM: jfieldID?
            static var PROPERTY_BROADCAST: jfieldID?
            static var PROPERTY_EXTENDED_PROPS: jfieldID?
            static var PROPERTY_INDICATE: jfieldID?
            static var PROPERTY_NOTIFY: jfieldID?
            static var PROPERTY_READ: jfieldID?
            static var PROPERTY_SIGNED_WRITE: jfieldID?
            static var PROPERTY_WRITE: jfieldID?
            static var PROPERTY_WRITE_NO_RESPONSE: jfieldID?
            static var WRITE_TYPE_DEFAULT: jfieldID?
            static var WRITE_TYPE_NO_RESPONSE: jfieldID?
            static var WRITE_TYPE_SIGNED: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var addDescriptor: jmethodID?
            static var getDescriptor: jmethodID?
            static var getDescriptors: jmethodID?
            static var getFloatValue: jmethodID?
            static var getInstanceId: jmethodID?
            static var getIntValue: jmethodID?
            static var getPermissions: jmethodID?
            static var getProperties: jmethodID?
            static var getService: jmethodID?
            static var getStringValue: jmethodID?
            static var getUuid: jmethodID?
            static var getValue: jmethodID?
            static var getWriteType: jmethodID?
            static var setValue: jmethodID?
            static var setValue2: jmethodID?
            static var setValue3: jmethodID?
            static var setValue4: jmethodID?
            static var setWriteType: jmethodID?
        }
    }
}

