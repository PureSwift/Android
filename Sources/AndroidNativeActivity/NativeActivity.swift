//
//  NativeActivity.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if os(Android)
import Android
import CAndroidNDK
#endif
import AndroidLooper
import AndroidFileManager
import SystemPackage

/// Native Activity
///
/// This structure defines the native side of an android.app.NativeActivity.
/// It is created by the framework, and handed to the application's native code as it is being launched.
///
/// [See Also](https://developer.android.com/ndk/reference/group/native-activity#anativeactivity)
public final class NativeActivity {
    
    // MARK: - Properties
    
    internal let pointer: UnsafeMutablePointer<ANativeActivity>
    
    // MARK: - Initialization
    
    internal init(_ pointer: UnsafeMutablePointer<ANativeActivity>) {
        self.pointer = pointer
    }
    
    deinit {
        ANativeActivity_finish(pointer)
    }
    
    // MARK: - Accessors
    
    /// Pointer to the callback function table of the native application.
    ///
    /// You can set the functions here to your own callbacks. The callbacks pointer itself is not immutable, so you must not call them directly. We recommend copying the callbacks to your own unique callbacks table and using those directly.
    public var callbacks: UnsafeMutablePointer<ANativeActivityCallbacks> {
        pointer.pointee.callbacks
    }
    
    /// The NativeActivity object handle.
    ///
    /// This is the native instance of the android.app.NativeActivity Java class.
    public var javaActivity: jobject {
        pointer.pointee.clazz
    }
    
    /// Path to this application's internal data directory.
    public var internalDataPath: FilePath {
        FilePath(String(cString: pointer.pointee.internalDataPath))
    }
    
    /// Path to this application's external (removable/mountable) data directory.
    public var externalDataPath: FilePath {
        FilePath(String(cString: pointer.pointee.externalDataPath))
    }
    
    /// The platform's SDK version code.
    public var sdkVersion: Int32 {
        pointer.pointee.sdkVersion
    }
    
    /// This is the native instance of the application.
    ///
    /// It is not used by the framework, but can be set by the application to its own instance state.
    public var instance: UnsafeMutableRawPointer? {
        get { pointer.pointee.instance }
        set { pointer.pointee.instance = newValue }
    }
    
    /// Pointer to the Asset Manager instance for the application.
    ///
    /// The application uses this to access binary assets bundled inside its own .apk file.
    public var assetManager: AndroidFileManager.AssetManager {
        AndroidFileManager.AssetManager(pointer.pointee.assetManager)
    }
    
    /// Available starting with Honeycomb: path to the directory containing the application's OBB files (if any).
    ///
    /// If the app doesn't have any OBB files, this directory may not exist.
    public var obbPath: FilePath? {
        guard let path = pointer.pointee.obbPath else {
            return nil
        }
        return FilePath(String(cString: path))
    }
}

// MARK: - Native Activity Callbacks

/// These are the callbacks the framework makes into a native application.
///
/// All of these callbacks happen on the main thread of the application. By default, all callbacks are NULL; set to a pointer to your own function to have it called.
///
/// [See Also](https://developer.android.com/ndk/reference/struct/a-native-activity-callbacks)
public struct NativeActivityCallbacks: Sendable {
    
    /// NativeActivity has started.
    ///
    /// See Java documentation for Activity.onStart() for more information.
    public var onStart: (@convention(c) (UnsafeMutablePointer<ANativeActivity>) -> Void)?
    
    /// NativeActivity has resumed.
    ///
    /// See Java documentation for Activity.onResume() for more information.
    public var onResume: (@convention(c) (UnsafeMutablePointer<ANativeActivity>) -> Void)?
    
