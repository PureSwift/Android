//
//  AndroidAPI.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/14/25.
//

#if os(Android)
import Android
import CAndroidNDK
#endif
import SwiftJava

/// Android API Level
public struct AndroidAPI: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        assert(rawValue > 0)
        self.rawValue = rawValue
    }
}

public extension AndroidAPI {
    
    /// Available since API level 24. Returns the API level of the device we're actually running on.
    static var current: AndroidAPI {
        get throws {
            AndroidAPI(rawValue: try deviceAPILevel())
        }
    }
}

internal extension AndroidAPI {
    
    /**
     Returns the targetSdkVersion of the caller, or __ANDROID_API_FUTURE__ if there is no known target SDK version (for code not running in the context of an app).

     The returned value is the same as the AndroidManifest.xml targetSdkVersion. This is mostly useful for the OS to decide what behavior an app is expecting. See also android_get_device_api_level().

     Available since API level 24. Returns the API level of the device we're actually running on, or -1 on failure.

     The returned value is the same as the Java Build.VERSION.SDK_INT. This is mostly useful for an app to work out what version of the OS it's running on. See also android_get_application_target_sdk_version().

     Available since API level 29.
     */
    static func deviceAPILevel() throws(Throwable) -> Int32 {
        if #available(Android 24, *) {
            try ndkValue().get()
        } else {
            try jniValue()
        }
    }
    
    /// `Build.VERSION.SDK_INT`
    static func jniValue() throws(Throwable) -> Int32 {
        do {
            let javaClass = try JavaClass<Build.VERSION>.init()
            return javaClass.SDK_INT
        }
        catch let error as Throwable {
            throw error
        }
        catch {
            fatalError("Invalid error \(error)")
        }
    }
    
    /// Available since API level 24. Returns the API level of the device we're actually running on.
    static func ndkValue() -> Result<Int32, Exception> {
        #if os(Android) && canImport(CAndroidNDK)
        let value = android_get_device_api_level()
        #else
        let value: Int32 = -1
        #endif
        guard value != -1 else {
            return .failure(Exception())
        }
        return .success(value)
    }
}

// MARK: - CustomStringConvertible

extension AndroidAPI: CustomStringConvertible {
    
    public var description: String {
        rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension AndroidAPI: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int32) {
        self.init(rawValue: value)
    }
}
