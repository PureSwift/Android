//
//  SwiftApp.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/8/25.
//

import AndroidKit

@JavaClass("com.pureswift.swiftandroid.Application")
public class Application: JavaObject {
    
    @JavaMethod
    public func sayHello()
}

@JavaImplementation("com.pureswift.swiftandroid.Application")
public extension Application {
    
    @JavaMethod
    public func onCreate() {
        //super.onCreate()
        
        print("\(#function)")
        
        sayHello()
    }
    
    @JavaMethod
    public func onTerminate() {
        //super.onTerminate()
        
        print("\(#function)")
    }
}

internal extension Application {
    
    func print(_ string: String) {
        let log = try! JavaClass<AndroidUtil.Log>()
        _ = log.v("Application", string)
    }
}
