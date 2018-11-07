//
//  BluetoothServerSocket.swift
//  Android
//
//  Created by Marco Estrella on 5/30/18.
//

import Foundation
import java_swift
import Android

public extension Android.Bluetooth {
    
    public typealias ServerSocket = AndroidBluetoothServerSocket
}

/**
 * A listening Bluetooth socket.
 *
 * The interface for Bluetooth Sockets is similar to that of TCP sockets: Socket and ServerSocket. On the server side,
 * use a BluetoothServerSocket to create a listening server socket. When a connection is accepted by the
 * BluetoothServerSocket, it will return a new BluetoothSocket to manage the connection. On the client side, use a
 * single BluetoothSocket to both initiate an outgoing connection and to manage the connection.
 *
 * The most common type of Bluetooth socket is RFCOMM, which is the type supported by the Android APIs. RFCOMM is a
 * connection-oriented, streaming transport over Bluetooth. It is also known as the Serial Port Profile (SPP).
 *
 * To create a listening BluetoothServerSocket that's ready for incoming connections, use BluetoothAdapter.listenUsingRfcommWithServiceRecord().
 * Then call accept() to listen for incoming connection requests. This call will block until a connection is established, at which point,
 * it will return a BluetoothSocket to manage the connection. Once the BluetoothSocket is acquired, it's a good idea to call close()
 * on the BluetoothServerSocket when it's no longer needed for accepting connections. Closing the BluetoothServerSocket will not close the returned BluetoothSocket.
 *
 * BluetoothServerSocket is thread safe. In particular, close() will always immediately abort ongoing operations and close the server socket.
 *
 * Note: Requires the BLUETOOTH permission.
 */
public final class AndroidBluetoothServerSocket: JavaObject {
    
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

// MARK: Maethods

public extension AndroidBluetoothServerSocket {
    
    /**
     * Block until a connection is established.
     *
     * Returns a connected BluetoothSocket on successful connection.
     *
     * Once this call returns, it can be called again to accept subsequent incoming connections.
     *
     * close() can be used to abort this call from another thread.
     */
    public func accept() -> Android.Bluetooth.Socket {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)

        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "accept",
                                                  methodSig: "()Landroid/bluetooth/BluetoothSocket;",
                                                  methodCache: &JNICache.MethodID.accept,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Bluetooth.Socket(javaObject: __return)
    }
    
    /**
     * Block until a connection is established, with timeout.
     *
     * Returns a connected BluetoothSocket on successful connection.
     *
     * Once this call returns, it can be called again to accept subsequent incoming connections.
     *
     * close() can be used to abort this call from another thread.
     */
    public func accept(timeout: Int) -> Android.Bluetooth.Socket {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(i: jint(timeout) )
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "accept",
                                                  methodSig: "(I)Landroid/bluetooth/BluetoothSocket;",
                                                  methodCache: &JNICache.MethodID.accept,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Bluetooth.Socket(javaObject: __return)
    }
    
    /**
     * Immediately close this socket, and release all associated resources.
     *
     * Causes blocked calls on this socket in other threads to immediately throw an IOException.
     *
     * Closing the BluetoothServerSocket will not close any BluetoothSocket received from accept().
     */
    public func clone() {
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "clone",
                                 methodSig: "()V",
                                 methodCache: &JNICache.MethodID.close,
                                 args: &__args,
                                 locals: &__locals)
    }
}

// MARK: - JNICache

internal extension AndroidBluetoothServerSocket {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothServerSocket"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var accept: jmethodID?
            static var accept2: jmethodID?
            static var close: jmethodID?
        }
    }
}
