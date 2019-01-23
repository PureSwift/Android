//
//  AndroidContextSystemService.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import java_swift

public extension Android.Content.Context {
    
    public typealias SystemService = AndroidContextSystemService
}

public extension Android.Content.Context.SystemService {
    
    public typealias Name = AndroidContextSystemServiceName
}

public protocol AndroidContextSystemService {
    
    static var systemServiceName: Android.Content.Context.SystemService.Name { get }
}

// MARK: - Supporting Types

public struct AndroidContextSystemServiceName: RawRepresentable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        
        self.rawValue = rawValue
    }
    
    public static let bluetooth = Android.Content.Context.SystemService.Name(rawValue: Android.Content.Context.bluetoothService!)
    
    public static let layoutInflater = Android.Content.Context.SystemService.Name(rawValue: Android.Content.Context.layoutInflaterService!)
    
    public static let inputMethodService = Android.Content.Context.SystemService.Name(rawValue: Android.Content.Context.inputMethodService!)
}

extension Android.Content.Context.SystemService.Name: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(rawValue: value)
    }
}
