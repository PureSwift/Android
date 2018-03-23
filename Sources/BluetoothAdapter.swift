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
                                                            returnType: .void).rawValue,
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

// MARK: - JNICache

internal extension Android.Bluetooth.Adapter {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothAdapter"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getDefaultAdapter: jmethodID?
            static var getBluetoothLeScanner: jmethodID?
        }
    }
}
