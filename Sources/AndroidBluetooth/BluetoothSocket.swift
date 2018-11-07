//
//  BluetoothSocket.swift
//  Android
//
//  Created by Marco Estrella on 5/30/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth {
    
    public typealias Socket = AndroidBluetoothSocket
}

/**
 * A connected or connecting Bluetooth socket.
 *
 * The interface for Bluetooth Sockets is similar to that of TCP sockets: Socket and ServerSocket.
 * On the server side, use a BluetoothServerSocket to create a listening server socket.
 * When a connection is accepted by the BluetoothServerSocket, it will return a new BluetoothSocket
 * to manage the connection. On the client side, use a single BluetoothSocket to both initiate an
 * outgoing connection and to manage the connection.
 *
 * The most common type of Bluetooth socket is RFCOMM, which is the type supported by the Android APIs.
 * RFCOMM is a connection-oriented, streaming transport over Bluetooth. It is also known as the Serial Port Profile (SPP).
 *
 * To create a BluetoothSocket for connecting to a known device, use BluetoothDevice.createRfcommSocketToServiceRecord().
 * Then call connect() to attempt a connection to the remote device. This call will block until a connection is established or the connection fails.
 *
 * To create a BluetoothSocket as a server (or "host"), see the BluetoothServerSocket documentation.
 *
 * Once the socket is connected, whether initiated as a client or accepted as a server, open the IO streams by calling getInputStream()
 * and getOutputStream() in order to retrieve InputStream and OutputStream objects, respectively, which are automatically connected to the socket.
 *
 * BluetoothSocket is thread safe. In particular, close() will always immediately abort ongoing operations and close the socket.
 *
 * Note: Requires the BLUETOOTH permission.
 */
public final class AndroidBluetoothSocket: JavaObject {
    
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

// MARK: Constants

internal extension AndroidBluetoothSocket {
    
    /// L2CAP socket
    internal static var TYPE_L2CAP: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TYPE_L2CAP",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TYPE_L2CAP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// RFCOMM socket
    internal static var TYPE_RFCOMM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TYPE_RFCOMM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TYPE_RFCOMM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /// SCO socket
    internal static var TYPE_SCO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TYPE_SCO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TYPE_SCO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
}

// MARK: Methods

public extension AndroidBluetoothSocket {
    
    /**
     * Closes this stream and releases any system resources associated with it.
     */
    public func close() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                    methodName: "close",
                                    methodSig: "()V",
                                    methodCache: &JNICache.MethodID.close,
                                    args: &__args,
                                    locals: &__locals)
    }
    
    /**
     * Attempt to connect to a remote device.
     */
    public func connect() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "connect",
                                 methodSig: "()V",
                                 methodCache: &JNICache.MethodID.connect,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    /**
     * Attempt to connect to a remote device.
     */
    public func getConnectionType() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                 methodName: "getConnectionType",
                                 methodSig: "()I",
                                 methodCache: &JNICache.MethodID.getConnectionType,
                                 args: &__args,
                                 locals: &__locals)
        
        return Int(__return)
    }
    
    /**
     * Get the input stream associated with this socket.
     */
    public func getInputStream() -> JavaObject {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                               methodName: "getInputStream",
                                               methodSig: "()Ljava/io/InputStream;",
                                               methodCache: &JNICache.MethodID.getInputStream,
                                               args: &__args,
                                               locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JavaObject(javaObject: __return)
    }
    
    /**
     * Get the maximum supported Receive packet size for the underlying transport.
     */
    public func getMaxReceivePacketSize() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getMaxReceivePacketSize",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getMaxReceivePacketSize,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Get the maximum supported Transmit packet size for the underlying transport.
     */
    public func getMaxTransmitPacketSize() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getMaxTransmitPacketSize",
                                               methodSig: "()I",
                                               methodCache: &JNICache.MethodID.getMaxTransmitPacketSize,
                                               args: &__args,
                                               locals: &__locals)
        return Int(__return)
    }
    
    /**
     * Get the output stream associated with this socket.
     */
    public func getOutputStream() -> JavaObject {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getOutputStream",
                                                  methodSig: "()Ljava/io/OutputStream;",
                                                  methodCache: &JNICache.MethodID.getOutputStream,
                                                  args: &__args,
                                                  locals: &__locals)
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JavaObject(javaObject: __return)
    }
    
    /**
     * Get the remote device this socket is connecting, or connected, to.
     */
    public func getRemoteDevice() -> Android.Bluetooth.Device {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getRemoteDevice",
                                                  methodSig: "()Landroid/bluetooth/BluetoothDevice;",
                                                  methodCache: &JNICache.MethodID.getRemoteDevice,
                                                  args: &__args,
                                                  locals: &__locals)
        defer { JNI.DeleteLocalRef( __return ) }
        
        return Android.Bluetooth.Device(javaObject: __return)
    }
    
    /**
     * Get the connection status of this socket, ie, whether there is an active connection with remote device.
     */
    public func isConnected() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                    methodName: "isConnected",
                                    methodSig: "()Z",
                                    methodCache: &JNICache.MethodID.isConnected,
                                    args: &__args,
                                    locals: &__locals)
        
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothSocket {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothSocket"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var TYPE_L2CAP: jfieldID?
            static var TYPE_RFCOMM: jfieldID?
            static var TYPE_SCO: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var close: jmethodID?
            static var connect: jmethodID?
            static var getConnectionType: jmethodID?
            static var getInputStream: jmethodID?
            static var getMaxReceivePacketSize: jmethodID?
            static var getMaxTransmitPacketSize: jmethodID?
            static var getOutputStream: jmethodID?
            static var getRemoteDevice: jmethodID?
            static var isConnected: jmethodID?
        }
    }
}
