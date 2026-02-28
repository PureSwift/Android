//
//  InputEvent.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if os(Android)
import Android
import CAndroidNDK
#endif

/// Input Event
///
/// Represents an input event from the Android input system. This is an opaque handle that wraps
/// both key events and motion events (touch, mouse, joystick, etc.).
///
/// [See Also](https://developer.android.com/ndk/reference/group/input#ainputevent)
public struct InputEvent: ~Copyable {
    
    // MARK: - Properties
    
    internal let pointer: OpaquePointer
    
    // MARK: - Initialization
    
    internal init(_ pointer: OpaquePointer) {
        self.pointer = pointer
    }
    
    // MARK: - Event Properties
    
    /// Get the input event type.
    public var type: EventType {
        EventType(rawValue: AInputEvent_getType(pointer))
    }
    
    /// Get the id for the device that an input event came from.
    public var deviceId: Int32 {
        AInputEvent_getDeviceId(pointer)
    }
    
    /// Get the input event source.
    public var source: EventSource {
        EventSource(rawValue: AInputEvent_getSource(pointer))
    }
}

// MARK: - Event Type

public struct EventType: RawRepresentable, Equatable, Hashable, Sendable {
    
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    
    /// Indicates that the input event is a key event.
    public static let key = EventType(rawValue: Int32(AINPUT_EVENT_TYPE_KEY))

    /// Indicates that the input event is a motion event.
    public static let motion = EventType(rawValue: Int32(AINPUT_EVENT_TYPE_MOTION))

    /// Indicates that the input event is a focus event.
    ///
    /// Available since API level 28.
    public static let focus = EventType(rawValue: Int32(AINPUT_EVENT_TYPE_FOCUS))

    /// Indicates that the input event is a capture event.
    ///
    /// Available since API level 28.
    public static let capture = EventType(rawValue: Int32(AINPUT_EVENT_TYPE_CAPTURE))

    /// Indicates that the input event is a drag event.
    ///
    /// Available since API level 31.
    public static let drag = EventType(rawValue: Int32(AINPUT_EVENT_TYPE_DRAG))

    /// Indicates that the input event is a touch mode event.
    ///
    /// Available since API level 31.
    public static let touchMode = EventType(rawValue: Int32(AINPUT_EVENT_TYPE_TOUCH_MODE))
}

// MARK: - Event Source

public struct EventSource: RawRepresentable, Equatable, Hashable, Sendable {
    
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    
    /// Unknown input source.
    public static let unknown = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_UNKNOWN))

    /// Keyboard input source.
    public static let keyboard = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_KEYBOARD))

    /// D-pad input source.
    public static let dpad = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_DPAD))

    /// Gamepad input source.
    public static let gamepad = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_GAMEPAD))

    /// Touchscreen input source.
    public static let touchscreen = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_TOUCHSCREEN))

    /// Mouse input source.
    public static let mouse = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_MOUSE))

    /// Stylus input source.
    public static let stylus = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_STYLUS))

    /// Bluetooth stylus input source.
    public static let bluetoothStylus = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_BLUETOOTH_STYLUS))

    /// Trackball input source.
    public static let trackball = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_TRACKBALL))

    /// Mouse relative input source.
    public static let mouseRelative = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_MOUSE_RELATIVE))

    /// Touchpad input source.
    public static let touchpad = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_TOUCHPAD))

    /// Touch navigation input source.
    public static let touchNavigation = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_TOUCH_NAVIGATION))

    /// Joystick input source.
    public static let joystick = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_JOYSTICK))

    /// HDMI input source.
    public static let hdmi = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_HDMI))

    /// Sensor input source.
    public static let sensor = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_SENSOR))

    /// Rotary encoder input source.
    public static let rotaryEncoder = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_ROTARY_ENCODER))

    /// Any input source.
    public static let any = EventSource(rawValue: Int32(bitPattern: AINPUT_SOURCE_ANY))
}

// MARK: - Key Event

public extension InputEvent {
    
    /// Get the key event action.
    ///
    /// Only valid for key events.
    var keyAction: KeyAction {
        KeyAction(AKeyEvent_getAction(pointer))
    }
    
