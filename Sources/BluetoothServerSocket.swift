//
//  BluetoothServerSocket.swift
//  Android
//
//  Created by Marco Estrella on 5/30/18.
//

import Foundation
import Bluetooth
import java_swift

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
