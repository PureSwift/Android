//
//  BluetoothGattCallback.swift
//  Android
//
//  Created by Marco Estrella on 6/7/18.
//

import Foundation
import java_swift
import java_util
import JNI

public extension Android.Bluetooth.LE {
    
    public typealias GattCallback = AndroidBluetoothGattCallback
}

/// his abstract class is used to implement BluetoothGatt callbacks.
public protocol AndroidBluetoothGattCallback: JavaProtocol {
    
    func onCharacteristicChanged(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic)
    
    func onCharacteristicRead(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic, status: Android.Bluetooth.Gatt.Status)
    
    func onCharacteristicWrite(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic, status: Android.Bluetooth.Gatt.Status)
    
    func onConnectionStateChange(gatt: Android.Bluetooth.Gatt, status: Android.Bluetooth.Gatt.Status, newStatus: Android.Bluetooth.Gatt.Status)
}
