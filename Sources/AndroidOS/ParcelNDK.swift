//
//  ParcelNDK.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(AndroidBinder)
#if canImport(Android)
import Android
#endif
import SwiftJava
import SwiftJavaJNICore
import struct AndroidBinder.Parcel

// MARK: - NDK Parcel

public extension AndroidOS.Parcel {
    
    typealias NDK = AndroidBinder.Parcel
}

public extension AndroidOS.Parcel {
    
    /// Create a temporary NDK object and perform operatios on it.
    @available(Android 30, *)
    func withNDK<E, Result>(_ body: (borrowing NDK) throws(E) -> Result) throws(E) -> Result where E: Error {
        guard let ndk = NDK.fromJava(javaThis, environment: javaEnvironment) else {
            fatalError("Unable to create NDK type")
        }
        return try body(ndk)
    }
}

#endif
