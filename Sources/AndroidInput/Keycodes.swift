//
//  Keycodes.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if os(Android)
import Android
import CAndroidNDK
#endif

/// Key code identifying a physical key on a keyboard or virtual key from an input device.
///
/// Key code constants from Android's `android/keycodes.h`.
///
/// [See Also](https://developer.android.com/ndk/reference/group/input#anonymous-enum-3)
public struct KeyCode: RawRepresentable, Equatable, Hashable, Sendable {

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    internal init(_ rawValue: Int32) {
        self.rawValue = Int(rawValue)
    }
}

public extension KeyCode {

    // MARK: Basic

    /// Unknown key code.
    static var unknown: KeyCode { KeyCode(rawValue: AKEYCODE_UNKNOWN) }

    /// Soft Left key.
    static var softLeft: KeyCode { KeyCode(rawValue: AKEYCODE_SOFT_LEFT) }

    /// Soft Right key.
    static var softRight: KeyCode { KeyCode(rawValue: AKEYCODE_SOFT_RIGHT) }

    /// Home key.
    static var home: KeyCode { KeyCode(rawValue: AKEYCODE_HOME) }

    /// Back key.
    static var back: KeyCode { KeyCode(rawValue: AKEYCODE_BACK) }

    /// Call key.
    static var call: KeyCode { KeyCode(rawValue: AKEYCODE_CALL) }

    /// End Call key.
    static var endCall: KeyCode { KeyCode(rawValue: AKEYCODE_ENDCALL) }

    // MARK: Number Row

    /// '0' key.
    static var digit0: KeyCode { KeyCode(rawValue: AKEYCODE_0) }

    /// '1' key.
    static var digit1: KeyCode { KeyCode(rawValue: AKEYCODE_1) }

    /// '2' key.
    static var digit2: KeyCode { KeyCode(rawValue: AKEYCODE_2) }

    /// '3' key.
    static var digit3: KeyCode { KeyCode(rawValue: AKEYCODE_3) }

    /// '4' key.
    static var digit4: KeyCode { KeyCode(rawValue: AKEYCODE_4) }

    /// '5' key.
    static var digit5: KeyCode { KeyCode(rawValue: AKEYCODE_5) }

    /// '6' key.
    static var digit6: KeyCode { KeyCode(rawValue: AKEYCODE_6) }

    /// '7' key.
    static var digit7: KeyCode { KeyCode(rawValue: AKEYCODE_7) }

    /// '8' key.
    static var digit8: KeyCode { KeyCode(rawValue: AKEYCODE_8) }

    /// '9' key.
    static var digit9: KeyCode { KeyCode(rawValue: AKEYCODE_9) }

    /// '*' key.
    static var star: KeyCode { KeyCode(rawValue: AKEYCODE_STAR) }

    /// '#' key.
    static var pound: KeyCode { KeyCode(rawValue: AKEYCODE_POUND) }

    // MARK: D-Pad

