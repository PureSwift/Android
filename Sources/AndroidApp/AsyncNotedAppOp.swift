// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.app.AsyncNotedAppOp")
open class AsyncNotedAppOp: JavaObject {
  @JavaMethod
  open func describeContents() -> Int32

  @JavaMethod
  open func getOp() -> String

  @JavaMethod
  open func getNotingUid() -> Int32

  @JavaMethod
  open func getAttributionTag() -> String

  @JavaMethod
  open override func equals(_ arg0: JavaObject?) -> Bool

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open override func hashCode() -> Int32

  @JavaMethod
  open func getMessage() -> String

  @JavaMethod
  open func getTime() -> Int64
}
extension JavaClass<AsyncNotedAppOp> {
  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32
}
