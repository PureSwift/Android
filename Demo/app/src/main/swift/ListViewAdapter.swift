//
//  ListViewAdapter.swift
//  AndroidSwiftUI
//
//  Created by Alsey Coleman Miller on 6/9/25.
//

import Foundation
import AndroidKit

@JavaClass("com.pureswift.swiftandroid.ListViewAdapter", extends: ListAdapter.self)
open class ListViewAdapter: JavaObject {
    
    @JavaMethod
    @_nonoverride public convenience init(swiftObject: SwiftObject!, environment: JNIEnvironment? = nil)
    
    @JavaMethod
    func getContext() -> SwiftObject!
}

@JavaImplementation("com.pureswift.swiftandroid.ListViewAdapter")
extension ListViewAdapter {
    
    @JavaMethod
    func hasStableIds() -> Bool {
        log("\(self).\(#function)")
        return true
    }
    
    @JavaMethod
    func isEmpty() -> Bool {
        log("\(self).\(#function)")
        return context.items.isEmpty
    }
    
    @JavaMethod
    func getCount() -> Int32 {
        log("\(self).\(#function)")
        return Int32(context.items.count)
    }

    @JavaMethod
    func getItem(position: Int32) -> JavaObject? {
        log("\(self).\(#function) \(position)")
        return JavaString(context.items[Int(position)])
    }
    
    @JavaMethod
    func getItemId(position: Int32) -> Int64 {
        log("\(self).\(#function)")
        return Int64(position)
    }

    @JavaMethod
    func getItemViewType(position: Int32) -> Int32 {
        log("\(self).\(#function)")
        return 0
    }

    @JavaMethod
    func getViewTypeCount() -> Int32 {
        log("\(self).\(#function)")
        return 1
    }

    @JavaMethod
    func getView(position: Int32, convertView: AndroidView.View?, parent: ViewGroup?) -> AndroidView.View? {
        log("\(self).\(#function) \(position)")
        guard let parent else {
            assertionFailure()
            return nil
        }
        let view = TextView(parent.getContext())
        let item = context.items[Int(position)]
        view.text = item
        return view
    }

    @JavaMethod
    func areAllItemsEnabled() -> Bool {
        log("\(self).\(#function)")
        return true
    }

    @JavaMethod
    func isEnabled(position: Int32) -> Bool {
        log("\(self).\(#function) \(position)")
        return true
    }

    @JavaMethod
    func registerDataSetObserver(observer: JavaObject?) {
        log("\(self).\(#function)")
        
    }

    @JavaMethod
    func unregisterDataSetObserver(observer: JavaObject?) {
        log("\(self).\(#function)")
        
    }
}

public extension ListViewAdapter {
    
    struct Context {
        
        let items: [String]
    }
    
    var context: Context {
        get {
            getContext().valueObject().value as! Context
        }
        set {
            getContext().valueObject().value = newValue
        }
    }
    
    convenience init(_ context: Context, environment: JNIEnvironment? = nil) {
        self.init(swiftObject: SwiftObject(context), environment: environment)
    }
}

extension ListViewAdapter {
    
    static var logTag: String { "ListViewAdapter" }
    
    static let log = try! JavaClass<AndroidUtil.Log>()
    
    func log(_ string: String) {
        _ = Self.log.d(Self.logTag, string)
    }
    
    func logError(_ string: String) {
        _ = Self.log.e(Self.logTag, string)
    }
}
