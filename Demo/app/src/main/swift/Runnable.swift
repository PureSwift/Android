//
//  Runnable.swift
//  AndroidSwiftUI
//
//  Created by Alsey Coleman Miller on 6/9/25.
//

import JavaKit
import JavaRuntime
import AndroidKit
import JavaLang

@JavaClass("com.pureswift.swiftandroid.Runnable", extends: JavaLang.Runnable.self)
open class Runnable: JavaObject {
    
    public typealias Block = () -> ()
    
    @JavaMethod
    @_nonoverride public convenience init(block: SwiftObject?, environment: JNIEnvironment? = nil)
    
    @JavaMethod
    public func getBlock() -> SwiftObject?
}

public extension Runnable {
    
    convenience init(_ block: @escaping () -> Void, environment: JNIEnvironment? = nil) {
        let object = SwiftObject(block, environment: environment)
        self.init(block: object, environment: environment)
    }
}

@JavaImplementation("com.pureswift.swiftandroid.Runnable")
extension Runnable {
    
    @JavaMethod
    func run() {
        block()
    }
}

private extension Runnable {
    
    var block: Block {
        guard let block = getBlock()?.valueObject().value as? Block else {
            fatalError()
        }
        return block
    }
}
