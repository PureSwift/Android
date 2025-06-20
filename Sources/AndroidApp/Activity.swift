// Auto-generated by Java-to-Swift wrapper generator.
import JavaIO
import JavaLang
import AndroidContent
import JavaKit
import JavaKitCollection
import JavaRuntime

@JavaClass("android.app.Activity", implements: FragmentBreadCrumbs.OnCreateContextMenuListener.self)
open class Activity: ContextWrapper {
  
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func removeDialog(_ arg0: Int32)

  @JavaMethod
  open func closeContextMenu()

  @JavaMethod
  open func onAttachedToWindow()

  @JavaMethod
  open func openOptionsMenu()

  @JavaMethod
  open func stopLockTask()

  @JavaMethod
  open func setImmersive(_ arg0: Bool)

  @JavaMethod
  open func setTranslucent(_ arg0: Bool) -> Bool

  @JavaMethod
  open func runOnUiThread(_ arg0: Runnable?)

  @JavaMethod
  open func onTitleChanged(_ arg0: CharSequence?, _ arg1: Int32)

  @JavaMethod
  open func getLocalClassName() -> String

  @JavaMethod
  open func moveTaskToBack(_ arg0: Bool) -> Bool

  @JavaMethod
  open func getTaskId() -> Int32

  @JavaMethod
  open func releaseInstance() -> Bool

  @JavaMethod
  open func finishFromChild(_ arg0: Activity?)

  @JavaMethod
  open func recreate()

  @JavaMethod
  open func setVisible(_ arg0: Bool)

  @JavaMethod
  open func getCallingPackage() -> String

  @JavaMethod
  open func takeKeyEvents(_ arg0: Bool)

  @JavaMethod
  open func dismissDialog(_ arg0: Int32)

  @JavaMethod
  open func onPrepareDialog(_ arg0: Int32, _ arg1: Dialog?)

  @JavaMethod
  open func onNavigateUp() -> Bool

  @JavaMethod
  open func onBackPressed()

  @JavaMethod
  open func setContentView(_ arg0: Int32)

  @JavaMethod
  open func getActionBar() -> ActionBar!

  @JavaMethod
  open func onUserLeaveHint()

  @JavaMethod
  open func getVoiceInteractor() -> VoiceInteractor!

  @JavaMethod
  open func onPostResume()

  @JavaMethod
  open func onRestart()

  @JavaMethod
  open func getApplication() -> Application!

  @JavaMethod
  open func onTrimMemory(_ arg0: Int32)

  @JavaMethod
  open func onStop()

  @JavaMethod
  open func onAttachFragment(_ arg0: Fragment?)

  @JavaMethod
  open func requestPermissions(_ arg0: [String], _ arg1: Int32)

  @JavaMethod
  open func setTurnScreenOn(_ arg0: Bool)

  @JavaMethod
  open func setShowWhenLocked(_ arg0: Bool)

  @JavaMethod
  open func startLockTask()

  @JavaMethod
  open func isImmersive() -> Bool

  @JavaMethod
  open func setTaskDescription(_ arg0: ActivityManager.TaskDescription?)

  @JavaMethod
  open func getTitleColor() -> Int32

  @JavaMethod
  open func setTitleColor(_ arg0: Int32)

  @JavaMethod
  open func setTitle(_ arg0: CharSequence?)

  @JavaMethod
  open func setTitle(_ arg0: Int32)

  @JavaMethod
  open func isTaskRoot() -> Bool

  @JavaMethod
  open func finishActivity(_ arg0: Int32)

  @JavaMethod
  open func finishAffinity()

  @JavaMethod
  open func isFinishing() -> Bool

  @JavaMethod
  open func onSearchRequested() -> Bool

  @JavaMethod
  open func showDialog(_ arg0: Int32)

  @JavaMethod
  open func onCreateDialog(_ arg0: Int32) -> Dialog!

  @JavaMethod
  open func closeOptionsMenu()

  @JavaMethod
  open func hasWindowFocus() -> Bool

  @JavaMethod
  open func onUserInteraction()

  @JavaMethod
  open func setDefaultKeyMode(_ arg0: Int32)

  @JavaMethod
  open func reportFullyDrawn()

  @JavaMethod
  open func isVoiceInteraction() -> Bool

  @JavaMethod
  open func onStateNotSaved()

