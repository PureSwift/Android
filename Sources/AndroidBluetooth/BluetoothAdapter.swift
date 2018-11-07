//
//  AndroidBluetoothAdapter.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import java_util
import JNI
import Android

public extension Android.Bluetooth {
    
    public typealias Adapter = AndroidBluetoothAdapter
}

public extension Android.Bluetooth.Adapter {
    
    public typealias Action = AndroidBluetoothAdapterAction
    public typealias Extra = AndroidBluetoothAdapterExtra
}

public final class AndroidBluetoothAdapter: JavaObject {
    
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
     * Get a handle to the default local Bluetooth adapter.
     *
     * Currently Android only supports one Bluetooth adapter, but the API
     * could be extended to support more. This will always return the default
     * adapter.
     *
     * - Returns: The default local adapter, or null if Bluetooth is not supported on this hardware platform.
     */
    public static var `default`: Android.Bluetooth.Adapter? {
    
        @inline(__always)
        get { return getDefaultAdapter() }
    }
    
    internal func getBluetoothLeAdvertiser() -> JavaObject? {
        
        // TODO
        return nil
    }
    
    public var lowEnergyScanner: Android.Bluetooth.LE.Scanner? {
        
        @inline(__always)
        get { return getBluetoothLeScanner() }
    }
}

// MARK: - Methods

public extension Android.Bluetooth.Adapter {
    
    /**
     * Cancel the current device discovery process.
     */
    public func cancelDiscovery() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "cancelDiscovery",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.cancelDiscovery,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Validate a String Bluetooth address, such as "00:43:A8:23:10:F0"
     *
     * Alphabetic characters must be uppercase to be valid.
     */
    public class func checkBluetoothAddress() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallStaticBooleanMethod(className: JNICache.className,
                                                         classCache: &JNICache.jniClass,
                                                         methodName: "checkBluetoothAddress",
                                                         methodSig: "()Z",
                                                         methodCache: &JNICache.MethodID.checkBluetoothAddress,
                                                         args: &__args,
                                                         locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Close the connection of the profile proxy to the Service.
     */
    public func closeProfileProxy(profile: Int, proxy: JavaObject) {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(profile) ),
            JNIType.toJava( value: proxy, locals: &__locals )
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "closeProfileProxy",
                                 methodSig: "(ILandroid/bluetooth/BluetoothProfile;)V",
                                 methodCache: &JNICache.MethodID.closeProfileProxy,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Turn off the local Bluetooth adapter—do not use without explicit user action to turn off Bluetooth.
     */
    public func disable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "disable",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.disable,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Turn on the local Bluetooth adapter—do not use without explicit user action to turn on Bluetooth.
     */
    public func enable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "enable",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.enable,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns the hardware address of the local Bluetooth adapter.
     */
    @_versioned
    internal func getAddress() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getAddress",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getAddress,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    /**
     * Returns a BluetoothLeAdvertiser object for Bluetooth LE Advertising operations.
     */
    public func getBluetoothLeAdvertiser() -> Android.Bluetooth.LE.Advertiser {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getBluetoothLeAdvertiser",
                                                  methodSig: "()Landroid/bluetooth/le/BluetoothLeAdvertiser;",
                                                  methodCache: &JNICache.MethodID.getBluetoothLeAdvertiser,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.LE.Advertiser(javaObject: __return)
    }
    
    /**
     * Returns a BluetoothLeScanner object for Bluetooth LE scan operations.
     */
    @_versioned
    internal func getBluetoothLeScanner() -> Android.Bluetooth.LE.Scanner? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getBluetoothLeScanner",
                                                  methodSig: "()Landroid/bluetooth/le/BluetoothLeScanner;",
                                                  methodCache: &JNICache.MethodID.getBluetoothLeScanner,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.Bluetooth.LE.Scanner( javaObject: __return ) : nil
    }
    
    /**
     * Returns a BluetoothLeScanner object for Bluetooth LE scan operations.
     */
    public func getBondedDevices() -> JavaSet {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getBondedDevices",
                                                  methodSig: "()Ljava/util/Set;",
                                                  methodCache: &JNICache.MethodID.getBondedDevices,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JavaSetForward(javaObject: __return)
    }
    
