//
//  AndroidManifestPermissionGroup.swift
//  Android
//
//  Created by Killian Greene on 7/6/18.
//

import Foundation
import java_swift

public struct AndroidManifestPermissionGroup: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension AndroidManifestPermissionGroup {
    
    public static let calendar = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.CALENDAR)
    
    public static let callLog = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.CALL_LOG)
    
    public static let camera = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.CAMERA)
    
    public static let contacts = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.CONTACTS)
    
    public static let location = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.LOCATION)
    
    public static let microphone = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.MICROPHONE)
    
    public static let phone = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.PHONE)
    
    public static let sensors = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.SENSORS)
    
    public static let sms = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.SMS)
    
    public static let storage = AndroidManifestPermissionGroup(rawValue: AndroidManifest.PermissionGroup.Constants.STORAGE)
}
