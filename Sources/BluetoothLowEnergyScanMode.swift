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
    
    public typealias CallbackType = AndroidBluetoothLowEnergyCallbackType
    
    public typealias MatchMode = AndroidBluetoothLowEnergyMatchMode
    
    public typealias MatchNum = AndroidBluetoothLowEnergyMatchNum
    
    public typealias Phy = AndroidBluetoothLowEnergyPhy
}

/// LE Scan mode.
public struct AndroidBluetoothLowEnergyScanMode: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /**
     * Perform Bluetooth LE scan in low power mode. This is the default scan mode as it consumes the least power. This mode
     * is enforced if the scanning application is not in foreground.
     */
    public static let lowPower = Android.Bluetooth.LE.ScanMode(rawValue: Android.Bluetooth.LE.ScanSettings.SCAN_MODE_LOW_POWER)
    
    /**
     * Perform Bluetooth LE scan in balanced power mode. Scan results are returned at a rate that
     * provides a good trade-off between scan frequency and power consumption.
     */
    public static let balanced = Android.Bluetooth.LE.ScanMode(rawValue: Android.Bluetooth.LE.ScanSettings.SCAN_MODE_BALANCED)
    
    /**
     * Scan using highest duty cycle. It's recommended to only use this mode when the application is running in the foreground.
     */
    public static let lowLatency = Android.Bluetooth.LE.ScanMode(rawValue: Android.Bluetooth.LE.ScanSettings.SCAN_MODE_LOW_LATENCY)
}

/// LE Callback Type
public struct AndroidBluetoothLowEnergyCallbackType: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    /**
     * Trigger a callback for every Bluetooth advertisement found that matches the filter criteria. If no filter is active, all
     * advertisement packets are reported.
     */
    public static let allMatches = Android.Bluetooth.LE.CallbackType(rawValue: Android.Bluetooth.LE.ScanSettings.CALLBACK_TYPE_ALL_MATCHES)
    
    /**
     * A result callback is only triggered for the first advertisement packet received that matches the filter criteria.
     */
    public static let firstMatch = Android.Bluetooth.LE.CallbackType(rawValue: Android.Bluetooth.LE.ScanSettings.CALLBACK_TYPE_FIRST_MATCH)
    
    /**
     * Receive a callback when advertisements are no longer received from a device that has been previously reported by a first match callback.
     */
    public static let matchLost = Android.Bluetooth.LE.CallbackType(rawValue: Android.Bluetooth.LE.ScanSettings.CALLBACK_TYPE_MATCH_LOST)
}

/// LE Match Mode
public struct AndroidBluetoothLowEnergyMatchMode: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /**
     * In Aggressive mode, hw will determine a match sooner even with feeble signal strength and few number of sightings/match in a duration.
     */
    public static let aggressive = Android.Bluetooth.LE.MatchMode(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_MODE_AGGRESSIVE)
    
    /**
     * For sticky mode, higher threshold of signal strength and sightings is required before reporting by hw
     */
    public static let sticky = Android.Bluetooth.LE.MatchMode(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_MODE_STICKY)
}

/// LE Match Num
public struct AndroidBluetoothLowEnergyMatchNum: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /**
     * Match one advertisement per filter.
     */
    public static let oneAdvertisement = Android.Bluetooth.LE.MatchNum(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_NUM_ONE_ADVERTISEMENT)
    
    /**
     * Match few advertisement per filter, depends on current capability and availibility of the resources in hw.
     */
    public static let fewAdvertisement = Android.Bluetooth.LE.MatchNum(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_NUM_FEW_ADVERTISEMENT)
    
    /**
     * Match as many advertisement per filter as hw could allow, depends on current capability and availibility of the resources in hw.
     */
    public static let maxAdvertisement = Android.Bluetooth.LE.MatchNum(rawValue: Android.Bluetooth.LE.ScanSettings.MATCH_NUM_MAX_ADVERTISEMENT)
}

/// LE Phy
public struct AndroidBluetoothLowEnergyPhy: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /**
     * Bluetooth LE 1M PHY. Used to refer to LE 1M Physical Channel for advertising, scanning or connection.
     */
    public static let phyLe1m = Android.Bluetooth.LE.Phy(rawValue: Android.Bluetooth.Device.PHY_LE_1M)
    
    /**
     * Bluetooth LE Coded PHY. Used to refer to LE Coded Physical Channel for advertising, scanning or connection.
     */
    public static let phyCoded = Android.Bluetooth.LE.Phy(rawValue: Android.Bluetooth.Device.PHY_LE_CODED)
    
    /**
     * Use all supported PHYs for scanning. This will check the controller capabilities, and start the scan on 1Mbit and LE Coded PHYs if supported, or on the 1Mbit PHY only.
     */
    public static let phyLeAllSupported = Android.Bluetooth.LE.Phy(rawValue: Android.Bluetooth.LE.ScanSettings.PHY_LE_ALL_SUPPORTED)
}
