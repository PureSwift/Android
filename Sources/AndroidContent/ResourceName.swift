//
//  ResourceName.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/10/25.
//

import JavaKit

/// Android Resource ID
///
/// Return the full name for a given resource identifier. This name is a single string of the form "package:type/entry".
public struct ResourceName: Equatable, Hashable, Codable, Sendable {
    
    public let name: String
    
    public let type: String
    
    public let package: String
    
    public init(name: String, type: String, package: String) {
        self.name = name
        self.type = type
        self.package = package
    }
}

// MARK: - Extensions

public extension ResourceID {
    
    init?(name: ResourceName, in resources: Resources) {
        self.init(name: name.name, type: name.type, package: name.package, in: resources)
    }
}

// MARK: - RawRepresentable

extension ResourceName: RawRepresentable {
    
    public init?(rawValue: String) {
        // TODO: Parse resource string
        fatalError("Not implemented")
    }
    
    public var rawValue: String {
        self.package + ":" + self.type + "/" + self.name
    }
}

// MARK: - CustomStringConvertible

extension ResourceName: CustomStringConvertible {
    
    public var description: String {
        rawValue
    }
}