    /// Framework is asking NativeActivity to save its current instance state.
    ///
    /// See Java documentation for Activity.onSaveInstanceState() for more information.
    /// The returned pointer needs to be created with malloc(); the framework will call free() on it for you.
    /// You also must fill in outSize with the number of bytes in the allocation. Note that the saved state will be persisted, so it can not contain any active entities (pointers to memory, file descriptors, etc).
    public var onSaveInstanceState: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, UnsafeMutablePointer<Int>) -> UnsafeMutableRawPointer?)?
    
    /// NativeActivity has paused.
    ///
    /// See Java documentation for Activity.onPause() for more information.
    public var onPause: (@convention(c) (UnsafeMutablePointer<ANativeActivity>) -> Void)?
    
    /// NativeActivity has stopped.
    ///
    /// See Java documentation for Activity.onStop() for more information.
    public var onStop: (@convention(c) (UnsafeMutablePointer<ANativeActivity>) -> Void)?
    
    /// NativeActivity is being destroyed.
    ///
    /// See Java documentation for Activity.onDestroy() for more information.
    public var onDestroy: (@convention(c) (UnsafeMutablePointer<ANativeActivity>) -> Void)?
    
    /// Focus has changed in this NativeActivity's window.
    ///
    /// This is often used, for example, to pause a game when it loses input focus.
    public var onWindowFocusChanged: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, Int32) -> Void)?
    
    /// The drawing window for this native activity has been created.
    ///
    /// You can use the window pointer to draw.
    public var onNativeWindowCreated: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, OpaquePointer?) -> Void)?
    
    /// The drawing window for this native activity has been resized.
    ///
    /// You should retrieve the new size from the window and ensure that your rendering in it now matches.
    public var onNativeWindowResized: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, OpaquePointer?) -> Void)?
    
    /// The drawing window for this native activity needs to be redrawn.
    ///
    /// To avoid transient artifacts during screen changes (such as orientation change), applications should not return from this function until they have finished drawing their window in its current state.
    public var onNativeWindowRedrawNeeded: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, OpaquePointer?) -> Void)?
    
    /// The drawing window for this native activity is going to be destroyed.
    ///
    /// You MUST ensure that you do not touch the window object after returning from this function: in the common case of drawing to the window from another thread, that means the implementation of this callback must properly synchronize with the other thread to stop its drawing before returning from here.
    public var onNativeWindowDestroyed: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, OpaquePointer?) -> Void)?
    
    /// The input queue for this native activity's window has been created.
    ///
    /// You can use it to monitor user input events.
    public var onInputQueueCreated: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, OpaquePointer?) -> Void)?
    
    /// The input queue for this native activity's window is being destroyed.
    ///
    /// You should no longer try to reference it. Pending events may still be delivered.
    public var onInputQueueDestroyed: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, OpaquePointer?) -> Void)?
    
    /// The rectangle in the window in which content should be placed has changed.
    public var onContentRectChanged: (@convention(c) (UnsafeMutablePointer<ANativeActivity>, UnsafePointer<ARect>?) -> Void)?
    
    /// The current device AConfiguration has changed.
    ///
    /// The new configuration can be retrieved from assetManager.
    public var onConfigurationChanged: (@convention(c) (UnsafeMutablePointer<ANativeActivity>) -> Void)?
    
    /// The system is running low on memory.
    ///
    /// Try to reduce your memory use.
    public var onLowMemory: (@convention(c) (UnsafeMutablePointer<ANativeActivity>) -> Void)?
}

// MARK: - Native Activity Functions

public extension NativeActivity {
    
    /// Change the window format of the given activity.
    ///
    /// Calls getWindow().setFormat() of the given activity.
    /// Note that this method can be called from any thread; it will send a message to the main thread of the process where the Java finish call will take place.
    func setWindowFormat(_ format: Int32) {
        ANativeActivity_setWindowFormat(pointer, format)
    }
    
    /// Change the window flags of the given activity.
    ///
    /// Calls getWindow().setFlags() of the given activity.
    /// Note that this method can be called from any thread; it will send a message to the main thread of the process where the Java finish call will take place. See window.h for flag constants.
    func setWindowFlags(addFlags: UInt32, removeFlags: UInt32) {
        ANativeActivity_setWindowFlags(pointer, addFlags, removeFlags)
    }
    
    /// Show the IME while in the given activity.
    ///
    /// Calls InputMethodManager.showSoftInput() for the given activity.
    /// Note that this method can be called from any thread; it will send a message to the main thread of the process where the Java finish call will take place.
    func showSoftInput(flags: UInt32) {
        ANativeActivity_showSoftInput(pointer, flags)
    }
    
    /// Hide the IME while in the given activity.
    ///
    /// Calls InputMethodManager.hideSoftInput() for the given activity.
    /// Note that this method can be called from any thread; it will send a message to the main thread of the process where the Java finish call will take place.
    func hideSoftInput(flags: UInt32) {
        ANativeActivity_hideSoftInput(pointer, flags)
    }
}

#if !os(Android)
// Stubs for non-Android platforms
private func ANativeActivity_setWindowFormat(_ activity: UnsafeMutablePointer<ANativeActivity>, _ format: Int32) { fatalError("stub") }
private func ANativeActivity_setWindowFlags(_ activity: UnsafeMutablePointer<ANativeActivity>, _ addFlags: UInt32, _ removeFlags: UInt32) { fatalError("stub") }
private func ANativeActivity_showSoftInput(_ activity: UnsafeMutablePointer<ANativeActivity>, _ flags: UInt32) { fatalError("stub") }
private func ANativeActivity_hideSoftInput(_ activity: UnsafeMutablePointer<ANativeActivity>, _ flags: UInt32) { fatalError("stub") }
private func ANativeActivity_finish(_ activity: UnsafeMutablePointer<ANativeActivity>) { fatalError("stub") }

public typealias ANativeActivity = OpaquePointer
public typealias ANativeActivityCallbacks = OpaquePointer
public typealias ARect = OpaquePointer
#endif
