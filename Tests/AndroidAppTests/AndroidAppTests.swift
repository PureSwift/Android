import Testing
import SwiftJavaJNICore
import SwiftJava
import AndroidOS
import AndroidApp
import AndroidContext
@preconcurrency import AndroidContent

extension AndroidApp.Application {
    /// The shared `android.app.Application`
    public static func currentApplication() throws -> Application {
        let jvm = try JavaVirtualMachine.shared()
        let env = try jvm.environment()

        // get the low-level application context wrapper from swift-android-native
        let lowLevelContext = try AndroidContext.application

        // wrap it in the @JavaClass Context
        return Application(javaHolder: JavaObjectHolder(object: lowLevelContext.pointer, environment: env))
    }
}

extension AndroidContent.Context {
    /// The shared `android.content.Context` for the current application
    public static func applicationContext() throws -> Context {
        // simply cast the Application to a Context
        try Application.currentApplication().as(AndroidContent.Context.self)!
    }
}

@Test func testAndroidAppContext() throws {
    let jvm = try JavaVirtualMachine.shared()
    let env = try jvm.environment()

    let ctx = try Context.applicationContext()

    let name = ctx.getPackageName()
    #expect(name == "org.swift.test.swiftandroid", "test harness named by skip android test")

    let info: AndroidContent.ApplicationInfo = ctx.getApplicationInfo()
    #expect(info.processName == "org.swift.test.swiftandroid")
    #expect(info.minSdkVersion >= 28)

    let looper: AndroidOS.Looper = ctx.getMainLooper()
    #expect(looper.isCurrentThread() == false, "tests should not be running on main thread")

    let activityManagerOb = try #require(ctx.getSystemService(ctx.javaClass.ACTIVITY_SERVICE))
    let activityManager: ActivityManager = ActivityManager(javaHolder: activityManagerOb.javaHolder)

    #expect(activityManager.javaClass.isUserAMonkey() == false, "aren't we all monkeys, though?")
}
