//
//  Duration.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

@available(macOS 13.0, *)
internal extension Duration {
    
    var milliseconds: Double {
        Double(components.seconds) * 1000 + Double(components.attoseconds) * 1e-15
    }
}
