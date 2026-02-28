//
//  InputQueue.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if os(Android)
import Android
import CAndroidNDK
#endif
import AndroidLooper

/// Input Queue
///
/// Provides a mechanism for your native activity to retrieve and process input events from the Android input system.
/// AInputQueue is an opaque handle for the native input queue associated with a window.
///
/// [See Also](https://developer.android.com/ndk/reference/group/input#ainputqueue)
public struct InputQueue: ~Copyable {
    
    // MARK: - Properties
    
    internal let pointer: OpaquePointer
    
    // MARK: - Initialization
    
    internal init(_ pointer: OpaquePointer) {
        self.pointer = pointer
    }
    
    // MARK: - Methods
    
    /// Add this input queue to a looper for processing.
    ///
    /// - Parameters:
    ///   - looper: The looper to use when invoking callbacks.
    ///   - identifier: The identifier to use when performing callbacks.
    ///   - callback: The function to call when an event is available.
    ///   - data: A private data pointer to supply to the callback.
    public func attachLooper(
        _ looper: borrowing Looper,
        identifier: Int32,
        callback: ALooper_callbackFunc?,
        data: UnsafeMutableRawPointer?
    ) {
        looper.withUnsafePointer { looperPointer in
            AInputQueue_attachLooper(self.pointer, looperPointer, identifier, callback, data)
        }
    }
    
    /// Remove the input queue from the looper it is currently attached to.
    public func detachLooper() {
        AInputQueue_detachLooper(pointer)
    }
    
    /// Returns true if there are one or more events available in the input queue.
    ///
    /// Returns 1 if the queue has events; 0 if it does not have events; and a negative value if there is an error.
    public func hasEvents() -> Int32 {
        AInputQueue_hasEvents(pointer)
    }
    
    /// Returns the next available event from the queue.
    ///
    /// Returns a negative value if no events are available or an error has occurred, otherwise returns a non-negative value indicating the number of events available.
    ///
    /// - Parameter outEvent: Will be set to the next input event.
    /// - Returns: The result code.
    @discardableResult
    public func getEvent(_ outEvent: inout InputEvent?) -> Int32 {
        var eventPointer: OpaquePointer?
        let result = AInputQueue_getEvent(pointer, &eventPointer)
        if result >= 0, let eventPointer {
            outEvent = InputEvent(eventPointer)
        } else {
            outEvent = nil
        }
        return result
    }
    
    /// Sends the key for standard pre-dispatching.
    ///
    /// Returns 0 if pre-dispatch was completed, 1 if the event should be pre-dispatched, or a negative value on error.
    ///
    /// - Parameter event: The input event to pre-dispatch.
    /// - Returns: The result code.
    @discardableResult
    public func preDispatchEvent(_ event: borrowing InputEvent) -> Int32 {
        AInputQueue_preDispatchEvent(pointer, event.pointer)
    }
    
    /// Report that dispatching has finished with the given event.
    ///
    /// This must be called after receiving an event with `getEvent()`.
    ///
    /// - Parameters:
    ///   - event: The event that was handled.
    ///   - handled: Whether the event was handled (1) or not (0).
    public func finishEvent(_ event: borrowing InputEvent, handled: Bool) {
        AInputQueue_finishEvent(pointer, event.pointer, handled ? 1 : 0)
    }
}