    /**
     * Get a handle to the default local Bluetooth adapter.
     *
     * Currently Android only supports one Bluetooth adapter, but the API
     * could be extended to support more. This will always return the default
     * adapter.
     *
     * - Returns: The default local adapter, or null if Bluetooth is not supported on this hardware platform.
     */
    @_versioned
    internal static func getDefaultAdapter() -> Android.Bluetooth.Adapter? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "getDefaultAdapter",
                                                        methodSig: JNIMethodSignature(
                                                            argumentTypes: [],
                                                            returnType: .object(JNICache.classSignature)).rawValue,
                                                        methodCache: &JNICache.MethodID.getDefaultAdapter,
                                                        args: &__args,
                                                        locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.Bluetooth.Adapter( javaObject: __return ) : nil
    }
    
    
    /**
     * Return the maximum LE advertising data length in bytes, if LE Extended Advertising feature is supported, 0 otherwise.
     */
    public func getLeMaximumAdvertisingDataLength() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                   methodName: "getLeMaximumAdvertisingDataLength",
                                                   methodSig: "()I",
                                                   methodCache: &JNICache.MethodID.getLeMaximumAdvertisingDataLength,
                                                   args: &__args,
                                                   locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Get the friendly Bluetooth name of the local Bluetooth adapter.
     */
    public func getName() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getName",
                                                  methodSig: "()Ljava/lang/String;",
                                                  methodCache: &JNICache.MethodID.getName,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return String(javaObject: __return)
    }
    
    /**
     * Get the current connection state of a profile.
     */
    public func getProfileConnectionState(profile: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = jvalue(i: jint(profile))
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getProfileConnectionState",
                                               methodSig: "(I)I",
                                               methodCache: &JNICache.MethodID.getProfileConnectionState,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Get the profile proxy object associated with the profile.
     */
    public func getProfileProxy(context: Android.Content.Context, listener: JavaObject, profile: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava( value: context, locals: &__locals ),
            JNIType.toJava( value: listener, locals: &__locals ),
            jvalue(i: jint(profile))
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                               methodName: "getProfileProxy",
                                               methodSig: "(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)I",
                                               methodCache: &JNICache.MethodID.getProfileProxy,
                                               args: &__args,
                                               locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Get a BluetoothDevice object for the given Bluetooth hardware address.
     */
    public func getRemoteDevice(address: [Int8]) -> Android.Bluetooth.Device {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: address, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                               methodName: "getRemoteDevice",
                                               methodSig: "([B)I",
                                               methodCache: &JNICache.MethodID.getRemoteDevice,
                                               args: &__args,
                                               locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.Device(javaObject: __return)
    }
    
    /**
     * Get a BluetoothDevice object for the given Bluetooth hardware address.
     */
    public func getRemoteDevice(address: String) -> Android.Bluetooth.Device {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: address, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getRemoteDevice",
                                                  methodSig: "(Ljava/lang/String;)I",
                                                  methodCache: &JNICache.MethodID.getRemoteDevice2,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.Device(javaObject: __return)
    }
    
    /**
     * Get the current Bluetooth scan mode of the local Bluetooth adapter.
     */
    public func getScanMode() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getScanMode",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getScanMode,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Get the current state of the local Bluetooth adapter.
     */
    public func getState() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getState",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getState,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Return true if the local Bluetooth adapter is currently in the device discovery process.
     */
    public func isDiscovering() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isDiscovering",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isDiscovering,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return true if Bluetooth is currently enabled and ready for use.
     */
    public func isEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isEnabled",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isEnabled,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return true if LE 2M PHY feature is supported.
     */
    public func isLe2MPhySupported() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isLe2MPhySupported",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isLe2MPhySupported,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return true if LE Coded PHY feature is supported.
     */
    public func isLeCodedPhySupported() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isLeCodedPhySupported",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isLeCodedPhySupported,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return true if LE Extended Advertising feature is supported.
     */
    public func isLeExtendedAdvertisingSupported() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isLeExtendedAdvertisingSupported",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isLeExtendedAdvertisingSupported,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return true if LE Periodic Advertising feature is supported.
     */
    public func isLePeriodicAdvertisingSupported() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isLePeriodicAdvertisingSupported",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isLePeriodicAdvertisingSupported,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return true if the multi advertisement is supported by the chipset.
     */
    public func isMultipleAdvertisementSupported() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isMultipleAdvertisementSupported",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isMultipleAdvertisementSupported,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return true if offloaded filters are supported.
     */
    public func isOffloadedFilteringSupported() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isOffloadedFilteringSupported",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isOffloadedFilteringSupported,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return true if offloaded scan batching is supported.
     */
    public func isOffloadedScanBatchingSupported() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isOffloadedScanBatchingSupported",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.isOffloadedScanBatchingSupported,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Create a listening, insecure RFCOMM Bluetooth socket with Service Record.
     */
    public func listenUsingInsecureRfcommWithServiceRecord(name: String, uuid: java_util.UUID) -> Android.Bluetooth.ServerSocket {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals),
            JNIType.toJava(value: uuid, locals: &__locals),
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "listenUsingInsecureRfcommWithServiceRecord",
                                                  methodSig: "(Ljava/lang/String;Ljava/util/UUID;)Landroid/bluetooth/BluetoothServerSocket;",
                                                  methodCache: &JNICache.MethodID.listenUsingInsecureRfcommWithServiceRecord,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.ServerSocket(javaObject: __return)
    }
    
    /**
     * Create a listening, secure RFCOMM Bluetooth socket with Service Record.
     */
    public func listenUsingRfcommWithServiceRecord(name: String, uuid: java_util.UUID) -> Android.Bluetooth.ServerSocket {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals),
            JNIType.toJava(value: uuid, locals: &__locals),
            ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "listenUsingRfcommWithServiceRecord",
                                                  methodSig: "(Ljava/lang/String;Ljava/util/UUID;)Landroid/bluetooth/BluetoothServerSocket;",
                                                  methodCache: &JNICache.MethodID.listenUsingRfcommWithServiceRecord,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.ServerSocket(javaObject: __return)
    }
    
    /**
     * Set the friendly Bluetooth name of the local Bluetooth adapter.
     */
    public func setName(name: String) -> Bool {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "setName",
                                                   methodSig: "(Ljava/lang/String;)Z",
                                                   methodCache: &JNICache.MethodID.setName,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Start the remote device discovery process.
     */
    public func startDiscovery() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "startDiscovery",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICache.MethodID.startDiscovery,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: - Constants

internal extension Android.Bluetooth.Adapter {
    
    /// Intent used to broadcast the change in connection state of the local Bluetooth adapter to a profile of the remote device.
    internal static var ACTION_CONNECTION_STATE_CHANGED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_CONNECTION_STATE_CHANGED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_CONNECTION_STATE_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Broadcast Action: The local Bluetooth adapter has finished the device discovery process.
    internal static var ACTION_DISCOVERY_FINISHED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_DISCOVERY_FINISHED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_DISCOVERY_FINISHED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Broadcast Action: The local Bluetooth adapter has started the remote device discovery process.
    internal static var ACTION_DISCOVERY_STARTED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_DISCOVERY_STARTED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_DISCOVERY_STARTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Broadcast Action: The local Bluetooth adapter has changed its friendly Bluetooth name.
    internal static var ACTION_LOCAL_NAME_CHANGED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_LOCAL_NAME_CHANGED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_LOCAL_NAME_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Activity Action: Show a system activity that requests discoverable mode.
    internal static var ACTION_REQUEST_DISCOVERABLE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_REQUEST_DISCOVERABLE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_REQUEST_DISCOVERABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Activity Action: Show a system activity that allows the user to turn on Bluetooth.
    internal static var ACTION_REQUEST_ENABLE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_REQUEST_ENABLE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_REQUEST_ENABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Broadcast Action: Indicates the Bluetooth scan mode of the local Adapter has changed.
    internal static var ACTION_SCAN_MODE_CHANGED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_SCAN_MODE_CHANGED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_SCAN_MODE_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Broadcast Action: The state of the local Bluetooth adapter has been changed.
    internal static var ACTION_STATE_CHANGED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_STATE_CHANGED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_STATE_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Sentinel error value for this class.
    internal static var ERROR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ERROR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ERROR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Extra used by ACTION_CONNECTION_STATE_CHANGED This extra represents the current connection state.
    internal static var EXTRA_CONNECTION_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_CONNECTION_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_CONNECTION_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Used as an optional int extra field in ACTION_REQUEST_DISCOVERABLE intents to request a specific duration for discoverability in seconds.
    internal static var EXTRA_DISCOVERABLE_DURATION: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_DISCOVERABLE_DURATION",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_DISCOVERABLE_DURATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Used as a String extra field in ACTION_LOCAL_NAME_CHANGED intents to request the local Bluetooth name.
    internal static var EXTRA_LOCAL_NAME: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_LOCAL_NAME",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_LOCAL_NAME,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Extra used by ACTION_CONNECTION_STATE_CHANGED This extra represents the previous connection state.
    internal static var EXTRA_PREVIOUS_CONNECTION_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_PREVIOUS_CONNECTION_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_PREVIOUS_CONNECTION_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Used as an int extra field in ACTION_SCAN_MODE_CHANGED intents to request the previous scan mode.
    internal static var EXTRA_PREVIOUS_SCAN_MODE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_PREVIOUS_SCAN_MODE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_PREVIOUS_SCAN_MODE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Used as an int extra field in ACTION_STATE_CHANGED intents to request the previous power state.
    internal static var EXTRA_PREVIOUS_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_PREVIOUS_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_PREVIOUS_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Used as an int extra field in ACTION_SCAN_MODE_CHANGED intents to request the current scan mode.
    internal static var EXTRA_SCAN_MODE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_SCAN_MODE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_SCAN_MODE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Used as an int extra field in ACTION_STATE_CHANGED intents to request the current power state.
    internal static var EXTRA_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            defer { JNI.DeleteLocalRef(__value) }
            
            return String(javaObject: __value)
        }
    }
    
    /// Indicates that inquiry scan is disabled, but page scan is enabled on the local Bluetooth adapter.
    internal static var SCAN_MODE_CONNECTABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_MODE_CONNECTABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCAN_MODE_CONNECTABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Indicates that both inquiry scan and page scan are enabled on the local Bluetooth adapter.
    internal static var SCAN_MODE_CONNECTABLE_DISCOVERABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_MODE_CONNECTABLE_DISCOVERABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCAN_MODE_CONNECTABLE_DISCOVERABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Indicates that both inquiry scan and page scan are disabled on the local Bluetooth adapter.
    internal static var SCAN_MODE_NONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_MODE_NONE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCAN_MODE_NONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// The profile is in connected state
    internal static var STATE_CONNECTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_CONNECTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_CONNECTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// The profile is in connecting state
    internal static var STATE_CONNECTING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_CONNECTING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_CONNECTING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// The profile is in disconnected state
    internal static var STATE_DISCONNECTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_DISCONNECTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_DISCONNECTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// The profile is in disconnecting state
    internal static var STATE_DISCONNECTING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_DISCONNECTING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_DISCONNECTING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Indicates the local Bluetooth adapter is off.
    internal static var STATE_OFF: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_OFF",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_OFF,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Indicates the local Bluetooth adapter is on, and ready for use.
    internal static var STATE_ON: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_ON",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_ON,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Indicates the local Bluetooth adapter is turning off.
    internal static var STATE_TURNING_OFF: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_TURNING_OFF",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_TURNING_OFF,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Indicates the local Bluetooth adapter is turning on.
    internal static var STATE_TURNING_ON: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATE_TURNING_ON",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATE_TURNING_ON,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// Mark: Supporting Types

