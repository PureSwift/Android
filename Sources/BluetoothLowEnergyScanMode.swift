//
//  AndroidBluetoothLEScanMode.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift

public extension Android.Bluetooth.LE {
    
    public typealias ScanMode = AndroidBluetoothLowEnergyScanMode
}

/// LE Scan mode.
public struct AndroidBluetoothLowEnergyScanMode: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /**
     * Perform Bluetooth LE scan in balanced power mode. Scan results are returned at a rate that
     * provides a good trade-off between scan frequency and power consumption.
     */
    public static let balanced = Android.Bluetooth.LE.ScanMode(rawValue: Android.Bluetooth.LE.ScanSettings.SCAN_MODE_BALANCED)
}
