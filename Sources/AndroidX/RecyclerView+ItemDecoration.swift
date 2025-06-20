// Auto-generated by Java-to-Swift wrapper generator.
import AndroidGraphics
import AndroidView
import JavaKit
import JavaRuntime

extension RecyclerView {
  @JavaClass("androidx.recyclerview.widget.RecyclerView$ItemDecoration")
  open class ItemDecoration: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func onDrawOver(_ arg0: Canvas?, _ arg1: RecyclerView?)

  @JavaMethod
  open func onDrawOver(_ arg0: Canvas?, _ arg1: RecyclerView?, _ arg2: RecyclerView.State?)

  @JavaMethod
  open func onDraw(_ arg0: Canvas?, _ arg1: RecyclerView?)

  @JavaMethod
  open func onDraw(_ arg0: Canvas?, _ arg1: RecyclerView?, _ arg2: RecyclerView.State?)

  @JavaMethod
  open func getItemOffsets(_ arg0: Rect?, _ arg1: Int32, _ arg2: RecyclerView?)

  @JavaMethod
  open func getItemOffsets(_ arg0: Rect?, _ arg1: View?, _ arg2: RecyclerView?, _ arg3: RecyclerView.State?)
  }
}
