//
//  Syscalls.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

#if !os(Android)

func stub() -> Never {
    fatalError("Not running on Android")
}

// MARK: - AInputQueue

func AInputQueue_attachLooper(
    _ queue: OpaquePointer,
    _ looper: OpaquePointer,
    _ ident: Int32,
    _ callback: (@convention(c) (Int32, Int32, UnsafeMutableRawPointer?) -> Int32)?,
    _ data: UnsafeMutableRawPointer?
) { stub() }

func AInputQueue_detachLooper(_ queue: OpaquePointer) { stub() }

func AInputQueue_hasEvents(_ queue: OpaquePointer) -> Int32 { stub() }

func AInputQueue_getEvent(
    _ queue: OpaquePointer,
    _ outEvent: UnsafeMutablePointer<OpaquePointer?>?
) -> Int32 { stub() }

func AInputQueue_preDispatchEvent(_ queue: OpaquePointer, _ event: OpaquePointer) -> Int32 { stub() }

func AInputQueue_finishEvent(_ queue: OpaquePointer, _ event: OpaquePointer, _ handled: Int32) { stub() }

// MARK: - AInputEvent

func AInputEvent_getType(_ event: OpaquePointer) -> Int32 { stub() }

func AInputEvent_getDeviceId(_ event: OpaquePointer) -> Int32 { stub() }

func AInputEvent_getSource(_ event: OpaquePointer) -> Int32 { stub() }

func AInputEvent_getDisplayId(_ event: OpaquePointer) -> Int32 { stub() }

// MARK: - AKeyEvent

func AKeyEvent_getAction(_ event: OpaquePointer) -> Int32 { stub() }

func AKeyEvent_getFlags(_ event: OpaquePointer) -> Int32 { stub() }

func AKeyEvent_getKeyCode(_ event: OpaquePointer) -> Int32 { stub() }

func AKeyEvent_getScanCode(_ event: OpaquePointer) -> Int32 { stub() }

func AKeyEvent_getMetaState(_ event: OpaquePointer) -> Int32 { stub() }

func AKeyEvent_getRepeatCount(_ event: OpaquePointer) -> Int32 { stub() }

func AKeyEvent_getDownTime(_ event: OpaquePointer) -> Int64 { stub() }

func AKeyEvent_getEventTime(_ event: OpaquePointer) -> Int64 { stub() }

// MARK: - AMotionEvent

func AMotionEvent_getAction(_ event: OpaquePointer) -> Int32 { stub() }

func AMotionEvent_getFlags(_ event: OpaquePointer) -> Int32 { stub() }

func AMotionEvent_getMetaState(_ event: OpaquePointer) -> Int32 { stub() }

func AMotionEvent_getButtonState(_ event: OpaquePointer) -> Int32 { stub() }

func AMotionEvent_getEdgeFlags(_ event: OpaquePointer) -> Int32 { stub() }

func AMotionEvent_getDownTime(_ event: OpaquePointer) -> Int64 { stub() }

func AMotionEvent_getEventTime(_ event: OpaquePointer) -> Int64 { stub() }

func AMotionEvent_getXOffset(_ event: OpaquePointer) -> Float { stub() }

func AMotionEvent_getYOffset(_ event: OpaquePointer) -> Float { stub() }

func AMotionEvent_getXPrecision(_ event: OpaquePointer) -> Float { stub() }

func AMotionEvent_getYPrecision(_ event: OpaquePointer) -> Float { stub() }

func AMotionEvent_getPointerCount(_ event: OpaquePointer) -> Int { stub() }

func AMotionEvent_getPointerId(_ event: OpaquePointer, _ pointerIndex: Int) -> Int32 { stub() }

func AMotionEvent_getToolType(_ event: OpaquePointer, _ pointerIndex: Int) -> Int32 { stub() }

