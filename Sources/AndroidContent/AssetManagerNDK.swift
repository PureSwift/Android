//
//  AssetManagerNDK.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if canImport(Android)
import Android
import AndroidNDK
#endif
import SwiftJava
import CSwiftJavaJNI
import AndroidFileManager

// MARK: - NDK Asset Manager

public extension AssetManager {

    /// Equivalent NDK type.
    typealias NDK = AndroidFileManager.AssetManager

    /// Create a temporary NDK object and perform operations on it.
    func withNDK<E, Result>(_ body: (borrowing NDK) throws(E) -> Result) throws(E) -> Result where E: Error {
        let ndk = NDK.fromJava(javaThis, environment: javaEnvironment)
        return try body(ndk)
    }
}

internal extension AndroidFileManager.AssetManager {

    /**
     * Converts an android.content.res.AssetManager object into an AAssetManager* object.
     *
     * If the asset manager is null, null is returned.
     *
     * Available since API level 24.
     *
     * \param env Java environment. Must not be null.
     * \param assetManager android.content.res.AssetManager java object.
     *
     * \return an AAssetManager object representing the Java AssetManager object. If either parameter
     * is null, this will return null.
     */
    static func fromJava(_ javaObject: jobject, environment: JNIEnvironment) -> AndroidFileManager.AssetManager {
        guard let pointer = AAssetManager_fromJava(environment, javaObject) else {
            fatalError("Unable to initialize from Java object")
        }
        return AndroidFileManager.AssetManager(pointer)
    }
}

#if !os(Android)
func AAssetManager_fromJava(_ environment: JNIEnvironment?, _ javaObject: jobject) -> OpaquePointer? { fatalError("stub") }
#endif
