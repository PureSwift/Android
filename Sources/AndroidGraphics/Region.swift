// Auto-generated by Java-to-Swift wrapper generator.
import AndroidOS
import JavaKit
import JavaRuntime

@JavaClass("android.graphics.Region", implements: Parcelable.self)
open class Region: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Rect?, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Region?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func describeContents() -> Int32

  @JavaMethod
  open func writeToParcel(_ arg0: Parcel?, _ arg1: Int32)

  @JavaMethod
  open func translate(_ arg0: Int32, _ arg1: Int32, _ arg2: Region?)

  @JavaMethod
  open func translate(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func isComplex() -> Bool

  @JavaMethod
  open func getBoundaryPath(_ arg0: Path?) -> Bool

  @JavaMethod
  open func getBoundaryPath() -> Path!

  @JavaMethod
  open func quickContains(_ arg0: Rect?) -> Bool

  @JavaMethod
  open func quickContains(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32) -> Bool

  @JavaMethod
  open func quickReject(_ arg0: Region?) -> Bool

  @JavaMethod
  open func quickReject(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32) -> Bool

  @JavaMethod
  open func quickReject(_ arg0: Rect?) -> Bool

  @JavaMethod
  open func isRect() -> Bool

  @JavaMethod
  open func setEmpty()

  @JavaMethod
  open func setPath(_ arg0: Path?, _ arg1: Region?) -> Bool

  @JavaMethod
  open override func finalize() throws

  @JavaMethod
  open override func equals(_ arg0: JavaObject?) -> Bool

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open func isEmpty() -> Bool

  @JavaMethod
  open func contains(_ arg0: Int32, _ arg1: Int32) -> Bool

  @JavaMethod
  open func getBounds(_ arg0: Rect?) -> Bool

  @JavaMethod
  open func getBounds() -> Rect!

  @JavaMethod
  open func set(_ arg0: Rect?) -> Bool

  @JavaMethod
  open func set(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32) -> Bool

  @JavaMethod
  open func set(_ arg0: Region?) -> Bool

  @JavaMethod
  open func op(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32, _ arg4: Region.Op?) -> Bool

  @JavaMethod
  open func op(_ arg0: Region?, _ arg1: Region.Op?) -> Bool

  @JavaMethod
  open func op(_ arg0: Rect?, _ arg1: Region?, _ arg2: Region.Op?) -> Bool

  @JavaMethod
  open func op(_ arg0: Region?, _ arg1: Region?, _ arg2: Region.Op?) -> Bool

  @JavaMethod
  open func op(_ arg0: Rect?, _ arg1: Region.Op?) -> Bool

  @JavaMethod
  open func union(_ arg0: Rect?) -> Bool
}
extension JavaClass<Region> {
  @JavaStaticField(isFinal: true)
  public var CREATOR: Parcelable.Creator<Region>!

  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32
}
