//
//  AndroidBluetoothLowEnergyScanCallbackType.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift

public extension Android.Bluetooth.LE {
    
    public typealias ScanCallbackType = AndroidBluetoothLowEnergyScanCallbackType
}

public struct AndroidBluetoothLowEnergyScanCallbackType: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        
        self.rawValue = rawValue
    }
}
