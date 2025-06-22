//
//  Fragment.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/22/25.
//

import AndroidKit

@JavaClass("com.pureswift.swiftandroid.Fragment")
open class Fragment: AndroidApp.Fragment {
    
    @JavaMethod
    @_nonoverride public convenience init(swiftObject: SwiftObject?, environment: JNIEnvironment? = nil)
    
    @JavaMethod
    public func getSwiftObject() -> SwiftObject?
}

public extension Fragment {
    
    struct Callback {
        
        var onViewCreated: ((AndroidView.View, AndroidOS.Bundle?) -> ())?
    }
}

@JavaImplementation("com.pureswift.swiftandroid.Fragment")
extension Fragment {
    
    @JavaMethod
    func onViewCreated(
        view: AndroidView.View?,
        savedInstanceState: AndroidOS.Bundle?
    ) {
        log("\(self).\(#function)")
        guard let onViewCreated = callback.onViewCreated else {
            return
        }
        guard let view else {
            assertionFailure("Missing view")
            return
        }
        onViewCreated(view, savedInstanceState)
    }
}

public extension Fragment {
    
    convenience init(callback: Callback, environment: JNIEnvironment? = nil) {
        let object = SwiftObject(callback, environment: environment)
        self.init(swiftObject: object, environment: environment)
    }
        
    var callback: Callback {
        getSwiftObject()!.valueObject().value as! Callback
    }
}

extension Fragment {
    
    static var logTag: LogTag { "Fragment" }
    
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
