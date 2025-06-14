// Auto-generated by Java-to-Swift wrapper generator.
import AndroidContent
import AndroidUtil
import JavaKit
import JavaRuntime

@JavaClass("android.graphics.drawable.NinePatchDrawable")
open class NinePatchDrawable: Drawable {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: NinePatch?, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Resources?, _ arg1: Bitmap?, _ arg2: [Int8], _ arg3: Rect?, _ arg4: String, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Bitmap?, _ arg1: [Int8], _ arg2: Rect?, _ arg3: String, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Resources?, _ arg1: NinePatch?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open override func canApplyTheme() -> Bool

  @JavaMethod
  open override func getChangingConfigurations() -> Int32

  @JavaMethod
  open override func getOpacity() -> Int32

  @JavaMethod
  open override func isStateful() -> Bool

  @JavaMethod
  open func setTargetDensity(_ arg0: Int32)

  @JavaMethod
  open func setTargetDensity(_ arg0: DisplayMetrics?)

  @JavaMethod
  open func setTargetDensity(_ arg0: Canvas?)

  @JavaMethod
  open func getPaint() -> Paint!

  @JavaMethod
  open override func draw(_ arg0: Canvas?)

  @JavaMethod
  open override func getAlpha() -> Int32

  @JavaMethod
  open override func hasFocusStateSpecified() -> Bool

  @JavaMethod
  open override func applyTheme(_ arg0: Resources.Theme?)

  @JavaMethod
  open override func setAlpha(_ arg0: Int32)

  @JavaMethod
  open override func setTintList(_ arg0: ColorStateList?)

  @JavaMethod
  open override func setTintBlendMode(_ arg0: BlendMode?)

  @JavaMethod
  open override func setColorFilter(_ arg0: ColorFilter?)

  @JavaMethod
  open override func onStateChange(_ arg0: [Int32]) -> Bool

  @JavaMethod
  open override func getConstantState() -> Drawable.ConstantState!

  @JavaMethod
  open override func mutate() -> Drawable!

  @JavaMethod
  open override func setDither(_ arg0: Bool)

  @JavaMethod
  open override func setFilterBitmap(_ arg0: Bool)

  @JavaMethod
  open override func isFilterBitmap() -> Bool

  @JavaMethod
  open override func setAutoMirrored(_ arg0: Bool)

  @JavaMethod
  open override func isAutoMirrored() -> Bool

  @JavaMethod
  open override func getTransparentRegion() -> Region!

  @JavaMethod
  open override func getIntrinsicWidth() -> Int32

  @JavaMethod
  open override func getIntrinsicHeight() -> Int32

  @JavaMethod
  open override func getPadding(_ arg0: Rect?) -> Bool

  @JavaMethod
  open override func getOpticalInsets() -> Insets!

  @JavaMethod
  open override func getOutline(_ arg0: Outline?)
}
