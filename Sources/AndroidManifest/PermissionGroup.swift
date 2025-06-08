//
//  Permission.Group.swift
//  Android
//
//  Created by Killian Greene on 7/6/18.
//

import JavaKit

public extension Permission {
    
    public struct Group: RawRepresentable, Equatable, Hashable, Codable, Sendable {
        
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

public extension Permission.Group {
    
    public static let calendar = Permission.Group(rawValue: AndroidManifest.Permission.Group.CALENDAR)
    
    public static let callLog = Permission.Group(rawValue: AndroidManifest.Permission.Group.CALL_LOG)
    
    public static let camera = Permission.Group(rawValue: AndroidManifest.Permission.Group.CAMERA)
    
    public static let contacts = Permission.Group(rawValue: AndroidManifest.Permission.Group.CONTACTS)
    
    public static let location = Permission.Group(rawValue: AndroidManifest.Permission.Group.LOCATION)
    
    public static let microphone = Permission.Group(rawValue: AndroidManifest.Permission.Group.MICROPHONE)
    
    public static let phone = Permission.Group(rawValue: AndroidManifest.Permission.Group.PHONE)
    
    public static let sensors = Permission.Group(rawValue: AndroidManifest.Permission.Group.SENSORS)
    
    public static let sms = Permission.Group(rawValue: AndroidManifest.Permission.Group.SMS)
    
    public static let storage = Permission.Group(rawValue: AndroidManifest.Permission.Group.STORAGE)
}
