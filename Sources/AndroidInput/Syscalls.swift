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

let AKEY_EVENT_ACTION_DOWN: Int32 = 0
let AKEY_EVENT_ACTION_UP: Int32 = 1
let AKEY_EVENT_ACTION_MULTIPLE: Int32 = 2

// MARK: - AMotionEvent Constants

let AMOTION_EVENT_ACTION_DOWN: Int32 = 0
let AMOTION_EVENT_ACTION_UP: Int32 = 1
let AMOTION_EVENT_ACTION_MOVE: Int32 = 2
let AMOTION_EVENT_ACTION_CANCEL: Int32 = 3
let AMOTION_EVENT_ACTION_OUTSIDE: Int32 = 4
let AMOTION_EVENT_ACTION_POINTER_DOWN: Int32 = 5
let AMOTION_EVENT_ACTION_POINTER_UP: Int32 = 6
let AMOTION_EVENT_ACTION_HOVER_MOVE: Int32 = 7
let AMOTION_EVENT_ACTION_SCROLL: Int32 = 8
let AMOTION_EVENT_ACTION_HOVER_ENTER: Int32 = 9
let AMOTION_EVENT_ACTION_HOVER_EXIT: Int32 = 10
let AMOTION_EVENT_ACTION_BUTTON_PRESS: Int32 = 11
let AMOTION_EVENT_ACTION_BUTTON_RELEASE: Int32 = 12

let AMOTION_EVENT_TOOL_TYPE_UNKNOWN: Int32 = 0
let AMOTION_EVENT_TOOL_TYPE_FINGER: Int32 = 1
let AMOTION_EVENT_TOOL_TYPE_STYLUS: Int32 = 2
let AMOTION_EVENT_TOOL_TYPE_MOUSE: Int32 = 3
let AMOTION_EVENT_TOOL_TYPE_ERASER: Int32 = 4

// MARK: - AKEYCODE Constants

