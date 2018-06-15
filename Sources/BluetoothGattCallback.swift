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
                        .object(Android.Bluetooth.GattCharacteristic.JNICache.classSignature)
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
            
            internal
            enum onConnectionStateChange: JNINativeMethodEntry {
                
                static let name = "__onConnectionStateChange"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .int,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnConnectionStateChange_Type = AndroidBluetoothGattCallback_onConnectionStateChange
            }
            
            internal
            enum onDescriptorRead: JNINativeMethodEntry {
                
                static let name = "__onDescriptorRead"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .object(Android.Bluetooth.GattDescriptor.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnDescriptorRead_Type = AndroidBluetoothGattCallback_onDescriptorRead
            }
            
            internal
            enum onDescriptorWrite: JNINativeMethodEntry {
                
                static let name = "__onDescriptorWrite"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .object(Android.Bluetooth.GattDescriptor.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnDescriptorWrite_Type = AndroidBluetoothGattCallback_onDescriptorWrite
            }
            
            internal
            enum onMtuChanged: JNINativeMethodEntry {
                
                static let name = "__onMtuChanged"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .int,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnMtuChanged_Type = AndroidBluetoothGattCallback_onMtuChanged
            }
            
            internal
            enum onPhyRead: JNINativeMethodEntry {
                
                static let name = "__onPhyRead"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .int,
                        .int,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnPhyRead_Type = AndroidBluetoothGattCallback_onPhyRead
            }
            
            internal
            enum onPhyUpdate: JNINativeMethodEntry {
                
                static let name = "__onPhyUpdate"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .int,
                        .int,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnPhyUpdate_Type = AndroidBluetoothGattCallback_onPhyUpdate
            }
            
            internal
            enum onReadRemoteRssi: JNINativeMethodEntry {
                
                static let name = "__onReadRemoteRssi"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .int,
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnReadRemoteRssi_Type = AndroidBluetoothGattCallback_onReadRemoteRssi
            }
            
            internal
            enum onReliableWriteCompleted: JNINativeMethodEntry {
                
                static let name = "__onReliableWriteCompleted"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnReliableWriteCompleted_Type = AndroidBluetoothGattCallback_onReliableWriteCompleted
            }
            
            internal
            enum onServicesDiscovered: JNINativeMethodEntry {
                
                static let name = "__onServicesDiscovered"
                
                static let signature = JNIMethodSignature(
                    argumentTypes: [
                        .long,
                        .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                        .int
                    ], returnType: .void)
                
                static let thunk: AndroidBluetoothGattCallback_OnServicesDiscovered_Type = AndroidBluetoothGattCallback_onServicesDiscovered
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

private typealias AndroidBluetoothGattCallback_OnConnectionStateChange_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint) -> ()

private func AndroidBluetoothGattCallback_onConnectionStateChange( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ gattParam: jobject?,
                                                                 _ statusParam: jint,
                                                                 _ newStatusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    let newStatus = Android.Bluetooth.Gatt.Status(rawValue: Int(newStatusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onConnectionStateChange(gatt: gatt, status: status, newStatus: newStatus)
}

private typealias AndroidBluetoothGattCallback_OnDescriptorRead_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jobject?, _: jint) -> ()

private func AndroidBluetoothGattCallback_onDescriptorRead( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                   _ __this: jobject?,
                                                                   _ __swiftObject: jlong,
                                                                   _ gattParam: jobject?,
                                                                   _ descriptorParam: jobject?,
                                                                   _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let descriptor = Android.Bluetooth.GattDescriptor(javaObject: descriptorParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onDescriptorRead(gatt: gatt, descriptor: descriptor, status: status)
}

private typealias AndroidBluetoothGattCallback_OnDescriptorWrite_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jobject?, _: jint) -> ()

private func AndroidBluetoothGattCallback_onDescriptorWrite( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                            _ __this: jobject?,
                                                            _ __swiftObject: jlong,
                                                            _ gattParam: jobject?,
                                                            _ descriptorParam: jobject?,
                                                            _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let descriptor = Android.Bluetooth.GattDescriptor(javaObject: descriptorParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onDescriptorWrite(gatt: gatt, descriptor: descriptor, status: status)
}

private typealias AndroidBluetoothGattCallback_OnMtuChanged_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint) -> ()

private func AndroidBluetoothGattCallback_onMtuChanged( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                             _ __this: jobject?,
                                                             _ __swiftObject: jlong,
                                                             _ gattParam: jobject?,
                                                             _ mtuParam: jint,
                                                             _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let mtu = Int(mtuParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onMtuChanged(gatt: gatt, mtu: mtu, status: status)
}

private typealias AndroidBluetoothGattCallback_OnPhyRead_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint, _: jint) -> ()

private func AndroidBluetoothGattCallback_onPhyRead( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                        _ __this: jobject?,
                                                        _ __swiftObject: jlong,
                                                        _ gattParam: jobject?,
                                                        _ txPhyParam: jint,
                                                        _ rxPhyParam: jint,
                                                        _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let txPhy = Android.Bluetooth.Gatt.TxPhy(rawValue: Int(txPhyParam))
    
    let rxPhy = Android.Bluetooth.Gatt.RxPhy(rawValue: Int(rxPhyParam))
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onPhyRead(gatt: gatt, txPhy: txPhy, rxPhy: rxPhy, status: status)
}

private typealias AndroidBluetoothGattCallback_OnPhyUpdate_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint, _: jint) -> ()

private func AndroidBluetoothGattCallback_onPhyUpdate( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                     _ __this: jobject?,
                                                     _ __swiftObject: jlong,
                                                     _ gattParam: jobject?,
                                                     _ txPhyParam: jint,
                                                     _ rxPhyParam: jint,
                                                     _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let txPhy = Android.Bluetooth.Gatt.TxPhy(rawValue: Int(txPhyParam))
    
    let rxPhy = Android.Bluetooth.Gatt.RxPhy(rawValue: Int(rxPhyParam))
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onPhyUpdate(gatt: gatt, txPhy: txPhy, rxPhy: rxPhy, status: status)
}

private typealias AndroidBluetoothGattCallback_OnReadRemoteRssi_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint) -> ()

private func AndroidBluetoothGattCallback_onReadRemoteRssi( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                       _ __this: jobject?,
                                                       _ __swiftObject: jlong,
                                                       _ gattParam: jobject?,
                                                       _ rssiParam: jint,
                                                       _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let rssi = Int(rssiParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onReadRemoteRssi(gatt: gatt, rssi: rssi, status: status)
}

private typealias AndroidBluetoothGattCallback_OnReliableWriteCompleted_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

private func AndroidBluetoothGattCallback_onReliableWriteCompleted( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                            _ __this: jobject?,
                                                            _ __swiftObject: jlong,
                                                            _ gattParam: jobject?,
                                                            _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)

    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onReliableWriteCompleted(gatt: gatt, status: status)
}

private typealias AndroidBluetoothGattCallback_OnServicesDiscovered_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint) -> ()

private func AndroidBluetoothGattCallback_onServicesDiscovered( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                    _ __this: jobject?,
                                                                    _ __swiftObject: jlong,
                                                                    _ gattParam: jobject?,
                                                                    _ statusParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    AndroidBluetoothGattCallbackLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .onServicesDiscovered(gatt: gatt, status: status)
}
