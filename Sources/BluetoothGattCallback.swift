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

public extension Android.Bluetooth {
    
    public typealias GattCallback = AndroidBluetoothGattCallback
}

/// his abstract class is used to implement BluetoothGatt callbacks.
public protocol AndroidBluetoothGattCallback: JavaProtocol {
    
    func onCharacteristicChanged(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic)
    
    func onCharacteristicRead(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic, status: Android.Bluetooth.Gatt.Status)
    
    func onCharacteristicWrite(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic, status: Android.Bluetooth.Gatt.Status)
    
    func onConnectionStateChange(gatt: Android.Bluetooth.Gatt, status: Android.Bluetooth.Gatt.Status, newStatus: Android.Bluetooth.Gatt.Status)
    
    func onDescriptorRead(gatt: Android.Bluetooth.Gatt, descriptor: Android.Bluetooth.GattDescriptor, status: Android.Bluetooth.Gatt.Status)
    
    func onDescriptorWrite(gatt: Android.Bluetooth.Gatt, descriptor: Android.Bluetooth.GattDescriptor, status: Android.Bluetooth.Gatt.Status)
    
    func onMtuChanged(gatt: Android.Bluetooth.Gatt, mtu: Int, status: Android.Bluetooth.Gatt.Status)
    
    func onPhyRead(gatt: Android.Bluetooth.Gatt, txPhy: Android.Bluetooth.Gatt.TxPhy, rxPhy: Android.Bluetooth.Gatt.RxPhy, status: Android.Bluetooth.Gatt.Status)
    
    func onPhyUpdate(gatt: Android.Bluetooth.Gatt, txPhy: Android.Bluetooth.Gatt.TxPhy, rxPhy: Android.Bluetooth.Gatt.RxPhy, status: Android.Bluetooth.Gatt.Status)
    
    func onReadRemoteRssi(gatt: Android.Bluetooth.Gatt, rssi: Int, status: Android.Bluetooth.Gatt.Status)
    
    func onReliableWriteCompleted(gatt: Android.Bluetooth.Gatt, status: Android.Bluetooth.Gatt.Status)
    
    func onServicesDiscovered(gatt: Android.Bluetooth.Gatt, status: Android.Bluetooth.Gatt.Status)
}


// MARK: - Local Listener

extension AndroidBluetoothGattCallback {
    
    public func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return AndroidBluetoothGattCallbackLocal( owned: self, proto: self ).localJavaObject( locals )
    }
}

internal class AndroidBluetoothGattCallbackLocal: JNILocalProxy<AndroidBluetoothGattCallback, Any> {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives: [JNINativeMethod] = [
            //JNICache.Method.onScanResult.method,
            .finalize
        ]
        
        let clazz = JNI.FindClass( proxyClassName() )
        
        withUnsafePointer(to: &natives[0]) {
            nativesPtr in
            if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, jint(natives.count) ) != jint(JNI_OK) {
                JNI.report( "Unable to register java natives" )
            }
        }
        
        defer { JNI.DeleteLocalRef( clazz ) }
        
        return JNI.api.NewGlobalRef( JNI.env, clazz )!
    }()
    
    override open class func proxyClassName() -> String { return JNICache.className }
    
    override open class func proxyClass() -> jclass? { return _proxyClass }
}

internal extension AndroidBluetoothGattCallbackLocal {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Bluetooth.className(["SwiftBluetoothGattCallback"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Method cache
        fileprivate enum Method {
            
            internal
            enum onCharacteristicChanged: JNINativeMethodEntry {
                
                static let name = "__onCharacteristicChanged"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .object(Android.Bluetooth.GattCharacteristic.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnCharacteristicChanged_Type = AndroidBluetoothGattCallback_onCharacteristicChanged
            }
            
            internal
            enum onCharacteristicRead: JNINativeMethodEntry {
                
                static let name = "__onCharacteristicRead"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .object(Android.Bluetooth.GattCharacteristic.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnCharacteristicRead_Type = AndroidBluetoothGattCallback_onCharacteristicRead
            }
            
            internal
            enum onCharacteristicWrite: JNINativeMethodEntry {
                
                static let name = "__onCharacteristicWrite"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .object(Android.Bluetooth.GattCharacteristic.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnCharacteristicWrite_Type = AndroidBluetoothGattCallback_onCharacteristicWrite
            }
        }
    }
}

// MARK: - Private Methods

private typealias AndroidBluetoothGattCallback_OnCharacteristicChanged_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jobject?) -> ()

private func AndroidBluetoothGattCallback_onCharacteristicChanged( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                _ __this: jobject?,
                                                                _ __swiftObject: jlong,
                                                                _ gattParam: jobject?,
                                                                _ characteristicParam: jobject?) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let characteristic = Android.Bluetooth.GattCharacteristic(javaObject: characteristicParam)
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onCharacteristicChanged(gatt: gatt, characteristic: characteristic)
}

private typealias AndroidBluetoothGattCallback_OnCharacteristicRead_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jobject?, _: jint) -> ()

private func AndroidBluetoothGattCallback_onCharacteristicRead( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ gattParam: jobject?,
                                                                 _ characteristicParam: jobject?,
                                                                 _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let characteristic = Android.Bluetooth.GattCharacteristic(javaObject: characteristicParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onCharacteristicRead(gatt: gatt, characteristic: characteristic, status: status)
}

private typealias AndroidBluetoothGattCallback_OnCharacteristicWrite_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jobject?, _: jint) -> ()

private func AndroidBluetoothGattCallback_onCharacteristicWrite( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                        _ __this: jobject?,
                                                                        _ __swiftObject: jlong,
                                                                        _ gattParam: jobject?,
                                                                        _ characteristicParam: jobject?,
                                                                        _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let characteristic = Android.Bluetooth.GattCharacteristic(javaObject: characteristicParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onCharacteristicWrite(gatt: gatt, characteristic: characteristic, status: status)
}
