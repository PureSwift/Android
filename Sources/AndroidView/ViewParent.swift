// Auto-generated by Java-to-Swift wrapper generator.
import AndroidGraphics
import AndroidOS
import JavaKit
import JavaRuntime

@JavaInterface("android.view.ViewParent")
public struct ViewParent {
  @JavaMethod
  public func requestFitSystemWindows()

  @JavaMethod
  public func getLayoutDirection() -> Int32

  @JavaMethod
  public func focusSearch(_ arg0: View?, _ arg1: Int32) -> View!

  @JavaMethod
  public func keyboardNavigationClusterSearch(_ arg0: View?, _ arg1: Int32) -> View!

  @JavaMethod
  public func getParentForAccessibility() -> ViewParent!

  @JavaMethod
  public func createContextMenu(_ arg0: ContextMenu?)

  @JavaMethod
  public func canResolveLayoutDirection() -> Bool

  @JavaMethod
  public func isLayoutDirectionResolved() -> Bool

  @JavaMethod
  public func isLayoutRequested() -> Bool

  @JavaMethod
  public func requestLayout()

  @JavaMethod
  public func getTextDirection() -> Int32

  @JavaMethod
  public func canResolveTextDirection() -> Bool

  @JavaMethod
  public func isTextDirectionResolved() -> Bool

  @JavaMethod
  public func getTextAlignment() -> Int32

  @JavaMethod
  public func canResolveTextAlignment() -> Bool

  @JavaMethod
  public func isTextAlignmentResolved() -> Bool

  @JavaMethod
  public func requestTransparentRegion(_ arg0: View?)

  @JavaMethod
  public func onDescendantInvalidated(_ arg0: View?, _ arg1: View?)

  @JavaMethod
  public func invalidateChild(_ arg0: View?, _ arg1: Rect?)

  @JavaMethod
  public func invalidateChildInParent(_ arg0: [Int32], _ arg1: Rect?) -> ViewParent!

  @JavaMethod
  public func requestChildFocus(_ arg0: View?, _ arg1: View?)

  @JavaMethod
  public func recomputeViewAttributes(_ arg0: View?)

  @JavaMethod
  public func clearChildFocus(_ arg0: View?)

  @JavaMethod
  public func getChildVisibleRect(_ arg0: View?, _ arg1: Rect?, _ arg2: Point?) -> Bool

  @JavaMethod
  public func bringChildToFront(_ arg0: View?)

  @JavaMethod
  public func focusableViewAvailable(_ arg0: View?)

  @JavaMethod
  public func showContextMenuForChild(_ arg0: View?, _ arg1: Float, _ arg2: Float) -> Bool

  @JavaMethod
  public func showContextMenuForChild(_ arg0: View?) -> Bool

  @JavaMethod
  public func startActionModeForChild(_ arg0: View?, _ arg1: ActionMode.Callback?, _ arg2: Int32) -> ActionMode!

  @JavaMethod
  public func startActionModeForChild(_ arg0: View?, _ arg1: ActionMode.Callback?) -> ActionMode!

  @JavaMethod
  public func childDrawableStateChanged(_ arg0: View?)

  @JavaMethod
  public func requestDisallowInterceptTouchEvent(_ arg0: Bool)

  @JavaMethod
  public func requestChildRectangleOnScreen(_ arg0: View?, _ arg1: Rect?, _ arg2: Bool) -> Bool

  @JavaMethod
  public func childHasTransientStateChanged(_ arg0: View?, _ arg1: Bool)

  @JavaMethod
  public func notifySubtreeAccessibilityStateChanged(_ arg0: View?, _ arg1: View?, _ arg2: Int32)

  @JavaMethod
  public func onStartNestedScroll(_ arg0: View?, _ arg1: View?, _ arg2: Int32) -> Bool

  @JavaMethod
  public func onNestedScrollAccepted(_ arg0: View?, _ arg1: View?, _ arg2: Int32)

  @JavaMethod
  public func onStopNestedScroll(_ arg0: View?)

  @JavaMethod
  public func onNestedScroll(_ arg0: View?, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32, _ arg4: Int32)

  @JavaMethod
  public func onNestedPreScroll(_ arg0: View?, _ arg1: Int32, _ arg2: Int32, _ arg3: [Int32])

  @JavaMethod
  public func onNestedFling(_ arg0: View?, _ arg1: Float, _ arg2: Float, _ arg3: Bool) -> Bool

  @JavaMethod
  public func onNestedPreFling(_ arg0: View?, _ arg1: Float, _ arg2: Float) -> Bool

  @JavaMethod
  public func onNestedPrePerformAccessibilityAction(_ arg0: View?, _ arg1: Int32, _ arg2: Bundle?) -> Bool

  @JavaMethod
  public func getParent() -> ViewParent!
}
