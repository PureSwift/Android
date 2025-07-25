// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.graphics.drawable.PictureDrawable")
open class PictureDrawable: Drawable {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Picture?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open override func getOpacity() -> Int32

  @JavaMethod
  open override func draw(_ arg0: Canvas?)

  @JavaMethod
  open override func setAlpha(_ arg0: Int32)

  @JavaMethod
  open override func setColorFilter(_ arg0: ColorFilter?)

  @JavaMethod
  open override func getIntrinsicWidth() -> Int32

  @JavaMethod
  open override func getIntrinsicHeight() -> Int32

  @JavaMethod
  open func getPicture() -> Picture!

  @JavaMethod
  open func setPicture(_ arg0: Picture?)
}
