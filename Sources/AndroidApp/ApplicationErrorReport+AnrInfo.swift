// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

extension ApplicationErrorReport {
  @JavaClass("android.app.ApplicationErrorReport$AnrInfo")
  open class AnrInfo: JavaObject {
  @JavaField(isFinal: false)
  public var activity: String

  @JavaField(isFinal: false)
  public var cause: String

  @JavaField(isFinal: false)
  public var info: String

  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)
  }
}
