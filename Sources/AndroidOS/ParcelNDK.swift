//
//  ParcelNDK.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(Android)
import Android
import AndroidNDK
#endif
import JavaKit
import JavaRuntime
import struct AndroidBinder.Parcel

// MARK: - NDK Parcel

public extension AndroidOS.Parcel {
    
    typealias NDK = AndroidBinder.Parcel
}

public extension AndroidOS.Parcel {
    
    /// Create a temporary NDK object and perform operatios on it.
    func withNDK<E, Result>(_ body: (borrowing NDK) throws(E) -> Result) throws(E) -> Result where E: Error {
        let ndk = NDK.fromJava(javaThis, environment: javaEnvironment)
        return try body(ndk)
    }
}

internal extension AndroidBinder.Parcel {
    
    /**
     * Converts an android.os.Parcel object into an AParcel* object.
     *
     * If the parcel is null, null is returned.
     *
     * Available since API level 30.
     *
     * \param env Java environment. Must not be null.
     * \param parcel android.os.Parcel java object.
     *
     * \return an AParcel object representing the Java parcel object. If either parameter is null, this
     * will return null. This must be deleted with AParcel_delete. This does not take ownership of the
     * jobject and is only good for as long as the jobject is alive.
     */
    static func fromJava(_ javaObject: jobject, environment: JNIEnvironment) -> AndroidBinder.Parcel {
        guard let pointer = AParcel_fromJavaParcel(environment, javaObject) else {
            fatalError("Unable to initialize from Java object")
        }
        return AndroidBinder.Parcel(pointer)
    }
}

#if !os(Android)
func AParcel_fromJavaParcel(_ environment: JNIEnvironment?, _ javaObject: jobject) -> OpaquePointer? { fatalError("stub") }
#endif
