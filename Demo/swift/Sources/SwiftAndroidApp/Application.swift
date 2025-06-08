//
//  SwiftApp.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/8/25.
//

import AndroidKit

@JavaClass("com.pureswift.swiftandroid.Application")
class Application: AndroidApp.Application {
    
    @JavaMethod
    func sayHello()
    
    @JavaMethod
    override func onCreate() {
        super.onCreate()
        
        print("\(#function)")
        
        sayHello()
    }
    
    @JavaMethod
    override func onTerminate() {
        super.onTerminate()
        
        print("\(#function)")
    }
}

@JavaImplementation("com.pureswift.swiftandroid.Application")
extension Application { }

internal extension Application {
    
    func print(_ string: String) {
        let log = try! JavaClass<AndroidUtil.Log>()
        _ = log.v("Application", string)
    }
}
