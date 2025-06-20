// Auto-generated by Java-to-Swift wrapper generator.
import AndroidContent
import AndroidView
import JavaKit
import JavaRuntime

@JavaClass("com.google.android.material.color.MaterialColors")
open class MaterialColors: JavaObject {

}
extension JavaClass<MaterialColors> {
  @JavaStaticField(isFinal: true)
  public var ALPHA_FULL: Float

  @JavaStaticField(isFinal: true)
  public var ALPHA_MEDIUM: Float

  @JavaStaticField(isFinal: true)
  public var ALPHA_DISABLED: Float

  @JavaStaticField(isFinal: true)
  public var ALPHA_LOW: Float

  @JavaStaticField(isFinal: true)
  public var ALPHA_DISABLED_LOW: Float

  @JavaStaticMethod
  public func compositeARGBWithAlpha(_ arg0: Int32, _ arg1: Int32) -> Int32

  @JavaStaticMethod
  public func isColorLight(_ arg0: Int32) -> Bool

  @JavaStaticMethod
  public func harmonizeWithPrimary(_ arg0: Context?, _ arg1: Int32) -> Int32

  @JavaStaticMethod
  public func harmonize(_ arg0: Int32, _ arg1: Int32) -> Int32

  @JavaStaticMethod
  public func getColorRoles(_ arg0: Int32, _ arg1: Bool) -> ColorRoles!

  @JavaStaticMethod
  public func getColorRoles(_ arg0: Context?, _ arg1: Int32) -> ColorRoles!

  @JavaStaticMethod
  public func getSurfaceContainerFromSeed(_ arg0: Context?, _ arg1: Int32) -> Int32

  @JavaStaticMethod
  public func getSurfaceContainerHighFromSeed(_ arg0: Context?, _ arg1: Int32) -> Int32

  @JavaStaticMethod
  public func getColor(_ arg0: Context?, _ arg1: Int32, _ arg2: Int32) -> Int32

  @JavaStaticMethod
  public func getColor(_ arg0: View?, _ arg1: Int32, _ arg2: Int32) -> Int32

  @JavaStaticMethod
  public func getColor(_ arg0: Context?, _ arg1: Int32, _ arg2: String) -> Int32

  @JavaStaticMethod
  public func getColor(_ arg0: View?, _ arg1: Int32) -> Int32

  @JavaStaticMethod
  public func getColorStateList(_ arg0: Context?, _ arg1: Int32, _ arg2: ColorStateList?) -> ColorStateList!

  @JavaStaticMethod
  public func getColorStateListOrNull(_ arg0: Context?, _ arg1: Int32) -> ColorStateList!

  @JavaStaticMethod
  public func getColorOrNull(_ arg0: Context?, _ arg1: Int32) -> JavaInteger!

  @JavaStaticMethod
  public func layer(_ arg0: Int32, _ arg1: Int32, _ arg2: Float) -> Int32

  @JavaStaticMethod
  public func layer(_ arg0: View?, _ arg1: Int32, _ arg2: Int32) -> Int32

  @JavaStaticMethod
  public func layer(_ arg0: View?, _ arg1: Int32, _ arg2: Int32, _ arg3: Float) -> Int32

  @JavaStaticMethod
  public func layer(_ arg0: Int32, _ arg1: Int32) -> Int32
}
