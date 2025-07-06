//
//  choreographer.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/14/25.
//

#if os(Android)
import Android
import AndroidNDK
#endif

/// Choreographer coordinates the timing of frame rendering.
///
/// This is the C version of the android.view.Choreographer object in Java. If you do not use Choreographer to pace your render loop, you may render too quickly for the display, increasing latency between frame submission and presentation.
///
/// Input events are guaranteed to be processed before the frame callback is called, and will not be run concurrently. Input and sensor events should not be handled in the Choregrapher callback.
///
/// The frame callback is also the appropriate place to run any per-frame state update logic. For example, in a game, the frame callback should be responsible for updating things like physics, AI, game state, and rendering the frame. Input and sensors should be handled separately via callbacks registered with AInputQueue and ASensorManager.
///
/// [See Also](https://developer.android.com/ndk/reference/group/choreographer)
public struct AndroidChoreographer : @unchecked Sendable {
    
    private let pointer: OpaquePointer

    /// Get the AChoreographer instance for the main thread.
    ///
    /// Must be initialized at startup time with `setupMainChoreographer()`
    public nonisolated(unsafe) private(set) static var main: AndroidChoreographer!
    
    /// Get the AChoreographer instance for the current thread.
    ///
    /// This must be called on an ALooper thread.
    public static var current: AndroidChoreographer {
        AndroidChoreographer(pointer: AChoreographer_getInstance()!)
    }

    private init(pointer: OpaquePointer) {
        self.pointer = pointer
    }

    /// Add a callback to the Choreographer to  invoke `_dispatch_main_queue_callback_4CF` on each frame to drain the main queue
    public static func setupMainChoreographer() {
        if Self.main == nil {
            Self.main = AndroidChoreographer.current
        }
    }

    public func postFrameCallback(_ callback: @convention(c)(Int, UnsafeMutableRawPointer?) -> ()) {
        AChoreographer_postFrameCallback(pointer, callback, nil)
    }
}