public extension Android.Bluetooth.Adapter {
    
    /// Adapter Action
    public struct AndroidBluetoothAdapterAction: RawRepresentable {
        
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public static let connectionStateChanged = Android.Bluetooth.Adapter.Action(rawValue: Android.Bluetooth.Adapter.ACTION_CONNECTION_STATE_CHANGED)
        
        public static let discoveryFinished = Android.Bluetooth.Adapter.Action(rawValue: Android.Bluetooth.Adapter.ACTION_DISCOVERY_FINISHED)
        
        public static let discoveryStarted = Android.Bluetooth.Adapter.Action(rawValue: Android.Bluetooth.Adapter.ACTION_DISCOVERY_STARTED)
        
        public static let localNameChanged = Android.Bluetooth.Adapter.Action(rawValue: Android.Bluetooth.Adapter.ACTION_LOCAL_NAME_CHANGED)
        
        public static let requestDiscoverable = Android.Bluetooth.Adapter.Action(rawValue: Android.Bluetooth.Adapter.ACTION_REQUEST_DISCOVERABLE)
        
        public static let requestEnable = Android.Bluetooth.Adapter.Action(rawValue: Android.Bluetooth.Adapter.ACTION_REQUEST_ENABLE)
        
        public static let scanModeChanged = Android.Bluetooth.Adapter.Action(rawValue: Android.Bluetooth.Adapter.ACTION_SCAN_MODE_CHANGED)
        
