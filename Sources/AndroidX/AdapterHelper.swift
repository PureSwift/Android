// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("androidx.recyclerview.widget.AdapterHelper", implements: OpReorderer.Callback.self)
open class AdapterHelper: JavaObject {
  @JavaMethod
  open func recycleUpdateOp(_ arg0: AdapterHelper.UpdateOp?)

  @JavaMethod
  open func obtainUpdateOp(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32, _ arg3: JavaObject?) -> AdapterHelper.UpdateOp!

  @JavaMethod
  open func applyPendingUpdatesToPosition(_ arg0: Int32) -> Int32
}
