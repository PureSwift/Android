// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

extension KeyEvent {
  @JavaClass("android.view.KeyEvent$DispatcherState")
  open class DispatcherState: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func isTracking(_ arg0: KeyEvent?) -> Bool

  @JavaMethod
  open func startTracking(_ arg0: KeyEvent?, _ arg1: JavaObject?)

  @JavaMethod
  open func performedLongPress(_ arg0: KeyEvent?)

  @JavaMethod
  open func handleUpEvent(_ arg0: KeyEvent?)

  @JavaMethod
  open func reset()

  @JavaMethod
  open func reset(_ arg0: JavaObject?)
  }
}
