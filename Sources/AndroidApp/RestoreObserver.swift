// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.app.backup.RestoreObserver")
open class RestoreObserver: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func restoreStarting(_ arg0: Int32)

  @JavaMethod
  open func onUpdate(_ arg0: Int32, _ arg1: String)

  @JavaMethod
  open func restoreFinished(_ arg0: Int32)
}
