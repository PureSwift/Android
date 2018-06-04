//
//  BluetoothGattServer.swift
//  Android
//
//  Created by Marco Estrella on 6/4/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias GattServer = AndroidBluetoothGattServer
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
            static var getConnectedDevices: jmethodID?
            static var getConnectionState: jmethodID?
            static var getDevicesMatchingConnectionStates: jmethodID?
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
