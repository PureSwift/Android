import Testing
import CSwiftJavaJNI
import JavaTypes
import SwiftJava
import Android
import AndroidOS
import AndroidApp
import AndroidContent

@Test func testAndroidAppContext() throws {
    #expect(AndroidContent.Context.fullJavaClassName == "android.content.Context", "unexpected class name")
    #expect(AndroidApp.Application.fullJavaClassName == "android.app.Application", "unexpected class name")

    let jvm: JavaVirtualMachine = try #require(JavaVirtualMachine.findCreatedJavaVM())
    let env: JNIEnvironment = try jvm.environment()
    let app: AndroidApp.Application = try #require(AndroidApp.Application.getApplicationContext(env: env))
    let ctx: AndroidContent.Context = AndroidContent.Context(javaHolder: app.javaHolder) // cast android.app.Application to android.content.Context

    let name = ctx.getPackageName()
    #expect(name == "org.swift.test.swiftandroid", "test harness named by skip android test")

    let info: AndroidContent.ApplicationInfo = ctx.getApplicationInfo()
    #expect(info.processName == "org.swift.test.swiftandroid")
    #expect(info.minSdkVersion == 28)

    let looper: AndroidOS.Looper = ctx.getMainLooper()
    #expect(looper.isCurrentThread() == false, "tests should not be running on main thread")

    let activityManagerOb: JavaObject = ctx.getSystemService(ctx.javaClass.ACTIVITY_SERVICE)
    let activityManager: ActivityManager = ActivityManager(javaHolder: activityManagerOb.javaHolder)
    #expect(activityManager.javaClass.isUserAMonkey() == false, "aren't we all monkeys, though?")
}

extension AndroidApp.Application {
    /// There's no public global way of accessing the Android Context, so we use `android.app.ActivityThread.currentActivityThread().getApplication()`
    public static func getApplicationContext(env: JNIEnvironment) -> AndroidApp.Application? {
        let jni: JNINativeInterface = env.pointee!.pointee

        guard let activityThreadClass: jclass = jni.FindClass(env, "android/app/ActivityThread") else { return nil }

        // lookup `currentActivityThread()` and call it
        guard let currentActivityThread: jmethodID = jni.GetStaticMethodID(env, activityThreadClass, "currentActivityThread", "()Landroid/app/ActivityThread;") else { return nil }
        guard let activityThread: jobject = jni.CallStaticObjectMethodA(env, activityThreadClass, currentActivityThread, []) else { return nil }

        // lookup `getApplication()` and call it
        guard let getApplication: jmethodID = jni.GetMethodID(env, activityThreadClass, "getApplication", "()Landroid/app/Application;") else { return nil }
        guard let application: jobject = jni.CallObjectMethodA(env, activityThread, getApplication, []) else { return nil }

        let contextHolder = JavaObjectHolder(object: application, environment: env)
        // this could also be AndroidContent.Context (i.e., android.content.Context)
        let ctx = AndroidApp.Application(javaHolder: contextHolder)
        return ctx
    }
}

extension JavaVirtualMachine {
    public static func findCreatedJavaVM() -> JavaVirtualMachine? {
        if let sharedJVM = try? JavaVirtualMachine.shared() {
            return sharedJVM
        }
    
        // manual method: Get the ambient JavaVM by invoking `JNI_GetCreatedJavaVMs` by hook or by crook
        typealias JavaVMPtr = UnsafeMutablePointer<JavaVM?>
        typealias GetCreatedJavaVMs = @convention(c) (_ pvm: UnsafeMutablePointer<JavaVMPtr?>, _ count: Int32, _ num: UnsafeMutablePointer<Int32>) -> jint

        // we need to get the host JVM using JNI_GetCreatedJavaVMs, but it is not exported in jni.h,
        // so we need to dlsym it from some library, which has changed over various Android APIs
        // libnativehelper.so added in API 31 (https://github.com/android/ndk/issues/1320) to work around "libart.so" no longer being allowed to load
        // FIXME: this might not work on API 29 and 30 specifically, since it is after Android started restricting access to the APIs but before they exposed JNI_GetCreatedJavaVMs publicly
        for libname in [nil, "libnativehelper.so", "libart.so", "libdvm.so"] {
            let lib = dlopen(libname, RTLD_NOW)
            guard let getCreatedJavaVMs = dlsym(lib, "JNI_GetCreatedJavaVMs").map({ unsafeBitCast($0, to: (GetCreatedJavaVMs).self) }) else {
                continue
            }

            var runningCount: Int32 = 0
            var jvm: JavaVMPtr?
            if getCreatedJavaVMs(&jvm, 1, &runningCount) == JNI_OK, let jvm = jvm {
                return JavaVirtualMachine(adoptingJVM: jvm)
            }
        }

        return nil
    }
}

