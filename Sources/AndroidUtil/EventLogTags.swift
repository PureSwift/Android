// Auto-generated by Java-to-Swift wrapper generator.
import JavaIO
import JavaKit
import JavaRuntime

@JavaClass("android.util.EventLogTags")
open class EventLogTags: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil) throws

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: BufferedReader?, environment: JNIEnvironment? = nil) throws

  @JavaMethod
  open func get(_ arg0: Int32) -> EventLogTags.Description!

  @JavaMethod
  open func get(_ arg0: String) -> EventLogTags.Description!
}
