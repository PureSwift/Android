//
//  LogTag.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/14/25.
//

/// Android Log Tag
public struct LogTag: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        assert(rawValue.isEmpty == false)
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension LogTag: CustomStringConvertible {
    
    public var description: String {
        rawValue
    }
}

// MARK: - ExpressibleByStringLiteral

extension LogTag: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}
