// Auto-generated by Java-to-Swift wrapper generator.
import JavaTime
import JavaKit
import JavaRuntime

@JavaClass("android.os.PowerManager")
open class PowerManager: JavaObject {
  @JavaMethod
  open func newWakeLock(_ arg0: Int32, _ arg1: String) -> PowerManager.WakeLock!

  @JavaMethod
  open func isWakeLockLevelSupported(_ arg0: Int32) -> Bool

  @JavaMethod
  open func isScreenOn() -> Bool

  @JavaMethod
  open func isInteractive() -> Bool

  @JavaMethod
  open func isRebootingUserspaceSupported() -> Bool

  @JavaMethod
  open func reboot(_ arg0: String)

  @JavaMethod
  open func isPowerSaveMode() -> Bool

  @JavaMethod
  open func getBatteryDischargePrediction() -> Duration!

  @JavaMethod
  open func isBatteryDischargePredictionPersonalized() -> Bool

  @JavaMethod
  open func getLocationPowerSaveMode() -> Int32

  @JavaMethod
  open func isDeviceIdleMode() -> Bool

  @JavaMethod
  open func isDeviceLightIdleMode() -> Bool

  @JavaMethod
  open func isLowPowerStandbyEnabled() -> Bool

  @JavaMethod
  open func isIgnoringBatteryOptimizations(_ arg0: String) -> Bool

  @JavaMethod
  open func isSustainedPerformanceModeSupported() -> Bool

  @JavaMethod
  open func getCurrentThermalStatus() -> Int32

  @JavaMethod
  open func addThermalStatusListener(_ arg0: PowerManager.OnThermalStatusChangedListener?)

  @JavaMethod
  open func removeThermalStatusListener(_ arg0: PowerManager.OnThermalStatusChangedListener?)

  @JavaMethod
  open func getThermalHeadroom(_ arg0: Int32) -> Float
}
extension JavaClass<PowerManager> {
  @JavaStaticField(isFinal: true)
  public var ACQUIRE_CAUSES_WAKEUP: Int32

  @JavaStaticField(isFinal: true)
  public var ACTION_DEVICE_IDLE_MODE_CHANGED: String

  @JavaStaticField(isFinal: true)
  public var ACTION_DEVICE_LIGHT_IDLE_MODE_CHANGED: String

  @JavaStaticField(isFinal: true)
  public var ACTION_LOW_POWER_STANDBY_ENABLED_CHANGED: String

  @JavaStaticField(isFinal: true)
  public var ACTION_POWER_SAVE_MODE_CHANGED: String

  @JavaStaticField(isFinal: true)
  public var FULL_WAKE_LOCK: Int32

  @JavaStaticField(isFinal: true)
  public var LOCATION_MODE_ALL_DISABLED_WHEN_SCREEN_OFF: Int32

  @JavaStaticField(isFinal: true)
  public var LOCATION_MODE_FOREGROUND_ONLY: Int32

  @JavaStaticField(isFinal: true)
  public var LOCATION_MODE_GPS_DISABLED_WHEN_SCREEN_OFF: Int32

  @JavaStaticField(isFinal: true)
  public var LOCATION_MODE_NO_CHANGE: Int32

  @JavaStaticField(isFinal: true)
  public var LOCATION_MODE_THROTTLE_REQUESTS_WHEN_SCREEN_OFF: Int32

  @JavaStaticField(isFinal: true)
  public var ON_AFTER_RELEASE: Int32

  @JavaStaticField(isFinal: true)
  public var PARTIAL_WAKE_LOCK: Int32

  @JavaStaticField(isFinal: true)
  public var PROXIMITY_SCREEN_OFF_WAKE_LOCK: Int32

  @JavaStaticField(isFinal: true)
  public var RELEASE_FLAG_WAIT_FOR_NO_PROXIMITY: Int32

  @JavaStaticField(isFinal: true)
  public var SCREEN_BRIGHT_WAKE_LOCK: Int32

  @JavaStaticField(isFinal: true)
  public var SCREEN_DIM_WAKE_LOCK: Int32

  @JavaStaticField(isFinal: true)
  public var THERMAL_STATUS_CRITICAL: Int32

  @JavaStaticField(isFinal: true)
  public var THERMAL_STATUS_EMERGENCY: Int32

  @JavaStaticField(isFinal: true)
  public var THERMAL_STATUS_LIGHT: Int32

  @JavaStaticField(isFinal: true)
  public var THERMAL_STATUS_MODERATE: Int32

  @JavaStaticField(isFinal: true)
  public var THERMAL_STATUS_NONE: Int32

  @JavaStaticField(isFinal: true)
  public var THERMAL_STATUS_SEVERE: Int32

  @JavaStaticField(isFinal: true)
  public var THERMAL_STATUS_SHUTDOWN: Int32
}
