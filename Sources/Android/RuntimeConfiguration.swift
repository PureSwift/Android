//
//  RuntimeConfiguration.swift
//  
//
//  Created by Alsey Coleman Miller on 11/30/22.
//

/// Swift Android runtime configuration
public struct RuntimeConfiguration {
    
    public var appCompatActivity: SwiftSupportAppCompatActivity.Type
    
    public var componentActivity: SwiftComponentActivity.Type
}

public extension RuntimeConfiguration {
    
    static var `default`: RuntimeConfiguration {
        RuntimeConfiguration(
            appCompatActivity: SwiftSupportAppCompatActivity.self,
            componentActivity: SwiftComponentActivity.self
        )
    }
}
