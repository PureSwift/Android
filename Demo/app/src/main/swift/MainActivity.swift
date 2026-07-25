//
//  Activity.swift
//  AndroidSwiftUI
//
//  Created by Alsey Coleman Miller on 6/8/25.
//

import Foundation
import AndroidKit
import JavaLang
#if canImport(Binder)
import Binder
#endif

@JavaClass("com.pureswift.swiftandroid.MainActivity")
open class MainActivity: AndroidApp.Activity {

    @JavaMethod
    open func setRootView(_ view: AndroidView.View?)

    @JavaMethod
    open func getEmitter() -> UnitEmitter!

    static private(set) var shared: MainActivity!

    lazy var emitter = getEmitter()!
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

        startEmitterTimer()

        #if canImport(Binder)
        Task {
            printBinderVersion()
        }
        #endif
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

    #if canImport(Binder)
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
    #endif
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
