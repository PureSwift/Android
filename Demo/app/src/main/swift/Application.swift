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
        
        sayHello()
    }
    
    @JavaMethod
    func onTerminateSwift() {
        log("\(self).\(#function)")
    }
}

extension Application {
    
    static var logTag: String { "Application" }
    
    static let log = try! JavaClass<AndroidUtil.Log>()
    
    func log(_ string: String) {
        _ = Self.log.d(Self.logTag, string)
    }
}
