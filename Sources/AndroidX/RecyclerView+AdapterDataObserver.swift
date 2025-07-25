// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

extension RecyclerView {
  @JavaClass("androidx.recyclerview.widget.RecyclerView$AdapterDataObserver")
  open class AdapterDataObserver: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func onChanged()

  @JavaMethod
  open func onItemRangeChanged(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func onItemRangeChanged(_ arg0: Int32, _ arg1: Int32, _ arg2: JavaObject?)

  @JavaMethod
  open func onItemRangeInserted(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func onItemRangeRemoved(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func onItemRangeMoved(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32)

  @JavaMethod
  open func onStateRestorationPolicyChanged()
  }
}
