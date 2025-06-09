//
//  ResourceID.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/9/25.
//

import JavaKit

/// Android Resource ID
public struct ResourceID: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        assert(rawValue != 0, "Invalid Resource ID: \(rawValue)")
        self.rawValue = rawValue
    }
}

// MARK: - Methods

public extension ResourceID {
    
    /// Return a resource identifier for the given resource name.
    /// A fully qualified resource name is of the form "package:type/entry". The first two components (package and type) are optional if defType and defPackage, respectively, are specified here.
    init?(name: String, type: String, package: String, in resources: Resources) {
        let rawValue = resources.getIdentifier(name, type, package)
        guard rawValue != 0 else {
            return nil
        }
        self.init(rawValue: rawValue)
    }
    
    /// Return the full name for a given resource identifier. This name is a single string of the form "package:type/entry".
    func name(in resources: Resources) throws -> String {
        try resources.getResourceName(rawValue)
    }
}

// MARK: - CustomStringConvertible

extension ResourceID: CustomStringConvertible {
    
    public var description: String {
        rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension ResourceID: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int32) {
        self.init(rawValue: value)
    }
}
