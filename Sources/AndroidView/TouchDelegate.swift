// Auto-generated by Java-to-Swift wrapper generator.
import AndroidGraphics
import JavaKit
import JavaRuntime

@JavaClass("android.view.TouchDelegate")
open class TouchDelegate: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Rect?, _ arg1: View?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func onTouchEvent(_ arg0: MotionEvent?) -> Bool

  @JavaMethod
  open func onTouchExplorationHoverEvent(_ arg0: MotionEvent?) -> Bool
}
extension JavaClass<TouchDelegate> {
  @JavaStaticField(isFinal: true)
  public var ABOVE: Int32

  @JavaStaticField(isFinal: true)
  public var BELOW: Int32

  @JavaStaticField(isFinal: true)
  public var TO_LEFT: Int32

  @JavaStaticField(isFinal: true)
  public var TO_RIGHT: Int32
}
