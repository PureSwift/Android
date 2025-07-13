//
//  Activity.swift
//  AndroidSwiftUI
//
//  Created by Alsey Coleman Miller on 6/8/25.
//

import Foundation
import AndroidKit
import JavaLang
import Binder

@JavaClass("com.pureswift.swiftandroid.MainActivity")
open class MainActivity: AndroidApp.Activity {
        
    @JavaMethod
    open func setRootView(_ view: AndroidView.View?)
    
    @JavaMethod
    open func getEmitter() -> UnitEmitter!
    
    static private(set) var shared: MainActivity!
    
    lazy var textView = TextView(self)
    
    lazy var listView = ListView(self)
    
    lazy var recyclerView = RecyclerView(self)
    
    lazy var button = AndroidWidget.Button(self)

    lazy var emitter = getEmitter()!
    
    lazy var rootViewID: Int32 = try! JavaClass<AndroidView.View>().generateViewId()
}

@JavaImplementation("com.pureswift.swiftandroid.MainActivity")
extension MainActivity {
    
    @JavaMethod
    public func onCreateSwift(_ savedInstanceState: BaseBundle?) {
        log("\(self).\(#function)")
        
        _onCreate(savedInstanceState)
    }
}

private extension MainActivity {
    
    #if os(Android)
    typealias MainActor = AndroidMainActor
    #endif
    
    func _onCreate(_ savedInstanceState: BaseBundle?) {
        
        // setup singletons
        if savedInstanceState == nil, MainActivity.shared == nil {
            MainActivity.shared = self
            startMainRunLoop()
            runAsync()
        }
        
        // need to recreate views
        //setRootView()
        startEmitterTimer()
        
        Task {
            printBinderVersion()
        }
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
        guard AndroidMainActor.setupMainLooper() else {
            fatalError("Unable to setup main loop")
        }
        #endif
    }
    
    func setRootView() {
        setTextView()
    }
    
    func setTextView() {
        let linearLayout = LinearLayout(self)
        linearLayout.orientation = .vertical
        linearLayout.gravity = .center
        linearLayout.addView(textView)
        configureButton()
        linearLayout.addView(button)
        setRootView(linearLayout)
        // update view on timer
        Task { [weak self] in
            while let self {
                await self.updateTextView()
                try? await Task.sleep(for: .seconds(1))
            }
        }
    }
    
    func startEmitterTimer() {
        // update view on timer
        Task { [weak self] in
            while let self {
                await emit()
                try? await Task.sleep(for: .seconds(1))
            }
        }
    }
    
    @MainActor
    func emit() {
        Self.log("\(self).\(#function)")
        emitter.emit()
    }
    
    func setupNavigationStack() {
        
        let fragmentContainer = FrameLayout(self)
        fragmentContainer.setId(rootViewID)
        let matchParent = try! JavaClass<AndroidView.ViewGroup.LayoutParams>().MATCH_PARENT
        fragmentContainer.setLayoutParams(ViewGroup.LayoutParams(matchParent, matchParent))
        
        let homeFragment = Fragment(callback: .init(onViewCreated: { view, bundle in
            let context = self
            
            let linearLayout = LinearLayout(self)
            linearLayout.setLayoutParams(ViewGroup.LayoutParams(matchParent, matchParent))
            linearLayout.orientation = .vertical
            linearLayout.gravity = .center
            
            let label = TextView(context)
            label.text = "Home View"
            label.gravity = .center
            linearLayout.addView(label)
            
            let button = Button(context)
            button.text = "Push"
            label.gravity = .center
            let listener = ViewOnClickListener {
                self.didPushButton()
            }
            button.setOnClickListener(listener.as(View.OnClickListener.self))
            linearLayout.addView(button)
            
            view.as(ViewGroup.self)!.addView(linearLayout)
        }))
        
        // setup initial fragment
        _ = getFragmentManager()
            .beginTransaction()
            .replace(rootViewID, homeFragment)
            .commit()
        
        // Set as the content view
        setRootView(fragmentContainer)
    }
    
