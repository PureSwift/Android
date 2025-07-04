// Auto-generated by Java-to-Swift wrapper generator.
import JavaIO
import AndroidOS
import AndroidUtil
import JavaKit
import JavaRuntime

@JavaClass("android.graphics.Bitmap", implements: Parcelable.self)
open class Bitmap: JavaObject {
  @JavaMethod
  open func describeContents() -> Int32

  @JavaMethod
  open func writeToParcel(_ arg0: Parcel?, _ arg1: Int32)

  @JavaMethod
  open func getColor(_ arg0: Int32, _ arg1: Int32) -> Color!

  @JavaMethod
  open func setWidth(_ arg0: Int32)

  @JavaMethod
  open func getWidth() -> Int32

  @JavaMethod
  open func getHeight() -> Int32

  @JavaMethod
  open func hasAlpha() -> Bool

  @JavaMethod
  open func getDensity() -> Int32

  @JavaMethod
  open func setDensity(_ arg0: Int32)

  @JavaMethod
  open func reconfigure(_ arg0: Int32, _ arg1: Int32, _ arg2: Bitmap.Config?)

  @JavaMethod
  open func setHeight(_ arg0: Int32)

  @JavaMethod
  open func setConfig(_ arg0: Bitmap.Config?)

  @JavaMethod
  open func recycle()

  @JavaMethod
  open func isRecycled() -> Bool

  @JavaMethod
  open func getGenerationId() -> Int32

  @JavaMethod
  open func isMutable() -> Bool

  @JavaMethod
  open func asShared() -> Bitmap!

  @JavaMethod
  open func getNinePatchChunk() -> [Int8]

  @JavaMethod
  open func isPremultiplied() -> Bool

  @JavaMethod
  open func setPremultiplied(_ arg0: Bool)

  @JavaMethod
  open func getScaledWidth(_ arg0: Int32) -> Int32

  @JavaMethod
  open func getScaledWidth(_ arg0: DisplayMetrics?) -> Int32

  @JavaMethod
  open func getScaledWidth(_ arg0: Canvas?) -> Int32

  @JavaMethod
  open func getScaledHeight(_ arg0: Int32) -> Int32

  @JavaMethod
  open func getScaledHeight(_ arg0: Canvas?) -> Int32

  @JavaMethod
  open func getScaledHeight(_ arg0: DisplayMetrics?) -> Int32

  @JavaMethod
  open func getRowBytes() -> Int32

  @JavaMethod
  open func getByteCount() -> Int32

  @JavaMethod
  open func getAllocationByteCount() -> Int32

  @JavaMethod
  open func getConfig() -> Bitmap.Config!

  @JavaMethod
  open func setHasAlpha(_ arg0: Bool)

  @JavaMethod
  open func hasMipMap() -> Bool

  @JavaMethod
  open func setHasMipMap(_ arg0: Bool)

  @JavaMethod
  open func getColorSpace() -> ColorSpace!

  @JavaMethod
  open func setColorSpace(_ arg0: ColorSpace?)

  @JavaMethod
  open func eraseColor(_ arg0: Int64)

  @JavaMethod
  open func eraseColor(_ arg0: Int32)

  @JavaMethod
  open func getPixel(_ arg0: Int32, _ arg1: Int32) -> Int32

  @JavaMethod
  open func getPixels(_ arg0: [Int32], _ arg1: Int32, _ arg2: Int32, _ arg3: Int32, _ arg4: Int32, _ arg5: Int32, _ arg6: Int32)

  @JavaMethod
  open func setPixel(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32)

  @JavaMethod
  open func setPixels(_ arg0: [Int32], _ arg1: Int32, _ arg2: Int32, _ arg3: Int32, _ arg4: Int32, _ arg5: Int32, _ arg6: Int32)

  @JavaMethod
  open func extractAlpha() -> Bitmap!

  @JavaMethod
  open func extractAlpha(_ arg0: Paint?, _ arg1: [Int32]) -> Bitmap!

  @JavaMethod
  open func sameAs(_ arg0: Bitmap?) -> Bool

  @JavaMethod
  open func prepareToDraw()

  @JavaMethod
  open func compress(_ arg0: Bitmap.CompressFormat?, _ arg1: Int32, _ arg2: OutputStream?) -> Bool

  @JavaMethod
  open func copy(_ arg0: Bitmap.Config?, _ arg1: Bool) -> Bitmap!
}
extension JavaClass<Bitmap> {
  @JavaStaticField(isFinal: true)
  public var CREATOR: Parcelable.Creator<Bitmap>!

  @JavaStaticField(isFinal: true)
  public var DENSITY_NONE: Int32

  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32

  @JavaStaticMethod
  public func createScaledBitmap(_ arg0: Bitmap?, _ arg1: Int32, _ arg2: Int32, _ arg3: Bool) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: DisplayMetrics?, _ arg1: [Int32], _ arg2: Int32, _ arg3: Int32, _ arg4: Bitmap.Config?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: [Int32], _ arg1: Int32, _ arg2: Int32, _ arg3: Bitmap.Config?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: DisplayMetrics?, _ arg1: [Int32], _ arg2: Int32, _ arg3: Int32, _ arg4: Int32, _ arg5: Int32, _ arg6: Bitmap.Config?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: Picture?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: Picture?, _ arg1: Int32, _ arg2: Int32, _ arg3: Bitmap.Config?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: Bitmap?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: DisplayMetrics?, _ arg1: Int32, _ arg2: Int32, _ arg3: Bitmap.Config?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: Int32, _ arg1: Int32, _ arg2: Bitmap.Config?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: Bitmap?, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32, _ arg4: Int32, _ arg5: Matrix?, _ arg6: Bool) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: Bitmap?, _ arg1: Int32, _ arg2: Int32, _ arg3: Int32, _ arg4: Int32) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: [Int32], _ arg1: Int32, _ arg2: Int32, _ arg3: Int32, _ arg4: Int32, _ arg5: Bitmap.Config?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: DisplayMetrics?, _ arg1: Int32, _ arg2: Int32, _ arg3: Bitmap.Config?, _ arg4: Bool, _ arg5: ColorSpace?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: DisplayMetrics?, _ arg1: Int32, _ arg2: Int32, _ arg3: Bitmap.Config?, _ arg4: Bool) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: Int32, _ arg1: Int32, _ arg2: Bitmap.Config?, _ arg3: Bool, _ arg4: ColorSpace?) -> Bitmap!

  @JavaStaticMethod
  public func createBitmap(_ arg0: Int32, _ arg1: Int32, _ arg2: Bitmap.Config?, _ arg3: Bool) -> Bitmap!
}
