//
//  BluetoothLePeriodicAdvertisingParameters.swift
//  Android
//
//  Created by Marco Estrella on 5/24/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth.LE {
    
    public typealias PeriodicAdvertisingParameters = AndroidBluetoothLowEnergyPeriodicAdvertisingParameters
}

/**
 * The PeriodicAdvertisingParameters provide a way to adjust periodic advertising preferences for each Bluetooth LE
 * advertising set. Use AdvertisingSetParameters.Builder to create an instance of this class.
 */
public final class AndroidBluetoothLowEnergyPeriodicAdvertisingParameters: JavaObject {
    
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
    
    public var includeTxPower: Bool {
        
        get { return getIncludeTxPower() }
    }
    
    public var interval: Int {
        
        get { return getInterval() }
    }
}

// MARK: - INTERNAL METHODS

internal extension Android.Bluetooth.LE.PeriodicAdvertisingParameters {
    
    @_versioned
    internal func getIncludeTxPower() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                               methodName: "getIncludeTxPower",
                                               methodSig: "()Z",
                                               methodCache: &JNICache.MethodID.getIncludeTxPower,
                                               args: &__args,
                                               locals: &__locals)
        return __return != jboolean(JNI_FALSE)
    }
    
    @_versioned
    internal func getInterval() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                                   methodName: "getInterval",
                                                   methodSig: "()I",
                                                   methodCache: &JNICache.MethodID.getInterval,
                                                   args: &__args,
                                                   locals: &__locals)
        return Int(__return)
    }
}

// MARK: - JNICache

internal extension Android.Bluetooth.LE.PeriodicAdvertisingParameters {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.LE.className(["PeriodicAdvertisingParameters"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getIncludeTxPower: jmethodID?
            static var getInterval: jmethodID?
        }
    }
}
