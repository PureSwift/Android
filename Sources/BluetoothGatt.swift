//
//  BluetoothGatt.swift
//  Android
//
//  Created by Marco Estrella on 6/1/18.
//

import Foundation
import Bluetooth
import java_swift
import java_util

public extension Android.Bluetooth {
    
    public typealias Gatt = AndroidBluetoothGatt
}

/**
 * Public API for the Bluetooth GATT Profile.
 *
 * This class provides Bluetooth GATT functionality to enable communication with Bluetooth Smart or Smart Ready devices.
 *
 * To connect to a remote peripheral device, create a BluetoothGattCallback and call connectGatt(Context, boolean, BluetoothGattCallback) to
 * get a instance of this class. GATT capable devices can be discovered using the Bluetooth device discovery or BLE scan process.
 */
public final class AndroidBluetoothGatt: JavaObject {
    
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

// Mark: - Constants

internal extension AndroidBluetoothGatt {
    
    /// Connection paramter update - Use the connection paramters recommended by the Bluetooth SIG.
    internal static var CONNECTION_PRIORITY_BALANCED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CONNECTION_PRIORITY_BALANCED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CONNECTION_PRIORITY_BALANCED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Connection paramter update - Request a high priority, low latency connection.
    internal static var CONNECTION_PRIORITY_HIGH: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CONNECTION_PRIORITY_HIGH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CONNECTION_PRIORITY_HIGH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Connection paramter update - Request low power, reduced data rate connection parameters.
    internal static var CONNECTION_PRIORITY_LOW_POWER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "CONNECTION_PRIORITY_LOW_POWER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.CONNECTION_PRIORITY_LOW_POWER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// A remote device connection is congested.
    internal static var GATT_CONNECTION_CONGESTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_CONNECTION_CONGESTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_CONNECTION_CONGESTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Insufficient authentication for a given operation.
    internal static var GATT_INSUFFICIENT_AUTHENTICATION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_INSUFFICIENT_AUTHENTICATION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_INSUFFICIENT_AUTHENTICATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Insufficient encryption for a given operation.
    internal static var GATT_INSUFFICIENT_ENCRYPTION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_INSUFFICIENT_ENCRYPTION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_INSUFFICIENT_ENCRYPTION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// A write operation exceeds the maximum length of the attribute
    internal static var GATT_INVALID_ATTRIBUTE_LENGTH: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_INVALID_ATTRIBUTE_LENGTH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_INVALID_ATTRIBUTE_LENGTH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// A read or write operation was requested with an invalid offset.
    internal static var GATT_INVALID_OFFSET: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_INVALID_OFFSET",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_INVALID_OFFSET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// GATT read operation is not permitted.
    internal static var GATT_READ_NOT_PERMITTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_READ_NOT_PERMITTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_READ_NOT_PERMITTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// The given request is not supported.
    internal static var GATT_REQUEST_NOT_SUPPORTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_REQUEST_NOT_SUPPORTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_REQUEST_NOT_SUPPORTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// A GATT operation completed successfully.
    internal static var GATT_SUCCESS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_SUCCESS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_SUCCESS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// GATT write operation is not permitted.
    internal static var GATT_WRITE_NOT_PERMITTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_WRITE_NOT_PERMITTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_WRITE_NOT_PERMITTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// Mark: - Methods

public extension AndroidBluetoothGatt {
    
    /**
     * Cancels a reliable write transaction for a given device.
     */
    public func abortReliableWrite() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                   methodName: "abortReliableWrite",
                                   methodSig: "()V",
                                   methodCache: &JNICache.MethodID.abortReliableWrite,
                                   args: &__args,
                                   locals: &__locals)
    }
    
    /**
     * Initiates a reliable write transaction for a given remote device.
     */
    public func beginReliableWrite() -> Bool {
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                 methodName: "beginReliableWrite",
                                 methodSig: "()Z",
                                 methodCache: &JNICache.MethodID.beginReliableWrite,
                                 args: &__args,
                                 locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Close this Bluetooth GATT client.
     */
    public func close() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "close",
                                 methodSig: "()V",
                                 methodCache: &JNICache.MethodID.close,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Close this Bluetooth GATT client.
     */
    public func connect() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                 methodName: "connect",
                                 methodSig: "()Z",
                                 methodCache: &JNICache.MethodID.connect,
                                 args: &__args,
                                 locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Disconnects an established connection, or cancels a connection attempt currently in progress.
     */
    public func disconnect() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "disconnect",
                                 methodSig: "()V",
                                 methodCache: &JNICache.MethodID.disconnect,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Discovers services offered by a remote device as well as their characteristics and descriptors.
     */
    public func discoverServices() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "discoverServices",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.discoverServices,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Executes a reliable write transaction for a given remote device.
     */
    public func executeReliableWrite() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "executeReliableWrite",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.executeReliableWrite,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return the remote bluetooth device this GATT client targets to.
     */
    public func getDevice() -> Android.Bluetooth.Device {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                   methodName: "getDevice",
                                                   methodSig: "()Landroid/bluetooth/BluetoothDevice;",
                                                   methodCache: &JNICache.MethodID.getDevice,
                                                   args: &__args,
                                                   locals: &__locals)
        
        return Android.Bluetooth.Device(javaObject: __return)
    }
    
    /**
     * Returns a BluetoothGattService, if the requested UUID is supported by the remote device.
     */
    public func getService(uuid: java_util.UUID) -> Android.Bluetooth.GattService {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: uuid, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getService",
                                                  methodSig: "()Landroid/bluetooth/BluetoothGattService;",
                                                  methodCache: &JNICache.MethodID.getService,
                                                  args: &__args,
                                                  locals: &__locals)
        
