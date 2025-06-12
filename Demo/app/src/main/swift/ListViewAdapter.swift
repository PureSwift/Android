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
    @_nonoverride public convenience init(
        context: AndroidContent.Context?,
        swiftObject: SwiftObject?,
        objects: ArrayList<JavaObject>?,
        environment: JNIEnvironment? = nil
    )
    
    @JavaMethod
    func getSwiftObject() -> SwiftObject!
    
    @JavaMethod
    func getResourceId() -> Int32
}

@JavaImplementation("com.pureswift.swiftandroid.ListViewAdapter")
extension ListViewAdapter {
    
    @JavaMethod
    func getView(position: Int32, convertView: AndroidView.View?, parent: ViewGroup?) -> AndroidView.View? {
        log("\(self).\(#function) \(position)")
        return getView(position, convertView, parent)
    }
}

public extension ListViewAdapter {
    
    typealias GetView = (Int32, AndroidView.View?, ViewGroup?) -> AndroidView.View?
    
    var getView: GetView {
        get {
            getSwiftObject().valueObject().value as! GetView
        }
        set {
            getSwiftObject().valueObject().value = newValue
        }
    }
    
    convenience init(
        context: AndroidContent.Context,
        getView: @escaping (Int32, AndroidView.View?, ViewGroup?) -> AndroidView.View?,
        objects: ArrayList<JavaObject>,
        environment: JNIEnvironment? = nil
    ) {
        self.init(context: context, swiftObject: SwiftObject(getView), objects: objects, environment: environment)
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
