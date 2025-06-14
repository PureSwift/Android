// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.widget.Filter")
open class Filter: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func filter(_ arg0: CharSequence?, _ arg1: Filter.FilterListener?)

  @JavaMethod
  open func filter(_ arg0: CharSequence?)

  @JavaMethod
  open func convertResultToString(_ arg0: JavaObject?) -> CharSequence!

  @JavaMethod
  open func performFiltering(_ arg0: CharSequence?) -> Filter.FilterResults!

  @JavaMethod
  open func publishResults(_ arg0: CharSequence?, _ arg1: Filter.FilterResults?)
}
