// Auto-generated by Java-to-Swift wrapper generator.
import AndroidView
import JavaKit
import JavaRuntime

@JavaClass("com.google.android.material.appbar.ViewOffsetHelper")
open class ViewOffsetHelper: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: View?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func isHorizontalOffsetEnabled() -> Bool

  @JavaMethod
  open func setHorizontalOffsetEnabled(_ arg0: Bool)

  @JavaMethod
  open func isVerticalOffsetEnabled() -> Bool

  @JavaMethod
  open func setVerticalOffsetEnabled(_ arg0: Bool)

  @JavaMethod
  open func getLeftAndRightOffset() -> Int32

  @JavaMethod
  open func getTopAndBottomOffset() -> Int32

  @JavaMethod
  open func setLeftAndRightOffset(_ arg0: Int32) -> Bool

  @JavaMethod
  open func setTopAndBottomOffset(_ arg0: Int32) -> Bool

  @JavaMethod
  open func getLayoutTop() -> Int32

  @JavaMethod
  open func getLayoutLeft() -> Int32
}
