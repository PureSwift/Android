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
    
    static let calendar = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().CALENDAR)
    
    static let callLog = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().CALL_LOG)
    
    static let camera = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().CAMERA)
    
    static let contacts = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().CONTACTS)
    
    static let location = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().LOCATION)
    
    static let microphone = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().MICROPHONE)
    
    static let phone = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().PHONE)
    
    static let sensors = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().SENSORS)
    
    static let sms = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().SMS)
    
    static let storage = Permission.Group(rawValue: try! JavaClass<AndroidManifest.Manifest.Permission.Group>().STORAGE)
}
