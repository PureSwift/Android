// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaKitCollection
import JavaRuntime

extension PictureInPictureParams {
  @JavaClass("android.app.PictureInPictureParams$Builder")
  open class Builder: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: PictureInPictureParams?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func setTitle(_ arg0: CharSequence?) -> PictureInPictureParams.Builder!

  @JavaMethod
  open func setCloseAction(_ arg0: RemoteAction?) -> PictureInPictureParams.Builder!

  @JavaMethod
  open func setAutoEnterEnabled(_ arg0: Bool) -> PictureInPictureParams.Builder!

  @JavaMethod
  open func setSeamlessResizeEnabled(_ arg0: Bool) -> PictureInPictureParams.Builder!

  @JavaMethod
  open func setSubtitle(_ arg0: CharSequence?) -> PictureInPictureParams.Builder!

  @JavaMethod
  open func setActions(_ arg0: List<RemoteAction>?) -> PictureInPictureParams.Builder!

  @JavaMethod
  open func build() -> PictureInPictureParams!
  }
}
