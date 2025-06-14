//
//  SwiftApp.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/8/25.
//

import AndroidKit

@JavaClass("com.pureswift.swiftandroid.Application")
public class Application: AndroidApp.Application {
    
    @JavaMethod
    public func sayHello()
}

@JavaImplementation("com.pureswift.swiftandroid.Application")
public extension Application {
    
    @JavaMethod
    func onCreateSwift() {
        log("\(self).\(#function)")
        
        printAPIVersion()
        sayHello()
    }
    
    @JavaMethod
    func onTerminateSwift() {
        log("\(self).\(#function)")
    }
}

private extension Application {
    
    func printAPIVersion() {
        
        do {
            let api = try AndroidOS.AndroidAPI.current
            Self.logInfo("Running on Android API \(api)")
        }
        catch {
            Self.logError("\(error)")
        }
    }
}

extension Application {
    
    static var logTag: LogTag { "Application" }
    
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