        public static let stateChanged = Android.Bluetooth.Adapter.Action(rawValue: Android.Bluetooth.Adapter.ACTION_STATE_CHANGED)
    }
    
    /// Adapter Action
    public struct AndroidBluetoothAdapterExtra: RawRepresentable {
        
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public static let connectionState = Android.Bluetooth.Adapter.Extra(rawValue: Android.Bluetooth.Adapter.EXTRA_CONNECTION_STATE)
        
        public static let discoverableDuration = Android.Bluetooth.Adapter.Extra(rawValue: Android.Bluetooth.Adapter.EXTRA_DISCOVERABLE_DURATION)
        
        public static let localName = Android.Bluetooth.Adapter.Extra(rawValue: Android.Bluetooth.Adapter.EXTRA_LOCAL_NAME)
        
        public static let previousConnectionState = Android.Bluetooth.Adapter.Extra(rawValue: Android.Bluetooth.Adapter.EXTRA_PREVIOUS_CONNECTION_STATE)
        
        public static let previousScanMode = Android.Bluetooth.Adapter.Extra(rawValue: Android.Bluetooth.Adapter.EXTRA_PREVIOUS_SCAN_MODE)
        
        public static let previousState = Android.Bluetooth.Adapter.Extra(rawValue: Android.Bluetooth.Adapter.EXTRA_PREVIOUS_STATE)
        
