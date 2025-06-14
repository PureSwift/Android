//
//  AndroidAPI.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/14/25.
//

#if os(Android)
import Android
import AndroidNDK
#endif

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
        get throws(Throwable) {
            let value: CInt
            #if os(Android) && canImport(AndroidNDK)
            value = try ndkValue().get()
            #else
            value = try jniValue()
            #endif
        }
    }
}

internal extension AndroidAPI {
    
    /// `Build.VERSION.SDK_INT`
    static func jniValue() throws(Throwable) -> Int32 {
        let javaClass = try JavaClass<Build.VERSION>.init()
        return javaClass.sdk_version
    }
    
    
    static func ndkValue() -> Result<Int32, Exception> {
        #if os(Android) && canImport(AndroidNDK)
        let value = android_get_device_api_level()
        #else
        let value: Int32 = -1
        #endif
        guard value != -1 else {
            throw Exception()
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
