//
//  BluetoothGattCharacteristic.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias GattCharacteristic = AndroidBluetoothGattCharacteristic
}

/**
 * Represents a Bluetooth GATT Characteristic
 *
 * A GATT characteristic is a basic data element used to construct a GATT service, BluetoothGattService. The characteristic contains a value
 * as well as additional information and optional GATT descriptors, BluetoothGattDescriptor.
 */
public final class AndroidBluetoothGattCharacteristic: JavaObject {
    
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
