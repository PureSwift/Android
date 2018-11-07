//
//  BluetoothGattServerCallback.swift
//  Android
//
//  Created by Marco Estrella on 6/7/18.
//

import Foundation
import java_swift
import java_util
import JNI
import Android

public extension Android.Bluetooth {
    
    public typealias GattServerCallback = AndroidBluetoothGattServerCallback
}

/// This abstract class is used to implement BluetoothGattServer callbacks.
public protocol AndroidBluetoothGattServerCallback: JavaProtocol {
    
    func onCharacteristicReadRequest(device: Android.Bluetooth.Device, requestId: Int, offset: Int, characteristic: Android.Bluetooth.GattCharacteristic)
    
    func onCharacteristicWriteRequest(device: Android.Bluetooth.Device, requestId: Int, characteristic: Android.Bluetooth.GattCharacteristic, preparedWrite: Bool, responseNeeded: Bool, offset: Int, value: [Int8])
    
    func onConnectionStateChange(device: Android.Bluetooth.Device, status: Int, newState: Int)
    
    func onDescriptorReadRequest(device: Android.Bluetooth.Device, requestId: Int, offset: Int, descriptor: Android.Bluetooth.GattDescriptor)
    
    func onDescriptorWriteRequest(device: Android.Bluetooth.Device, requestId: Int, descriptor: Android.Bluetooth.GattDescriptor, preparedWrite: Bool, responseNeeded: Bool, offset: Int, value: [Int8])
    
    func onExecuteWrite(device: Android.Bluetooth.Device, requestId: Int, execute: Bool)
    
    func onMtuChanged(device: Android.Bluetooth.Device, mtu: Int)
    
    func onNotificationSent(device: Android.Bluetooth.Device, status: Int)
    
    func onPhyRead(device: Android.Bluetooth.Device, txPhy: Int, rxPhy: Int, status: Int)
    
    func onPhyUpdate(device: Android.Bluetooth.Device, txPhy: Int, rxPhy: Int, status: Int)
    
    func onServiceAdded(status: Int, service: Android.Bluetooth.GattService)
    
    
}
