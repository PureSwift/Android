// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaKit
import JavaRuntime

@JavaClass("android.util.Half", implements: Comparable.self)
open class Half: JavaNumber {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Float, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Double, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: String, environment: JNIEnvironment? = nil) throws

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Int16, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func halfValue() -> Int16

  @JavaMethod
  open override func equals(_ arg0: JavaObject?) -> Bool

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open override func hashCode() -> Int32

  @JavaMethod
  open func compareTo(_ arg0: JavaObject?) -> Int32

  @JavaMethod
  open func compareTo(_ arg0: Half?) -> Int32

  @JavaMethod
  open override func byteValue() -> Int8

  @JavaMethod
  open override func shortValue() -> Int16

  @JavaMethod
  open override func intValue() -> Int32

  @JavaMethod
  open override func longValue() -> Int64

  @JavaMethod
  open override func floatValue() -> Float

  @JavaMethod
  open override func doubleValue() -> Double

  @JavaMethod
  open func isNaN() -> Bool
}
extension JavaClass<Half> {
  @JavaStaticField(isFinal: true)
  public var EPSILON: Int16

  @JavaStaticField(isFinal: true)
  public var LOWEST_VALUE: Int16

  @JavaStaticField(isFinal: true)
  public var MAX_EXPONENT: Int32

  @JavaStaticField(isFinal: true)
  public var MAX_VALUE: Int16

  @JavaStaticField(isFinal: true)
  public var MIN_EXPONENT: Int32

  @JavaStaticField(isFinal: true)
  public var MIN_NORMAL: Int16

  @JavaStaticField(isFinal: true)
  public var MIN_VALUE: Int16

  @JavaStaticField(isFinal: true)
  public var NEGATIVE_INFINITY: Int16

  @JavaStaticField(isFinal: true)
  public var NEGATIVE_ZERO: Int16

  @JavaStaticField(isFinal: true)
  public var NaN: Int16

  @JavaStaticField(isFinal: true)
  public var POSITIVE_INFINITY: Int16

  @JavaStaticField(isFinal: true)
  public var POSITIVE_ZERO: Int16

  @JavaStaticField(isFinal: true)
  public var SIZE: Int32

  @JavaStaticMethod
  public func halfToShortBits(_ arg0: Int16) -> Int16

  @JavaStaticMethod
  public func halfToIntBits(_ arg0: Int16) -> Int32

  @JavaStaticMethod
  public func halfToRawIntBits(_ arg0: Int16) -> Int32

  @JavaStaticMethod
  public func intBitsToHalf(_ arg0: Int32) -> Int16

  @JavaStaticMethod
  public func trunc(_ arg0: Int16) -> Int16

  @JavaStaticMethod
  public func less(_ arg0: Int16, _ arg1: Int16) -> Bool

  @JavaStaticMethod
  public func lessEquals(_ arg0: Int16, _ arg1: Int16) -> Bool

  @JavaStaticMethod
  public func greater(_ arg0: Int16, _ arg1: Int16) -> Bool

  @JavaStaticMethod
  public func greaterEquals(_ arg0: Int16, _ arg1: Int16) -> Bool

  @JavaStaticMethod
  public func getSign(_ arg0: Int16) -> Int32

  @JavaStaticMethod
  public func getSignificand(_ arg0: Int16) -> Int32

  @JavaStaticMethod
  public func toFloat(_ arg0: Int16) -> Float

  @JavaStaticMethod
  public func toHalf(_ arg0: Float) -> Int16

  @JavaStaticMethod
  public func parseHalf(_ arg0: String) throws -> Int16

  @JavaStaticMethod
  public func equals(_ arg0: Int16, _ arg1: Int16) -> Bool

  @JavaStaticMethod
  public func toString(_ arg0: Int16) -> String

  @JavaStaticMethod
  public func hashCode(_ arg0: Int16) -> Int32

  @JavaStaticMethod
  public func abs(_ arg0: Int16) -> Int16

  @JavaStaticMethod
  public func min(_ arg0: Int16, _ arg1: Int16) -> Int16

  @JavaStaticMethod
  public func max(_ arg0: Int16, _ arg1: Int16) -> Int16

  @JavaStaticMethod
  public func floor(_ arg0: Int16) -> Int16

  @JavaStaticMethod
  public func ceil(_ arg0: Int16) -> Int16

  @JavaStaticMethod
  public func round(_ arg0: Int16) -> Int16

  @JavaStaticMethod
  public func copySign(_ arg0: Int16, _ arg1: Int16) -> Int16

  @JavaStaticMethod
  public func isInfinite(_ arg0: Int16) -> Bool

  @JavaStaticMethod
  public func compare(_ arg0: Int16, _ arg1: Int16) -> Int32

  @JavaStaticMethod
  public func valueOf(_ arg0: String) -> Half!

  @JavaStaticMethod
  public func valueOf(_ arg0: Float) -> Half!

  @JavaStaticMethod
  public func valueOf(_ arg0: Int16) -> Half!

  @JavaStaticMethod
  public func toHexString(_ arg0: Int16) -> String

  @JavaStaticMethod
  public func isNaN(_ arg0: Int16) -> Bool

  @JavaStaticMethod
  public func getExponent(_ arg0: Int16) -> Int32

  @JavaStaticMethod
  public func isNormalized(_ arg0: Int16) -> Bool
}
