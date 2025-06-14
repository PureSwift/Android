// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

extension Notification {
  @JavaClass("android.app.Notification$BigTextStyle")
  open class BigTextStyle: Notification.Style {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Notification.Builder?, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func setBigContentTitle(_ arg0: CharSequence?) -> Notification.BigTextStyle!

  @JavaMethod
  open func setSummaryText(_ arg0: CharSequence?) -> Notification.BigTextStyle!

  @JavaMethod
  open func bigText(_ arg0: CharSequence?) -> Notification.BigTextStyle!
  }
}
