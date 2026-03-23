//
//  IBinderNDK.swift
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
    static func fromJava(_ javaObject: AndroidOS.IBinder) -> AndroidBinder? {
        AndroidBinder.fromJava(javaObject.javaThis, environment: javaObject.javaEnvironment)
    }
}

#endif
