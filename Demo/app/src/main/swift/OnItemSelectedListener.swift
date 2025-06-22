//
//  OnItemSelectedListener.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/21/25.
//

import Foundation
import AndroidKit
import AndroidMaterial

@JavaClass("com.pureswift.swiftandroid.NavigationBarViewOnItemSelectedListener", extends: AndroidMaterial.NavigationView.OnNavigationItemSelectedListener.self)
open class NavigationBarViewOnItemSelectedListener: JavaObject {
    
    public typealias Action = (MenuItem?) -> (Bool)
    
    @JavaMethod
    @_nonoverride public convenience init(action: SwiftObject?, environment: JNIEnvironment? = nil)
    
    @JavaMethod
    public func getAction() -> SwiftObject?
}

@JavaImplementation("com.pureswift.swiftandroid.NavigationBarViewOnItemSelectedListener")
extension NavigationBarViewOnItemSelectedListener {
    
    @JavaMethod
    func onNavigationItemSelected(menuItem: MenuItem?) -> Bool {
        log("\(self).\(#function)")
        // drain queue
        RunLoop.main.run(until: Date() + 0.01)
        let result = action(menuItem)
        RunLoop.main.run(until: Date() + 0.01)
        return result
    }
}

public extension NavigationBarViewOnItemSelectedListener {
    
    convenience init(action: @escaping Action, environment: JNIEnvironment? = nil) {
        let object = SwiftObject(action, environment: environment)
        self.init(action: object, environment: environment)
    }
        
    var action: Action {
        getAction()!.valueObject().value as! Action
    }
}

extension NavigationBarViewOnItemSelectedListener {
    
    static var logTag: LogTag { "NavigationBarViewOnItemSelectedListener" }
    
    static func log(_ string: String) {
        try? AndroidLogger(tag: logTag, priority: .debug)
            .log(string)
    }
    
    static func logInfo(_ string: String) {
        try? AndroidLogger(tag: logTag, priority: .info)
            .log(string)
    }
    
    static func logError(_ string: String) {
        try? AndroidLogger(tag: logTag, priority: .error)
            .log(string)
    }
    
    func log(_ string: String) {
        Self.log(string)
    }
    
    func logError(_ string: String) {
        Self.logError(string)
    }
}
