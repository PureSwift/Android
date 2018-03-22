//
//  Bluetooth.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/17/18.
//

import Foundation
import java_swift
import java_util

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
    
    private static var getAdapter_MethodID: jmethodID?
    
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
                                                  methodCache: &type(of: self).getAdapter_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? AndroidBluetoothAdapter( javaObject: __return ) : nil
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

// MARK: - Android.Content.Context.SystemService

extension Android.Bluetooth.Manager: Android.Content.Context.SystemService {
    
    public static var systemServiceName: Android.Content.Context.SystemService.Name { return .bluetooth }
}
