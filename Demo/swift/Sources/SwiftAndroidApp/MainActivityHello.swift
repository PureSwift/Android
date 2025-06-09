//
//  Untitled.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/8/25.
//

import JavaKit

@JavaClass("com.pureswift.swiftandroid.MainActivityHello")
open class MainActivityHello: JavaObject {
    
}

@JavaImplementation("com.pureswift.swiftandroid.MainActivityHello")
extension MainActivityHello {
    
    @JavaMethod
    func sayHelloName() -> String {
        "Swift 🏎️"
    }
}
