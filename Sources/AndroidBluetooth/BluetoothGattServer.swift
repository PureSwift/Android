//
//  BluetoothGattServer.swift
//  Android
//
//  Created by Marco Estrella on 6/4/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth {
    
    public typealias GattServer = AndroidBluetoothGattServer
}

public extension Android.Bluetooth.GattServer {
    
    public typealias TxPhy = AndroidBluetoothTxPhy
    
    public typealias RxPhy = AndroidBluetoothRxPhy
    
    public typealias PhyOptions = AndroidBluetoothPhyOptions
}

/**
 * Public API for the Bluetooth GATT Profile server role.
 *
 * This class provides Bluetooth GATT server role functionality, allowing applications to create Bluetooth Smart services and characteristics.
 *
 * BluetoothGattServer is a proxy object for controlling the Bluetooth Service via IPC. Use openGattServer(Context, BluetoothGattServerCallback) to get an instance of this class.
 */
public final class AndroidBluetoothGattServer: JavaObject {
    
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

public extension AndroidBluetoothGattServer {
    
    /**
     * Add a service to the list of services to be hosted.
     */
    public func addService(service: Android.Bluetooth.GattService) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: service, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                               methodName: "addService",
                                               methodSig: "(Landroid/bluetooth/BluetoothGattService;)Z",
                                               methodCache: &JNICache.MethodID.addService,
                                               args: &__args,
                                               locals: &__locals)
        return __return != jboolean(__return)
    }
    
    /**
     * Disconnects an established connection, or cancels a connection attempt currently in progress.
     */
    public func cancelConnection(device: Android.Bluetooth.Device) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: device, locals: &__locals)
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                   methodName: "cancelConnection",
                                   methodSig: "(Landroid/bluetooth/BluetoothDevice;)V",
                                   methodCache: &JNICache.MethodID.cancelConnection,
                                   args: &__args,
                                   locals: &__locals)
    }
    
    /**
     * Remove all services from the list of provided services.
     */
    public func clearServices() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "clearServices",
                                 methodSig: "()V",
                                 methodCache: &JNICache.MethodID.clearServices,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Close this GATT server instance.
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
     * Initiate a connection to a Bluetooth GATT capable device.
     */
    public func connect(device: Android.Bluetooth.Device, autoConnect: Bool) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: device, locals: &__locals),
            jvalue(z: jboolean(autoConnect ? JNI_TRUE : JNI_FALSE))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                 methodName: "connect",
                                 methodSig: "(Landroid/bluetooth/BluetoothDevice;Z)Z",
                                 methodCache: &JNICache.MethodID.connect,
                                 args: &__args,
                                 locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns a BluetoothGattService from the list of services offered by this device.
     */
    public func getService(uuid: java_util.UUID) -> Android.Bluetooth.GattService {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: uuid, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                   methodName: "getService",
                                                   methodSig: "(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;",
                                                   methodCache: &JNICache.MethodID.getService,
                                                   args: &__args,
                                                   locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Bluetooth.GattService(javaObject: __return)
    }
    
    /**
     * Returns a list of GATT services offered by this device.
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
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return ListForward(javaObject: __return)
    }
    
    /**
     * Send a notification or indication that a local characteristic has been updated.
     */
    public func notifyCharacteristicChanged(device: Android.Bluetooth.Device, characteristic: Android.Bluetooth.GattCharacteristic, confirm: Bool) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: device, locals: &__locals),
            JNIType.toJava(value: characteristic, locals: &__locals),
            jvalue(z: jboolean(confirm ? JNI_TRUE : JNI_FALSE))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "notifyCharacteristicChanged",
                                                   methodSig: "(Landroid/bluetooth/BluetoothDevice;Landroid/bluetooth/BluetoothGattCharacteristic;Z)Z",
                                                   methodCache: &JNICache.MethodID.notifyCharacteristicChanged,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Read the current transmitter PHY and receiver PHY of the connection.
     */
    public func readPhy(device: Android.Bluetooth.Device) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: device, locals: &__locals)
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "readPhy",
                                 methodSig: "(Landroid/bluetooth/BluetoothDevice;)V",
                                 methodCache: &JNICache.MethodID.readPhy,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Removes a service from the list of services to be provided.
     */
    public func removeService(service: Android.Bluetooth.GattService) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: service, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "removeService",
                                                   methodSig: "(Landroid/bluetooth/BluetoothGattService;)Z",
                                                   methodCache: &JNICache.MethodID.removeService,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Send a response to a read or write request to a remote device.
     */
    public func sendResponse(device: Android.Bluetooth.Device, requestId: Int, status: Int, offset: Int, value: [Int8]) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: device, locals: &__locals),
            jvalue(i: jint(requestId)),
            jvalue(i: jint(status)),
            jvalue(i: jint(offset)),
            JNIType.toJava(value: value, locals: &__locals),
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "removeService",
                                                   methodSig: "(Landroid/bluetooth/BluetoothDevice;III[B)Z",
                                                   methodCache: &JNICache.MethodID.removeService,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Set the preferred connection PHY for this app.
     */
    public func setPreferredPhy(device: Android.Bluetooth.Device, txPhy: TxPhy, rxPhy: RxPhy, phyOptions: PhyOptions) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: device, locals: &__locals),
            jvalue(i: jint(txPhy.rawValue)),
            jvalue(i: jint(rxPhy.rawValue)),
            jvalue(i: jint(phyOptions.rawValue))
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setPreferredPhy",
                                 methodSig: "(Landroid/bluetooth/BluetoothDevice;III)V",
                                 methodCache: &JNICache.MethodID.setPreferredPhy,
                                 args: &__args,
                                 locals: &__locals)
    }
}

// MARK: - Supporting types

public extension AndroidBluetoothGattServer {
    
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
}

// MARK: - JNICache

internal extension AndroidBluetoothGattServer {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothGattServer"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var addService: jmethodID?
            static var cancelConnection: jmethodID?
            static var clearServices: jmethodID?
            static var close: jmethodID?
            static var connect: jmethodID?
            static var getConnectedDevices: jmethodID? //Not supported
            static var getConnectionState: jmethodID? //Not supported
            static var getDevicesMatchingConnectionStates: jmethodID? //Not supported
            static var getService: jmethodID?
            static var getServices: jmethodID?
            static var notifyCharacteristicChanged: jmethodID?
            static var readPhy: jmethodID?
            static var removeService: jmethodID?
            static var sendResponse: jmethodID?
            static var setPreferredPhy: jmethodID?
        }
    }
}
