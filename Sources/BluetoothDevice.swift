//
//  AndroidBluetoothDevice.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias Device = AndroidBluetoothDevice
}

public final class AndroidBluetoothDevice: JavaObject {
    
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
    
    public var address: Bluetooth.Address {
        
        get { return Address(rawValue: getAddress())! }
    }
}

// MARK: - JNI

private extension Android.Bluetooth.Device {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/bluetooth/BluetoothDevice"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getAddress: jmethodID?
        }
    }
}
