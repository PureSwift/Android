// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaUtil
import AndroidOS
import JavaKit
import JavaRuntime

@JavaClass("android.content.res.Configuration", implements: Parcelable.self, Comparable.self)
open class Configuration: JavaObject {
  @JavaField(isFinal: false)
  public var colorMode: Int32

  @JavaField(isFinal: false)
  public var densityDpi: Int32

  @JavaField(isFinal: false)
  public var fontScale: Float

  @JavaField(isFinal: false)
  public var fontWeightAdjustment: Int32

  @JavaField(isFinal: false)
  public var hardKeyboardHidden: Int32

  @JavaField(isFinal: false)
  public var keyboard: Int32

  @JavaField(isFinal: false)
  public var keyboardHidden: Int32

  @JavaField(isFinal: false)
  public var locale: Locale!

  @JavaField(isFinal: false)
  public var mcc: Int32

  @JavaField(isFinal: false)
  public var mnc: Int32

  @JavaField(isFinal: false)
  public var navigation: Int32

  @JavaField(isFinal: false)
  public var navigationHidden: Int32

  @JavaField(isFinal: false)
  public var orientation: Int32

  @JavaField(isFinal: false)
  public var screenHeightDp: Int32

  @JavaField(isFinal: false)
  public var screenLayout: Int32

  @JavaField(isFinal: false)
  public var screenWidthDp: Int32

  @JavaField(isFinal: false)
  public var smallestScreenWidthDp: Int32

  @JavaField(isFinal: false)
  public var touchscreen: Int32

  @JavaField(isFinal: false)
  public var uiMode: Int32

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Configuration?, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func describeContents() -> Int32

  @JavaMethod
  open func writeToParcel(_ arg0: Parcel?, _ arg1: Int32)

  @JavaMethod
  open func readFromParcel(_ arg0: Parcel?)

  @JavaMethod
  open func isLayoutSizeAtLeast(_ arg0: Int32) -> Bool

  @JavaMethod
  open func setTo(_ arg0: Configuration?)

  @JavaMethod
  open func setToDefaults()

  @JavaMethod
  open func updateFrom(_ arg0: Configuration?) -> Int32

  @JavaMethod
  open func isNightModeActive() -> Bool

  @JavaMethod
  open func getLocales() -> LocaleList!

  @JavaMethod
  open func setLocales(_ arg0: LocaleList?)

  @JavaMethod
  open func getLayoutDirection() -> Int32

  @JavaMethod
  open func setLayoutDirection(_ arg0: Locale?)

  @JavaMethod
  open func isScreenRound() -> Bool

  @JavaMethod
  open func isScreenWideColorGamut() -> Bool

  @JavaMethod
  open func isScreenHdr() -> Bool

  @JavaMethod
  open func equals(_ arg0: Configuration?) -> Bool

  @JavaMethod
  open override func equals(_ arg0: JavaObject?) -> Bool

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open override func hashCode() -> Int32

  @JavaMethod
  open func compareTo(_ arg0: JavaObject?) -> Int32

  @JavaMethod
  open func compareTo(_ arg0: Configuration?) -> Int32

  @JavaMethod
  open func diff(_ arg0: Configuration?) -> Int32

  @JavaMethod
  open func setLocale(_ arg0: Locale?)
}
extension JavaClass<Configuration> {
  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_HDR_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_HDR_NO: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_HDR_SHIFT: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_HDR_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_HDR_YES: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_WIDE_COLOR_GAMUT_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_WIDE_COLOR_GAMUT_NO: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_WIDE_COLOR_GAMUT_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var COLOR_MODE_WIDE_COLOR_GAMUT_YES: Int32

  @JavaStaticField(isFinal: true)
  public var CREATOR: Parcelable.Creator<Configuration>!

  @JavaStaticField(isFinal: true)
  public var DENSITY_DPI_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var FONT_WEIGHT_ADJUSTMENT_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var HARDKEYBOARDHIDDEN_NO: Int32

  @JavaStaticField(isFinal: true)
  public var HARDKEYBOARDHIDDEN_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var HARDKEYBOARDHIDDEN_YES: Int32

  @JavaStaticField(isFinal: true)
  public var KEYBOARDHIDDEN_NO: Int32

  @JavaStaticField(isFinal: true)
  public var KEYBOARDHIDDEN_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var KEYBOARDHIDDEN_YES: Int32

  @JavaStaticField(isFinal: true)
  public var KEYBOARD_12KEY: Int32

  @JavaStaticField(isFinal: true)
  public var KEYBOARD_NOKEYS: Int32

  @JavaStaticField(isFinal: true)
  public var KEYBOARD_QWERTY: Int32

  @JavaStaticField(isFinal: true)
  public var KEYBOARD_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var MNC_ZERO: Int32

  @JavaStaticField(isFinal: true)
  public var NAVIGATIONHIDDEN_NO: Int32

  @JavaStaticField(isFinal: true)
  public var NAVIGATIONHIDDEN_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var NAVIGATIONHIDDEN_YES: Int32

  @JavaStaticField(isFinal: true)
  public var NAVIGATION_DPAD: Int32

  @JavaStaticField(isFinal: true)
  public var NAVIGATION_NONAV: Int32

  @JavaStaticField(isFinal: true)
  public var NAVIGATION_TRACKBALL: Int32

  @JavaStaticField(isFinal: true)
  public var NAVIGATION_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var NAVIGATION_WHEEL: Int32

  @JavaStaticField(isFinal: true)
  public var ORIENTATION_LANDSCAPE: Int32

  @JavaStaticField(isFinal: true)
  public var ORIENTATION_PORTRAIT: Int32

  @JavaStaticField(isFinal: true)
  public var ORIENTATION_SQUARE: Int32

  @JavaStaticField(isFinal: true)
  public var ORIENTATION_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LAYOUTDIR_LTR: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LAYOUTDIR_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LAYOUTDIR_RTL: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LAYOUTDIR_SHIFT: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LAYOUTDIR_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LONG_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LONG_NO: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LONG_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_LONG_YES: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_ROUND_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_ROUND_NO: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_ROUND_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_ROUND_YES: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_SIZE_LARGE: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_SIZE_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_SIZE_NORMAL: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_SIZE_SMALL: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_SIZE_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_SIZE_XLARGE: Int32

  @JavaStaticField(isFinal: true)
  public var SCREENLAYOUT_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var SCREEN_HEIGHT_DP_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var SCREEN_WIDTH_DP_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var SMALLEST_SCREEN_WIDTH_DP_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var TOUCHSCREEN_FINGER: Int32

  @JavaStaticField(isFinal: true)
  public var TOUCHSCREEN_NOTOUCH: Int32

  @JavaStaticField(isFinal: true)
  public var TOUCHSCREEN_STYLUS: Int32

  @JavaStaticField(isFinal: true)
  public var TOUCHSCREEN_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_NIGHT_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_NIGHT_NO: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_NIGHT_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_NIGHT_YES: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_APPLIANCE: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_CAR: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_DESK: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_NORMAL: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_TELEVISION: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_UNDEFINED: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_VR_HEADSET: Int32

  @JavaStaticField(isFinal: true)
  public var UI_MODE_TYPE_WATCH: Int32

  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32

  @JavaStaticMethod
  public func needNewResources(_ arg0: Int32, _ arg1: Int32) -> Bool

  @JavaStaticMethod
  public func generateDelta(_ arg0: Configuration?, _ arg1: Configuration?) -> Configuration!
}
