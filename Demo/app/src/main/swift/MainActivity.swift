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
    
    static private(set) var shared: MainActivity!
    
    lazy var textView = TextView(self)
    
    lazy var listView = ListView(self)
    
    lazy var recyclerView = RecyclerView(self)
    
    var runnable: AndroidJavaLang.Runnable!
    
    //lazy var timer = AndroidJavaUtil.Timer()
}

@JavaImplementation("com.pureswift.swiftandroid.MainActivity")
extension MainActivity {
    
    @JavaMethod
    public func onCreateSwift(_ savedInstanceState: BaseBundle?) {
        log("\(self).\(#function)")
        
        _onCreate()
    }
}

private extension MainActivity {
    
    #if os(Android)
    typealias MainActor = AndroidMainActor
    #endif
    
    func _onCreate() {
        MainActivity.shared = self
        runAsync()
        startMainRunLoop()
        setRootView()
        
        
    }
    
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
        }
    }
    
    func startMainRunLoop() {
        #if os(Android)
        guard AndroidLooper.setupMainLooper() else {
            fatalError("Unable to setup main loop")
        }
        #endif
    }
    
    func setRootView() {
        setRecyclerView()
    }
    
    func setTextView() {
        setRootView(textView)
        // update view on timer
        Task { [weak self] in
            while let self {
                await self.updateTextView()
                try? await Task.sleep(for: .seconds(1))
            }
        }
    }
    
    func setListView() {
        let items = [
            "Row 1",
            "Row 2",
            "Row 3",
            "Row 4",
            "Row 5"
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
    }
    
    func setRecyclerView() {
        let items = [
            "Row 1",
            "Row 2",
            "Row 3",
            "Row 4",
            "Row 5"
        ]
        let callback = RecyclerViewAdapter.Callback(
            onBindViewHolder: { (holder, position) in
                guard let viewHolder = holder.as(RecyclerViewAdapter.ViewHolder.self) else {
                    return
                }
                // get view
                let linearLayout = viewHolder.itemView.as(LinearLayout.self)!
                let textView: TextView
                if linearLayout.getChildCount() == 0 {
                    textView = TextView(self)
                    linearLayout.addView(textView)
                } else {
                    textView = linearLayout.getChildAt(0).as(TextView.self)!
                }
                // set data
                let data = items[Int(position)]
                textView.text = data
            },
            getItemCount: {
                Int32(items.count)
            }
        )
        let adapter = RecyclerViewAdapter(callback)
        recyclerView.setLayoutManager(LinearLayoutManager(self))
        recyclerView.setAdapter(adapter)
        setRootView(recyclerView)
    }
    
    @MainActor
    func updateTextView() {
        log("\(self).\(#function)")
        textView.text = "Hello Swift!\n\(Date().formatted(date: .numeric, time: .complete))"
    }
}

extension MainActivity {
    
    static var logTag: LogTag { "MainActivity" }
        
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

