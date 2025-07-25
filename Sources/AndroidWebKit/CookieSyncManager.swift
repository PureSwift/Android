// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaKit
import JavaRuntime

@JavaClass("android.webkit.CookieSyncManager", implements: Runnable.self)
open class CookieSyncManager: JavaObject {
  @JavaMethod
  open func run()

  @JavaMethod
  open func sync()

  @JavaMethod
  open func syncFromRamToFlash()

  @JavaMethod
  open func resetSync()

  @JavaMethod
  open func startSync()

  @JavaMethod
  open func stopSync()
}
extension JavaClass<CookieSyncManager> {
  @JavaStaticMethod
  public func getInstance() -> CookieSyncManager!
}
