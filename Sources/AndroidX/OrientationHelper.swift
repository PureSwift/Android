// Auto-generated by Java-to-Swift wrapper generator.
import AndroidView
import JavaKit
import JavaRuntime

@JavaClass("androidx.recyclerview.widget.OrientationHelper")
open class OrientationHelper: JavaObject {
  @JavaMethod
  open func getModeInOther() -> Int32

  @JavaMethod
  open func getDecoratedStart(_ arg0: View?) -> Int32

  @JavaMethod
  open func getDecoratedEnd(_ arg0: View?) -> Int32

  @JavaMethod
  open func getDecoratedMeasurement(_ arg0: View?) -> Int32

  @JavaMethod
  open func getEndAfterPadding() -> Int32

  @JavaMethod
  open func getStartAfterPadding() -> Int32

  @JavaMethod
  open func offsetChild(_ arg0: View?, _ arg1: Int32)

  @JavaMethod
  open func getMode() -> Int32

  @JavaMethod
  open func getLayoutManager() -> RecyclerView.LayoutManager!

  @JavaMethod
  open func getEndPadding() -> Int32

  @JavaMethod
  open func onLayoutComplete()

  @JavaMethod
  open func getTotalSpaceChange() -> Int32

  @JavaMethod
  open func offsetChildren(_ arg0: Int32)

  @JavaMethod
  open func getEnd() -> Int32

  @JavaMethod
  open func getTransformedEndWithDecoration(_ arg0: View?) -> Int32

  @JavaMethod
  open func getTransformedStartWithDecoration(_ arg0: View?) -> Int32

  @JavaMethod
  open func getDecoratedMeasurementInOther(_ arg0: View?) -> Int32

  @JavaMethod
  open func getTotalSpace() -> Int32
}
extension JavaClass<OrientationHelper> {
  @JavaStaticField(isFinal: true)
  public var HORIZONTAL: Int32

  @JavaStaticField(isFinal: true)
  public var VERTICAL: Int32

  @JavaStaticMethod
  public func createVerticalHelper(_ arg0: RecyclerView.LayoutManager?) -> OrientationHelper!

  @JavaStaticMethod
  public func createHorizontalHelper(_ arg0: RecyclerView.LayoutManager?) -> OrientationHelper!

  @JavaStaticMethod
  public func createOrientationHelper(_ arg0: RecyclerView.LayoutManager?, _ arg1: Int32) -> OrientationHelper!
}
