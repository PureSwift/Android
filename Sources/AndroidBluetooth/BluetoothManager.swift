//
//  Bluetooth.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/17/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth {
    
    public typealias Manager = AndroidBluetoothManager
}

/**
 * High level manager used to obtain an instance of an `Android.Bluetooth.Adapter`
 * and to conduct overall Bluetooth Management.
 */
public final class AndroidBluetoothManager: JavaObject {
    
    private static var JNIClass: jclass?
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /**
     * Get the default BLUETOOTH Adapter for this device.
     *
     * @return the default BLUETOOTH Adapter
     */
    public var adapter: AndroidBluetoothAdapter? {
        
        @inline(__always)
        get { return getAdapter() }
    }
}

// MARK: - Methods

public extension AndroidBluetoothManager {
    
    /**
     * Get connected devices for the specified profile.
     */
    public func getConnectedDevices(profile: Int) -> List? {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(profile))
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getConnectedDevices",
                                                  methodSig: "(I)Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getConnectedDevices,
                                                  args: &__args,
                                                  locals: &__locals)
        return ListForward(javaObject: __return)
    }
    
    /**
     * Get connected devices for the specified profile.
     */
    public func getConnectionState(device: Android.Bluetooth.Device, profile: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(profile)),
            JNIType.toJava(value: device, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                  methodName: "getConnectionState",
                                                  methodSig: "(Landroid/bluetooth/BluetoothDevice;I)I",
                                                  methodCache: &JNICache.MethodID.getConnectionState,
                                                  args: &__args,
                                                  locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Get a list of devices that match any of the given connection states.
     */
    public func getDevicesMatchingConnectionStates(profile: Int, states: [Int]) -> List? {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(profile)),
            JNIType.toJava(value: states, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                               methodName: "getDevicesMatchingConnectionStates",
                                               methodSig: "(I[I)Ljava/util/List;",
                                               methodCache: &JNICache.MethodID.getDevicesMatchingConnectionStates,
                                               args: &__args,
                                               locals: &__locals)
        return ListForward(javaObject: __return)
    }
    
    /**
     * Open a GATT Server The callback is used to deliver results to Caller, such as connection status as well as the results of any other GATT server operations.
     */
    public func openGattServer(context: Android.Content.Context, callback: JavaObject) -> Android.Bluetooth.GattServer? {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: context, locals: &__locals),
            JNIType.toJava(value: callback, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "openGattServer",
                                                  methodSig: "(Landroid/content/Context;Landroid/bluetooth/;LBluetoothGattServerCallback;)Landroid/bluetooth/BluetoothGattServer;",
                                                  methodCache: &JNICache.MethodID.openGattServer,
                                                  args: &__args,
                                                  locals: &__locals)
        return __return != nil ? Android.Bluetooth.GattServer(javaObject: __return) : nil
    }
    
    /**
     * Get the default BLUETOOTH Adapter for this device.
     *
     * @return the default BLUETOOTH Adapter
     */
    @_versioned
    internal func getAdapter() -> Android.Bluetooth.Adapter? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getAdapter",
                                                  methodSig: "()Landroid/bluetooth/BluetoothAdapter;",
                                                  methodCache: &JNICache.MethodID.getAdapter,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? AndroidBluetoothAdapter( javaObject: __return ) : nil
    }
}

// MARK: - Android.Content.Context.SystemService

extension Android.Bluetooth.Manager: Android.Content.Context.SystemService {
    
    public static var systemServiceName: Android.Content.Context.SystemService.Name { return .bluetooth }
}

// MARK: - JNICache

internal extension AndroidBluetoothManager {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothManager"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getAdapter: jmethodID?
            static var getConnectedDevices: jmethodID?
            static var getConnectionState: jmethodID?
            static var getDevicesMatchingConnectionStates: jmethodID?
            static var openGattServer: jmethodID?
        }
    }
}