  @JavaMethod
  open func isChild() -> Bool

  @JavaMethod
  open func onLowMemory()

  @JavaMethod
  open func onPause()

  @JavaMethod
  open func onResume()

  @JavaMethod
  open func onRequestPermissionsResult(_ arg0: Int32, _ arg1: [String], _ arg2: [Int32])

  @JavaMethod
  open func shouldShowRequestPermissionRationale(_ arg0: String) -> Bool

  @JavaMethod
  open func onMultiWindowModeChanged(_ arg0: Bool)

  @JavaMethod
  open func onPictureInPictureModeChanged(_ arg0: Bool)

  @JavaMethod
  open func setEnterSharedElementCallback(_ arg0: SharedElementCallback?)

  @JavaMethod
  open func setExitSharedElementCallback(_ arg0: SharedElementCallback?)

  @JavaMethod
  open func postponeEnterTransition()

  @JavaMethod
  open func startPostponedEnterTransition()

  @JavaMethod
  open func registerActivityLifecycleCallbacks(_ arg0: Application.ActivityLifecycleCallbacks?)

  @JavaMethod
  open func unregisterActivityLifecycleCallbacks(_ arg0: Application.ActivityLifecycleCallbacks?)

  @JavaMethod
  open func onTopResumedActivityChanged(_ arg0: Bool)

  @JavaMethod
  open func isVoiceInteractionRoot() -> Bool

  @JavaMethod
  open func isLocalVoiceInteractionSupported() -> Bool

  @JavaMethod
  open func onLocalVoiceInteractionStarted()

  @JavaMethod
  open func onLocalVoiceInteractionStopped()

  @JavaMethod
  open func stopLocalVoiceInteraction()

  @JavaMethod
  open func onCreateDescription() -> CharSequence!

  @JavaMethod
  open func onProvideAssistContent(_ arg0: AssistContent?)

  @JavaMethod
  open func requestShowKeyboardShortcuts()

  @JavaMethod
  open func dismissKeyboardShortcutsHelper()

  @JavaMethod
  open func onPictureInPictureUiStateChanged(_ arg0: PictureInPictureUiState?)

  @JavaMethod
  open func enterPictureInPictureMode(_ arg0: PictureInPictureParams?) -> Bool

  @JavaMethod
  open func enterPictureInPictureMode()

  @JavaMethod
  open func setPictureInPictureParams(_ arg0: PictureInPictureParams?)

  @JavaMethod
  open func getMaxNumPictureInPictureActions() -> Int32

  @JavaMethod
  open func onPictureInPictureRequested() -> Bool

  @JavaMethod
  open func setShouldDockBigOverlays(_ arg0: Bool)

  @JavaMethod
  open func shouldDockBigOverlays() -> Bool

  @JavaMethod
  open func getChangingConfigurations() -> Int32

  @JavaMethod
  open func getLastNonConfigurationInstance() -> JavaObject!

  @JavaMethod
  open func onRetainNonConfigurationInstance() -> JavaObject!

  @JavaMethod
  open func setFinishOnTouchOutside(_ arg0: Bool)

  @JavaMethod
  open func onWindowFocusChanged(_ arg0: Bool)

  @JavaMethod
  open func onDetachedFromWindow()

  @JavaMethod
  open func invalidateOptionsMenu()

  @JavaMethod
  open func onNavigateUpFromChild(_ arg0: Activity?) -> Bool

  @JavaMethod
  open func onCreateNavigateUpTaskStack(_ arg0: TaskStackBuilder?)

  @JavaMethod
  open func onPrepareNavigateUpTaskStack(_ arg0: TaskStackBuilder?)

  @JavaMethod
  open func requestWindowFeature(_ arg0: Int32) -> Bool

