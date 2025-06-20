// Auto-generated by Java-to-Swift wrapper generator.
import AndroidOS
import AndroidUtil
import JavaKit
import JavaRuntime

@JavaClass("android.content.pm.PackageItemInfo")
open class PackageItemInfo: JavaObject {
  @JavaField(isFinal: false)
  public var banner: Int32

  @JavaField(isFinal: false)
  public var icon: Int32

  @JavaField(isFinal: false)
  public var labelRes: Int32

  @JavaField(isFinal: false)
  public var logo: Int32

  @JavaField(isFinal: false)
  public var metaData: Bundle!

  @JavaField(isFinal: false)
  public var name: String

  @JavaField(isFinal: false)
  public var nonLocalizedLabel: CharSequence!

  @JavaField(isFinal: false)
  public var packageName: String

  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: PackageItemInfo?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func writeToParcel(_ arg0: Parcel?, _ arg1: Int32)

  @JavaMethod
  open func loadLabel(_ arg0: PackageManager?) -> CharSequence!

  @JavaMethod
  open func loadXmlMetaData(_ arg0: PackageManager?, _ arg1: String) -> XmlResourceParser!

  @JavaMethod
  open func dumpFront(_ arg0: Printer?, _ arg1: String)

  @JavaMethod
  open func dumpBack(_ arg0: Printer?, _ arg1: String)
}
