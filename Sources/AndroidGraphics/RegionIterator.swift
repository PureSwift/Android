// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.graphics.RegionIterator")
open class RegionIterator: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Region?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open override func finalize() throws

  @JavaMethod
  open func next(_ arg0: Rect?) -> Bool
}
