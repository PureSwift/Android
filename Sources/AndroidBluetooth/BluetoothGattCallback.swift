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
import Android

public extension Android.Bluetooth {
    
    public typealias GattCallback = AndroidBluetoothGattCallback
}

/// his abstract class is used to implement BluetoothGatt callbacks.
open class AndroidBluetoothGattCallback: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        bindNewJavaObject()
    }
    
    /// Initialize a new Java instance and bind to this Swift object.
    public func bindNewJavaObject() {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: JNICache.className,
                                                          classObject: JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &JNICache.MethodID.new_method,
                                                          args: &args,
                                                          locals: &locals )
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    open func onCharacteristicChanged(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic) {}
    
    open func onCharacteristicRead(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onCharacteristicWrite(gatt: Android.Bluetooth.Gatt, characteristic: Android.Bluetooth.GattCharacteristic, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onConnectionStateChange(gatt: Android.Bluetooth.Gatt, status: Android.Bluetooth.Gatt.Status, newState: Android.Bluetooth.Device.State) {}
    
    open func onDescriptorRead(gatt: Android.Bluetooth.Gatt, descriptor: Android.Bluetooth.GattDescriptor, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onDescriptorWrite(gatt: Android.Bluetooth.Gatt, descriptor: Android.Bluetooth.GattDescriptor, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onMtuChanged(gatt: Android.Bluetooth.Gatt, mtu: Int, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onPhyRead(gatt: Android.Bluetooth.Gatt, txPhy: Android.Bluetooth.Gatt.TxPhy, rxPhy: Android.Bluetooth.Gatt.RxPhy, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onPhyUpdate(gatt: Android.Bluetooth.Gatt, txPhy: Android.Bluetooth.Gatt.TxPhy, rxPhy: Android.Bluetooth.Gatt.RxPhy, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onReadRemoteRssi(gatt: Android.Bluetooth.Gatt, rssi: Int, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onReliableWriteCompleted(gatt: Android.Bluetooth.Gatt, status: Android.Bluetooth.Gatt.Status) {}
    
    open func onServicesDiscovered(gatt: Android.Bluetooth.Gatt, status: Android.Bluetooth.Gatt.Status) {}
}

extension AndroidBluetoothGattCallback: JNIListener { }

fileprivate extension AndroidBluetoothGattCallback {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Bluetooth.className(["SwiftBluetoothGattCallback"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        static var jniClassConstants: jclass?
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            //onCharacteristicChanged
            let OnCharacteristicChangedSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .object(Android.Bluetooth.GattCharacteristic.JNICache.classSignature)
                ], returnType: .void)
            
            let OnCharacteristicChanged: AndroidBluetoothGattCallback_OnCharacteristicChanged_Type = AndroidBluetoothGattCallback_onCharacteristicChanged
            
            natives.append( JNINativeMethod(name: strdup("__onCharacteristicChanged"),
                                            signature: strdup(OnCharacteristicChangedSignature.rawValue),
                                            fnPtr: unsafeBitCast( OnCharacteristicChanged, to: UnsafeMutableRawPointer.self ) ))
            
            //onCharacteristicRead
            let OnCharacteristicReadSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .object(Android.Bluetooth.GattCharacteristic.JNICache.classSignature),
                    .int
                ], returnType: .void)
            
            let onCharacteristicRead: AndroidBluetoothGattCallback_OnCharacteristicRead_Type = AndroidBluetoothGattCallback_onCharacteristicRead
            
            natives.append( JNINativeMethod(name: strdup("__onCharacteristicRead"),
                                            signature: strdup(OnCharacteristicReadSignature.rawValue),
                                            fnPtr: unsafeBitCast( onCharacteristicRead, to: UnsafeMutableRawPointer.self ) ))
            
            //onCharacteristicWrite
            let onCharacteristicWriteSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .object(Android.Bluetooth.GattCharacteristic.JNICache.classSignature),
                    .int
                ], returnType: .void)
            
            let onCharacteristicWrite: AndroidBluetoothGattCallback_OnCharacteristicWrite_Type = AndroidBluetoothGattCallback_onCharacteristicWrite
            
            natives.append( JNINativeMethod(name: strdup("__onCharacteristicWrite"),
                                            signature: strdup(onCharacteristicWriteSignature.rawValue),
                                            fnPtr: unsafeBitCast( onCharacteristicWrite, to: UnsafeMutableRawPointer.self ) ))
            
            //onConnectionStateChange
            let onConnectionStateChangeSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .int,
                    .int
                ], returnType: .void)
            
            let onConnectionStateChange: AndroidBluetoothGattCallback_OnConnectionStateChange_Type = AndroidBluetoothGattCallback_onConnectionStateChange
            
            natives.append( JNINativeMethod(name: strdup("__onConnectionStateChange"),
                                            signature: strdup(onConnectionStateChangeSignature.rawValue),
                                            fnPtr: unsafeBitCast( onConnectionStateChange, to: UnsafeMutableRawPointer.self ) ))
            
            //onDescriptorRead
            let onDescriptorReadSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .object(Android.Bluetooth.GattDescriptor.JNICache.classSignature),
                    .int
                ], returnType: .void)
            
            let onDescriptorRead: AndroidBluetoothGattCallback_OnDescriptorRead_Type = AndroidBluetoothGattCallback_onDescriptorRead
            
            natives.append( JNINativeMethod(name: strdup("__onDescriptorRead"),
                                            signature: strdup(onDescriptorReadSignature.rawValue),
                                            fnPtr: unsafeBitCast( onDescriptorRead, to: UnsafeMutableRawPointer.self ) ))
            
            //onDescriptorWrite
            let onDescriptorWriteSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .object(Android.Bluetooth.GattDescriptor.JNICache.classSignature),
                    .int
                ], returnType: .void)
            
            let onDescriptorWrite: AndroidBluetoothGattCallback_OnDescriptorWrite_Type = AndroidBluetoothGattCallback_onDescriptorWrite
            
            natives.append( JNINativeMethod(name: strdup("__onDescriptorWrite"),
                                            signature: strdup(onDescriptorWriteSignature.rawValue),
                                            fnPtr: unsafeBitCast( onDescriptorWrite, to: UnsafeMutableRawPointer.self ) ))
            
            //onMtuChanged
            let onMtuChangedSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .int,
                    .int
                ], returnType: .void)
            
            let onMtuChanged: AndroidBluetoothGattCallback_OnMtuChanged_Type = AndroidBluetoothGattCallback_onMtuChanged
            
            natives.append( JNINativeMethod(name: strdup("__onMtuChanged"),
                                            signature: strdup(onMtuChangedSignature.rawValue),
                                            fnPtr: unsafeBitCast( onMtuChanged, to: UnsafeMutableRawPointer.self ) ))
            
            //onPhyRead
            let onPhyReadSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .int,
                    .int,
                    .int
                ], returnType: .void)
            
            let onPhyRead: AndroidBluetoothGattCallback_OnPhyRead_Type = AndroidBluetoothGattCallback_onPhyRead
            
            natives.append( JNINativeMethod(name: strdup("__onPhyRead"),
                                            signature: strdup(onPhyReadSignature.rawValue),
                                            fnPtr: unsafeBitCast( onPhyRead, to: UnsafeMutableRawPointer.self ) ))
            
            //onPhyUpdate
            
            let onPhyUpdateSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .int,
                    .int,
                    .int
                ], returnType: .void)
            
            let onPhyUpdate: AndroidBluetoothGattCallback_OnPhyUpdate_Type = AndroidBluetoothGattCallback_onPhyUpdate
            
            natives.append( JNINativeMethod(name: strdup("__onPhyUpdate"),
                                            signature: strdup(onPhyUpdateSignature.rawValue),
                                            fnPtr: unsafeBitCast( onPhyUpdate, to: UnsafeMutableRawPointer.self ) ))
            
            //onReadRemoteRssi
            let onReadRemoteRssiSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .int,
                    .int
                ], returnType: .void)
            
            let onReadRemoteRssi: AndroidBluetoothGattCallback_OnReadRemoteRssi_Type = AndroidBluetoothGattCallback_onReadRemoteRssi
            
            natives.append( JNINativeMethod(name: strdup("__onReadRemoteRssi"),
                                            signature: strdup(onReadRemoteRssiSignature.rawValue),
                                            fnPtr: unsafeBitCast( onReadRemoteRssi, to: UnsafeMutableRawPointer.self ) ))
            
            //onReliableWriteCompleted
            let onReliableWriteCompletedSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .int
                ], returnType: .void)
            
            let onReliableWriteCompleted: AndroidBluetoothGattCallback_OnReliableWriteCompleted_Type = AndroidBluetoothGattCallback_onReliableWriteCompleted
            
            natives.append( JNINativeMethod(name: strdup("__onReliableWriteCompleted"),
                                            signature: strdup(onReliableWriteCompletedSignature.rawValue),
                                            fnPtr: unsafeBitCast( onReliableWriteCompleted, to: UnsafeMutableRawPointer.self ) ))
            
            //onServicesDiscovered
            let onServicesDiscoveredSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(Android.Bluetooth.Gatt.JNICache.classSignature),
                    .int
                ], returnType: .void)
            
            let onServicesDiscovered: AndroidBluetoothGattCallback_OnServicesDiscovered_Type = AndroidBluetoothGattCallback_onServicesDiscovered
            
            natives.append( JNINativeMethod(name: strdup("__onServicesDiscovered"),
                                            signature: strdup(onServicesDiscoveredSignature.rawValue),
                                            fnPtr: unsafeBitCast( onServicesDiscovered, to: UnsafeMutableRawPointer.self ) ))
            
            let clazz = JNI.FindClass( className )
            
            let nativesCount = jint(natives.count)
        withUnsafePointer(to: &natives[0]) { nativesPtr in
            if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, nativesCount ) != jint(JNI_OK) {
                JNI.report( "Unable to register java natives" )
            }
        }
            
            defer { JNI.DeleteLocalRef( clazz ) }
            
            return JNI.api.NewGlobalRef( JNI.env, clazz )!
        }()
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var new_method: jmethodID?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
        .onCharacteristicWrite(gatt: gatt, characteristic: characteristic, status: status)
}

private typealias AndroidBluetoothGattCallback_OnConnectionStateChange_Type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jint) -> ()

private func AndroidBluetoothGattCallback_onConnectionStateChange( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ gattParam: jobject?,
                                                                 _ statusParam: jint,
                                                                 _ newStateParam: jint) -> () {
    let gatt = Android.Bluetooth.Gatt(javaObject: gattParam)
    
    let status = Android.Bluetooth.Gatt.Status(rawValue: Int(statusParam))
    
    let newState = Android.Bluetooth.Device.State(rawValue: Int(newStateParam))
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
        .onConnectionStateChange(gatt: gatt, status: status, newState: newState)
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
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
    
    AndroidBluetoothGattCallback
        .swiftObject(from: __swiftObject)?
        .onServicesDiscovered(gatt: gatt, status: status)
}