let AKEYCODE_UNKNOWN: Int32 = 0
let AKEYCODE_SOFT_LEFT: Int32 = 1
let AKEYCODE_SOFT_RIGHT: Int32 = 2
let AKEYCODE_HOME: Int32 = 3
let AKEYCODE_BACK: Int32 = 4
let AKEYCODE_CALL: Int32 = 5
let AKEYCODE_ENDCALL: Int32 = 6
let AKEYCODE_0: Int32 = 7
let AKEYCODE_1: Int32 = 8
let AKEYCODE_2: Int32 = 9
let AKEYCODE_3: Int32 = 10
let AKEYCODE_4: Int32 = 11
let AKEYCODE_5: Int32 = 12
let AKEYCODE_6: Int32 = 13
let AKEYCODE_7: Int32 = 14
let AKEYCODE_8: Int32 = 15
let AKEYCODE_9: Int32 = 16
let AKEYCODE_STAR: Int32 = 17
let AKEYCODE_POUND: Int32 = 18
let AKEYCODE_DPAD_UP: Int32 = 19
let AKEYCODE_DPAD_DOWN: Int32 = 20
let AKEYCODE_DPAD_LEFT: Int32 = 21
let AKEYCODE_DPAD_RIGHT: Int32 = 22
let AKEYCODE_DPAD_CENTER: Int32 = 23
let AKEYCODE_VOLUME_UP: Int32 = 24
let AKEYCODE_VOLUME_DOWN: Int32 = 25
let AKEYCODE_POWER: Int32 = 26
let AKEYCODE_CAMERA: Int32 = 27
let AKEYCODE_CLEAR: Int32 = 28
let AKEYCODE_A: Int32 = 29
let AKEYCODE_B: Int32 = 30
let AKEYCODE_C: Int32 = 31
let AKEYCODE_D: Int32 = 32
let AKEYCODE_E: Int32 = 33
let AKEYCODE_F: Int32 = 34
let AKEYCODE_G: Int32 = 35
let AKEYCODE_H: Int32 = 36
let AKEYCODE_I: Int32 = 37
let AKEYCODE_J: Int32 = 38
let AKEYCODE_K: Int32 = 39
let AKEYCODE_L: Int32 = 40
let AKEYCODE_M: Int32 = 41
let AKEYCODE_N: Int32 = 42
let AKEYCODE_O: Int32 = 43
let AKEYCODE_P: Int32 = 44
let AKEYCODE_Q: Int32 = 45
let AKEYCODE_R: Int32 = 46
let AKEYCODE_S: Int32 = 47
let AKEYCODE_T: Int32 = 48
let AKEYCODE_U: Int32 = 49
let AKEYCODE_V: Int32 = 50
let AKEYCODE_W: Int32 = 51
let AKEYCODE_X: Int32 = 52
let AKEYCODE_Y: Int32 = 53
let AKEYCODE_Z: Int32 = 54
let AKEYCODE_COMMA: Int32 = 55
let AKEYCODE_PERIOD: Int32 = 56
let AKEYCODE_ALT_LEFT: Int32 = 57
let AKEYCODE_ALT_RIGHT: Int32 = 58
let AKEYCODE_SHIFT_LEFT: Int32 = 59
let AKEYCODE_SHIFT_RIGHT: Int32 = 60
let AKEYCODE_TAB: Int32 = 61
let AKEYCODE_SPACE: Int32 = 62
let AKEYCODE_SYM: Int32 = 63
let AKEYCODE_EXPLORER: Int32 = 64
let AKEYCODE_ENVELOPE: Int32 = 65
let AKEYCODE_ENTER: Int32 = 66
let AKEYCODE_DEL: Int32 = 67
let AKEYCODE_GRAVE: Int32 = 68
let AKEYCODE_MINUS: Int32 = 69
let AKEYCODE_EQUALS: Int32 = 70
let AKEYCODE_LEFT_BRACKET: Int32 = 71
let AKEYCODE_RIGHT_BRACKET: Int32 = 72
let AKEYCODE_BACKSLASH: Int32 = 73
let AKEYCODE_SEMICOLON: Int32 = 74
let AKEYCODE_APOSTROPHE: Int32 = 75
let AKEYCODE_SLASH: Int32 = 76
let AKEYCODE_AT: Int32 = 77
let AKEYCODE_NUM: Int32 = 78
let AKEYCODE_HEADSETHOOK: Int32 = 79
let AKEYCODE_FOCUS: Int32 = 80
let AKEYCODE_PLUS: Int32 = 81
let AKEYCODE_MENU: Int32 = 82
let AKEYCODE_NOTIFICATION: Int32 = 83
let AKEYCODE_SEARCH: Int32 = 84
let AKEYCODE_MEDIA_PLAY_PAUSE: Int32 = 85
let AKEYCODE_MEDIA_STOP: Int32 = 86
let AKEYCODE_MEDIA_NEXT: Int32 = 87
let AKEYCODE_MEDIA_PREVIOUS: Int32 = 88
let AKEYCODE_MEDIA_REWIND: Int32 = 89
let AKEYCODE_MEDIA_FAST_FORWARD: Int32 = 90
let AKEYCODE_MUTE: Int32 = 91
let AKEYCODE_PAGE_UP: Int32 = 92
let AKEYCODE_PAGE_DOWN: Int32 = 93
let AKEYCODE_PICTSYMBOLS: Int32 = 94
let AKEYCODE_SWITCH_CHARSET: Int32 = 95
let AKEYCODE_BUTTON_A: Int32 = 96
let AKEYCODE_BUTTON_B: Int32 = 97
let AKEYCODE_BUTTON_C: Int32 = 98
let AKEYCODE_BUTTON_X: Int32 = 99
let AKEYCODE_BUTTON_Y: Int32 = 100
let AKEYCODE_BUTTON_Z: Int32 = 101
let AKEYCODE_BUTTON_L1: Int32 = 102
let AKEYCODE_BUTTON_R1: Int32 = 103
let AKEYCODE_BUTTON_L2: Int32 = 104
let AKEYCODE_BUTTON_R2: Int32 = 105
let AKEYCODE_BUTTON_THUMBL: Int32 = 106
let AKEYCODE_BUTTON_THUMBR: Int32 = 107
let AKEYCODE_BUTTON_START: Int32 = 108
let AKEYCODE_BUTTON_SELECT: Int32 = 109
let AKEYCODE_BUTTON_MODE: Int32 = 110
let AKEYCODE_ESCAPE: Int32 = 111
let AKEYCODE_FORWARD_DEL: Int32 = 112
let AKEYCODE_CTRL_LEFT: Int32 = 113
let AKEYCODE_CTRL_RIGHT: Int32 = 114
let AKEYCODE_CAPS_LOCK: Int32 = 115
let AKEYCODE_SCROLL_LOCK: Int32 = 116
let AKEYCODE_META_LEFT: Int32 = 117
let AKEYCODE_META_RIGHT: Int32 = 118
let AKEYCODE_FUNCTION: Int32 = 119
let AKEYCODE_SYSRQ: Int32 = 120
let AKEYCODE_BREAK: Int32 = 121
let AKEYCODE_MOVE_HOME: Int32 = 122
let AKEYCODE_MOVE_END: Int32 = 123
let AKEYCODE_INSERT: Int32 = 124
let AKEYCODE_FORWARD: Int32 = 125
let AKEYCODE_MEDIA_PLAY: Int32 = 126
let AKEYCODE_MEDIA_PAUSE: Int32 = 127
let AKEYCODE_MEDIA_CLOSE: Int32 = 128
let AKEYCODE_MEDIA_EJECT: Int32 = 129
let AKEYCODE_MEDIA_RECORD: Int32 = 130
let AKEYCODE_F1: Int32 = 131
let AKEYCODE_F2: Int32 = 132
let AKEYCODE_F3: Int32 = 133
let AKEYCODE_F4: Int32 = 134
let AKEYCODE_F5: Int32 = 135
let AKEYCODE_F6: Int32 = 136
let AKEYCODE_F7: Int32 = 137
let AKEYCODE_F8: Int32 = 138
let AKEYCODE_F9: Int32 = 139
let AKEYCODE_F10: Int32 = 140
let AKEYCODE_F11: Int32 = 141
let AKEYCODE_F12: Int32 = 142
let AKEYCODE_NUM_LOCK: Int32 = 143
let AKEYCODE_NUMPAD_0: Int32 = 144
let AKEYCODE_NUMPAD_1: Int32 = 145
let AKEYCODE_NUMPAD_2: Int32 = 146
let AKEYCODE_NUMPAD_3: Int32 = 147
let AKEYCODE_NUMPAD_4: Int32 = 148
let AKEYCODE_NUMPAD_5: Int32 = 149
let AKEYCODE_NUMPAD_6: Int32 = 150
let AKEYCODE_NUMPAD_7: Int32 = 151
let AKEYCODE_NUMPAD_8: Int32 = 152
let AKEYCODE_NUMPAD_9: Int32 = 153
let AKEYCODE_NUMPAD_DIVIDE: Int32 = 154
let AKEYCODE_NUMPAD_MULTIPLY: Int32 = 155
let AKEYCODE_NUMPAD_SUBTRACT: Int32 = 156
let AKEYCODE_NUMPAD_ADD: Int32 = 157
let AKEYCODE_NUMPAD_DOT: Int32 = 158
let AKEYCODE_NUMPAD_COMMA: Int32 = 159
let AKEYCODE_NUMPAD_ENTER: Int32 = 160
let AKEYCODE_NUMPAD_EQUALS: Int32 = 161
let AKEYCODE_NUMPAD_LEFT_PAREN: Int32 = 162
let AKEYCODE_NUMPAD_RIGHT_PAREN: Int32 = 163
let AKEYCODE_VOLUME_MUTE: Int32 = 164
let AKEYCODE_INFO: Int32 = 165
let AKEYCODE_CHANNEL_UP: Int32 = 166
let AKEYCODE_CHANNEL_DOWN: Int32 = 167
let AKEYCODE_ZOOM_IN: Int32 = 168
let AKEYCODE_ZOOM_OUT: Int32 = 169
let AKEYCODE_TV: Int32 = 170
let AKEYCODE_WINDOW: Int32 = 171
let AKEYCODE_GUIDE: Int32 = 172
let AKEYCODE_DVR: Int32 = 173
let AKEYCODE_BOOKMARK: Int32 = 174
let AKEYCODE_CAPTIONS: Int32 = 175
let AKEYCODE_SETTINGS: Int32 = 176
let AKEYCODE_TV_POWER: Int32 = 177
let AKEYCODE_TV_INPUT: Int32 = 178
let AKEYCODE_STB_POWER: Int32 = 179
let AKEYCODE_STB_INPUT: Int32 = 180
let AKEYCODE_AVR_POWER: Int32 = 181
let AKEYCODE_AVR_INPUT: Int32 = 182
let AKEYCODE_PROG_RED: Int32 = 183
let AKEYCODE_PROG_GREEN: Int32 = 184
let AKEYCODE_PROG_YELLOW: Int32 = 185
let AKEYCODE_PROG_BLUE: Int32 = 186
let AKEYCODE_APP_SWITCH: Int32 = 187
let AKEYCODE_BUTTON_1: Int32 = 188
let AKEYCODE_BUTTON_2: Int32 = 189
let AKEYCODE_BUTTON_3: Int32 = 190
let AKEYCODE_BUTTON_4: Int32 = 191
let AKEYCODE_BUTTON_5: Int32 = 192
let AKEYCODE_BUTTON_6: Int32 = 193
let AKEYCODE_BUTTON_7: Int32 = 194
let AKEYCODE_BUTTON_8: Int32 = 195
let AKEYCODE_BUTTON_9: Int32 = 196
let AKEYCODE_BUTTON_10: Int32 = 197
let AKEYCODE_BUTTON_11: Int32 = 198
let AKEYCODE_BUTTON_12: Int32 = 199
let AKEYCODE_BUTTON_13: Int32 = 200
let AKEYCODE_BUTTON_14: Int32 = 201
let AKEYCODE_BUTTON_15: Int32 = 202
let AKEYCODE_BUTTON_16: Int32 = 203
let AKEYCODE_LANGUAGE_SWITCH: Int32 = 204
let AKEYCODE_MANNER_MODE: Int32 = 205
let AKEYCODE_3D_MODE: Int32 = 206
let AKEYCODE_CONTACTS: Int32 = 207
let AKEYCODE_CALENDAR: Int32 = 208
let AKEYCODE_MUSIC: Int32 = 209
let AKEYCODE_CALCULATOR: Int32 = 210
let AKEYCODE_ZENKAKU_HANKAKU: Int32 = 211
let AKEYCODE_EISU: Int32 = 212
let AKEYCODE_MUHENKAN: Int32 = 213
let AKEYCODE_HENKAN: Int32 = 214
let AKEYCODE_KATAKANA_HIRAGANA: Int32 = 215
let AKEYCODE_YEN: Int32 = 216
let AKEYCODE_RO: Int32 = 217
let AKEYCODE_KANA: Int32 = 218
let AKEYCODE_ASSIST: Int32 = 219
let AKEYCODE_BRIGHTNESS_DOWN: Int32 = 220
let AKEYCODE_BRIGHTNESS_UP: Int32 = 221
let AKEYCODE_MEDIA_AUDIO_TRACK: Int32 = 222
let AKEYCODE_SLEEP: Int32 = 223
let AKEYCODE_WAKEUP: Int32 = 224
let AKEYCODE_PAIRING: Int32 = 225
let AKEYCODE_MEDIA_TOP_MENU: Int32 = 226
let AKEYCODE_11: Int32 = 227
let AKEYCODE_12: Int32 = 228
let AKEYCODE_LAST_CHANNEL: Int32 = 229
let AKEYCODE_TV_DATA_SERVICE: Int32 = 230
let AKEYCODE_VOICE_ASSIST: Int32 = 231
let AKEYCODE_TV_RADIO_SERVICE: Int32 = 232
let AKEYCODE_TV_TELETEXT: Int32 = 233
let AKEYCODE_TV_NUMBER_ENTRY: Int32 = 234
let AKEYCODE_TV_TERRESTRIAL_ANALOG: Int32 = 235
let AKEYCODE_TV_TERRESTRIAL_DIGITAL: Int32 = 236
let AKEYCODE_TV_SATELLITE: Int32 = 237
let AKEYCODE_TV_SATELLITE_BS: Int32 = 238
let AKEYCODE_TV_SATELLITE_CS: Int32 = 239
let AKEYCODE_TV_SATELLITE_SERVICE: Int32 = 240
let AKEYCODE_TV_NETWORK: Int32 = 241
let AKEYCODE_TV_ANTENNA_CABLE: Int32 = 242
let AKEYCODE_TV_INPUT_HDMI_1: Int32 = 243
let AKEYCODE_TV_INPUT_HDMI_2: Int32 = 244
let AKEYCODE_TV_INPUT_HDMI_3: Int32 = 245
let AKEYCODE_TV_INPUT_HDMI_4: Int32 = 246
let AKEYCODE_TV_INPUT_COMPOSITE_1: Int32 = 247
let AKEYCODE_TV_INPUT_COMPOSITE_2: Int32 = 248
let AKEYCODE_TV_INPUT_COMPONENT_1: Int32 = 249
let AKEYCODE_TV_INPUT_COMPONENT_2: Int32 = 250
let AKEYCODE_TV_INPUT_VGA_1: Int32 = 251
let AKEYCODE_TV_AUDIO_DESCRIPTION: Int32 = 252
let AKEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP: Int32 = 253
let AKEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN: Int32 = 254
let AKEYCODE_TV_ZOOM_MODE: Int32 = 255
let AKEYCODE_TV_CONTENTS_MENU: Int32 = 256
let AKEYCODE_TV_MEDIA_CONTEXT_MENU: Int32 = 257
let AKEYCODE_TV_TIMER_PROGRAMMING: Int32 = 258
let AKEYCODE_HELP: Int32 = 259
let AKEYCODE_NAVIGATE_PREVIOUS: Int32 = 260
let AKEYCODE_NAVIGATE_NEXT: Int32 = 261
let AKEYCODE_NAVIGATE_IN: Int32 = 262
let AKEYCODE_NAVIGATE_OUT: Int32 = 263
let AKEYCODE_STEM_PRIMARY: Int32 = 264
let AKEYCODE_STEM_1: Int32 = 265
let AKEYCODE_STEM_2: Int32 = 266
let AKEYCODE_STEM_3: Int32 = 267
let AKEYCODE_DPAD_UP_LEFT: Int32 = 268
let AKEYCODE_DPAD_DOWN_LEFT: Int32 = 269
let AKEYCODE_DPAD_UP_RIGHT: Int32 = 270
let AKEYCODE_DPAD_DOWN_RIGHT: Int32 = 271
let AKEYCODE_MEDIA_SKIP_FORWARD: Int32 = 272
let AKEYCODE_MEDIA_SKIP_BACKWARD: Int32 = 273
let AKEYCODE_MEDIA_STEP_FORWARD: Int32 = 274
let AKEYCODE_MEDIA_STEP_BACKWARD: Int32 = 275
let AKEYCODE_SOFT_SLEEP: Int32 = 276
let AKEYCODE_CUT: Int32 = 277
let AKEYCODE_COPY: Int32 = 278
let AKEYCODE_PASTE: Int32 = 279
let AKEYCODE_SYSTEM_NAVIGATION_UP: Int32 = 280
let AKEYCODE_SYSTEM_NAVIGATION_DOWN: Int32 = 281
let AKEYCODE_SYSTEM_NAVIGATION_LEFT: Int32 = 282
let AKEYCODE_SYSTEM_NAVIGATION_RIGHT: Int32 = 283
let AKEYCODE_ALL_APPS: Int32 = 284
let AKEYCODE_REFRESH: Int32 = 285
let AKEYCODE_THUMBS_UP: Int32 = 286
let AKEYCODE_THUMBS_DOWN: Int32 = 287
let AKEYCODE_PROFILE_SWITCH: Int32 = 288
let AKEYCODE_VIDEO_APP_1: Int32 = 289
let AKEYCODE_VIDEO_APP_2: Int32 = 290
let AKEYCODE_VIDEO_APP_3: Int32 = 291
let AKEYCODE_VIDEO_APP_4: Int32 = 292
let AKEYCODE_VIDEO_APP_5: Int32 = 293
let AKEYCODE_VIDEO_APP_6: Int32 = 294
let AKEYCODE_VIDEO_APP_7: Int32 = 295
let AKEYCODE_VIDEO_APP_8: Int32 = 296
let AKEYCODE_FEATURED_APP_1: Int32 = 297
let AKEYCODE_FEATURED_APP_2: Int32 = 298
let AKEYCODE_FEATURED_APP_3: Int32 = 299
let AKEYCODE_FEATURED_APP_4: Int32 = 300
let AKEYCODE_DEMO_APP_1: Int32 = 301
let AKEYCODE_DEMO_APP_2: Int32 = 302
let AKEYCODE_DEMO_APP_3: Int32 = 303
let AKEYCODE_DEMO_APP_4: Int32 = 304
let AKEYCODE_KEYBOARD_BACKLIGHT_DOWN: Int32 = 305
let AKEYCODE_KEYBOARD_BACKLIGHT_UP: Int32 = 306
let AKEYCODE_KEYBOARD_BACKLIGHT_TOGGLE: Int32 = 307
let AKEYCODE_STYLUS_BUTTON_PRIMARY: Int32 = 308
let AKEYCODE_STYLUS_BUTTON_SECONDARY: Int32 = 309
let AKEYCODE_STYLUS_BUTTON_TERTIARY: Int32 = 310
let AKEYCODE_STYLUS_BUTTON_TAIL: Int32 = 311
let AKEYCODE_RECENT_APPS: Int32 = 312
let AKEYCODE_MACRO_1: Int32 = 313
let AKEYCODE_MACRO_2: Int32 = 314
let AKEYCODE_MACRO_3: Int32 = 315
let AKEYCODE_MACRO_4: Int32 = 316
let AKEYCODE_EMOJI_PICKER: Int32 = 317
let AKEYCODE_SCREENSHOT: Int32 = 318

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
