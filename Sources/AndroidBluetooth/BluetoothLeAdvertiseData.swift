//
//  BluetoothLeAdvertiseData.swift
//  Android
//
//  Created by Marco Estrella on 5/25/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth.LE {
    
    public typealias AdvertiseData = AndroidBluetoothLowEnergyAdvertiseData
}

/**
 * Advertise data packet container for Bluetooth LE advertising. This represents the data to be advertised as well as
 * the scan response data for active scans.
 *
 * Use AdvertiseData.Builder to create an instance of AdvertiseData to be advertised.
 */
public final class AndroidBluetoothLowEnergyAdvertiseData: JavaObject {
    
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
     * Whether the device name will be included in the advertisement packet.
     */
    public var includeDeviceName: Bool {
        
        get { return getIncludeDeviceName() }
    }
    
    /**
     * Whether the transmission power level will be included in the advertisement packet.
     */
    public var includeTxPowerLevel: Bool {
        
        get { return getIncludeTxPowerLevel() }
    }
    
    /**
     * Returns an array of manufacturer Id and the corresponding manufacturer specific data.
     */
    public var manufacturerSpecificData: Android.Util.SparseArray? {
        
         get { return getManufacturerSpecificData() }
    }
}

// MARK: Internal Methods

internal extension AndroidBluetoothLowEnergyAdvertiseData {
    
    @_versioned
    internal func getIncludeDeviceName() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                               methodName: "getIncludeDeviceName",
                                               methodSig: "()Z",
                                               methodCache: &JNICache.MethodID.getIncludeDeviceName,
                                               args: &__args,
                                               locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    @_versioned
    internal func getIncludeTxPowerLevel() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                               methodName: "getIncludeTxPowerLevel",
                                               methodSig: "()Z",
                                               methodCache: &JNICache.MethodID.getIncludeTxPowerLevel,
                                               args: &__args,
                                               locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    @_versioned
    internal func getManufacturerSpecificData() -> Android.Util.SparseArray? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getManufacturerSpecificData",
                                                  methodSig: "()Landroid/util/SparseArray;",
                                                  methodCache: &JNICache.MethodID.getManufacturerSpecificData,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.Util.SparseArray( javaObject: __return ) : nil
    }
    
    
    @_versioned
    internal func getServiceUuids() -> List? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getServiceUuids",
                                                  methodSig: "()Ljava/util/List;",
                                                  methodCache: &JNICache.MethodID.getServiceUuids,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? ListForward( javaObject: __return ) : nil
    }
    
    @_versioned
    internal func getServiceData() -> JavaMap? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getServiceData",
                                                  methodSig: "()Ljava/util/Map;",
                                                  methodCache: &JNICache.MethodID.getServiceData,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JNIType.toSwift( type: java_swift.JavaMapForward.self, from: __return )
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothLowEnergyAdvertiseData {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["AdvertiseData"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getIncludeDeviceName: jmethodID?
            static var getIncludeTxPowerLevel: jmethodID?
            static var getManufacturerSpecificData: jmethodID?
            static var getServiceData: jmethodID?
            static var getServiceUuids: jmethodID?
        }
    }
}
