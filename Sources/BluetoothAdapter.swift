//
//  AndroidBluetoothAdapter.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift

public extension Android.Bluetooth {
    
    public typealias Adapter = AndroidBluetoothAdapter
}

public final class AndroidBluetoothAdapter: JavaObject {
    
    fileprivate static let javaClassName = "android/bluetooth/BluetoothAdapter"
    
    private static var JNIClass: jclass?
    
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
    
    private static var getDefaultAdapter_MethodID: jmethodID?
    
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
        
        let __return = JNIMethod.CallStaticObjectMethod(className: javaClassName,
                                                        classCache: &JNIClass,
                                                        methodName: "getDefaultAdapter",
                                                        methodSig: "()L\(javaClassName);",
                                                        methodCache: &getDefaultAdapter_MethodID,
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
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getBluetoothLeScanner",
                                                  methodSig: "()Landroid/bluetooth/le/BluetoothLeScanner;",
                                                  methodCache: &type(of: self).getBluetoothLeScanner_MethodID,
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
