//
//  JNI.swift
//  Android
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import JNI
import java_swift

internal protocol JNINativeMethodEntry {
    
    associatedtype Thunk
    
    static var name: String { get }
    
    static var signature: JNIMethodSignature { get }
    
    static var thunk: Thunk { get }
}

extension JNINativeMethodEntry {
    
    static var method: JNINativeMethod {
        
        return JNINativeMethod ( name: strdup(name),
                                 signature: strdup(signature.rawValue),
                                 fnPtr: unsafeBitCast( thunk, to: UnsafeMutableRawPointer.self ) )
    }
}

extension JNINativeMethod {
    
    static var finalize: JNINativeMethod {
        
        return JNINativeMethod(
            name: strdup("__finalize"),
            signature: strdup("(J)V"),
            fnPtr: unsafeBitCast( JNIReleasableProxy__finalize_thunk, to: UnsafeMutableRawPointer.self ) )
    }
}