    /// Get the key event flags.
    ///
    /// Only valid for key events.
    var keyFlags: Int32 {
        AKeyEvent_getFlags(pointer)
    }
    
    /// Get the key code of the key event.
    ///
    /// Only valid for key events.
    var keyCode: KeyCode {
        KeyCode(AKeyEvent_getKeyCode(pointer))
    }
    
    /// Get the hardware key id of this key event.
    ///
    /// Only valid for key events.
    var scanCode: Int32 {
        AKeyEvent_getScanCode(pointer)
    }
    
    /// Get the meta key state.
    ///
    /// Only valid for key events.
    var metaState: Int32 {
        AKeyEvent_getMetaState(pointer)
    }
    
    /// Get the repeat count of the key event.
    ///
    /// Only valid for key events.
    var repeatCount: Int32 {
        AKeyEvent_getRepeatCount(pointer)
    }
    
    /// Get the time of the most recent key down event, in the `java.lang.System.nanoTime()` time base.
    ///
    /// Only valid for key events.
    var downTime: Int64 {
        AKeyEvent_getDownTime(pointer)
    }
    
    /// Get the time this event occurred, in the `java.lang.System.nanoTime()` time base.
    ///
    /// Only valid for key events.
    var keyEventTime: Int64 {
        AKeyEvent_getEventTime(pointer)
    }
}

// MARK: - Key Action

public struct KeyAction: RawRepresentable, Equatable, Hashable, Sendable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    internal init(_ rawValue: Int32) {
        self.rawValue = Int(rawValue)
    }
    
    /// Key down action.
    public static let down = KeyAction(rawValue: AKEY_EVENT_ACTION_DOWN)
    
    /// Key up action.
    public static let up = KeyAction(rawValue: AKEY_EVENT_ACTION_UP)
    
    /// Multiple key action.
    public static let multiple = KeyAction(rawValue: AKEY_EVENT_ACTION_MULTIPLE)
}

// MARK: - Motion Event

public extension InputEvent {
    
    /// Get the motion event action.
    ///
    /// Only valid for motion events.
    var motionAction: MotionAction {
        MotionAction(AMotionEvent_getAction(pointer))
    }
    
    /// Get the motion event flags.
    ///
    /// Only valid for motion events.
    var motionFlags: Int32 {
        AMotionEvent_getFlags(pointer)
    }
    
    /// Get the combined motion event action code and pointer index.
    ///
    /// Only valid for motion events.
    var actionWithPointerIndex: Int32 {
        AMotionEvent_getAction(pointer)
    }
    
    /// Get the meta key state.
    ///
    /// Only valid for motion events.
    var motionMetaState: Int32 {
        AMotionEvent_getMetaState(pointer)
    }
    
    /// Get the button state of all buttons that are pressed.
    ///
    /// Only valid for motion events.
    var buttonState: Int32 {
        AMotionEvent_getButtonState(pointer)
    }
    
    /// Get the edge flags of the motion event.
    ///
    /// Only valid for motion events.
    var edgeFlags: Int32 {
        AMotionEvent_getEdgeFlags(pointer)
    }
    
    /// Get the time when the user originally pressed down to start a stream of position events.
    ///
    /// Only valid for motion events.
    var motionDownTime: Int64 {
        AMotionEvent_getDownTime(pointer)
    }
    
    /// Get the time when this specific event was generated.
    ///
    /// Only valid for motion events.
    var motionEventTime: Int64 {
        AMotionEvent_getEventTime(pointer)
    }
    
    /// Get the X coordinate offset.
    ///
    /// Only valid for motion events.
    var xOffset: Float {
        AMotionEvent_getXOffset(pointer)
    }
    
    /// Get the Y coordinate offset.
    ///
    /// Only valid for motion events.
    var yOffset: Float {
        AMotionEvent_getYOffset(pointer)
    }
    
    /// Get the precision of the X coordinates being reported.
    ///
    /// Only valid for motion events.
    var xPrecision: Float {
        AMotionEvent_getXPrecision(pointer)
    }
    
