//
//  RecyclerView.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/13/25.
//

import AndroidKit

@JavaClass("com.pureswift.swiftandroid.RecyclerViewAdapter")
open class RecyclerViewAdapter: RecyclerView.Adapter {
    
    @JavaMethod
    @_nonoverride public convenience init(swiftObject: SwiftObject?, environment: JNIEnvironment? = nil)
    
    @JavaMethod
    func getSwiftObject() -> SwiftObject!
}

@JavaImplementation("com.pureswift.swiftandroid.RecyclerViewAdapter")
extension RecyclerViewAdapter {
    
    @JavaMethod
    public func onBindViewHolderSwift(_ viewHolder: RecyclerViewAdapter.ViewHolder?, _ position: Int32) {
        log("\(self).\(#function) \(position)")
        callback.onBindViewHolder(viewHolder!, position)
    }
    
    @JavaMethod
    public func getItemCountSwift() -> Int32 {
        log("\(self).\(#function)")
        return callback.getItemCount()
    }
}

extension RecyclerViewAdapter {
    
    static var logTag: LogTag { "RecyclerViewAdapter" }
        
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

public extension RecyclerViewAdapter {
    
    struct Callback {
                
        var onBindViewHolder: ((RecyclerViewAdapter.ViewHolder, Int32) -> ())
        
        var getItemCount: () -> Int32
        
        public init(
            onBindViewHolder: @escaping ((RecyclerViewAdapter.ViewHolder, Int32) -> Void),
            getItemCount: @escaping () -> Int32 = { return 0 }
        ) {
            self.onBindViewHolder = onBindViewHolder
            self.getItemCount = getItemCount
        }
    }
}

public extension RecyclerViewAdapter {
    
    convenience init(_ callback: Callback, environment: JNIEnvironment? = nil) {
        let swiftObject = SwiftObject(callback, environment: environment)
        self.init(swiftObject: swiftObject, environment: environment)
    }
    
    var callback: Callback {
        get {
            getSwiftObject().valueObject().value as! Callback
        }
        set {
            getSwiftObject().valueObject().value = newValue
        }
    }
}

extension RecyclerViewAdapter {
    
    @JavaClass("com.pureswift.swiftandroid.RecyclerViewAdapter$ViewHolder")
    open class ViewHolder: RecyclerView.ViewHolder {
        
        @JavaMethod
        @_nonoverride public convenience init(view: AndroidView.View?, environment: JNIEnvironment? = nil)
    }
}
