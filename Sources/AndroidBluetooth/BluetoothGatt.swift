//
//  BluetoothGatt.swift
//  Android
//
//  Created by Marco Estrella on 6/1/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth {
    
    public typealias Gatt = AndroidBluetoothGatt
}

public extension Android.Bluetooth.Gatt {
    
    public typealias ConnectionPriority = AndroidBluetoothConnectionPriority
    
    public typealias TxPhy = AndroidBluetoothTxPhy
    
    public typealias RxPhy = AndroidBluetoothRxPhy
    
    public typealias PhyOptions = AndroidBluetoothPhyOptions
    
    public typealias Status = AndroidBluetoothGattStatus
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
    
    public var services: [AndroidBluetoothGattService] {
        
        get { return getServices() }
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
    
    /// A GATT operation failed, errors other than the above
    internal static var GATT_FAILURE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GATT_FAILURE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GATT_FAILURE,
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
        
        defer { JNI.DeleteLocalRef(__return) }
        
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
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Bluetooth.GattService(javaObject: __return)
    }
    
    /**
     * Returns a list of GATT services offered by the remote device.
     */
    @inline(__always)
    internal func getServices() -> [AndroidBluetoothGattService] {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getServices",
                                                  methodSig: "()Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getServices,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        if(__return == nil){
            return []
        }
        
        let arrayListServices = ArrayList(javaObject: __return)
        
        if(arrayListServices.size() == 0){
            return []
        }
        
        var swiftServices = [Android.Bluetooth.GattService]()
        
        arrayListServices.forEach { item in
            let service = Android.Bluetooth.GattService(javaObject: item.javaObject)
            swiftServices.append(service)
        }

        return swiftServices
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
    public func requestConnectionPriority(connectionPriority: Android.Bluetooth.Gatt.ConnectionPriority) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(connectionPriority.rawValue))
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
    public func setPreferredPhy(txPhy: Android.Bluetooth.Gatt.TxPhy, rxPhy: Android.Bluetooth.Gatt.RxPhy, phyOptions: Android.Bluetooth.Gatt.PhyOptions)  {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(txPhy.rawValue)),
            jvalue(i: jint(rxPhy.rawValue)),
            jvalue(i: jint(phyOptions.rawValue))
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

// MARK: - Supporting types

public extension AndroidBluetoothGatt {
    
    public struct AndroidBluetoothConnectionPriority: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Connection parameter update - Use the connection parameters recommended by the Bluetooth SIG. This is the default value if no connection parameter update is requested.
         */
        public static let balanced = Android.Bluetooth.Gatt.ConnectionPriority(rawValue: Android.Bluetooth.Gatt.CONNECTION_PRIORITY_BALANCED)
        
        /**
         * Connection parameter update - Request a high priority, low latency connection. An application should only request high priority connection parameters to transfer
         * large amounts of data over LE quickly. Once the transfer is complete, the application should request CONNECTION_PRIORITY_BALANCED connection parameters to reduce energy use.
         */
        public static let high = Android.Bluetooth.Gatt.ConnectionPriority(rawValue: Android.Bluetooth.Gatt.CONNECTION_PRIORITY_HIGH)
        
