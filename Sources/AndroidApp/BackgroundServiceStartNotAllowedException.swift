// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.app.BackgroundServiceStartNotAllowedException")
open class BackgroundServiceStartNotAllowedException: ServiceStartNotAllowedException {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: String, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func describeContents() -> Int32
}
extension JavaClass<BackgroundServiceStartNotAllowedException> {
  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32
}
