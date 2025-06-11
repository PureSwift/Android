//
//  JavaRetainedValue.swift
//  AndroidSwiftUI
//
//  Created by Alsey Coleman Miller on 6/9/25.
//

import JavaKit
import JavaRuntime

/// Java class that retains a Swift value for the duration of its lifetime.
@JavaClass("com.pureswift.swiftandroid.SwiftObject")
open class SwiftObject: JavaObject {
    
    @JavaMethod
    @_nonoverride public convenience init(swiftObject: Int64, type: String, environment: JNIEnvironment? = nil)
    
    @JavaMethod
    open func getSwiftObject() -> Int64
    
    @JavaMethod
    open func getType() -> String
}

@JavaImplementation("com.pureswift.swiftandroid.SwiftObject")
extension SwiftObject {
    
    @JavaMethod
    public func toStringSwift() -> String {
        "\(valueObject().value)"
    }
    
    @JavaMethod
    public func finalizeSwift() {
        // release owned swift value
        release()
    }
}

extension SwiftObject {
    
    convenience init<T>(_ value: T, environment: JNIEnvironment? = nil) {
        let box = JavaRetainedValue(value)
        let type = box.type
        self.init(swiftObject: box.id, type: type, environment: environment)
        // retain value
        retain(box)
    }
    
    func valueObject() -> JavaRetainedValue {
        let id = getSwiftObject()
        guard let object = Self.retained[id] else {
            fatalError()
        }
        return object
    }
}

private extension SwiftObject {
    
    static var retained = [JavaRetainedValue.ID: JavaRetainedValue]()
    
    func retain(_ value: JavaRetainedValue) {
        Self.retained[value.id] = value
    }
    
    func release() {
        let id = getSwiftObject()
        Self.retained[id] = nil
    }
}

/// Swift Object retained until released by Java object.
final class JavaRetainedValue: Identifiable {
    
    var value: Any
    
    var type: String {
        String(describing: Swift.type(of: value))
    }
    
    var id: Int64 {
        Int64(ObjectIdentifier(self).hashValue)
    }
    
    init<T>(_ value: T) {
        self.value = value
    }
}
