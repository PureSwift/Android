// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("com.google.android.material.color.utilities.MathUtils")
open class ColorMathUtils: JavaObject {

}
extension JavaClass<ColorMathUtils> {
  @JavaStaticMethod
  public func lerp(_ arg0: Double, _ arg1: Double, _ arg2: Double) -> Double

  @JavaStaticMethod
  public func sanitizeDegreesDouble(_ arg0: Double) -> Double

  @JavaStaticMethod
  public func sanitizeDegreesInt(_ arg0: Int32) -> Int32

  @JavaStaticMethod
  public func clampDouble(_ arg0: Double, _ arg1: Double, _ arg2: Double) -> Double

  @JavaStaticMethod
  public func clampInt(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32) -> Int32

  @JavaStaticMethod
  public func rotationDirection(_ arg0: Double, _ arg1: Double) -> Double

  @JavaStaticMethod
  public func differenceDegrees(_ arg0: Double, _ arg1: Double) -> Double

  @JavaStaticMethod
  public func matrixMultiply(_ arg0: [Double], _ arg1: [[Double]]) -> [Double]

  @JavaStaticMethod
  public func signum(_ arg0: Double) -> Int32
}
