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
    
    lazy var textView = TextView(self)
    
    lazy var listView = ListView(self)
    
    var runnable: AndroidJavaLang.Runnable!
    
    //lazy var timer = AndroidJavaUtil.Timer()
}

@JavaImplementation("com.pureswift.swiftandroid.MainActivity")
extension MainActivity {
    
    @JavaMethod
    public func onCreateSwift(_ savedInstanceState: BaseBundle?) {
        log("\(self).\(#function)")
        
        runAsync()
        
        startMainRunLoop()
        
        setRootView()
        
        // update view on timer
        Task { [weak self] in
            while let self = self {
                try? await Task.sleep(for: .seconds(1))
                await MainActor.run { [weak self] in
                    self?.updateView()
                }
            }
        }
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
    
    func startMainRunLoop() {
        let runnable = Runnable { [weak self] in
            // run main loop
            RunLoop.main.run(until: Date() + 0.01)
            // schedule next
            Task { [weak self] in
                while let self, let runnable = self.runnable {
                    try? await Task.sleep(for: .seconds(10))
                    self.runOnUiThread(runnable)
                }
            }
        }
        self.runnable = runnable.as(AndroidJavaLang.Runnable.self)
        self.runOnUiThread(self.runnable)
    }
    
    func setRootView() {
        let items = [
            "Row 1",
            "Row 2",
            "Row 3"
        ]
        let layout = try! JavaClass<R.layout>()
        let resource = layout.simple_list_item_1
        assert(resource != 0)
        let objects: [JavaObject?] = items.map { JavaString($0) }
        let adapter = ArrayAdapter<JavaObject>(
            context: self,
            resource: resource,
            objects: objects
        )
        listView.setAdapter(adapter.as(Adapter.self))
                
        setRootView(listView)
        updateView()
    }
    
    func updateView() {
        textView.text = "Hello Swift!\n\(Date().formatted(date: .numeric, time: .complete))"
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

