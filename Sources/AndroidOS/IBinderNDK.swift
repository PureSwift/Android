//
//  IBinderNDK.swift
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
import AndroidBinder

// MARK: - NDK Parcel

public extension AndroidOS.IBinder {
    
    typealias NDK = AndroidBinder
}

public extension AndroidBinder {
    
    /// Converts an `android.os.IBinder` object into an `AIBinder*` object.
    convenience init(_ javaObject: AndroidOS.IBinder) {
        self.init(javaObject.javaThis, environment: javaObject.javaEnvironment)
    }
}

internal extension AndroidBinder {
    
    /**
     * Converts an android.os.IBinder object into an AIBinder* object.
     *
     * If the binder is null, null is returned. If this binder object was originally an
     * AIBinder object, the original object is returned. The returned object has one refcount
     * associated with it, and so this should be accompanied with an AIBinder_decStrong call.
     *
     * Available since API level 29.
     *
     * \param env Java environment. Must not be null.
     * \param binder android.os.IBinder java object.
     *
     * \return an AIBinder object representing the Java binder object. If either parameter is null, or
     * the Java object is of the wrong type, this will return null.
     */
    convenience init(_ javaObject: jobject, environment: JNIEnvironment? = nil) {
        guard let pointer = AParcel_fromJavaParcel(environment, javaObject) else {
            fatalError("Unable to initialize from Java object")
        }
        self.init(pointer)
    }
}

#if !os(Android)
func AIBinder_fromJavaBinder(_ environment: JNIEnvironment?, _ javaObject: jobject) -> OpaquePointer? { fatalError("stub") }
#endif
