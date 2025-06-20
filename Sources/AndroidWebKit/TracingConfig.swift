// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaKitCollection
import JavaRuntime

@JavaClass("android.webkit.TracingConfig")
open class TracingConfig: JavaObject {
  @JavaMethod
  open func getPredefinedCategories() -> Int32

  @JavaMethod
  open func getCustomIncludedCategories() -> List<JavaString>!

  @JavaMethod
  open func getTracingMode() -> Int32
}
extension JavaClass<TracingConfig> {
  @JavaStaticField(isFinal: true)
  public var CATEGORIES_ALL: Int32

  @JavaStaticField(isFinal: true)
  public var CATEGORIES_ANDROID_WEBVIEW: Int32

  @JavaStaticField(isFinal: true)
  public var CATEGORIES_FRAME_VIEWER: Int32

  @JavaStaticField(isFinal: true)
  public var CATEGORIES_INPUT_LATENCY: Int32

  @JavaStaticField(isFinal: true)
  public var CATEGORIES_JAVASCRIPT_AND_RENDERING: Int32

  @JavaStaticField(isFinal: true)
  public var CATEGORIES_NONE: Int32

  @JavaStaticField(isFinal: true)
  public var CATEGORIES_RENDERING: Int32

  @JavaStaticField(isFinal: true)
  public var CATEGORIES_WEB_DEVELOPER: Int32

  @JavaStaticField(isFinal: true)
  public var RECORD_CONTINUOUSLY: Int32

  @JavaStaticField(isFinal: true)
  public var RECORD_UNTIL_FULL: Int32
}
