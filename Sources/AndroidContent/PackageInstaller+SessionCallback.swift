// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

extension PackageInstaller {
  @JavaClass("android.content.pm.PackageInstaller$SessionCallback")
  open class SessionCallback: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func onFinished(_ arg0: Int32, _ arg1: Bool)

  @JavaMethod
  open func onCreated(_ arg0: Int32)

  @JavaMethod
  open func onBadgingChanged(_ arg0: Int32)

  @JavaMethod
  open func onActiveChanged(_ arg0: Int32, _ arg1: Bool)

  @JavaMethod
  open func onProgressChanged(_ arg0: Int32, _ arg1: Float)
  }
}
