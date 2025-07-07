//
//  IBinderNDK.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(AndroidBinder)
#if canImport(Android)
import Android
import AndroidNDK
#endif
import JavaKit
import JavaRuntime
import AndroidBinder

// MARK: - NDK Parcel

public extension AndroidOS.IBinder {
    
    /// Equivalent NDK type
    typealias NDK = AndroidBinder
}

public extension AndroidOS.IBinder {
    
    init(_ ndkObject: NDK, environment: JNIEnvironment) {
        let javaObject = ndkObject.toJavaObject(environment: environment)
        self.init(javaThis: javaObject, environment: environment)
    }
}

public extension AndroidBinder {
    
    /// Converts an `android.os.IBinder` object into an `AIBinder*` object.
    convenience init(_ javaObject: AndroidOS.IBinder) {
        self.init(javaObject.javaThis, environment: javaObject.javaEnvironment)
    }
}

internal extension AndroidBinder {
    
    /**
     * Converts an `android.os.IBinder` object into an `AIBinder* object`.
     *
     * If the binder is null, null is returned. If this binder object was originally an
     * AIBinder object, the original object is returned. The returned object has one refcount
     * associated with it, and so this should be accompanied with an `AIBinder_decStrong` call.
     *
     * Available since API level 29.
     *
     * \param env Java environment. Must not be null.
     * \param binder android.os.IBinder java object.
     *
     * \return an AIBinder object representing the Java binder object. If either parameter is null, or
     * the Java object is of the wrong type, this will return null.
     */
    convenience init(_ javaObject: jobject, environment: JNIEnvironment) {
        guard let pointer = AParcel_fromJavaParcel(environment, javaObject) else {
            fatalError("Unable to initialize from Java object")
        }
        self.init(pointer)
    }
    
    /**
     * Converts an `AIBinder*` object into an `android.os.IBinder` object.
     *
     * If the binder is null, null is returned. If this binder object was originally an IBinder object,
     * the original java object will be returned.
     *
     * WARNING: this function returns global and local references. This can be
     * figured out using GetObjectRefType. Though, when this function is called
     * from within a Java context, the local ref will automatically be cleaned
     * up. If this is called outside of a Java frame,
     * PushObjectFrame/PopObjectFrame can simulate this automatic cleanup.
     *
     * Available since API level 29.
     *
     * \param env Java environment. Must not be null.
     * \param binder the object to convert.
     *
     * \return an android.os.IBinder object or null if the parameters were null.
     */
    func toJavaObject(environment: JNIEnvironment) -> jobject {
        withUnsafePointer {
            AIBinder_toJavaBinder(environment, $0)
        }
    }
}

#if !os(Android)
func AIBinder_fromJavaBinder(_ environment: JNIEnvironment?, _ javaObject: jobject) -> OpaquePointer? { fatalError("stub") }

func AIBinder_toJavaBinder(_ environment: JNIEnvironment?, _ ndkObject: OpaquePointer?) -> jobject { fatalError("stub") }
#endif
#endif