  @JavaMethod
  open func setFeatureDrawableResource(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func setFeatureDrawableAlpha(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func isActivityTransitionRunning() -> Bool

  @JavaMethod
  open func overridePendingTransition(_ arg0: Int32, _ arg1: Int32, _ arg2: Int32)

  @JavaMethod
  open func overridePendingTransition(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func isChangingConfigurations() -> Bool

  @JavaMethod
  open func finishAfterTransition()

  @JavaMethod
  open func finishActivityFromChild(_ arg0: Activity?, _ arg1: Int32)

  @JavaMethod
  open func finishAndRemoveTask()

  @JavaMethod
  open func setRequestedOrientation(_ arg0: Int32)

  @JavaMethod
  open func getRequestedOrientation() -> Int32

  @JavaMethod
  open func isLaunchedFromBubble() -> Bool

  @JavaMethod
  open func setProgressBarVisibility(_ arg0: Bool)

  @JavaMethod
  open func setProgressBarIndeterminateVisibility(_ arg0: Bool)

  @JavaMethod
  open func setProgressBarIndeterminate(_ arg0: Bool)

  @JavaMethod
  open func setSecondaryProgress(_ arg0: Int32)

  @JavaMethod
  open func setVolumeControlStream(_ arg0: Int32)

  @JavaMethod
  open func getVolumeControlStream() -> Int32

  @JavaMethod
  open func requestVisibleBehind(_ arg0: Bool) -> Bool

  @JavaMethod
  open func onVisibleBehindCanceled()

  @JavaMethod
  open func onEnterAnimationComplete()

  @JavaMethod
  open func showLockTaskEscapeMessage()

  @JavaMethod
  open func setRecentsScreenshotEnabled(_ arg0: Bool)

  @JavaMethod
  open func setInheritShowWhenLocked(_ arg0: Bool)

  @JavaMethod
  open func onDestroy()

  @JavaMethod
  open override func setTheme(_ arg0: Int32)

  @JavaMethod
  open override func getSystemService(_ arg0: String) -> JavaObject!

  @JavaMethod
  open func getTitle() -> CharSequence!

  @JavaMethod
  open func getFragmentManager() -> FragmentManager!

  @JavaMethod
  open func getLoaderManager() -> LoaderManager!

  @JavaMethod
  open func isInMultiWindowMode() -> Bool

  @JavaMethod
  open func isInPictureInPictureMode() -> Bool

  @JavaMethod
  open func onContentChanged()

  @JavaMethod
  open func onChildTitleChanged(_ arg0: Activity?, _ arg1: CharSequence?)

  @JavaMethod
  open func setProgress(_ arg0: Int32)

  @JavaMethod
  open func getParent() -> Activity!

  @JavaMethod
  open func onStart()

  @JavaMethod
  open func isDestroyed() -> Bool

  @JavaMethod
  open func finish()

  @JavaMethod
  open func dump(_ arg0: String, _ arg1: FileDescriptor?, _ arg2: PrintWriter?, _ arg3: [String])

  @JavaMethod
  open func setResult(_ arg0: Int32)
}
extension JavaClass<Activity> {
  @JavaStaticField(isFinal: true)
  public var DEFAULT_KEYS_DIALER: Int32

  @JavaStaticField(isFinal: true)
  public var DEFAULT_KEYS_DISABLE: Int32

  @JavaStaticField(isFinal: true)
  public var DEFAULT_KEYS_SEARCH_GLOBAL: Int32

  @JavaStaticField(isFinal: true)
  public var DEFAULT_KEYS_SEARCH_LOCAL: Int32

  @JavaStaticField(isFinal: true)
  public var DEFAULT_KEYS_SHORTCUT: Int32

  @JavaStaticField(isFinal: true)
  public var RESULT_CANCELED: Int32

  @JavaStaticField(isFinal: true)
  public var RESULT_FIRST_USER: Int32

  @JavaStaticField(isFinal: true)
  public var RESULT_OK: Int32

  @JavaStaticField(isFinal: true)
  public var TRIM_MEMORY_BACKGROUND: Int32

  @JavaStaticField(isFinal: true)
  public var TRIM_MEMORY_COMPLETE: Int32

  @JavaStaticField(isFinal: true)
  public var TRIM_MEMORY_MODERATE: Int32

  @JavaStaticField(isFinal: true)
  public var TRIM_MEMORY_RUNNING_CRITICAL: Int32

  @JavaStaticField(isFinal: true)
  public var TRIM_MEMORY_RUNNING_LOW: Int32

  @JavaStaticField(isFinal: true)
  public var TRIM_MEMORY_RUNNING_MODERATE: Int32

  @JavaStaticField(isFinal: true)
  public var TRIM_MEMORY_UI_HIDDEN: Int32

  @JavaStaticField(isFinal: true)
  public var ACCESSIBILITY_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var ACCOUNT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var ACTIVITY_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var ALARM_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var APPWIDGET_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var APP_OPS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var APP_SEARCH_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var AUDIO_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var BATTERY_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var BIND_ABOVE_CLIENT: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_ADJUST_WITH_ACTIVITY: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_ALLOW_OOM_MANAGEMENT: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_AUTO_CREATE: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_DEBUG_UNBIND: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_EXTERNAL_SERVICE: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_IMPORTANT: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_INCLUDE_CAPABILITIES: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_NOT_FOREGROUND: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_NOT_PERCEPTIBLE: Int32

  @JavaStaticField(isFinal: true)
  public var BIND_WAIVE_PRIORITY: Int32

  @JavaStaticField(isFinal: true)
  public var BIOMETRIC_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var BLOB_STORE_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var BLUETOOTH_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var BUGREPORT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var CAMERA_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var CAPTIONING_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var CARRIER_CONFIG_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var CLIPBOARD_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var COMPANION_DEVICE_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var CONNECTIVITY_DIAGNOSTICS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var CONNECTIVITY_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var CONSUMER_IR_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var CONTEXT_IGNORE_SECURITY: Int32

  @JavaStaticField(isFinal: true)
  public var CONTEXT_INCLUDE_CODE: Int32

  @JavaStaticField(isFinal: true)
  public var CONTEXT_RESTRICTED: Int32

  @JavaStaticField(isFinal: true)
  public var CROSS_PROFILE_APPS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var DEVICE_POLICY_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var DISPLAY_HASH_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var DISPLAY_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var DOMAIN_VERIFICATION_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var DOWNLOAD_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var DROPBOX_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var EUICC_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var FILE_INTEGRITY_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var FINGERPRINT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var GAME_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var HARDWARE_PROPERTIES_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var INPUT_METHOD_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var INPUT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var IPSEC_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var JOB_SCHEDULER_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var KEYGUARD_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var LAUNCHER_APPS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var LAYOUT_INFLATER_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var LOCALE_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var LOCATION_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_COMMUNICATION_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_METRICS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_PROJECTION_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_ROUTER_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_SESSION_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var MIDI_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var MODE_APPEND: Int32

  @JavaStaticField(isFinal: true)
  public var MODE_ENABLE_WRITE_AHEAD_LOGGING: Int32

  @JavaStaticField(isFinal: true)
  public var MODE_MULTI_PROCESS: Int32

  @JavaStaticField(isFinal: true)
  public var MODE_NO_LOCALIZED_COLLATORS: Int32

  @JavaStaticField(isFinal: true)
  public var MODE_PRIVATE: Int32

  @JavaStaticField(isFinal: true)
  public var MODE_WORLD_READABLE: Int32

  @JavaStaticField(isFinal: true)
  public var MODE_WORLD_WRITEABLE: Int32

  @JavaStaticField(isFinal: true)
  public var NETWORK_STATS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var NFC_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var NOTIFICATION_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var NSD_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var PEOPLE_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var PERFORMANCE_HINT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var POWER_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var PRINT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var RECEIVER_EXPORTED: Int32

  @JavaStaticField(isFinal: true)
  public var RECEIVER_NOT_EXPORTED: Int32

  @JavaStaticField(isFinal: true)
  public var RECEIVER_VISIBLE_TO_INSTANT_APPS: Int32

  @JavaStaticField(isFinal: true)
  public var RESTRICTIONS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var ROLE_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var SEARCH_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var SENSOR_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var SHORTCUT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var STATUS_BAR_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var STORAGE_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var STORAGE_STATS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var SYSTEM_HEALTH_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var TELECOM_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var TELEPHONY_IMS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var TELEPHONY_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var TELEPHONY_SUBSCRIPTION_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var TEXT_CLASSIFICATION_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var TEXT_SERVICES_MANAGER_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var TV_INPUT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var TV_INTERACTIVE_APP_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var UI_MODE_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var USAGE_STATS_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var USB_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var USER_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var VIBRATOR_MANAGER_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var VIBRATOR_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var VPN_MANAGEMENT_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var WALLPAPER_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var WIFI_AWARE_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var WIFI_P2P_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var WIFI_RTT_RANGING_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var WIFI_SERVICE: String

  @JavaStaticField(isFinal: true)
  public var WINDOW_SERVICE: String
}
