//
//  RecyclerView.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/13/25.
//

import AndroidKit

@JavaClass("com.pureswift.swiftandroid.RecyclerViewAdapter")
open class RecyclerViewAdapter: RecyclerView.Adapter<RecyclerView.ViewHolder> {
    
    @JavaMethod
    @_nonoverride public convenience init(swiftObject: SwiftObject?, environment: JNIEnvironment? = nil)
    
    @JavaMethod
    func getSwiftObject() -> SwiftObject!
}

@JavaImplementation("com.pureswift.swiftandroid.RecyclerViewAdapter")
extension RecyclerViewAdapter {
    
    @JavaMethod
    public func onCreateViewHolderSwift(_ viewGroup: ViewGroup?, _ viewType: Int32) -> RecyclerView.ViewHolder! {
        callback.onCreateViewHolder(viewGroup, viewType)
    }
    
    @JavaMethod
    public func onBindViewHolderSwift(_ viewHolder: RecyclerView.ViewHolder?, _ position: Int32) {
        callback.onBindViewHolder(viewHolder, position)
    }
    
    @JavaMethod
    public func getItemCountSwift() -> Int32 {
        callback.getItemCount()
    }
}

public extension RecyclerViewAdapter {
    
    struct Callback<T> {
        
        var onCreateViewHolder: ((ViewGroup, Int32) -> RecyclerView.ViewHolder)?
        
        var onBindViewHolder: ((RecyclerViewAdapter.ViewHolder<T>, Int32) -> ())?
        
        var getItemCount: () -> Int32 = { return 0 }
        
        public init(onCreateViewHolder: ((ViewGroup, Int32) -> RecyclerView.ViewHolder)? = nil, onBindViewHolder: ((RecyclerView.ViewHolder, Int32) -> Void)? = nil, getItemCount: @escaping () -> Int32) {
            self.onCreateViewHolder = onCreateViewHolder
            self.onBindViewHolder = onBindViewHolder
            self.getItemCount = getItemCount
        }
    }
    
    convenience init(_ callback: Callback, environment: JNIEnvironment? = nil) {
        let swiftObject = SwiftObject(callback, environment: environment)
        self.init(swiftObject: swiftObject, environment: environment)
    }
    
    var callback: Callback<T> {
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
    open class ViewHolder<T>: RecyclerView.ViewHolder {
        
        @JavaMethod
        @_nonoverride public convenience init(view: AndroidView.View?, swiftObject: SwiftObject?, environment: JNIEnvironment? = nil)
        
        @JavaMethod
        func getSwiftObject() -> SwiftObject!
    }
}

public extension RecyclerViewAdapter.ViewHolder {
    
    convenience init(_ value: T, view: AndroidView.View?, environment: JNIEnvironment? = nil) {
        let swiftObject = SwiftObject(value, environment: environment)
        self.init(view: view, swiftObject: swiftObject, environment: environment)
    }
    
    var value: T {
        get {
            getSwiftObject().valueObject().value as! T
        }
        set {
            getSwiftObject().valueObject().value = newValue
        }
    }
}
