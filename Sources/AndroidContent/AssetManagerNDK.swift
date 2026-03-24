//
//  AssetManagerNDK.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if canImport(Android)
import Android
#endif
import SwiftJava
import AndroidFileManager

// MARK: - NDK Asset Manager

public extension AssetManager {

    /// Equivalent NDK type.
    typealias NDK = AndroidFileManager.AssetManager

    /// Create a temporary NDK object and perform operations on it.
    func withNDK<E, Result>(_ body: (borrowing NDK) throws(E) -> Result) throws(E) -> Result where E: Error {
        guard let ndk = NDK.fromJava(javaThis, environment: javaEnvironment) else {
            fatalError("Unable to create NDK type")
        }
        return try body(ndk)
    }
}
