// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

extension Magnifier {
  @JavaClass("android.widget.Magnifier$Builder")
  open class Builder: JavaObject {
  @JavaMethod
  open func build() -> Magnifier!

  @JavaMethod
  open func setSize(_ arg0: Int32, _ arg1: Int32) -> Magnifier.Builder!

  @JavaMethod
  open func setDefaultSourceToMagnifierOffset(_ arg0: Int32, _ arg1: Int32) -> Magnifier.Builder!

  @JavaMethod
  open func setInitialZoom(_ arg0: Float) -> Magnifier.Builder!

  @JavaMethod
  open func setCornerRadius(_ arg0: Float) -> Magnifier.Builder!

  @JavaMethod
  open func setClippingEnabled(_ arg0: Bool) -> Magnifier.Builder!

  @JavaMethod
  open func setSourceBounds(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32) -> Magnifier.Builder!

  @JavaMethod
  open func setElevation(_ arg0: Float) -> Magnifier.Builder!
  }
}
