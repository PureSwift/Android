import JavaKit
import JavaRuntime

@JavaClass("android.util.Property")
open class Property: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: JavaClass<JavaObject>?, _ arg1: String, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func getName() -> String

  @JavaMethod
  open func get(_ arg0: JavaObject?) -> JavaObject!

  @JavaMethod
  open func set(_ arg0: JavaObject?, _ arg1: JavaObject?)

  @JavaMethod
  open func getType() -> JavaClass<JavaObject>!

  @JavaMethod
  open func isReadOnly() -> Bool
}
