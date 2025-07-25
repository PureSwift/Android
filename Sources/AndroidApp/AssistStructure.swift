// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.app.assist.AssistStructure")
open class AssistStructure: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func describeContents() -> Int32

  @JavaMethod
  open func getAcquisitionStartTime() -> Int64

  @JavaMethod
  open func getAcquisitionEndTime() -> Int64

  @JavaMethod
  open func isHomeActivity() -> Bool

  @JavaMethod
  open func getWindowNodeCount() -> Int32

  @JavaMethod
  open func getWindowNodeAt(_ arg0: Int32) -> AssistStructure.WindowNode!
}
extension JavaClass<AssistStructure> {
  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32
}
