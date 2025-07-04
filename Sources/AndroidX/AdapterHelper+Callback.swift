// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

extension AdapterHelper {
  @JavaInterface("androidx.recyclerview.widget.AdapterHelper$Callback")
  public struct Callback {
  @JavaMethod
  public func findViewHolder(_ arg0: Int32) -> RecyclerView.ViewHolder!

  @JavaMethod
  public func offsetPositionsForRemovingInvisible(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  public func offsetPositionsForRemovingLaidOutOrNewView(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  public func markViewHoldersUpdated(_ arg0: Int32, _ arg1: Int32, _ arg2: JavaObject?)

  @JavaMethod
  public func onDispatchFirstPass(_ arg0: AdapterHelper.UpdateOp?)

  @JavaMethod
  public func onDispatchSecondPass(_ arg0: AdapterHelper.UpdateOp?)

  @JavaMethod
  public func offsetPositionsForAdd(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  public func offsetPositionsForMove(_ arg0: Int32, _ arg1: Int32)
  }
}