        return Android.Bluetooth.GattService(javaObject: __return)
    }
    
    /**
     * Returns a list of GATT services offered by the remote device.
     */
    public func getServices() -> List? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getServices",
                                                  methodSig: "()Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getServices,
                                                  args: &__args,
                                                  locals: &__locals)
        return ListForward(javaObject: __return)
    }
    
    /**
     * Reads the requested characteristic from the associated remote device.
     */
    public func readCharacteristic(characteristic: Android.Bluetooth.GattCharacteristic) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: characteristic, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "readCharacteristic",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattCharacteristic;)Z",
                                                   methodCache: &JNICache.MethodID.readCharacteristic,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Reads the value for a given descriptor from the associated remote device.
     */
    public func readDescriptor(descriptor: Android.Bluetooth.GattDescriptor) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: descriptor, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "readDescriptor",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattDescriptor;)Z",
                                                   methodCache: &JNICache.MethodID.readDescriptor,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Read the current transmitter PHY and receiver PHY of the connection.
     */
    public func readPhy() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "readPhy",
                                 methodSig: "()V",
                                 methodCache: &JNICache.MethodID.readPhy,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Read the RSSI for a connected remote device.
     */
    public func readRemoteRssi() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "readRemoteRssi",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.readRemoteRssi,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Request a connection parameter update.
     */
    public func requestConnectionPriority(connectionPriority: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(connectionPriority))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "requestConnectionPriority",
                                                   methodSig: "(I)Z",
                                                   methodCache: &JNICache.MethodID.requestConnectionPriority,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Request an MTU size used for a given connection.
     */
    public func requestMtu(mtu: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(mtu))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "requestMtu",
                                                   methodSig: "(I)Z",
                                                   methodCache: &JNICache.MethodID.requestMtu,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Enable or disable notifications/indications for a given characteristic.
     */
    public func setCharacteristicNotification(characteristic: Android.Bluetooth.GattCharacteristic, enable: Bool) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: characteristic, locals: &__locals),
            jvalue(z: jboolean(enable ?  JNI_TRUE : JNI_FALSE))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "setCharacteristicNotification",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattCharacteristic;Z)Z",
                                                   methodCache: &JNICache.MethodID.setCharacteristicNotification,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Set the preferred connection PHY for this app.
     */
    public func setPreferredPhy(txPhy: Int, rxPhy: Int, phyOptions: Int)  {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(txPhy)),
            jvalue(i: jint(rxPhy)),
            jvalue(i: jint(phyOptions))
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                   methodName: "setPreferredPhy",
                                   methodSig: "(III)V",
                                   methodCache: &JNICache.MethodID.setPreferredPhy,
                                   args: &__args,
                                   locals: &__locals)
    }
    
    /**
     * Writes a given characteristic and its values to the associated remote device.
     */
    public func writeCharacteristic(characteristic: Android.Bluetooth.GattCharacteristic) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: characteristic, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "writeCharacteristic",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattCharacteristic;)Z",
                                                   methodCache: &JNICache.MethodID.writeCharacteristic,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Write the value of a given descriptor to the associated remote device.
     */
    public func writeDescriptor(descriptor: Android.Bluetooth.GattDescriptor) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: descriptor, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "writeDescriptor",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattDescriptor;)Z",
                                                   methodCache: &JNICache.MethodID.writeDescriptor,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothGatt {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGatt"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var CONNECTION_PRIORITY_BALANCED: jfieldID?
            static var CONNECTION_PRIORITY_HIGH: jfieldID?
            static var CONNECTION_PRIORITY_LOW_POWER: jfieldID?
            static var GATT_CONNECTION_CONGESTED: jfieldID?
            static var GATT_FAILURE: jfieldID?
            static var GATT_INSUFFICIENT_AUTHENTICATION: jfieldID?
            static var GATT_INSUFFICIENT_ENCRYPTION: jfieldID?
            static var GATT_INVALID_ATTRIBUTE_LENGTH: jfieldID?
            static var GATT_INVALID_OFFSET: jfieldID?
            static var GATT_READ_NOT_PERMITTED: jfieldID?
            static var GATT_REQUEST_NOT_SUPPORTED: jfieldID?
            static var GATT_SUCCESS: jfieldID?
            static var GATT_WRITE_NOT_PERMITTED: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var abortReliableWrite: jmethodID?
            static var abortReliableWrite2: jmethodID?
            static var beginReliableWrite: jmethodID?
            static var close: jmethodID?
            static var connect: jmethodID?
            static var disconnect: jmethodID?
            static var discoverServices: jmethodID?
            static var executeReliableWrite: jmethodID?
            static var getConnectedDevices: jmethodID?
            static var getConnectionState: jmethodID?
            static var getDevice: jmethodID?
            static var getDevicesMatchingConnectionStates: jmethodID?
            static var getService: jmethodID?
            static var getServices: jmethodID?
            static var readCharacteristic: jmethodID?
            static var readDescriptor: jmethodID?
            static var readPhy: jmethodID?
            static var readRemoteRssi: jmethodID?
            static var requestConnectionPriority: jmethodID?
            static var requestMtu: jmethodID?
            static var setCharacteristicNotification: jmethodID?
            static var setPreferredPhy: jmethodID?
            static var writeCharacteristic: jmethodID?
            static var writeDescriptor: jmethodID?
        }
    }
}


