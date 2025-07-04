// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("android.animation.ValueAnimator")
open class ValueAnimator: Animator {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func setIntValues(_ arg0: [Int32])

  @JavaMethod
  open func setFloatValues(_ arg0: [Float])

  @JavaMethod
  open func setObjectValues(_ arg0: [JavaObject?])

  @JavaMethod
  open func setEvaluator(_ arg0: TypeEvaluator?)

  @JavaMethod
  open override func setDuration(_ arg0: Int64) -> ValueAnimator!

  @JavaMethod
  open override func setStartDelay(_ arg0: Int64)

  @JavaMethod
  open override func getStartDelay() -> Int64

  @JavaMethod
  open override func setInterpolator(_ arg0: TimeInterpolator?)

  @JavaMethod
  open override func getInterpolator() -> TimeInterpolator!

  @JavaMethod
  open override func isRunning() -> Bool

  @JavaMethod
  open override func pause()

  @JavaMethod
  open override func resume()

  @JavaMethod
  open func setCurrentPlayTime(_ arg0: Int64)

  @JavaMethod
  open func getCurrentPlayTime() -> Int64

  @JavaMethod
  open override func getTotalDuration() -> Int64

  @JavaMethod
  open func setValues(_ arg0: [PropertyValuesHolder?])

  @JavaMethod
  open func getValues() -> [PropertyValuesHolder?]

  @JavaMethod
  open func setCurrentFraction(_ arg0: Float)

  @JavaMethod
  open func getAnimatedValue() -> JavaObject!

  @JavaMethod
  open func getAnimatedValue(_ arg0: String) -> JavaObject!

  @JavaMethod
  open func setRepeatCount(_ arg0: Int32)

  @JavaMethod
  open func getRepeatCount() -> Int32

  @JavaMethod
  open func setRepeatMode(_ arg0: Int32)

  @JavaMethod
  open func getRepeatMode() -> Int32

  @JavaMethod
  open func addUpdateListener(_ arg0: ValueAnimator.AnimatorUpdateListener?)

  @JavaMethod
  open func removeAllUpdateListeners()

  @JavaMethod
  open func removeUpdateListener(_ arg0: ValueAnimator.AnimatorUpdateListener?)

  @JavaMethod
  open func getAnimatedFraction() -> Float

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open override func clone() -> ValueAnimator!

  @JavaMethod
  open func reverse()

  @JavaMethod
  open override func end()

  @JavaMethod
  open override func start()

  @JavaMethod
  open override func cancel()

  @JavaMethod
  open override func isStarted() -> Bool

  @JavaMethod
  open override func getDuration() -> Int64
}
extension JavaClass<ValueAnimator> {
  @JavaStaticField(isFinal: true)
  public var INFINITE: Int32

  @JavaStaticField(isFinal: true)
  public var RESTART: Int32

  @JavaStaticField(isFinal: true)
  public var REVERSE: Int32

  @JavaStaticField(isFinal: true)
  public var DURATION_INFINITE: Int64

  @JavaStaticMethod
  public func ofObject(_ arg0: TypeEvaluator?, _ arg1: [JavaObject?]) -> ValueAnimator!

  @JavaStaticMethod
  public func ofArgb(_ arg0: [Int32]) -> ValueAnimator!

  @JavaStaticMethod
  public func ofPropertyValuesHolder(_ arg0: [PropertyValuesHolder?]) -> ValueAnimator!

  @JavaStaticMethod
  public func getDurationScale() -> Float

  @JavaStaticMethod
  public func registerDurationScaleChangeListener(_ arg0: ValueAnimator.DurationScaleChangeListener?) -> Bool

  @JavaStaticMethod
  public func unregisterDurationScaleChangeListener(_ arg0: ValueAnimator.DurationScaleChangeListener?) -> Bool

  @JavaStaticMethod
  public func areAnimatorsEnabled() -> Bool

  @JavaStaticMethod
  public func getFrameDelay() -> Int64

  @JavaStaticMethod
  public func setFrameDelay(_ arg0: Int64)

  @JavaStaticMethod
  public func ofInt(_ arg0: [Int32]) -> ValueAnimator!

  @JavaStaticMethod
  public func ofFloat(_ arg0: [Float]) -> ValueAnimator!
}
