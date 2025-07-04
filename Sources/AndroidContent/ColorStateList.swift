// Auto-generated by Java-to-Swift wrapper generator.
import AndroidOS
import JavaKit
import JavaRuntime

@JavaClass("android.content.res.ColorStateList", implements: Parcelable.self)
open class ColorStateList: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: [[Int32]], _ arg1: [Int32], environment: JNIEnvironment? = nil)

  @JavaMethod
  open func describeContents() -> Int32

  @JavaMethod
  open func writeToParcel(_ arg0: Parcel?, _ arg1: Int32)

  @JavaMethod
  open func getChangingConfigurations() -> Int32

  @JavaMethod
  open func withAlpha(_ arg0: Int32) -> ColorStateList!

  @JavaMethod
  open func withLStar(_ arg0: Float) -> ColorStateList!

  @JavaMethod
  open func isStateful() -> Bool

  @JavaMethod
  open func getColorForState(_ arg0: [Int32], _ arg1: Int32) -> Int32

  @JavaMethod
  open func getDefaultColor() -> Int32

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open func isOpaque() -> Bool
}
extension JavaClass<ColorStateList> {
  @JavaStaticField(isFinal: true)
  public var CREATOR: Parcelable.Creator<ColorStateList>!

  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32

  @JavaStaticMethod
  public func valueOf(_ arg0: Int32) -> ColorStateList!
}
