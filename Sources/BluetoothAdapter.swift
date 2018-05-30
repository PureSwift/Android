//
//  AndroidBluetoothAdapter.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Bluetooth {
    
    public typealias Adapter = AndroidBluetoothAdapter
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
    
    private static var getBluetoothLeScanner_MethodID: jmethodID?
    
    /**
     * Returns a `BluetoothLeScanner` object for Bluetooth LE scan operations.
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
    
    public var lowEnergyScanner: Android.Bluetooth.LE.Scanner? {
        
        @inline(__always)
        get { return getBluetoothLeScanner() }
    }
}

// MARK: - Constants

internal extension Android.Bluetooth.Adapter {
    
    /// Intent used to broadcast the change in connection state of the local Bluetooth adapter to a profile of the remote device.
    internal static var ACTION_CONNECTION_STATE_CHANGED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_CONNECTION_STATE_CHANGED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_CONNECTION_STATE_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Broadcast Action: The local Bluetooth adapter has finished the device discovery process.
    internal static var ACTION_DISCOVERY_FINISHED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_DISCOVERY_FINISHED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_DISCOVERY_FINISHED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Broadcast Action: The local Bluetooth adapter has started the remote device discovery process.
    internal static var ACTION_DISCOVERY_STARTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_DISCOVERY_STARTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_DISCOVERY_STARTED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Broadcast Action: The local Bluetooth adapter has changed its friendly Bluetooth name.
    internal static var ACTION_LOCAL_NAME_CHANGED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_LOCAL_NAME_CHANGED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_LOCAL_NAME_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Activity Action: Show a system activity that requests discoverable mode.
    internal static var ACTION_REQUEST_DISCOVERABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_REQUEST_DISCOVERABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_REQUEST_DISCOVERABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Activity Action: Show a system activity that allows the user to turn on Bluetooth.
    internal static var ACTION_REQUEST_ENABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_REQUEST_ENABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_REQUEST_ENABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Broadcast Action: Indicates the Bluetooth scan mode of the local Adapter has changed.
    internal static var ACTION_SCAN_MODE_CHANGED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_SCAN_MODE_CHANGED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_SCAN_MODE_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Broadcast Action: The state of the local Bluetooth adapter has been changed.
    internal static var ACTION_STATE_CHANGED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACTION_STATE_CHANGED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACTION_STATE_CHANGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
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
    internal static var EXTRA_CONNECTION_STATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_CONNECTION_STATE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_CONNECTION_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Used as an optional int extra field in ACTION_REQUEST_DISCOVERABLE intents to request a specific duration for discoverability in seconds.
    internal static var EXTRA_DISCOVERABLE_DURATION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_DISCOVERABLE_DURATION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_DISCOVERABLE_DURATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Used as a String extra field in ACTION_LOCAL_NAME_CHANGED intents to request the local Bluetooth name.
    internal static var EXTRA_LOCAL_NAME: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_LOCAL_NAME",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_LOCAL_NAME,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Extra used by ACTION_CONNECTION_STATE_CHANGED This extra represents the previous connection state.
    internal static var EXTRA_PREVIOUS_CONNECTION_STATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_PREVIOUS_CONNECTION_STATE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_PREVIOUS_CONNECTION_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Used as an int extra field in ACTION_SCAN_MODE_CHANGED intents to request the previous scan mode.
    internal static var EXTRA_PREVIOUS_SCAN_MODE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_PREVIOUS_SCAN_MODE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_PREVIOUS_SCAN_MODE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Used as an int extra field in ACTION_STATE_CHANGED intents to request the previous power state.
    internal static var EXTRA_PREVIOUS_STATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_PREVIOUS_STATE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_PREVIOUS_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Used as an int extra field in ACTION_SCAN_MODE_CHANGED intents to request the current scan mode.
    internal static var EXTRA_SCAN_MODE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_SCAN_MODE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_SCAN_MODE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// Used as an int extra field in ACTION_STATE_CHANGED intents to request the current power state.
    internal static var EXTRA_STATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "EXTRA_STATE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.EXTRA_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
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
                                 methodSig: "(ILandroid/bluetooth/BluetoothProfile;)",
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
    public func getAddress() -> String {
        
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
    public func getBluetoothLeScanner() -> Android.Bluetooth.LE.Scanner {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getBluetoothLeScanner",
                                                  methodSig: "()Landroid/bluetooth/le/BluetoothLeScanner;",
                                                  methodCache: &JNICache.MethodID.getBluetoothLeScanner,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.LE.Scanner(javaObject: __return)
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
            static var startLeScan: jmethodID?
            static var startLeScan2: jmethodID?
            static var startLeScan3: jmethodID?
        }
    }
}
