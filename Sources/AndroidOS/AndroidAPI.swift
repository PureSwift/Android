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
import JavaKit

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
    
    static func deviceAPILevel() throws -> Int32 {
        #if os(Android) && canImport(AndroidNDK)
        try ndkValue().get()
        #else
        try jniValue()
        #endif
    }
    
    /// `Build.VERSION.SDK_INT`
    static func jniValue() throws -> Int32 {
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
        #if os(Android) && canImport(AndroidNDK)
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