        public static let scanMode = Android.Bluetooth.Adapter.Extra(rawValue: Android.Bluetooth.Adapter.EXTRA_SCAN_MODE)
        
        public static let state = Android.Bluetooth.Adapter.Extra(rawValue: Android.Bluetooth.Adapter.EXTRA_STATE)
    }
}

// MARK: - JNICache

internal extension Android.Bluetooth.Adapter {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothAdapter"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var ACTION_CONNECTION_STATE_CHANGED: jfieldID?
            static var ACTION_DISCOVERY_FINISHED: jfieldID?
            static var ACTION_DISCOVERY_STARTED: jfieldID?
            static var ACTION_LOCAL_NAME_CHANGED: jfieldID?
            static var ACTION_REQUEST_DISCOVERABLE: jfieldID?
            static var ACTION_REQUEST_ENABLE: jfieldID?
            static var ACTION_SCAN_MODE_CHANGED: jfieldID?
            static var ACTION_STATE_CHANGED: jfieldID?
            static var ERROR: jfieldID?
            static var EXTRA_CONNECTION_STATE: jfieldID?
            static var EXTRA_DISCOVERABLE_DURATION: jfieldID?
            static var EXTRA_LOCAL_NAME: jfieldID?
            static var EXTRA_PREVIOUS_CONNECTION_STATE: jfieldID?
            static var EXTRA_PREVIOUS_SCAN_MODE: jfieldID?
            static var EXTRA_PREVIOUS_STATE: jfieldID?
            static var EXTRA_SCAN_MODE: jfieldID?
            static var EXTRA_STATE: jfieldID?
            static var SCAN_MODE_CONNECTABLE: jfieldID?
            static var SCAN_MODE_CONNECTABLE_DISCOVERABLE: jfieldID?
            static var SCAN_MODE_NONE: jfieldID?
            static var STATE_CONNECTED: jfieldID?
            static var STATE_CONNECTING: jfieldID?
            static var STATE_DISCONNECTED: jfieldID?
            static var STATE_DISCONNECTING: jfieldID?
            static var STATE_OFF: jfieldID?
            static var STATE_ON: jfieldID?
            static var STATE_TURNING_OFF: jfieldID?
            static var STATE_TURNING_ON: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var cancelDiscovery: jmethodID?
            static var checkBluetoothAddress: jmethodID?
            static var closeProfileProxy: jmethodID?
            static var disable: jmethodID?
            static var enable: jmethodID?
            static var getAddress: jmethodID?
            static var getBluetoothLeAdvertiser: jmethodID?
            static var getBluetoothLeScanner: jmethodID?
            static var getBondedDevices: jmethodID?
            static var getDefaultAdapter: jmethodID?
            static var getLeMaximumAdvertisingDataLength: jmethodID?
            static var getName: jmethodID?
            static var getProfileConnectionState: jmethodID?
            static var getProfileProxy: jmethodID?
            static var getRemoteDevice: jmethodID?
            static var getRemoteDevice2: jmethodID?
            static var getScanMode: jmethodID?
            static var getState: jmethodID?
            static var isDiscovering: jmethodID?
            static var isEnabled: jmethodID?
            static var isLe2MPhySupported: jmethodID?
            static var isLeCodedPhySupported: jmethodID?
            static var isLeExtendedAdvertisingSupported: jmethodID?
            static var isLePeriodicAdvertisingSupported: jmethodID?
            static var isMultipleAdvertisementSupported: jmethodID?
            static var isOffloadedFilteringSupported: jmethodID?
            static var isOffloadedScanBatchingSupported: jmethodID?
            static var listenUsingInsecureRfcommWithServiceRecord: jmethodID?
            static var listenUsingRfcommWithServiceRecord: jmethodID?
            static var setName: jmethodID?
            static var startDiscovery: jmethodID?
            static var startLeScan: jmethodID? //deprecated api 21
            static var startLeScan2: jmethodID? //deprecated api 21
            static var startLeScan3: jmethodID? //deprecated api 21
            static var stopLeScan: jmethodID? //deprecated api 21
        }
    }
}
