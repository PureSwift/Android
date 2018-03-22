//
//  AndroidManifest.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_swift

public extension Android {
    
    public typealias Manifest = AndroidManifest
}

public struct AndroidManifest: RawRepresentable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        
        self.init(rawValue: rawValue)
    }
}

public extension Android.Manifest {
    
    public init(permissionGroup name: String) {
        
        fatalError()
    }
    
    public init(permission name: String) {
        
        fatalError()
    }
}