func AMotionEvent_getRawX(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getRawY(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getX(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getY(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getPressure(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getSize(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getTouchMajor(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getTouchMinor(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getToolMajor(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getToolMinor(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getOrientation(_ event: OpaquePointer, _ pointerIndex: Int) -> Float { stub() }

func AMotionEvent_getAxisValue(
    _ event: OpaquePointer,
    _ axis: Int32,
    _ pointerIndex: Int
) -> Float { stub() }

func AMotionEvent_getHistorySize(_ event: OpaquePointer) -> Int { stub() }

func AMotionEvent_getHistoricalX(
    _ event: OpaquePointer,
    _ pointerIndex: Int,
    _ historyIndex: Int
) -> Float { stub() }

func AMotionEvent_getHistoricalY(
    _ event: OpaquePointer,
    _ pointerIndex: Int,
    _ historyIndex: Int
) -> Float { stub() }

// MARK: - AInputEvent Constants

let AINPUT_EVENT_TYPE_KEY: Int = 1
let AINPUT_EVENT_TYPE_MOTION: Int = 2
let AINPUT_EVENT_TYPE_FOCUS: Int = 3
let AINPUT_EVENT_TYPE_CAPTURE: Int = 4
let AINPUT_EVENT_TYPE_DRAG: Int = 5
let AINPUT_EVENT_TYPE_TOUCH_MODE: Int = 6

let AINPUT_SOURCE_UNKNOWN: UInt32 = 0
let AINPUT_SOURCE_KEYBOARD: UInt32 = 0x101
let AINPUT_SOURCE_DPAD: UInt32 = 0x201
let AINPUT_SOURCE_GAMEPAD: UInt32 = 0x401
let AINPUT_SOURCE_TOUCHSCREEN: UInt32 = 0x1002
let AINPUT_SOURCE_MOUSE: UInt32 = 0x2002
let AINPUT_SOURCE_STYLUS: UInt32 = 0x4002
let AINPUT_SOURCE_BLUETOOTH_STYLUS: UInt32 = 0x8002
let AINPUT_SOURCE_TRACKBALL: UInt32 = 0x10004
let AINPUT_SOURCE_MOUSE_RELATIVE: UInt32 = 0x20004
let AINPUT_SOURCE_TOUCHPAD: UInt32 = 0x100008
let AINPUT_SOURCE_TOUCH_NAVIGATION: UInt32 = 0x200000
let AINPUT_SOURCE_JOYSTICK: UInt32 = 0x1000010
let AINPUT_SOURCE_HDMI: UInt32 = 0x2000010
let AINPUT_SOURCE_SENSOR: UInt32 = 0x4000000
let AINPUT_SOURCE_ROTARY_ENCODER: UInt32 = 0x400000
let AINPUT_SOURCE_ANY: UInt32 = 0xFFFFFFFF

// MARK: - AKeyEvent Constants

let AKEY_EVENT_ACTION_DOWN: Int = 0
let AKEY_EVENT_ACTION_UP: Int = 1
let AKEY_EVENT_ACTION_MULTIPLE: Int = 2

// MARK: - AMotionEvent Constants

let AMOTION_EVENT_ACTION_DOWN: Int = 0
let AMOTION_EVENT_ACTION_UP: Int = 1
let AMOTION_EVENT_ACTION_MOVE: Int = 2
let AMOTION_EVENT_ACTION_CANCEL: Int = 3
let AMOTION_EVENT_ACTION_OUTSIDE: Int = 4
let AMOTION_EVENT_ACTION_POINTER_DOWN: Int = 5
let AMOTION_EVENT_ACTION_POINTER_UP: Int = 6
let AMOTION_EVENT_ACTION_HOVER_MOVE: Int = 7
let AMOTION_EVENT_ACTION_SCROLL: Int = 8
let AMOTION_EVENT_ACTION_HOVER_ENTER: Int = 9
let AMOTION_EVENT_ACTION_HOVER_EXIT: Int = 10
let AMOTION_EVENT_ACTION_BUTTON_PRESS: Int = 11
let AMOTION_EVENT_ACTION_BUTTON_RELEASE: Int = 12

let AMOTION_EVENT_TOOL_TYPE_UNKNOWN: Int = 0
let AMOTION_EVENT_TOOL_TYPE_FINGER: Int = 1
let AMOTION_EVENT_TOOL_TYPE_STYLUS: Int = 2
let AMOTION_EVENT_TOOL_TYPE_MOUSE: Int = 3
let AMOTION_EVENT_TOOL_TYPE_ERASER: Int = 4

// MARK: - AKEYCODE Constants

let AKEYCODE_UNKNOWN: Int = 0
let AKEYCODE_SOFT_LEFT: Int = 1
let AKEYCODE_SOFT_RIGHT: Int = 2
let AKEYCODE_HOME: Int = 3
let AKEYCODE_BACK: Int = 4
let AKEYCODE_CALL: Int = 5
let AKEYCODE_ENDCALL: Int = 6
let AKEYCODE_0: Int = 7
let AKEYCODE_1: Int = 8
let AKEYCODE_2: Int = 9
let AKEYCODE_3: Int = 10
let AKEYCODE_4: Int = 11
let AKEYCODE_5: Int = 12
let AKEYCODE_6: Int = 13
let AKEYCODE_7: Int = 14
let AKEYCODE_8: Int = 15
let AKEYCODE_9: Int = 16
let AKEYCODE_STAR: Int = 17
let AKEYCODE_POUND: Int = 18
let AKEYCODE_DPAD_UP: Int = 19
let AKEYCODE_DPAD_DOWN: Int = 20
let AKEYCODE_DPAD_LEFT: Int = 21
let AKEYCODE_DPAD_RIGHT: Int = 22
let AKEYCODE_DPAD_CENTER: Int = 23
let AKEYCODE_VOLUME_UP: Int = 24
let AKEYCODE_VOLUME_DOWN: Int = 25
let AKEYCODE_POWER: Int = 26
let AKEYCODE_CAMERA: Int = 27
let AKEYCODE_CLEAR: Int = 28
let AKEYCODE_A: Int = 29
let AKEYCODE_B: Int = 30
let AKEYCODE_C: Int = 31
let AKEYCODE_D: Int = 32
let AKEYCODE_E: Int = 33
let AKEYCODE_F: Int = 34
let AKEYCODE_G: Int = 35
let AKEYCODE_H: Int = 36
let AKEYCODE_I: Int = 37
let AKEYCODE_J: Int = 38
let AKEYCODE_K: Int = 39
let AKEYCODE_L: Int = 40
let AKEYCODE_M: Int = 41
let AKEYCODE_N: Int = 42
let AKEYCODE_O: Int = 43
let AKEYCODE_P: Int = 44
let AKEYCODE_Q: Int = 45
let AKEYCODE_R: Int = 46
let AKEYCODE_S: Int = 47
let AKEYCODE_T: Int = 48
let AKEYCODE_U: Int = 49
let AKEYCODE_V: Int = 50
let AKEYCODE_W: Int = 51
let AKEYCODE_X: Int = 52
let AKEYCODE_Y: Int = 53
let AKEYCODE_Z: Int = 54
let AKEYCODE_COMMA: Int = 55
let AKEYCODE_PERIOD: Int = 56
let AKEYCODE_ALT_LEFT: Int = 57
let AKEYCODE_ALT_RIGHT: Int = 58
let AKEYCODE_SHIFT_LEFT: Int = 59
let AKEYCODE_SHIFT_RIGHT: Int = 60
let AKEYCODE_TAB: Int = 61
let AKEYCODE_SPACE: Int = 62
let AKEYCODE_SYM: Int = 63
let AKEYCODE_EXPLORER: Int = 64
let AKEYCODE_ENVELOPE: Int = 65
let AKEYCODE_ENTER: Int = 66
let AKEYCODE_DEL: Int = 67
let AKEYCODE_GRAVE: Int = 68
let AKEYCODE_MINUS: Int = 69
let AKEYCODE_EQUALS: Int = 70
let AKEYCODE_LEFT_BRACKET: Int = 71
let AKEYCODE_RIGHT_BRACKET: Int = 72
let AKEYCODE_BACKSLASH: Int = 73
let AKEYCODE_SEMICOLON: Int = 74
let AKEYCODE_APOSTROPHE: Int = 75
let AKEYCODE_SLASH: Int = 76
let AKEYCODE_AT: Int = 77
let AKEYCODE_NUM: Int = 78
let AKEYCODE_HEADSETHOOK: Int = 79
let AKEYCODE_FOCUS: Int = 80
let AKEYCODE_PLUS: Int = 81
let AKEYCODE_MENU: Int = 82
let AKEYCODE_NOTIFICATION: Int = 83
let AKEYCODE_SEARCH: Int = 84
let AKEYCODE_MEDIA_PLAY_PAUSE: Int = 85
let AKEYCODE_MEDIA_STOP: Int = 86
let AKEYCODE_MEDIA_NEXT: Int = 87
let AKEYCODE_MEDIA_PREVIOUS: Int = 88
let AKEYCODE_MEDIA_REWIND: Int = 89
let AKEYCODE_MEDIA_FAST_FORWARD: Int = 90
let AKEYCODE_MUTE: Int = 91
let AKEYCODE_PAGE_UP: Int = 92
let AKEYCODE_PAGE_DOWN: Int = 93
let AKEYCODE_PICTSYMBOLS: Int = 94
let AKEYCODE_SWITCH_CHARSET: Int = 95
let AKEYCODE_BUTTON_A: Int = 96
let AKEYCODE_BUTTON_B: Int = 97
let AKEYCODE_BUTTON_C: Int = 98
let AKEYCODE_BUTTON_X: Int = 99
let AKEYCODE_BUTTON_Y: Int = 100
let AKEYCODE_BUTTON_Z: Int = 101
let AKEYCODE_BUTTON_L1: Int = 102
let AKEYCODE_BUTTON_R1: Int = 103
let AKEYCODE_BUTTON_L2: Int = 104
let AKEYCODE_BUTTON_R2: Int = 105
let AKEYCODE_BUTTON_THUMBL: Int = 106
let AKEYCODE_BUTTON_THUMBR: Int = 107
let AKEYCODE_BUTTON_START: Int = 108
let AKEYCODE_BUTTON_SELECT: Int = 109
let AKEYCODE_BUTTON_MODE: Int = 110
let AKEYCODE_ESCAPE: Int = 111
let AKEYCODE_FORWARD_DEL: Int = 112
let AKEYCODE_CTRL_LEFT: Int = 113
let AKEYCODE_CTRL_RIGHT: Int = 114
let AKEYCODE_CAPS_LOCK: Int = 115
let AKEYCODE_SCROLL_LOCK: Int = 116
let AKEYCODE_META_LEFT: Int = 117
let AKEYCODE_META_RIGHT: Int = 118
let AKEYCODE_FUNCTION: Int = 119
let AKEYCODE_SYSRQ: Int = 120
let AKEYCODE_BREAK: Int = 121
let AKEYCODE_MOVE_HOME: Int = 122
let AKEYCODE_MOVE_END: Int = 123
let AKEYCODE_INSERT: Int = 124
let AKEYCODE_FORWARD: Int = 125
let AKEYCODE_MEDIA_PLAY: Int = 126
let AKEYCODE_MEDIA_PAUSE: Int = 127
let AKEYCODE_MEDIA_CLOSE: Int = 128
let AKEYCODE_MEDIA_EJECT: Int = 129
let AKEYCODE_MEDIA_RECORD: Int = 130
let AKEYCODE_F1: Int = 131
let AKEYCODE_F2: Int = 132
let AKEYCODE_F3: Int = 133
let AKEYCODE_F4: Int = 134
let AKEYCODE_F5: Int = 135
let AKEYCODE_F6: Int = 136
let AKEYCODE_F7: Int = 137
let AKEYCODE_F8: Int = 138
let AKEYCODE_F9: Int = 139
let AKEYCODE_F10: Int = 140
let AKEYCODE_F11: Int = 141
let AKEYCODE_F12: Int = 142
let AKEYCODE_NUM_LOCK: Int = 143
let AKEYCODE_NUMPAD_0: Int = 144
let AKEYCODE_NUMPAD_1: Int = 145
let AKEYCODE_NUMPAD_2: Int = 146
let AKEYCODE_NUMPAD_3: Int = 147
let AKEYCODE_NUMPAD_4: Int = 148
let AKEYCODE_NUMPAD_5: Int = 149
let AKEYCODE_NUMPAD_6: Int = 150
let AKEYCODE_NUMPAD_7: Int = 151
let AKEYCODE_NUMPAD_8: Int = 152
let AKEYCODE_NUMPAD_9: Int = 153
let AKEYCODE_NUMPAD_DIVIDE: Int = 154
let AKEYCODE_NUMPAD_MULTIPLY: Int = 155
let AKEYCODE_NUMPAD_SUBTRACT: Int = 156
let AKEYCODE_NUMPAD_ADD: Int = 157
let AKEYCODE_NUMPAD_DOT: Int = 158
let AKEYCODE_NUMPAD_COMMA: Int = 159
let AKEYCODE_NUMPAD_ENTER: Int = 160
let AKEYCODE_NUMPAD_EQUALS: Int = 161
let AKEYCODE_NUMPAD_LEFT_PAREN: Int = 162
let AKEYCODE_NUMPAD_RIGHT_PAREN: Int = 163
let AKEYCODE_VOLUME_MUTE: Int = 164
let AKEYCODE_INFO: Int = 165
let AKEYCODE_CHANNEL_UP: Int = 166
let AKEYCODE_CHANNEL_DOWN: Int = 167
let AKEYCODE_ZOOM_IN: Int = 168
let AKEYCODE_ZOOM_OUT: Int = 169
let AKEYCODE_TV: Int = 170
let AKEYCODE_WINDOW: Int = 171
let AKEYCODE_GUIDE: Int = 172
let AKEYCODE_DVR: Int = 173
let AKEYCODE_BOOKMARK: Int = 174
let AKEYCODE_CAPTIONS: Int = 175
let AKEYCODE_SETTINGS: Int = 176
let AKEYCODE_TV_POWER: Int = 177
let AKEYCODE_TV_INPUT: Int = 178
let AKEYCODE_STB_POWER: Int = 179
let AKEYCODE_STB_INPUT: Int = 180
let AKEYCODE_AVR_POWER: Int = 181
let AKEYCODE_AVR_INPUT: Int = 182
let AKEYCODE_PROG_RED: Int = 183
let AKEYCODE_PROG_GREEN: Int = 184
let AKEYCODE_PROG_YELLOW: Int = 185
let AKEYCODE_PROG_BLUE: Int = 186
let AKEYCODE_APP_SWITCH: Int = 187
let AKEYCODE_BUTTON_1: Int = 188
let AKEYCODE_BUTTON_2: Int = 189
let AKEYCODE_BUTTON_3: Int = 190
let AKEYCODE_BUTTON_4: Int = 191
let AKEYCODE_BUTTON_5: Int = 192
let AKEYCODE_BUTTON_6: Int = 193
let AKEYCODE_BUTTON_7: Int = 194
let AKEYCODE_BUTTON_8: Int = 195
let AKEYCODE_BUTTON_9: Int = 196
let AKEYCODE_BUTTON_10: Int = 197
let AKEYCODE_BUTTON_11: Int = 198
let AKEYCODE_BUTTON_12: Int = 199
let AKEYCODE_BUTTON_13: Int = 200
let AKEYCODE_BUTTON_14: Int = 201
let AKEYCODE_BUTTON_15: Int = 202
let AKEYCODE_BUTTON_16: Int = 203
let AKEYCODE_LANGUAGE_SWITCH: Int = 204
let AKEYCODE_MANNER_MODE: Int = 205
let AKEYCODE_3D_MODE: Int = 206
let AKEYCODE_CONTACTS: Int = 207
let AKEYCODE_CALENDAR: Int = 208
let AKEYCODE_MUSIC: Int = 209
let AKEYCODE_CALCULATOR: Int = 210
let AKEYCODE_ZENKAKU_HANKAKU: Int = 211
let AKEYCODE_EISU: Int = 212
let AKEYCODE_MUHENKAN: Int = 213
let AKEYCODE_HENKAN: Int = 214
let AKEYCODE_KATAKANA_HIRAGANA: Int = 215
let AKEYCODE_YEN: Int = 216
let AKEYCODE_RO: Int = 217
let AKEYCODE_KANA: Int = 218
let AKEYCODE_ASSIST: Int = 219
let AKEYCODE_BRIGHTNESS_DOWN: Int = 220
let AKEYCODE_BRIGHTNESS_UP: Int = 221
let AKEYCODE_MEDIA_AUDIO_TRACK: Int = 222
let AKEYCODE_SLEEP: Int = 223
let AKEYCODE_WAKEUP: Int = 224
let AKEYCODE_PAIRING: Int = 225
let AKEYCODE_MEDIA_TOP_MENU: Int = 226
let AKEYCODE_11: Int = 227
let AKEYCODE_12: Int = 228
let AKEYCODE_LAST_CHANNEL: Int = 229
let AKEYCODE_TV_DATA_SERVICE: Int = 230
let AKEYCODE_VOICE_ASSIST: Int = 231
let AKEYCODE_TV_RADIO_SERVICE: Int = 232
let AKEYCODE_TV_TELETEXT: Int = 233
let AKEYCODE_TV_NUMBER_ENTRY: Int = 234
let AKEYCODE_TV_TERRESTRIAL_ANALOG: Int = 235
let AKEYCODE_TV_TERRESTRIAL_DIGITAL: Int = 236
let AKEYCODE_TV_SATELLITE: Int = 237
let AKEYCODE_TV_SATELLITE_BS: Int = 238
let AKEYCODE_TV_SATELLITE_CS: Int = 239
let AKEYCODE_TV_SATELLITE_SERVICE: Int = 240
let AKEYCODE_TV_NETWORK: Int = 241
let AKEYCODE_TV_ANTENNA_CABLE: Int = 242
let AKEYCODE_TV_INPUT_HDMI_1: Int = 243
let AKEYCODE_TV_INPUT_HDMI_2: Int = 244
let AKEYCODE_TV_INPUT_HDMI_3: Int = 245
let AKEYCODE_TV_INPUT_HDMI_4: Int = 246
let AKEYCODE_TV_INPUT_COMPOSITE_1: Int = 247
let AKEYCODE_TV_INPUT_COMPOSITE_2: Int = 248
let AKEYCODE_TV_INPUT_COMPONENT_1: Int = 249
let AKEYCODE_TV_INPUT_COMPONENT_2: Int = 250
let AKEYCODE_TV_INPUT_VGA_1: Int = 251
let AKEYCODE_TV_AUDIO_DESCRIPTION: Int = 252
let AKEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP: Int = 253
let AKEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN: Int = 254
let AKEYCODE_TV_ZOOM_MODE: Int = 255
let AKEYCODE_TV_CONTENTS_MENU: Int = 256
let AKEYCODE_TV_MEDIA_CONTEXT_MENU: Int = 257
let AKEYCODE_TV_TIMER_PROGRAMMING: Int = 258
let AKEYCODE_HELP: Int = 259
let AKEYCODE_NAVIGATE_PREVIOUS: Int = 260
let AKEYCODE_NAVIGATE_NEXT: Int = 261
let AKEYCODE_NAVIGATE_IN: Int = 262
let AKEYCODE_NAVIGATE_OUT: Int = 263
let AKEYCODE_STEM_PRIMARY: Int = 264
let AKEYCODE_STEM_1: Int = 265
let AKEYCODE_STEM_2: Int = 266
let AKEYCODE_STEM_3: Int = 267
let AKEYCODE_DPAD_UP_LEFT: Int = 268
let AKEYCODE_DPAD_DOWN_LEFT: Int = 269
let AKEYCODE_DPAD_UP_RIGHT: Int = 270
let AKEYCODE_DPAD_DOWN_RIGHT: Int = 271
let AKEYCODE_MEDIA_SKIP_FORWARD: Int = 272
let AKEYCODE_MEDIA_SKIP_BACKWARD: Int = 273
let AKEYCODE_MEDIA_STEP_FORWARD: Int = 274
let AKEYCODE_MEDIA_STEP_BACKWARD: Int = 275
let AKEYCODE_SOFT_SLEEP: Int = 276
let AKEYCODE_CUT: Int = 277
let AKEYCODE_COPY: Int = 278
let AKEYCODE_PASTE: Int = 279
let AKEYCODE_SYSTEM_NAVIGATION_UP: Int = 280
let AKEYCODE_SYSTEM_NAVIGATION_DOWN: Int = 281
let AKEYCODE_SYSTEM_NAVIGATION_LEFT: Int = 282
let AKEYCODE_SYSTEM_NAVIGATION_RIGHT: Int = 283
let AKEYCODE_ALL_APPS: Int = 284
let AKEYCODE_REFRESH: Int = 285
let AKEYCODE_THUMBS_UP: Int = 286
let AKEYCODE_THUMBS_DOWN: Int = 287
let AKEYCODE_PROFILE_SWITCH: Int = 288
let AKEYCODE_VIDEO_APP_1: Int = 289
let AKEYCODE_VIDEO_APP_2: Int = 290
let AKEYCODE_VIDEO_APP_3: Int = 291
let AKEYCODE_VIDEO_APP_4: Int = 292
let AKEYCODE_VIDEO_APP_5: Int = 293
let AKEYCODE_VIDEO_APP_6: Int = 294
let AKEYCODE_VIDEO_APP_7: Int = 295
let AKEYCODE_VIDEO_APP_8: Int = 296
let AKEYCODE_FEATURED_APP_1: Int = 297
let AKEYCODE_FEATURED_APP_2: Int = 298
let AKEYCODE_FEATURED_APP_3: Int = 299
let AKEYCODE_FEATURED_APP_4: Int = 300
let AKEYCODE_DEMO_APP_1: Int = 301
let AKEYCODE_DEMO_APP_2: Int = 302
let AKEYCODE_DEMO_APP_3: Int = 303
let AKEYCODE_DEMO_APP_4: Int = 304
let AKEYCODE_KEYBOARD_BACKLIGHT_DOWN: Int = 305
let AKEYCODE_KEYBOARD_BACKLIGHT_UP: Int = 306
let AKEYCODE_KEYBOARD_BACKLIGHT_TOGGLE: Int = 307
let AKEYCODE_STYLUS_BUTTON_PRIMARY: Int = 308
let AKEYCODE_STYLUS_BUTTON_SECONDARY: Int = 309
let AKEYCODE_STYLUS_BUTTON_TERTIARY: Int = 310
let AKEYCODE_STYLUS_BUTTON_TAIL: Int = 311
let AKEYCODE_RECENT_APPS: Int = 312
let AKEYCODE_MACRO_1: Int = 313
let AKEYCODE_MACRO_2: Int = 314
let AKEYCODE_MACRO_3: Int = 315
let AKEYCODE_MACRO_4: Int = 316
let AKEYCODE_EMOJI_PICKER: Int = 317
let AKEYCODE_SCREENSHOT: Int = 318

// MARK: - JNI Types

typealias JNIEnvironment = OpaquePointer
typealias jobject = OpaquePointer

// MARK: - Paddleboat

struct Paddleboat_Vibration_Data {
    var duration_ms: Int32
    var left_motor_intensity: Float
    var right_motor_intensity: Float
    init(duration_ms: Int32, left_motor_intensity: Float, right_motor_intensity: Float) {
        self.duration_ms = duration_ms
        self.left_motor_intensity = left_motor_intensity
        self.right_motor_intensity = right_motor_intensity
    }
}

func Paddleboat_init(_ env: JNIEnvironment, _ context: jobject) -> Int32 { stub() }
func Paddleboat_isInitialized() -> Bool { stub() }
func Paddleboat_destroy(_ env: JNIEnvironment) { stub() }
func Paddleboat_update(_ env: JNIEnvironment) { stub() }
func Paddleboat_setBackButtonConsumed(_ consume: Bool) { stub() }
func Paddleboat_getBackButtonConsumed() -> Bool { stub() }
func Paddleboat_getControllerStatus(_ index: Int32) -> Int32 { stub() }
func Paddleboat_getControllerName(_ index: Int32, _ bufferSize: Int32, _ buffer: UnsafeMutablePointer<CChar>) -> Int32 { stub() }
func Paddleboat_setControllerLight(_ index: Int32, _ type: Int32, _ data: UInt32, _ env: JNIEnvironment) -> Int32 { stub() }
func Paddleboat_setControllerVibrationData(_ index: Int32, _ data: UnsafeMutablePointer<Paddleboat_Vibration_Data>, _ env: JNIEnvironment) -> Int32 { stub() }
func Paddleboat_getIntegratedMotionSensorFlags() -> UInt32 { stub() }

#endif
