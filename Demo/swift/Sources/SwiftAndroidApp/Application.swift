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
    public func onCreateSwift() {
        
        print("\(#function)")
        
        sayHello()
    }
    
    @JavaMethod
    public func onTerminateSwift() {
        
        print("\(#function)")
    }
}

internal extension Application {
    
    func print(_ string: String) {
        let log = try! JavaClass<AndroidUtil.Log>()
        _ = log.v("Application", string)
    }
}
