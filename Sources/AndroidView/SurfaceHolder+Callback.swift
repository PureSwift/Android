// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

extension SurfaceHolder {
  @JavaInterface("android.view.SurfaceHolder$Callback")
  public struct Callback {
  @JavaMethod
  public func surfaceCreated(_ arg0: SurfaceHolder?)

  @JavaMethod
  public func surfaceChanged(_ arg0: SurfaceHolder?, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32)

  @JavaMethod
  public func surfaceDestroyed(_ arg0: SurfaceHolder?)
  }
}
