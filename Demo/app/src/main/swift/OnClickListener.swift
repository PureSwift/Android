//
//  OnClickListener.swift
//  AndroidSwiftUI
//
//  Created by Alsey Coleman Miller on 6/9/25.
//

import Foundation
import AndroidKit

@JavaClass("com.pureswift.swiftandroid.ViewOnClickListener", extends: AndroidView.View.OnClickListener.self)
open class ViewOnClickListener: JavaObject {
    
    public typealias Action = () -> ()
    
    @JavaMethod
    @_nonoverride public convenience init(action: SwiftObject?, environment: JNIEnvironment? = nil)
    
    @JavaMethod
    public func getAction() -> SwiftObject?
}

@JavaImplementation("com.pureswift.swiftandroid.ViewOnClickListener")
extension ViewOnClickListener {
    
    @JavaMethod
    func onClick() {
        log("\(self).\(#function)")
        // drain queue
        RunLoop.main.run(until: Date() + 0.01)
        action()
        RunLoop.main.run(until: Date() + 0.01)
    }
}

public extension ViewOnClickListener {
    
    convenience init(action: @escaping () -> (), environment: JNIEnvironment? = nil) {
        let object = SwiftObject(action, environment: environment)
        self.init(action: object, environment: environment)
    }
        
    var action: (() -> ()) {
        getAction()!.valueObject().value as! Action
    }
}

extension ViewOnClickListener {
    
    static var logTag: LogTag { "ViewOnClickListener" }
    
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