        /**
         * Connection parameter update - Request low power, reduced data rate connection parameters.
         */
        public static let lowPower = Android.Bluetooth.Gatt.ConnectionPriority(rawValue: Android.Bluetooth.Gatt.CONNECTION_PRIORITY_LOW_POWER)
    }
    
    public struct AndroidBluetoothTxPhy: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Bluetooth LE 1M PHY mask. Used to specify LE 1M Physical Channel as one of many available options in a bitmask.
         */
        public static let phyLe1mMask = Android.Bluetooth.Gatt.TxPhy(rawValue: Android.Bluetooth.Device.PHY_LE_1M_MASK)
        
        /**
         * Bluetooth LE 2M PHY mask. Used to specify LE 2M Physical Channel as one of many available options in a bitmask.
         */
        public static let phyLe2mMask = Android.Bluetooth.Gatt.TxPhy(rawValue: Android.Bluetooth.Device.PHY_LE_2M_MASK)
        
        /**
         * Bluetooth LE Coded PHY mask. Used to specify LE Coded Physical Channel as one of many available options in a bitmask.
         */
        public static let phyLecodedMask = Android.Bluetooth.Gatt.TxPhy(rawValue: Android.Bluetooth.Device.PHY_LE_CODED_MASK)
    }
    
    public struct AndroidBluetoothRxPhy: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * Bluetooth LE 1M PHY mask. Used to specify LE 1M Physical Channel as one of many available options in a bitmask.
         */
        public static let phyLe1mMask = Android.Bluetooth.Gatt.TxPhy(rawValue: Android.Bluetooth.Device.PHY_LE_1M_MASK)
        
        /**
         * Bluetooth LE 2M PHY mask. Used to specify LE 2M Physical Channel as one of many available options in a bitmask.
         */
        public static let phyLe2mMask = Android.Bluetooth.Gatt.TxPhy(rawValue: Android.Bluetooth.Device.PHY_LE_2M_MASK)
        
        /**
         * Bluetooth LE Coded PHY mask. Used to specify LE Coded Physical Channel as one of many available options in a bitmask.
         */
        public static let phyLecodedMask = Android.Bluetooth.Gatt.TxPhy(rawValue: Android.Bluetooth.Device.PHY_LE_CODED_MASK)
    }
    
    public struct AndroidBluetoothPhyOptions: RawRepresentable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * No preferred coding when transmitting on the LE Coded PHY.
         */
        public static let noPreferred = Android.Bluetooth.Gatt.PhyOptions(rawValue: Android.Bluetooth.Device.PHY_OPTION_NO_PREFERRED)
        
        /**
         * Prefer the S=2 coding to be used when transmitting on the LE Coded PHY.
         */
        public static let optionS2 = Android.Bluetooth.Gatt.PhyOptions(rawValue: Android.Bluetooth.Device.PHY_OPTION_S2)
        
        /**
         * Prefer the S=8 coding to be used when transmitting on the LE Coded PHY.
         */
        public static let optionS8 = Android.Bluetooth.Gatt.PhyOptions(rawValue: Android.Bluetooth.Device.PHY_OPTION_S8)
    }
    
    public struct AndroidBluetoothGattStatus: RawRepresentable, Equatable, Error {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /**
         * A remote device connection is congested.
         */
        public static let connectionCongested = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_CONNECTION_CONGESTED)
        
        /**
         * A GATT operation failed, errors other than the above
         */
        public static let failure = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_FAILURE)
        
        /**
         * Insufficient authentication for a given operation
         */
        public static let insufficientAuthentication = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_INSUFFICIENT_AUTHENTICATION)
        
        /**
         * Insufficient encryption for a given operation
         */
        public static let insufficientEncryption = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_INSUFFICIENT_ENCRYPTION)
        
        /**
         * A write operation exceeds the maximum length of the attribute
         */
        public static let invalidAttibuteLength = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_INVALID_ATTRIBUTE_LENGTH)
        
        /**
         * A read or write operation was requested with an invalid offset
         */
        public static let invalidOffset = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_INVALID_OFFSET)
        
        /**
         * GATT read operation is not permitted
         */
        public static let readNotPermitted = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_READ_NOT_PERMITTED)
        
        /**
         * The given request is not supported
         */
        public static let requestNotSupported = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_REQUEST_NOT_SUPPORTED)
        
        /**
         * A GATT operation completed successfully
         */
        public static let success = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_SUCCESS)
        
        /**
         * GATT write operation is not permitted
         */
        public static let writeNotPermitted = Android.Bluetooth.Gatt.Status(rawValue: Android.Bluetooth.Gatt.GATT_WRITE_NOT_PERMITTED)
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
            static var getConnectedDevices: jmethodID? // Not supported
            static var getConnectionState: jmethodID?  // Not supported
            static var getDevice: jmethodID?
            static var getDevicesMatchingConnectionStates: jmethodID? // Not supported
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



