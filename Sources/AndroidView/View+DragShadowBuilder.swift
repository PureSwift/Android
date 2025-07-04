// Auto-generated by Java-to-Swift wrapper generator.
import AndroidGraphics
import JavaKit
import JavaRuntime

extension View {
  @JavaClass("android.view.View$DragShadowBuilder")
  open class DragShadowBuilder: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: View?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func getView() -> View!

  @JavaMethod
  open func onProvideShadowMetrics(_ arg0: Point?, _ arg1: Point?)

  @JavaMethod
  open func onDrawShadow(_ arg0: Canvas?)
  }
}