    /// Directional Pad Up key.
    static var dpadUp: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_UP) }

    /// Directional Pad Down key.
    static var dpadDown: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_DOWN) }

    /// Directional Pad Left key.
    static var dpadLeft: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_LEFT) }

    /// Directional Pad Right key.
    static var dpadRight: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_RIGHT) }

    /// Directional Pad Center key.
    static var dpadCenter: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_CENTER) }

    /// Directional Pad Up-Left key.
    static var dpadUpLeft: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_UP_LEFT) }

    /// Directional Pad Down-Left key.
    static var dpadDownLeft: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_DOWN_LEFT) }

    /// Directional Pad Up-Right key.
    static var dpadUpRight: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_UP_RIGHT) }

    /// Directional Pad Down-Right key.
    static var dpadDownRight: KeyCode { KeyCode(rawValue: AKEYCODE_DPAD_DOWN_RIGHT) }

    // MARK: Volume / Power

    /// Volume Up key.
    static var volumeUp: KeyCode { KeyCode(rawValue: AKEYCODE_VOLUME_UP) }

    /// Volume Down key.
    static var volumeDown: KeyCode { KeyCode(rawValue: AKEYCODE_VOLUME_DOWN) }

    /// Volume Mute key.
    static var volumeMute: KeyCode { KeyCode(rawValue: AKEYCODE_VOLUME_MUTE) }

    /// Power key.
    static var power: KeyCode { KeyCode(rawValue: AKEYCODE_POWER) }

    /// Camera key.
    static var camera: KeyCode { KeyCode(rawValue: AKEYCODE_CAMERA) }

    /// Clear key.
    static var clear: KeyCode { KeyCode(rawValue: AKEYCODE_CLEAR) }

    // MARK: Letters

    /// 'A' key.
    static var a: KeyCode { KeyCode(rawValue: AKEYCODE_A) }

    /// 'B' key.
    static var b: KeyCode { KeyCode(rawValue: AKEYCODE_B) }

    /// 'C' key.
    static var c: KeyCode { KeyCode(rawValue: AKEYCODE_C) }

    /// 'D' key.
    static var d: KeyCode { KeyCode(rawValue: AKEYCODE_D) }

    /// 'E' key.
    static var e: KeyCode { KeyCode(rawValue: AKEYCODE_E) }

    /// 'F' key.
    static var f: KeyCode { KeyCode(rawValue: AKEYCODE_F) }

    /// 'G' key.
    static var g: KeyCode { KeyCode(rawValue: AKEYCODE_G) }

    /// 'H' key.
    static var h: KeyCode { KeyCode(rawValue: AKEYCODE_H) }

    /// 'I' key.
    static var i: KeyCode { KeyCode(rawValue: AKEYCODE_I) }

    /// 'J' key.
    static var j: KeyCode { KeyCode(rawValue: AKEYCODE_J) }

    /// 'K' key.
    static var k: KeyCode { KeyCode(rawValue: AKEYCODE_K) }

    /// 'L' key.
    static var l: KeyCode { KeyCode(rawValue: AKEYCODE_L) }

    /// 'M' key.
    static var m: KeyCode { KeyCode(rawValue: AKEYCODE_M) }

    /// 'N' key.
    static var n: KeyCode { KeyCode(rawValue: AKEYCODE_N) }

    /// 'O' key.
    static var o: KeyCode { KeyCode(rawValue: AKEYCODE_O) }

    /// 'P' key.
    static var p: KeyCode { KeyCode(rawValue: AKEYCODE_P) }

    /// 'Q' key.
    static var q: KeyCode { KeyCode(rawValue: AKEYCODE_Q) }

    /// 'R' key.
    static var r: KeyCode { KeyCode(rawValue: AKEYCODE_R) }

    /// 'S' key.
    static var s: KeyCode { KeyCode(rawValue: AKEYCODE_S) }

    /// 'T' key.
    static var t: KeyCode { KeyCode(rawValue: AKEYCODE_T) }

    /// 'U' key.
    static var u: KeyCode { KeyCode(rawValue: AKEYCODE_U) }

    /// 'V' key.
    static var v: KeyCode { KeyCode(rawValue: AKEYCODE_V) }

    /// 'W' key.
    static var w: KeyCode { KeyCode(rawValue: AKEYCODE_W) }

    /// 'X' key.
    static var x: KeyCode { KeyCode(rawValue: AKEYCODE_X) }

    /// 'Y' key.
    static var y: KeyCode { KeyCode(rawValue: AKEYCODE_Y) }

    /// 'Z' key.
    static var z: KeyCode { KeyCode(rawValue: AKEYCODE_Z) }

    // MARK: Punctuation / Symbols

    /// ',' key.
    static var comma: KeyCode { KeyCode(rawValue: AKEYCODE_COMMA) }

    /// '.' key.
    static var period: KeyCode { KeyCode(rawValue: AKEYCODE_PERIOD) }

    /// Left Alt modifier key.
    static var altLeft: KeyCode { KeyCode(rawValue: AKEYCODE_ALT_LEFT) }

    /// Right Alt modifier key.
    static var altRight: KeyCode { KeyCode(rawValue: AKEYCODE_ALT_RIGHT) }

    /// Left Shift modifier key.
    static var shiftLeft: KeyCode { KeyCode(rawValue: AKEYCODE_SHIFT_LEFT) }

    /// Right Shift modifier key.
    static var shiftRight: KeyCode { KeyCode(rawValue: AKEYCODE_SHIFT_RIGHT) }

    /// Tab key.
    static var tab: KeyCode { KeyCode(rawValue: AKEYCODE_TAB) }

    /// Space key.
    static var space: KeyCode { KeyCode(rawValue: AKEYCODE_SPACE) }

    /// Symbol modifier key.
    static var sym: KeyCode { KeyCode(rawValue: AKEYCODE_SYM) }

    /// Explorer special function key.
    static var explorer: KeyCode { KeyCode(rawValue: AKEYCODE_EXPLORER) }

    /// Envelope special function key.
    static var envelope: KeyCode { KeyCode(rawValue: AKEYCODE_ENVELOPE) }

    /// Enter key.
    static var enter: KeyCode { KeyCode(rawValue: AKEYCODE_ENTER) }

    /// Backspace key (labeled "DEL" on Android).
    static var delete: KeyCode { KeyCode(rawValue: AKEYCODE_DEL) }

    /// '`' (backtick / grave accent) key.
    static var grave: KeyCode { KeyCode(rawValue: AKEYCODE_GRAVE) }

    /// '-' key.
    static var minus: KeyCode { KeyCode(rawValue: AKEYCODE_MINUS) }

    /// '=' key.
    static var equals: KeyCode { KeyCode(rawValue: AKEYCODE_EQUALS) }

    /// '[' key.
    static var leftBracket: KeyCode { KeyCode(rawValue: AKEYCODE_LEFT_BRACKET) }

    /// ']' key.
    static var rightBracket: KeyCode { KeyCode(rawValue: AKEYCODE_RIGHT_BRACKET) }

    /// '\' key.
    static var backslash: KeyCode { KeyCode(rawValue: AKEYCODE_BACKSLASH) }

    /// ';' key.
    static var semicolon: KeyCode { KeyCode(rawValue: AKEYCODE_SEMICOLON) }

    /// '\'' (apostrophe) key.
    static var apostrophe: KeyCode { KeyCode(rawValue: AKEYCODE_APOSTROPHE) }

    /// '/' key.
    static var slash: KeyCode { KeyCode(rawValue: AKEYCODE_SLASH) }

    /// '@' key.
    static var at: KeyCode { KeyCode(rawValue: AKEYCODE_AT) }

    /// Number modifier key.
    static var num: KeyCode { KeyCode(rawValue: AKEYCODE_NUM) }

    /// Headset Hook key.
    static var headsetHook: KeyCode { KeyCode(rawValue: AKEYCODE_HEADSETHOOK) }

    /// Camera Focus key.
    static var focus: KeyCode { KeyCode(rawValue: AKEYCODE_FOCUS) }

    /// '+' key.
    static var plus: KeyCode { KeyCode(rawValue: AKEYCODE_PLUS) }

    /// Menu key.
    static var menu: KeyCode { KeyCode(rawValue: AKEYCODE_MENU) }

    /// Notification key.
    static var notification: KeyCode { KeyCode(rawValue: AKEYCODE_NOTIFICATION) }

    /// Search key.
    static var search: KeyCode { KeyCode(rawValue: AKEYCODE_SEARCH) }

    // MARK: Media

    /// Play/Pause media key.
    static var mediaPlayPause: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_PLAY_PAUSE) }

    /// Stop media key.
    static var mediaStop: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_STOP) }

    /// Play media key.
    static var mediaPlay: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_PLAY) }

    /// Pause media key.
    static var mediaPause: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_PAUSE) }

    /// Next media key.
    static var mediaNext: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_NEXT) }

    /// Previous media key.
    static var mediaPrevious: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_PREVIOUS) }

    /// Rewind media key.
    static var mediaRewind: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_REWIND) }

    /// Fast Forward media key.
    static var mediaFastForward: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_FAST_FORWARD) }

    /// Close media key.
    static var mediaClose: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_CLOSE) }

    /// Eject media key.
    static var mediaEject: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_EJECT) }

    /// Record media key.
    static var mediaRecord: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_RECORD) }

    /// Audio Track media key.
    static var mediaAudioTrack: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_AUDIO_TRACK) }

    /// Media Top Menu key.
    static var mediaTopMenu: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_TOP_MENU) }

    /// Skip Forward media key.
    static var mediaSkipForward: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_SKIP_FORWARD) }

    /// Skip Backward media key.
    static var mediaSkipBackward: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_SKIP_BACKWARD) }

    /// Step Forward media key.
    static var mediaStepForward: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_STEP_FORWARD) }

    /// Step Backward media key.
    static var mediaStepBackward: KeyCode { KeyCode(rawValue: AKEYCODE_MEDIA_STEP_BACKWARD) }

    /// Mute key.
    static var mute: KeyCode { KeyCode(rawValue: AKEYCODE_MUTE) }

    // MARK: Navigation

    /// Page Up key.
    static var pageUp: KeyCode { KeyCode(rawValue: AKEYCODE_PAGE_UP) }

    /// Page Down key.
    static var pageDown: KeyCode { KeyCode(rawValue: AKEYCODE_PAGE_DOWN) }

    /// Picture Symbols modifier key.
    static var pictSymbols: KeyCode { KeyCode(rawValue: AKEYCODE_PICTSYMBOLS) }

    /// Switch Charset modifier key.
    static var switchCharset: KeyCode { KeyCode(rawValue: AKEYCODE_SWITCH_CHARSET) }

    // MARK: Extended Keyboard

    /// Escape key.
    static var escape: KeyCode { KeyCode(rawValue: AKEYCODE_ESCAPE) }

    /// Forward Delete key.
    static var forwardDelete: KeyCode { KeyCode(rawValue: AKEYCODE_FORWARD_DEL) }

    /// Left Control modifier key.
    static var controlLeft: KeyCode { KeyCode(rawValue: AKEYCODE_CTRL_LEFT) }

    /// Right Control modifier key.
    static var controlRight: KeyCode { KeyCode(rawValue: AKEYCODE_CTRL_RIGHT) }

    /// Caps Lock key.
    static var capsLock: KeyCode { KeyCode(rawValue: AKEYCODE_CAPS_LOCK) }

    /// Scroll Lock key.
    static var scrollLock: KeyCode { KeyCode(rawValue: AKEYCODE_SCROLL_LOCK) }

    /// Left Meta modifier key.
    static var metaLeft: KeyCode { KeyCode(rawValue: AKEYCODE_META_LEFT) }

    /// Right Meta modifier key.
    static var metaRight: KeyCode { KeyCode(rawValue: AKEYCODE_META_RIGHT) }

    /// Function modifier key.
    static var function: KeyCode { KeyCode(rawValue: AKEYCODE_FUNCTION) }

    /// System Request / Print Screen key.
    static var sysRq: KeyCode { KeyCode(rawValue: AKEYCODE_SYSRQ) }

    /// Break / Pause key.
    static var `break`: KeyCode { KeyCode(rawValue: AKEYCODE_BREAK) }

    /// Move to Beginning of Line key.
    static var moveHome: KeyCode { KeyCode(rawValue: AKEYCODE_MOVE_HOME) }

    /// Move to End of Line key.
    static var moveEnd: KeyCode { KeyCode(rawValue: AKEYCODE_MOVE_END) }

    /// Insert key.
    static var insert: KeyCode { KeyCode(rawValue: AKEYCODE_INSERT) }

    /// Forward key.
    static var forward: KeyCode { KeyCode(rawValue: AKEYCODE_FORWARD) }

    // MARK: Function Keys

    /// F1 key.
    static var f1: KeyCode { KeyCode(rawValue: AKEYCODE_F1) }

    /// F2 key.
    static var f2: KeyCode { KeyCode(rawValue: AKEYCODE_F2) }

    /// F3 key.
    static var f3: KeyCode { KeyCode(rawValue: AKEYCODE_F3) }

    /// F4 key.
    static var f4: KeyCode { KeyCode(rawValue: AKEYCODE_F4) }

    /// F5 key.
    static var f5: KeyCode { KeyCode(rawValue: AKEYCODE_F5) }

    /// F6 key.
    static var f6: KeyCode { KeyCode(rawValue: AKEYCODE_F6) }

    /// F7 key.
    static var f7: KeyCode { KeyCode(rawValue: AKEYCODE_F7) }

    /// F8 key.
    static var f8: KeyCode { KeyCode(rawValue: AKEYCODE_F8) }

    /// F9 key.
    static var f9: KeyCode { KeyCode(rawValue: AKEYCODE_F9) }

    /// F10 key.
    static var f10: KeyCode { KeyCode(rawValue: AKEYCODE_F10) }

    /// F11 key.
    static var f11: KeyCode { KeyCode(rawValue: AKEYCODE_F11) }

    /// F12 key.
    static var f12: KeyCode { KeyCode(rawValue: AKEYCODE_F12) }

    // MARK: Numpad

    /// Num Lock key.
    static var numLock: KeyCode { KeyCode(rawValue: AKEYCODE_NUM_LOCK) }

    /// Numpad '0' key.
    static var numpad0: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_0) }

    /// Numpad '1' key.
    static var numpad1: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_1) }

    /// Numpad '2' key.
    static var numpad2: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_2) }

    /// Numpad '3' key.
    static var numpad3: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_3) }

    /// Numpad '4' key.
    static var numpad4: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_4) }

    /// Numpad '5' key.
    static var numpad5: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_5) }

    /// Numpad '6' key.
    static var numpad6: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_6) }

    /// Numpad '7' key.
    static var numpad7: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_7) }

    /// Numpad '8' key.
    static var numpad8: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_8) }

    /// Numpad '9' key.
    static var numpad9: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_9) }

    /// Numpad '/' key.
    static var numpadDivide: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_DIVIDE) }

    /// Numpad '*' key.
    static var numpadMultiply: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_MULTIPLY) }

    /// Numpad '-' key.
    static var numpadSubtract: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_SUBTRACT) }

    /// Numpad '+' key.
    static var numpadAdd: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_ADD) }

    /// Numpad '.' key.
    static var numpadDot: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_DOT) }

    /// Numpad ',' key.
    static var numpadComma: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_COMMA) }

    /// Numpad Enter key.
    static var numpadEnter: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_ENTER) }

    /// Numpad '=' key.
    static var numpadEquals: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_EQUALS) }

    /// Numpad '(' key.
    static var numpadLeftParen: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_LEFT_PAREN) }

    /// Numpad ')' key.
    static var numpadRightParen: KeyCode { KeyCode(rawValue: AKEYCODE_NUMPAD_RIGHT_PAREN) }

    // MARK: Gamepad (Named)

    /// A button on a gamepad.
    static var buttonA: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_A) }

    /// B button on a gamepad.
    static var buttonB: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_B) }

    /// C button on a gamepad.
    static var buttonC: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_C) }

    /// X button on a gamepad.
    static var buttonX: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_X) }

    /// Y button on a gamepad.
    static var buttonY: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_Y) }

    /// Z button on a gamepad.
    static var buttonZ: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_Z) }

    /// L1 button on a gamepad.
    static var buttonL1: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_L1) }

    /// R1 button on a gamepad.
    static var buttonR1: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_R1) }

    /// L2 button on a gamepad.
    static var buttonL2: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_L2) }

    /// R2 button on a gamepad.
    static var buttonR2: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_R2) }

    /// Left thumbstick button on a gamepad.
    static var buttonThumbL: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_THUMBL) }

    /// Right thumbstick button on a gamepad.
    static var buttonThumbR: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_THUMBR) }

    /// Start button on a gamepad.
    static var buttonStart: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_START) }

    /// Select button on a gamepad.
    static var buttonSelect: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_SELECT) }

    /// Mode button on a gamepad.
    static var buttonMode: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_MODE) }

    // MARK: Gamepad (Generic 1-16)

    /// Generic gamepad button 1.
    static var button1: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_1) }

    /// Generic gamepad button 2.
    static var button2: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_2) }

    /// Generic gamepad button 3.
    static var button3: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_3) }

    /// Generic gamepad button 4.
    static var button4: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_4) }

    /// Generic gamepad button 5.
    static var button5: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_5) }

    /// Generic gamepad button 6.
    static var button6: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_6) }

    /// Generic gamepad button 7.
    static var button7: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_7) }

    /// Generic gamepad button 8.
    static var button8: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_8) }

    /// Generic gamepad button 9.
    static var button9: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_9) }

    /// Generic gamepad button 10.
    static var button10: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_10) }

    /// Generic gamepad button 11.
    static var button11: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_11) }

    /// Generic gamepad button 12.
    static var button12: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_12) }

    /// Generic gamepad button 13.
    static var button13: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_13) }

    /// Generic gamepad button 14.
    static var button14: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_14) }

    /// Generic gamepad button 15.
    static var button15: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_15) }

    /// Generic gamepad button 16.
    static var button16: KeyCode { KeyCode(rawValue: AKEYCODE_BUTTON_16) }

    // MARK: Language / Input Method

    /// Language Switch key.
    static var languageSwitch: KeyCode { KeyCode(rawValue: AKEYCODE_LANGUAGE_SWITCH) }

    /// Manner Mode key.
    static var mannerMode: KeyCode { KeyCode(rawValue: AKEYCODE_MANNER_MODE) }

    /// 3D Mode key.
    static var mode3D: KeyCode { KeyCode(rawValue: AKEYCODE_3D_MODE) }

    /// Contacts special function key.
    static var contacts: KeyCode { KeyCode(rawValue: AKEYCODE_CONTACTS) }

    /// Calendar special function key.
    static var calendar: KeyCode { KeyCode(rawValue: AKEYCODE_CALENDAR) }

    /// Music special function key.
    static var music: KeyCode { KeyCode(rawValue: AKEYCODE_MUSIC) }

    /// Calculator special function key.
    static var calculator: KeyCode { KeyCode(rawValue: AKEYCODE_CALCULATOR) }

    // MARK: Japanese Keyboard

    /// Zenkaku/Hankaku key (full-width / half-width toggle).
    static var zenkakuHankaku: KeyCode { KeyCode(rawValue: AKEYCODE_ZENKAKU_HANKAKU) }

    /// Eisu key (alphanumeric toggle).
    static var eisu: KeyCode { KeyCode(rawValue: AKEYCODE_EISU) }

    /// Muhenkan key (non-conversion).
    static var muhenkan: KeyCode { KeyCode(rawValue: AKEYCODE_MUHENKAN) }

    /// Henkan key (conversion).
    static var henkan: KeyCode { KeyCode(rawValue: AKEYCODE_HENKAN) }

    /// Katakana / Hiragana key.
    static var katakanaHiragana: KeyCode { KeyCode(rawValue: AKEYCODE_KATAKANA_HIRAGANA) }

    /// Yen key.
    static var yen: KeyCode { KeyCode(rawValue: AKEYCODE_YEN) }

    /// Ro key.
    static var ro: KeyCode { KeyCode(rawValue: AKEYCODE_RO) }

    /// Kana modifier key.
    static var kana: KeyCode { KeyCode(rawValue: AKEYCODE_KANA) }

    // MARK: System / Accessibility

    /// Assist key.
    static var assist: KeyCode { KeyCode(rawValue: AKEYCODE_ASSIST) }

    /// Brightness Down key.
    static var brightnessDown: KeyCode { KeyCode(rawValue: AKEYCODE_BRIGHTNESS_DOWN) }

    /// Brightness Up key.
    static var brightnessUp: KeyCode { KeyCode(rawValue: AKEYCODE_BRIGHTNESS_UP) }

    /// Sleep key.
    static var sleep: KeyCode { KeyCode(rawValue: AKEYCODE_SLEEP) }

    /// Wakeup key.
    static var wakeup: KeyCode { KeyCode(rawValue: AKEYCODE_WAKEUP) }

    /// Pairing key.
    static var pairing: KeyCode { KeyCode(rawValue: AKEYCODE_PAIRING) }

    /// App Switch key.
    static var appSwitch: KeyCode { KeyCode(rawValue: AKEYCODE_APP_SWITCH) }

    /// Voice Assist key.
    static var voiceAssist: KeyCode { KeyCode(rawValue: AKEYCODE_VOICE_ASSIST) }

    /// Help key.
    static var help: KeyCode { KeyCode(rawValue: AKEYCODE_HELP) }

    /// Navigate Previous key.
    static var navigatePrevious: KeyCode { KeyCode(rawValue: AKEYCODE_NAVIGATE_PREVIOUS) }

    /// Navigate Next key.
    static var navigateNext: KeyCode { KeyCode(rawValue: AKEYCODE_NAVIGATE_NEXT) }

    /// Navigate In key.
    static var navigateIn: KeyCode { KeyCode(rawValue: AKEYCODE_NAVIGATE_IN) }

    /// Navigate Out key.
    static var navigateOut: KeyCode { KeyCode(rawValue: AKEYCODE_NAVIGATE_OUT) }

    /// Soft Sleep key.
    static var softSleep: KeyCode { KeyCode(rawValue: AKEYCODE_SOFT_SLEEP) }

    /// Cut key.
    static var cut: KeyCode { KeyCode(rawValue: AKEYCODE_CUT) }

    /// Copy key.
    static var copy: KeyCode { KeyCode(rawValue: AKEYCODE_COPY) }

    /// Paste key.
    static var paste: KeyCode { KeyCode(rawValue: AKEYCODE_PASTE) }

    /// All Apps key.
    static var allApps: KeyCode { KeyCode(rawValue: AKEYCODE_ALL_APPS) }

    /// Refresh key.
    static var refresh: KeyCode { KeyCode(rawValue: AKEYCODE_REFRESH) }

    /// Thumbs Up key.
    static var thumbsUp: KeyCode { KeyCode(rawValue: AKEYCODE_THUMBS_UP) }

    /// Thumbs Down key.
    static var thumbsDown: KeyCode { KeyCode(rawValue: AKEYCODE_THUMBS_DOWN) }

    /// Profile Switch key.
    static var profileSwitch: KeyCode { KeyCode(rawValue: AKEYCODE_PROFILE_SWITCH) }

    /// Recent Apps key.
    static var recentApps: KeyCode { KeyCode(rawValue: AKEYCODE_RECENT_APPS) }
    
    // MARK: System Navigation Gestures

    /// System Navigation Up key.
    static var systemNavigationUp: KeyCode { KeyCode(rawValue: AKEYCODE_SYSTEM_NAVIGATION_UP) }

    /// System Navigation Down key.
    static var systemNavigationDown: KeyCode { KeyCode(rawValue: AKEYCODE_SYSTEM_NAVIGATION_DOWN) }

    /// System Navigation Left key.
    static var systemNavigationLeft: KeyCode { KeyCode(rawValue: AKEYCODE_SYSTEM_NAVIGATION_LEFT) }

    /// System Navigation Right key.
    static var systemNavigationRight: KeyCode { KeyCode(rawValue: AKEYCODE_SYSTEM_NAVIGATION_RIGHT) }

    // MARK: Wearable Stem Buttons

    /// Primary stem button on a wearable device.
    static var stemPrimary: KeyCode { KeyCode(rawValue: AKEYCODE_STEM_PRIMARY) }

    /// Stem button 1 on a wearable device.
    static var stem1: KeyCode { KeyCode(rawValue: AKEYCODE_STEM_1) }

    /// Stem button 2 on a wearable device.
    static var stem2: KeyCode { KeyCode(rawValue: AKEYCODE_STEM_2) }

    /// Stem button 3 on a wearable device.
    static var stem3: KeyCode { KeyCode(rawValue: AKEYCODE_STEM_3) }

    // MARK: TV

    /// Info key (TV remotes).
    static var info: KeyCode { KeyCode(rawValue: AKEYCODE_INFO) }

    /// Channel Up key.
    static var channelUp: KeyCode { KeyCode(rawValue: AKEYCODE_CHANNEL_UP) }

    /// Channel Down key.
    static var channelDown: KeyCode { KeyCode(rawValue: AKEYCODE_CHANNEL_DOWN) }

    /// Zoom In key.
    static var zoomIn: KeyCode { KeyCode(rawValue: AKEYCODE_ZOOM_IN) }

    /// Zoom Out key.
    static var zoomOut: KeyCode { KeyCode(rawValue: AKEYCODE_ZOOM_OUT) }

    /// TV key.
    static var tv: KeyCode { KeyCode(rawValue: AKEYCODE_TV) }

    /// Window key (picture-in-picture).
    static var window: KeyCode { KeyCode(rawValue: AKEYCODE_WINDOW) }

    /// Guide key.
    static var guide: KeyCode { KeyCode(rawValue: AKEYCODE_GUIDE) }

    /// DVR key.
    static var dvr: KeyCode { KeyCode(rawValue: AKEYCODE_DVR) }

    /// Bookmark key.
    static var bookmark: KeyCode { KeyCode(rawValue: AKEYCODE_BOOKMARK) }

    /// Toggle captions key.
    static var captions: KeyCode { KeyCode(rawValue: AKEYCODE_CAPTIONS) }

    /// Settings key.
    static var settings: KeyCode { KeyCode(rawValue: AKEYCODE_SETTINGS) }

    /// TV Power key.
    static var tvPower: KeyCode { KeyCode(rawValue: AKEYCODE_TV_POWER) }

    /// TV Input key.
    static var tvInput: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT) }

    /// Set-top-box Power key.
    static var stbPower: KeyCode { KeyCode(rawValue: AKEYCODE_STB_POWER) }

    /// Set-top-box Input key.
    static var stbInput: KeyCode { KeyCode(rawValue: AKEYCODE_STB_INPUT) }

    /// A/V Receiver Power key.
    static var avrPower: KeyCode { KeyCode(rawValue: AKEYCODE_AVR_POWER) }

    /// A/V Receiver Input key.
    static var avrInput: KeyCode { KeyCode(rawValue: AKEYCODE_AVR_INPUT) }

    /// Red programmable key.
    static var progRed: KeyCode { KeyCode(rawValue: AKEYCODE_PROG_RED) }

    /// Green programmable key.
    static var progGreen: KeyCode { KeyCode(rawValue: AKEYCODE_PROG_GREEN) }

    /// Yellow programmable key.
    static var progYellow: KeyCode { KeyCode(rawValue: AKEYCODE_PROG_YELLOW) }

    /// Blue programmable key.
    static var progBlue: KeyCode { KeyCode(rawValue: AKEYCODE_PROG_BLUE) }

    /// Last Channel key.
    static var lastChannel: KeyCode { KeyCode(rawValue: AKEYCODE_LAST_CHANNEL) }

    /// TV Data Service key.
    static var tvDataService: KeyCode { KeyCode(rawValue: AKEYCODE_TV_DATA_SERVICE) }

    /// TV Radio Service key.
    static var tvRadioService: KeyCode { KeyCode(rawValue: AKEYCODE_TV_RADIO_SERVICE) }

    /// Teletext key.
    static var tvTeletext: KeyCode { KeyCode(rawValue: AKEYCODE_TV_TELETEXT) }

    /// TV Number Entry key.
    static var tvNumberEntry: KeyCode { KeyCode(rawValue: AKEYCODE_TV_NUMBER_ENTRY) }

    /// TV Terrestrial Analog key.
    static var tvTerrestrialAnalog: KeyCode { KeyCode(rawValue: AKEYCODE_TV_TERRESTRIAL_ANALOG) }

    /// TV Terrestrial Digital key.
    static var tvTerrestrialDigital: KeyCode { KeyCode(rawValue: AKEYCODE_TV_TERRESTRIAL_DIGITAL) }

    /// TV Satellite key.
    static var tvSatellite: KeyCode { KeyCode(rawValue: AKEYCODE_TV_SATELLITE) }

    /// TV Satellite BS key.
    static var tvSatelliteBS: KeyCode { KeyCode(rawValue: AKEYCODE_TV_SATELLITE_BS) }

    /// TV Satellite CS key.
    static var tvSatelliteCS: KeyCode { KeyCode(rawValue: AKEYCODE_TV_SATELLITE_CS) }

    /// TV Satellite Service key.
    static var tvSatelliteService: KeyCode { KeyCode(rawValue: AKEYCODE_TV_SATELLITE_SERVICE) }

    /// TV Network key.
    static var tvNetwork: KeyCode { KeyCode(rawValue: AKEYCODE_TV_NETWORK) }

    /// TV Antenna/Cable key.
    static var tvAntennaCable: KeyCode { KeyCode(rawValue: AKEYCODE_TV_ANTENNA_CABLE) }

    /// TV HDMI Input 1 key.
    static var tvInputHDMI1: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_HDMI_1) }

    /// TV HDMI Input 2 key.
    static var tvInputHDMI2: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_HDMI_2) }

    /// TV HDMI Input 3 key.
    static var tvInputHDMI3: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_HDMI_3) }

    /// TV HDMI Input 4 key.
    static var tvInputHDMI4: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_HDMI_4) }

    /// TV Composite Input 1 key.
    static var tvInputComposite1: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_COMPOSITE_1) }

    /// TV Composite Input 2 key.
    static var tvInputComposite2: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_COMPOSITE_2) }

    /// TV Component Input 1 key.
    static var tvInputComponent1: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_COMPONENT_1) }

    /// TV Component Input 2 key.
    static var tvInputComponent2: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_COMPONENT_2) }

    /// TV VGA Input 1 key.
    static var tvInputVGA1: KeyCode { KeyCode(rawValue: AKEYCODE_TV_INPUT_VGA_1) }

    /// TV Audio Description key.
    static var tvAudioDescription: KeyCode { KeyCode(rawValue: AKEYCODE_TV_AUDIO_DESCRIPTION) }

    /// TV Audio Description Mix Up key.
    static var tvAudioDescriptionMixUp: KeyCode { KeyCode(rawValue: AKEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP) }

    /// TV Audio Description Mix Down key.
    static var tvAudioDescriptionMixDown: KeyCode { KeyCode(rawValue: AKEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN) }

    /// TV Zoom Mode key.
    static var tvZoomMode: KeyCode { KeyCode(rawValue: AKEYCODE_TV_ZOOM_MODE) }

    /// TV Contents Menu key.
    static var tvContentsMenu: KeyCode { KeyCode(rawValue: AKEYCODE_TV_CONTENTS_MENU) }

    /// TV Media Context Menu key.
    static var tvMediaContextMenu: KeyCode { KeyCode(rawValue: AKEYCODE_TV_MEDIA_CONTEXT_MENU) }

    /// TV Timer Programming key.
    static var tvTimerProgramming: KeyCode { KeyCode(rawValue: AKEYCODE_TV_TIMER_PROGRAMMING) }

    /// TV remote '11' button.
    static var key11: KeyCode { KeyCode(rawValue: AKEYCODE_11) }

    /// TV remote '12' button.
    static var key12: KeyCode { KeyCode(rawValue: AKEYCODE_12) }

    // MARK: Video / Featured / Demo App Shortcuts

    /// Video App 1 shortcut key.
    static var videoApp1: KeyCode { KeyCode(rawValue: AKEYCODE_VIDEO_APP_1) }

    /// Video App 2 shortcut key.
    static var videoApp2: KeyCode { KeyCode(rawValue: AKEYCODE_VIDEO_APP_2) }

    /// Video App 3 shortcut key.
    static var videoApp3: KeyCode { KeyCode(rawValue: AKEYCODE_VIDEO_APP_3) }

    /// Video App 4 shortcut key.
    static var videoApp4: KeyCode { KeyCode(rawValue: AKEYCODE_VIDEO_APP_4) }

    /// Video App 5 shortcut key.
    static var videoApp5: KeyCode { KeyCode(rawValue: AKEYCODE_VIDEO_APP_5) }

    /// Video App 6 shortcut key.
    static var videoApp6: KeyCode { KeyCode(rawValue: AKEYCODE_VIDEO_APP_6) }

    /// Video App 7 shortcut key.
    static var videoApp7: KeyCode { KeyCode(rawValue: AKEYCODE_VIDEO_APP_7) }

    /// Video App 8 shortcut key.
    static var videoApp8: KeyCode { KeyCode(rawValue: AKEYCODE_VIDEO_APP_8) }

    /// Featured App 1 shortcut key.
    static var featuredApp1: KeyCode { KeyCode(rawValue: AKEYCODE_FEATURED_APP_1) }

    /// Featured App 2 shortcut key.
    static var featuredApp2: KeyCode { KeyCode(rawValue: AKEYCODE_FEATURED_APP_2) }

    /// Featured App 3 shortcut key.
    static var featuredApp3: KeyCode { KeyCode(rawValue: AKEYCODE_FEATURED_APP_3) }

    /// Featured App 4 shortcut key.
    static var featuredApp4: KeyCode { KeyCode(rawValue: AKEYCODE_FEATURED_APP_4) }

    /// Demo App 1 shortcut key.
    static var demoApp1: KeyCode { KeyCode(rawValue: AKEYCODE_DEMO_APP_1) }

    /// Demo App 2 shortcut key.
    static var demoApp2: KeyCode { KeyCode(rawValue: AKEYCODE_DEMO_APP_2) }

    /// Demo App 3 shortcut key.
    static var demoApp3: KeyCode { KeyCode(rawValue: AKEYCODE_DEMO_APP_3) }

    /// Demo App 4 shortcut key.
    static var demoApp4: KeyCode { KeyCode(rawValue: AKEYCODE_DEMO_APP_4) }

    // MARK: Keyboard Backlight

    /// Keyboard Backlight Down key.
    static var keyboardBacklightDown: KeyCode { KeyCode(rawValue: AKEYCODE_KEYBOARD_BACKLIGHT_DOWN) }

    /// Keyboard Backlight Up key.
    static var keyboardBacklightUp: KeyCode { KeyCode(rawValue: AKEYCODE_KEYBOARD_BACKLIGHT_UP) }

    /// Keyboard Backlight Toggle key.
    static var keyboardBacklightToggle: KeyCode { KeyCode(rawValue: AKEYCODE_KEYBOARD_BACKLIGHT_TOGGLE) }

    // MARK: Stylus Buttons

    /// Primary stylus button.
    static var stylusButtonPrimary: KeyCode { KeyCode(rawValue: AKEYCODE_STYLUS_BUTTON_PRIMARY) }

    /// Secondary stylus button.
    static var stylusButtonSecondary: KeyCode { KeyCode(rawValue: AKEYCODE_STYLUS_BUTTON_SECONDARY) }

    /// Tertiary stylus button.
    static var stylusButtonTertiary: KeyCode { KeyCode(rawValue: AKEYCODE_STYLUS_BUTTON_TERTIARY) }

    /// Tail stylus button.
    static var stylusButtonTail: KeyCode { KeyCode(rawValue: AKEYCODE_STYLUS_BUTTON_TAIL) }

    // MARK: Macros

    /// Macro 1 key.
    static var macro1: KeyCode { KeyCode(rawValue: AKEYCODE_MACRO_1) }

    /// Macro 2 key.
    static var macro2: KeyCode { KeyCode(rawValue: AKEYCODE_MACRO_2) }

    /// Macro 3 key.
    static var macro3: KeyCode { KeyCode(rawValue: AKEYCODE_MACRO_3) }

    /// Macro 4 key.
    static var macro4: KeyCode { KeyCode(rawValue: AKEYCODE_MACRO_4) }
}
