// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.widget.CursorAdapter", implements: Filterable.self, ThemedSpinnerAdapter.self)
open class CursorAdapter: BaseAdapter {
  @JavaMethod
  open func getCount() -> Int32

  @JavaMethod
  open func getFilter() -> Filter!

  @JavaMethod
  open func getFilterQueryProvider() -> FilterQueryProvider!

  @JavaMethod
  open func setFilterQueryProvider(_ arg0: FilterQueryProvider?)

  @JavaMethod
  open func getItem(_ arg0: Int32) -> JavaObject!

  @JavaMethod
  open func getItemId(_ arg0: Int32) -> Int64

  @JavaMethod
  open override func hasStableIds() -> Bool

  @JavaMethod
  open func onContentChanged()
}
extension JavaClass<CursorAdapter> {
  @JavaStaticField(isFinal: true)
  public var FLAG_AUTO_REQUERY: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_REGISTER_CONTENT_OBSERVER: Int32

  @JavaStaticField(isFinal: true)
  public var IGNORE_ITEM_VIEW_TYPE: Int32

  @JavaStaticField(isFinal: true)
  public var NO_SELECTION: Int32
}
