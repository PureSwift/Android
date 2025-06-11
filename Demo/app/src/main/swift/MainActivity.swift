//
//  Activity.swift
//  AndroidSwiftUI
//
//  Created by Alsey Coleman Miller on 6/8/25.
//

import Foundation
import AndroidKit
import AndroidJavaLang

@JavaClass("com.pureswift.swiftandroid.MainActivity")
open class MainActivity: AndroidApp.Activity {
        
    @JavaMethod
    open func setRootView(_ view: AndroidView.View?)
}

@JavaImplementation("com.pureswift.swiftandroid.MainActivity")
extension MainActivity {
    
    @JavaMethod
    public func onCreateSwift(_ savedInstanceState: BaseBundle?) {
        log("\(self).\(#function)")
        
        runAsync()
        
        runMainThread {
            Self.log("\(self).\(#function) Main Thread Runnable")
            RunLoop.main.run(until: Date() + 0.1)
        }
        
        setRootView()
    }
}

private extension MainActivity {
    
    func runAsync() {
        RunLoop.main.run(until: Date() + 0.1)
        DispatchQueue.main.async {
            Self.log("\(self).\(#function) Main Thread Async")
        }
        DispatchQueue.global(qos: .default).async {
            Self.log("\(self).\(#function) Default Dispatch Queue Async")
        }
        Task {
            Self.log("\(self).\(#function) Task Started")
            await MainActor.run {
                RunLoop.main.run(until: Date() + 0.1)
            }
        }
    }
    
    func runMainThread(_ block: @escaping () -> ()) {
        self.runOnUiThread(Runnable(block).as(AndroidJavaLang.Runnable.self))
    }
    
    func setRootView() {
        /*
        let listView = ListView(self)
        let items = [
            "1",
            "2",
            "3"
        ]
        let context = ListViewAdapter.Context(items: items)
        let adapter = ListViewAdapter(context)
        listView.setAdapter(adapter.as(Adapter.self))
        */
        let textView = TextView(self)
        textView.text = "Hello Swift!"
        setRootView(textView)
    }
}

extension MainActivity {
    
    static var logTag: String { "MainActivity" }
    
    static let log = try! JavaClass<AndroidUtil.Log>()
    
    static func log(_ string: String) {
        _ = Self.log.d(Self.logTag, string)
    }
    
    static func logInfo(_ string: String) {
        _ = Self.log.i(Self.logTag, string)
    }
    
    static func logError(_ string: String) {
        _ = Self.log.e(Self.logTag, string)
    }
    
    func log(_ string: String) {
        Self.log(string)
    }
    
    func logError(_ string: String) {
        Self.logError(string)
    }
}
