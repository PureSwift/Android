// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaKitCollection
import JavaRuntime

extension RecyclerView {
  @JavaClass("androidx.recyclerview.widget.RecyclerView$ItemAnimator")
  open class ItemAnimator: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func endAnimations()

  @JavaMethod
  open func getChangeDuration() -> Int64

  @JavaMethod
  open func getAddDuration() -> Int64

  @JavaMethod
  open func dispatchAnimationsFinished()

  @JavaMethod
  open func runPendingAnimations()

  @JavaMethod
  open func recordPreLayoutInformation(_ arg0: RecyclerView.State?, _ arg1: RecyclerView.ViewHolder?, _ arg2: Int32, _ arg3: List<JavaObject>?) -> RecyclerView.ItemAnimator.ItemHolderInfo!

  @JavaMethod
  open func recordPostLayoutInformation(_ arg0: RecyclerView.State?, _ arg1: RecyclerView.ViewHolder?) -> RecyclerView.ItemAnimator.ItemHolderInfo!

  @JavaMethod
  open func animateChange(_ arg0: RecyclerView.ViewHolder?, _ arg1: RecyclerView.ViewHolder?, _ arg2: RecyclerView.ItemAnimator.ItemHolderInfo?, _ arg3: RecyclerView.ItemAnimator.ItemHolderInfo?) -> Bool

  @JavaMethod
  open func animateAppearance(_ arg0: RecyclerView.ViewHolder?, _ arg1: RecyclerView.ItemAnimator.ItemHolderInfo?, _ arg2: RecyclerView.ItemAnimator.ItemHolderInfo?) -> Bool

  @JavaMethod
  open func animateDisappearance(_ arg0: RecyclerView.ViewHolder?, _ arg1: RecyclerView.ItemAnimator.ItemHolderInfo?, _ arg2: RecyclerView.ItemAnimator.ItemHolderInfo?) -> Bool

  @JavaMethod
  open func canReuseUpdatedViewHolder(_ arg0: RecyclerView.ViewHolder?, _ arg1: List<JavaObject>?) -> Bool

  @JavaMethod
  open func canReuseUpdatedViewHolder(_ arg0: RecyclerView.ViewHolder?) -> Bool

  @JavaMethod
  open func isRunning(_ arg0: RecyclerView.ItemAnimator.ItemAnimatorFinishedListener?) -> Bool

  @JavaMethod
  open func isRunning() -> Bool

  @JavaMethod
  open func endAnimation(_ arg0: RecyclerView.ViewHolder?)

  @JavaMethod
  open func dispatchAnimationFinished(_ arg0: RecyclerView.ViewHolder?)

  @JavaMethod
  open func animatePersistence(_ arg0: RecyclerView.ViewHolder?, _ arg1: RecyclerView.ItemAnimator.ItemHolderInfo?, _ arg2: RecyclerView.ItemAnimator.ItemHolderInfo?) -> Bool

  @JavaMethod
  open func obtainHolderInfo() -> RecyclerView.ItemAnimator.ItemHolderInfo!

  @JavaMethod
  open func onAnimationFinished(_ arg0: RecyclerView.ViewHolder?)

  @JavaMethod
  open func onAnimationStarted(_ arg0: RecyclerView.ViewHolder?)

  @JavaMethod
  open func setMoveDuration(_ arg0: Int64)

  @JavaMethod
  open func setAddDuration(_ arg0: Int64)

  @JavaMethod
  open func setRemoveDuration(_ arg0: Int64)

  @JavaMethod
  open func setChangeDuration(_ arg0: Int64)

  @JavaMethod
  open func dispatchAnimationStarted(_ arg0: RecyclerView.ViewHolder?)

  @JavaMethod
  open func getMoveDuration() -> Int64

  @JavaMethod
  open func getRemoveDuration() -> Int64
  }
}
extension JavaClass<RecyclerView.ItemAnimator> {
  @JavaStaticField(isFinal: true)
  public var FLAG_CHANGED: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_REMOVED: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_INVALIDATED: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_MOVED: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_APPEARED_IN_PRE_LAYOUT: Int32
}