    /// Get the precision of the Y coordinates being reported.
    ///
    /// Only valid for motion events.
    var yPrecision: Float {
        AMotionEvent_getYPrecision(pointer)
    }
    
    /// Get the number of pointers of data contained in this event.
    ///
    /// Only valid for motion events.
    var pointerCount: Int {
        Int(AMotionEvent_getPointerCount(pointer))
    }
    
    /// Get the pointer identifier associated with a particular pointer data index in this event.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the identifier.
    /// - Returns: The pointer identifier.
    func getPointerId(at pointerIndex: Int) -> Int32 {
        AMotionEvent_getPointerId(pointer, pointerIndex)
    }
    
    /// Get the tool type of a pointer.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the tool type.
    /// - Returns: The tool type.
    func getToolType(at pointerIndex: Int) -> ToolType {
        ToolType(AMotionEvent_getToolType(pointer, pointerIndex))
    }
    
    /// Get the original raw X coordinate of this event.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the X coordinate.
    /// - Returns: The raw X coordinate.
    func getRawX(at pointerIndex: Int) -> Float {
        AMotionEvent_getRawX(pointer, pointerIndex)
    }
    
    /// Get the original raw Y coordinate of this event.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the Y coordinate.
    /// - Returns: The raw Y coordinate.
    func getRawY(at pointerIndex: Int) -> Float {
        AMotionEvent_getRawY(pointer, pointerIndex)
    }
    
    /// Get the current X coordinate of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the X coordinate.
    /// - Returns: The X coordinate.
    func getX(at pointerIndex: Int) -> Float {
        AMotionEvent_getX(pointer, pointerIndex)
    }
    
    /// Get the current Y coordinate of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the Y coordinate.
    /// - Returns: The Y coordinate.
    func getY(at pointerIndex: Int) -> Float {
        AMotionEvent_getY(pointer, pointerIndex)
    }
    
    /// Get the current pressure of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the pressure.
    /// - Returns: The pressure value.
    func getPressure(at pointerIndex: Int) -> Float {
        AMotionEvent_getPressure(pointer, pointerIndex)
    }
    
    /// Get the current size of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the size.
    /// - Returns: The size value.
    func getSize(at pointerIndex: Int) -> Float {
        AMotionEvent_getSize(pointer, pointerIndex)
    }
    
    /// Get the current touch major value of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the touch major.
    /// - Returns: The touch major value.
    func getTouchMajor(at pointerIndex: Int) -> Float {
        AMotionEvent_getTouchMajor(pointer, pointerIndex)
    }
    
    /// Get the current touch minor value of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the touch minor.
    /// - Returns: The touch minor value.
    func getTouchMinor(at pointerIndex: Int) -> Float {
        AMotionEvent_getTouchMinor(pointer, pointerIndex)
    }
    
    /// Get the current tool major value of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the tool major.
    /// - Returns: The tool major value.
    func getToolMajor(at pointerIndex: Int) -> Float {
        AMotionEvent_getToolMajor(pointer, pointerIndex)
    }
    
    /// Get the current tool minor value of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the tool minor.
    /// - Returns: The tool minor value.
    func getToolMinor(at pointerIndex: Int) -> Float {
        AMotionEvent_getToolMinor(pointer, pointerIndex)
    }
    
    /// Get the current orientation of this event for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameter pointerIndex: The index of the pointer for which to retrieve the orientation.
    /// - Returns: The orientation value.
    func getOrientation(at pointerIndex: Int) -> Float {
        AMotionEvent_getOrientation(pointer, pointerIndex)
    }
    
    /// Get the value of the request axis for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameters:
    ///   - axis: The axis identifier.
    ///   - pointerIndex: The index of the pointer for which to retrieve the axis value.
    /// - Returns: The axis value.
    func getAxisValue(_ axis: Int32, at pointerIndex: Int) -> Float {
        AMotionEvent_getAxisValue(pointer, axis, pointerIndex)
    }
    
