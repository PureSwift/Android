//
//  BluetoothGattService.swift
//  Android
//
//  Created by Marco Estrella on 5/31/18.
//

import Foundation
import Bluetooth
import java_swift

public extension Android.Bluetooth {
    
    public typealias Service = AndroidBluetoothService
}

/**
 * Represents a Bluetooth GATT Service
 *
 * Gatt Service contains a collection of BluetoothGattCharacteristic, as well as referenced services.
 */
public final class AndroidBluetoothService: JavaObject {
    
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
