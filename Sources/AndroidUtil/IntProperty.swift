import JavaKit
import JavaRuntime

@JavaClass("android.util.IntProperty")
open class IntProperty: Property {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: String, environment: JNIEnvironment? = nil)

  @JavaMethod
  open override func set(_ arg0: JavaObject?, _ arg1: JavaObject?)

  @JavaMethod
  open func setValue(_ arg0: JavaObject?, _ arg1: Int32)
}
