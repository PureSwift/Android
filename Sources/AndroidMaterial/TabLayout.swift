// Auto-generated by Java-to-Swift wrapper generator.
import AndroidContent
import AndroidGraphics
import AndroidUtil
import AndroidView
import AndroidWidget
import JavaKit
import JavaRuntime

@JavaClass("com.google.android.material.tabs.TabLayout")
open class TabLayout: HorizontalScrollView {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Context?, _ arg1: AttributeSet?, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Context?, _ arg1: AttributeSet?, _ arg2: Int32, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Context?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open override func addView(_ arg0: View?)

  @JavaMethod
  open override func addView(_ arg0: View?, _ arg1: Int32)

  @JavaMethod
  open override func addView(_ arg0: View?, _ arg1: Int32, _ arg2: ViewGroup.LayoutParams?)

  @JavaMethod
  open override func addView(_ arg0: View?, _ arg1: ViewGroup.LayoutParams?)

  @JavaMethod
  open override func onMeasure(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func generateLayoutParams(_ arg0: AttributeSet?) -> FrameLayout.LayoutParams!

  @JavaMethod
  open override func shouldDelayChildPressedState() -> Bool

  @JavaMethod
  open override func onDraw(_ arg0: Canvas?)

  @JavaMethod
  open override func onInterceptTouchEvent(_ arg0: MotionEvent?) -> Bool

  @JavaMethod
  open override func onAttachedToWindow()

  @JavaMethod
  open override func onDetachedFromWindow()

  @JavaMethod
  open override func onTouchEvent(_ arg0: MotionEvent?) -> Bool

  @JavaMethod
  open override func setElevation(_ arg0: Float)

  @JavaMethod
  open func setSelectedTabIndicatorColor(_ arg0: Int32)

  @JavaMethod
  open func setSelectedTabIndicatorHeight(_ arg0: Int32)

  @JavaMethod
  open func setScrollPosition(_ arg0: Int32, _ arg1: Float, _ arg2: Bool, _ arg3: Bool)

  @JavaMethod
  open func setScrollPosition(_ arg0: Int32, _ arg1: Float, _ arg2: Bool)

  @JavaMethod
  open func addTab(_ arg0: TabLayout.Tab?)

  @JavaMethod
  open func addTab(_ arg0: TabLayout.Tab?, _ arg1: Bool)

  @JavaMethod
  open func addTab(_ arg0: TabLayout.Tab?, _ arg1: Int32, _ arg2: Bool)

  @JavaMethod
  open func addTab(_ arg0: TabLayout.Tab?, _ arg1: Int32)

  @JavaMethod
  open func setOnTabSelectedListener(_ arg0: TabLayout.OnTabSelectedListener?)

  @JavaMethod
  open func addOnTabSelectedListener(_ arg0: TabLayout.OnTabSelectedListener?)

  @JavaMethod
  open func removeOnTabSelectedListener(_ arg0: TabLayout.OnTabSelectedListener?)

  @JavaMethod
  open func clearOnTabSelectedListeners()

  @JavaMethod
  open func createTabFromPool() -> TabLayout.Tab!

  @JavaMethod
  open func releaseFromTabPool(_ arg0: TabLayout.Tab?) -> Bool

  @JavaMethod
  open func getTabCount() -> Int32

  @JavaMethod
  open func getTabAt(_ arg0: Int32) -> TabLayout.Tab!

  @JavaMethod
  open func getSelectedTabPosition() -> Int32

  @JavaMethod
  open func removeTab(_ arg0: TabLayout.Tab?)

  @JavaMethod
  open func removeTabAt(_ arg0: Int32)

  @JavaMethod
  open func removeAllTabs()

  @JavaMethod
  open func setTabMode(_ arg0: Int32)

  @JavaMethod
  open func getTabMode() -> Int32

  @JavaMethod
  open func setTabGravity(_ arg0: Int32)

  @JavaMethod
  open func getTabGravity() -> Int32

  @JavaMethod
  open func setSelectedTabIndicatorGravity(_ arg0: Int32)

  @JavaMethod
  open func getTabIndicatorGravity() -> Int32

  @JavaMethod
  open func setTabIndicatorAnimationMode(_ arg0: Int32)

  @JavaMethod
  open func getTabIndicatorAnimationMode() -> Int32

  @JavaMethod
  open func setTabIndicatorFullWidth(_ arg0: Bool)

  @JavaMethod
  open func isTabIndicatorFullWidth() -> Bool

  @JavaMethod
  open func setInlineLabel(_ arg0: Bool)

  @JavaMethod
  open func setInlineLabelResource(_ arg0: Int32)

  @JavaMethod
  open func isInlineLabel() -> Bool

  @JavaMethod
  open func setUnboundedRipple(_ arg0: Bool)

  @JavaMethod
  open func setUnboundedRippleResource(_ arg0: Int32)

  @JavaMethod
  open func hasUnboundedRipple() -> Bool

  @JavaMethod
  open func setTabTextColors(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func setTabTextColors(_ arg0: ColorStateList?)

  @JavaMethod
  open func getTabTextColors() -> ColorStateList!

  @JavaMethod
  open func setTabIconTint(_ arg0: ColorStateList?)

  @JavaMethod
  open func setTabIconTintResource(_ arg0: Int32)

  @JavaMethod
  open func getTabIconTint() -> ColorStateList!

  @JavaMethod
  open func getTabRippleColor() -> ColorStateList!

  @JavaMethod
  open func setTabRippleColor(_ arg0: ColorStateList?)

  @JavaMethod
  open func setTabRippleColorResource(_ arg0: Int32)

  @JavaMethod
  open func getTabSelectedIndicator() -> Drawable!

  @JavaMethod
  open func setSelectedTabIndicator(_ arg0: Int32)

  @JavaMethod
  open func setSelectedTabIndicator(_ arg0: Drawable?)

  @JavaMethod
  open func selectTab(_ arg0: TabLayout.Tab?, _ arg1: Bool)

  @JavaMethod
  open func selectTab(_ arg0: TabLayout.Tab?)

  @JavaMethod
  open func newTab() -> TabLayout.Tab!
}
extension JavaClass<TabLayout> {
  @JavaStaticField(isFinal: true)
  public var MODE_SCROLLABLE: Int32

  @JavaStaticField(isFinal: true)
  public var MODE_FIXED: Int32

  @JavaStaticField(isFinal: true)
  public var MODE_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var TAB_LABEL_VISIBILITY_UNLABELED: Int32

  @JavaStaticField(isFinal: true)
  public var TAB_LABEL_VISIBILITY_LABELED: Int32

  @JavaStaticField(isFinal: true)
  public var GRAVITY_FILL: Int32

  @JavaStaticField(isFinal: true)
  public var GRAVITY_CENTER: Int32

  @JavaStaticField(isFinal: true)
  public var GRAVITY_START: Int32

  @JavaStaticField(isFinal: true)
  public var INDICATOR_GRAVITY_BOTTOM: Int32

  @JavaStaticField(isFinal: true)
  public var INDICATOR_GRAVITY_CENTER: Int32

  @JavaStaticField(isFinal: true)
  public var INDICATOR_GRAVITY_TOP: Int32

  @JavaStaticField(isFinal: true)
  public var INDICATOR_GRAVITY_STRETCH: Int32

  @JavaStaticField(isFinal: true)
  public var INDICATOR_ANIMATION_MODE_LINEAR: Int32

  @JavaStaticField(isFinal: true)
  public var INDICATOR_ANIMATION_MODE_ELASTIC: Int32

  @JavaStaticField(isFinal: true)
  public var INDICATOR_ANIMATION_MODE_FADE: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_AFTER_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_BEFORE_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_BLOCK_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var LAYOUT_MODE_CLIP_BOUNDS: Int32

  @JavaStaticField(isFinal: true)
  public var LAYOUT_MODE_OPTICAL_BOUNDS: Int32

  @JavaStaticField(isFinal: true)
  public var PERSISTENT_ALL_CACHES: Int32

  @JavaStaticField(isFinal: true)
  public var PERSISTENT_ANIMATION_CACHE: Int32

  @JavaStaticField(isFinal: true)
  public var PERSISTENT_NO_CACHE: Int32

  @JavaStaticField(isFinal: true)
  public var PERSISTENT_SCROLLING_CACHE: Int32

  @JavaStaticField(isFinal: true)
  public var ACCESSIBILITY_DATA_SENSITIVE_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var ACCESSIBILITY_DATA_SENSITIVE_NO: Int32

  @JavaStaticField(isFinal: true)
  public var ACCESSIBILITY_DATA_SENSITIVE_YES: Int32

  @JavaStaticField(isFinal: true)
  public var ACCESSIBILITY_LIVE_REGION_ASSERTIVE: Int32

  @JavaStaticField(isFinal: true)
  public var ACCESSIBILITY_LIVE_REGION_NONE: Int32

  @JavaStaticField(isFinal: true)
  public var ACCESSIBILITY_LIVE_REGION_POLITE: Int32

  @JavaStaticField(isFinal: true)
  public var ALPHA: Property!

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_FLAG_INCLUDE_NOT_IMPORTANT_VIEWS: Int32

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DATE: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DAY: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_MONTH: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_YEAR: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_CREDIT_CARD_NUMBER: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_CREDIT_CARD_SECURITY_CODE: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_EMAIL_ADDRESS: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_NAME: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_PASSWORD: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_PHONE: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_POSTAL_ADDRESS: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_POSTAL_CODE: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_HINT_USERNAME: String

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_TYPE_DATE: Int32

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_TYPE_LIST: Int32

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_TYPE_NONE: Int32

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_TYPE_TEXT: Int32

  @JavaStaticField(isFinal: true)
  public var AUTOFILL_TYPE_TOGGLE: Int32

  @JavaStaticField(isFinal: true)
  public var CONTENT_SENSITIVITY_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var CONTENT_SENSITIVITY_NOT_SENSITIVE: Int32

  @JavaStaticField(isFinal: true)
  public var CONTENT_SENSITIVITY_SENSITIVE: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_ACCESSIBILITY_ACTION: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_GLOBAL: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_GLOBAL_PERSISTABLE_URI_PERMISSION: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_GLOBAL_PREFIX_URI_PERMISSION: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_GLOBAL_SAME_APPLICATION: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_GLOBAL_URI_READ: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_GLOBAL_URI_WRITE: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_OPAQUE: Int32

  @JavaStaticField(isFinal: true)
  public var DRAG_FLAG_START_INTENT_SENDER_ON_UNHANDLED_DRAG: Int32

  @JavaStaticField(isFinal: true)
  public var DRAWING_CACHE_QUALITY_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var DRAWING_CACHE_QUALITY_HIGH: Int32

  @JavaStaticField(isFinal: true)
  public var DRAWING_CACHE_QUALITY_LOW: Int32

  @JavaStaticField(isFinal: true)
  public var FIND_VIEWS_WITH_CONTENT_DESCRIPTION: Int32

  @JavaStaticField(isFinal: true)
  public var FIND_VIEWS_WITH_TEXT: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUSABLE: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUSABLES_ALL: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUSABLES_TOUCH_MODE: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUSABLE_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_BACKWARD: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_DOWN: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_FORWARD: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_LEFT: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_RIGHT: Int32

  @JavaStaticField(isFinal: true)
  public var FOCUS_UP: Int32

  @JavaStaticField(isFinal: true)
  public var GONE: Int32

  @JavaStaticField(isFinal: true)
  public var HAPTIC_FEEDBACK_ENABLED: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_ACCESSIBILITY_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_ACCESSIBILITY_NO: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_ACCESSIBILITY_YES: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_AUTOFILL_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_AUTOFILL_NO: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_AUTOFILL_YES: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_AUTOFILL_YES_EXCLUDE_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_CONTENT_CAPTURE_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_CONTENT_CAPTURE_NO: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_CONTENT_CAPTURE_NO_EXCLUDE_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_CONTENT_CAPTURE_YES: Int32

  @JavaStaticField(isFinal: true)
  public var IMPORTANT_FOR_CONTENT_CAPTURE_YES_EXCLUDE_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var INVISIBLE: Int32

  @JavaStaticField(isFinal: true)
  public var KEEP_SCREEN_ON: Int32

  @JavaStaticField(isFinal: true)
  public var LAYER_TYPE_HARDWARE: Int32

  @JavaStaticField(isFinal: true)
  public var LAYER_TYPE_NONE: Int32

  @JavaStaticField(isFinal: true)
  public var LAYER_TYPE_SOFTWARE: Int32

  @JavaStaticField(isFinal: true)
  public var LAYOUT_DIRECTION_INHERIT: Int32

  @JavaStaticField(isFinal: true)
  public var LAYOUT_DIRECTION_LOCALE: Int32

  @JavaStaticField(isFinal: true)
  public var LAYOUT_DIRECTION_LTR: Int32

  @JavaStaticField(isFinal: true)
  public var LAYOUT_DIRECTION_RTL: Int32

  @JavaStaticField(isFinal: true)
  public var MEASURED_HEIGHT_STATE_SHIFT: Int32

  @JavaStaticField(isFinal: true)
  public var MEASURED_SIZE_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var MEASURED_STATE_MASK: Int32

  @JavaStaticField(isFinal: true)
  public var MEASURED_STATE_TOO_SMALL: Int32

  @JavaStaticField(isFinal: true)
  public var NOT_FOCUSABLE: Int32

  @JavaStaticField(isFinal: true)
  public var NO_ID: Int32

  @JavaStaticField(isFinal: true)
  public var OVER_SCROLL_ALWAYS: Int32

  @JavaStaticField(isFinal: true)
  public var OVER_SCROLL_IF_CONTENT_SCROLLS: Int32

  @JavaStaticField(isFinal: true)
  public var OVER_SCROLL_NEVER: Int32

  @JavaStaticField(isFinal: true)
  public var REQUESTED_FRAME_RATE_CATEGORY_DEFAULT: Float

  @JavaStaticField(isFinal: true)
  public var REQUESTED_FRAME_RATE_CATEGORY_HIGH: Float

  @JavaStaticField(isFinal: true)
  public var REQUESTED_FRAME_RATE_CATEGORY_LOW: Float

  @JavaStaticField(isFinal: true)
  public var REQUESTED_FRAME_RATE_CATEGORY_NORMAL: Float

  @JavaStaticField(isFinal: true)
  public var REQUESTED_FRAME_RATE_CATEGORY_NO_PREFERENCE: Float

  @JavaStaticField(isFinal: true)
  public var ROTATION: Property!

  @JavaStaticField(isFinal: true)
  public var ROTATION_X: Property!

  @JavaStaticField(isFinal: true)
  public var ROTATION_Y: Property!

  @JavaStaticField(isFinal: true)
  public var SCALE_X: Property!

  @JavaStaticField(isFinal: true)
  public var SCALE_Y: Property!

  @JavaStaticField(isFinal: true)
  public var SCREEN_STATE_OFF: Int32

  @JavaStaticField(isFinal: true)
  public var SCREEN_STATE_ON: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLLBARS_INSIDE_INSET: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLLBARS_INSIDE_OVERLAY: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLLBARS_OUTSIDE_INSET: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLLBARS_OUTSIDE_OVERLAY: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLLBAR_POSITION_DEFAULT: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLLBAR_POSITION_LEFT: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLLBAR_POSITION_RIGHT: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_AXIS_HORIZONTAL: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_AXIS_NONE: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_AXIS_VERTICAL: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_CAPTURE_HINT_AUTO: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_CAPTURE_HINT_EXCLUDE: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_CAPTURE_HINT_EXCLUDE_DESCENDANTS: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_CAPTURE_HINT_INCLUDE: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_INDICATOR_BOTTOM: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_INDICATOR_END: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_INDICATOR_LEFT: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_INDICATOR_RIGHT: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_INDICATOR_START: Int32

  @JavaStaticField(isFinal: true)
  public var SCROLL_INDICATOR_TOP: Int32

  @JavaStaticField(isFinal: true)
  public var SOUND_EFFECTS_ENABLED: Int32

  @JavaStaticField(isFinal: true)
  public var STATUS_BAR_HIDDEN: Int32

  @JavaStaticField(isFinal: true)
  public var STATUS_BAR_VISIBLE: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_FULLSCREEN: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_HIDE_NAVIGATION: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_IMMERSIVE: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_IMMERSIVE_STICKY: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_LAYOUT_STABLE: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_LIGHT_STATUS_BAR: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_LOW_PROFILE: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_FLAG_VISIBLE: Int32

  @JavaStaticField(isFinal: true)
  public var SYSTEM_UI_LAYOUT_FLAGS: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_ALIGNMENT_CENTER: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_ALIGNMENT_GRAVITY: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_ALIGNMENT_INHERIT: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_ALIGNMENT_TEXT_END: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_ALIGNMENT_TEXT_START: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_ALIGNMENT_VIEW_END: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_ALIGNMENT_VIEW_START: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_DIRECTION_ANY_RTL: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_DIRECTION_FIRST_STRONG: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_DIRECTION_FIRST_STRONG_LTR: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_DIRECTION_FIRST_STRONG_RTL: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_DIRECTION_INHERIT: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_DIRECTION_LOCALE: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_DIRECTION_LTR: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT_DIRECTION_RTL: Int32

  @JavaStaticField(isFinal: true)
  public var TRANSLATION_X: Property!

  @JavaStaticField(isFinal: true)
  public var TRANSLATION_Y: Property!

  @JavaStaticField(isFinal: true)
  public var TRANSLATION_Z: Property!

  @JavaStaticField(isFinal: true)
  public var VISIBLE: Int32

  @JavaStaticField(isFinal: true)
  public var X: Property!

  @JavaStaticField(isFinal: true)
  public var Y: Property!

  @JavaStaticField(isFinal: true)
  public var Z: Property!
}