    /// Get the number of historical points in this event.
    ///
    /// Only valid for motion events.
    var historySize: Int {
        Int(AMotionEvent_getHistorySize(pointer))
    }
    
    /// Get the historical X coordinate for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameters:
    ///   - pointerIndex: The index of the pointer.
    ///   - historyIndex: The index of the historical point.
    /// - Returns: The historical X coordinate.
    func getHistoricalX(at pointerIndex: Int, historyIndex: Int) -> Float {
        AMotionEvent_getHistoricalX(pointer, pointerIndex, historyIndex)
    }
    
    /// Get the historical Y coordinate for the given pointer index.
    ///
    /// Only valid for motion events.
    ///
    /// - Parameters:
    ///   - pointerIndex: The index of the pointer.
    ///   - historyIndex: The index of the historical point.
    /// - Returns: The historical Y coordinate.
    func getHistoricalY(at pointerIndex: Int, historyIndex: Int) -> Float {
        AMotionEvent_getHistoricalY(pointer, pointerIndex, historyIndex)
    }
}

// MARK: - Motion Action

public struct MotionAction: RawRepresentable, Equatable, Hashable, Sendable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    internal init(_ rawValue: Int32) {
        self.rawValue = Int(rawValue)
    }
    
    /// Motion action down.
    public static let down = MotionAction(rawValue: AMOTION_EVENT_ACTION_DOWN)
    
    /// Motion action up.
    public static let up = MotionAction(rawValue: AMOTION_EVENT_ACTION_UP)
    
    /// Motion action move.
    public static let move = MotionAction(rawValue: AMOTION_EVENT_ACTION_MOVE)
    
    /// Motion action cancel.
    public static let cancel = MotionAction(rawValue: AMOTION_EVENT_ACTION_CANCEL)
    
    /// Motion action outside.
    public static let outside = MotionAction(rawValue: AMOTION_EVENT_ACTION_OUTSIDE)
    
    /// Motion action pointer down.
    public static let pointerDown = MotionAction(rawValue: AMOTION_EVENT_ACTION_POINTER_DOWN)
    
    /// Motion action pointer up.
    public static let pointerUp = MotionAction(rawValue: AMOTION_EVENT_ACTION_POINTER_UP)
    
    /// Motion action hover move.
    public static let hoverMove = MotionAction(rawValue: AMOTION_EVENT_ACTION_HOVER_MOVE)
    
    /// Motion action scroll.
    public static let scroll = MotionAction(rawValue: AMOTION_EVENT_ACTION_SCROLL)
    
    /// Motion action hover enter.
    public static let hoverEnter = MotionAction(rawValue: AMOTION_EVENT_ACTION_HOVER_ENTER)
    
    /// Motion action hover exit.
    public static let hoverExit = MotionAction(rawValue: AMOTION_EVENT_ACTION_HOVER_EXIT)
    
    /// Motion action button press.
    public static let buttonPress = MotionAction(rawValue: AMOTION_EVENT_ACTION_BUTTON_PRESS)
    
    /// Motion action button release.
    public static let buttonRelease = MotionAction(rawValue: AMOTION_EVENT_ACTION_BUTTON_RELEASE)
}

// MARK: - Tool Type

public struct ToolType: RawRepresentable, Equatable, Hashable, Sendable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    internal init(_ rawValue: Int32) {
        self.rawValue = Int(rawValue)
    }
    
    /// Unknown tool type.
    public static let unknown = ToolType(rawValue: AMOTION_EVENT_TOOL_TYPE_UNKNOWN)
    
    /// Finger tool type.
    public static let finger = ToolType(rawValue: AMOTION_EVENT_TOOL_TYPE_FINGER)
    
    /// Stylus tool type.
    public static let stylus = ToolType(rawValue: AMOTION_EVENT_TOOL_TYPE_STYLUS)
    
    /// Mouse tool type.
    public static let mouse = ToolType(rawValue: AMOTION_EVENT_TOOL_TYPE_MOUSE)
    
    /// Eraser tool type.
    public static let eraser = ToolType(rawValue: AMOTION_EVENT_TOOL_TYPE_ERASER)
}
