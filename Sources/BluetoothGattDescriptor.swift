//
//  BluetoothGattDescriptor.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias GattDescriptor = AndroidBluetoothGattDescriptor
}

/**
 * Represents a Bluetooth GATT Descriptor
 *
 * GATT Descriptors contain additional information and attributes of a GATT characteristic, BluetoothGattCharacteristic.
 * They can be used to describe the characteristic's features or to control certain behaviours of the characteristic.
 */
public final class AndroidBluetoothGattDescriptor: JavaObject {
    
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