    func configureButton() {
        button.text = "Push"
        let listener = ViewOnClickListener {
            self.didPushButton()
        }
        button.setOnClickListener(listener.as(View.OnClickListener.self))
    }
    
    func didPushButton() {
        
        let counter = getFragmentManager().getBackStackEntryCount() + 1
        
        let detailFragment = Fragment(callback: .init(onViewCreated: { view, bundle in
            let context = self
            
            let matchParent = try! JavaClass<AndroidView.ViewGroup.LayoutParams>().MATCH_PARENT
            
            let linearLayout = LinearLayout(self)
            linearLayout.setLayoutParams(ViewGroup.LayoutParams(matchParent, matchParent))
            linearLayout.orientation = .vertical
            linearLayout.gravity = .center
            
            let label = TextView(context)
            label.text = "Detail View \(counter)"
            label.gravity = .center
            linearLayout.addView(label)
            
            let button = Button(context)
            button.text = "Push"
            button.gravity = .center
            let listener = ViewOnClickListener {
                self.didPushButton()
            }
            button.setOnClickListener(listener.as(View.OnClickListener.self))
            linearLayout.addView(button)
            
            view.as(ViewGroup.self)!.addView(linearLayout)
        }))
        
        push(detailFragment, name: "Detail \(counter)")
    }
    
    func push(_ fragment: AndroidApp.Fragment, name: String) {
        log("\(self).\(#function) \(name)")
        _ = getFragmentManager()
            .beginTransaction()
            .replace(rootViewID, fragment)
            .addToBackStack(name)
            .commit()
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
    
    func setTabBar() {
        let layout = LinearLayout(self)
        layout.orientation = .vertical
        
        let container = FrameLayout(self)
        container.setId(2001)
        
        let bottomNav = BottomNavigationView(self)
        _ = bottomNav.getMenu().add(0, 1, 0, JavaString("Home").as(CharSequence.self)).setIcon(17301543)
        _ = bottomNav.getMenu().add(0, 2, 1, JavaString("Profile").as(CharSequence.self)).setIcon(17301659)
        
        let homeFragment = Fragment(callback: .init(onViewCreated: { view, bundle in
            let context = self
            let label = TextView(context)
            label.text = "Home View"
            label.gravity = .center
            view.as(ViewGroup.self)!.addView(label)
        }))
        
        let profileFragment = Fragment(callback: .init(onViewCreated: { view, bundle in
            let context = self
            let label = TextView(context)
            label.text = "Profile"
            label.gravity = .center
            view.as(ViewGroup.self)!.addView(label)
        }))
        
        let fragment1 = homeFragment
        let fragment2 = profileFragment
        
        let listener = NavigationBarViewOnItemSelectedListener { item in
            guard let item else { return false }
            let fragment: AndroidApp.Fragment = (item.getItemId() == 1) ? fragment1 : fragment2
            _ = self.getFragmentManager().beginTransaction()
                .replace(2001, fragment)
                .commit()
            return true
        }
        bottomNav.setOnItemSelectedListener(listener.as(NavigationBarView.OnItemSelectedListener.self))
        
        let matchParent = try! JavaClass<ViewGroup.LayoutParams>().MATCH_PARENT
        let wrapContent = try! JavaClass<ViewGroup.LayoutParams>().WRAP_CONTENT
        
        layout.addView(container as AndroidView.View, ViewGroup.LayoutParams(matchParent, 1))
        layout.addView(bottomNav as AndroidView.View, ViewGroup.LayoutParams(matchParent, wrapContent))
        
        self.setRootView(layout)
        
        // Default to Home
        _ = self.getFragmentManager().beginTransaction()
            .add(2001, fragment1)
            .commit()
    }
    
    private func printBinderVersion() {
        // Print Binder version
        do {
            let version = try BinderVersion.current
            logInfo("Binder Version: \(version)")
        }
        catch {
            logError("Unable to read binder: \(error)")
        }
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
    
    func logInfo(_ string: String) {
        Self.logInfo(string)
    }
}
