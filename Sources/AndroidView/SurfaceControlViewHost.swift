// Auto-generated by Java-to-Swift wrapper generator.
import AndroidContent
import AndroidOS
import JavaKit
import JavaRuntime

@JavaClass("android.view.SurfaceControlViewHost")
open class SurfaceControlViewHost: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: AndroidContent.Context?, _ arg1: Display?, _ arg2: IBinder?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func getSurfacePackage() -> SurfaceControlViewHost.SurfacePackage!

  @JavaMethod
  open func setView(_ arg0: View?, _ arg1: Int32, _ arg2: Int32)

  @JavaMethod
  open func getView() -> View!

  @JavaMethod
  open func relayout(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open override func finalize() throws

  @JavaMethod
  open func release()
}
