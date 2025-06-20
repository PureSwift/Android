// Auto-generated by Java-to-Swift wrapper generator.
import AndroidApp
import AndroidContent
import AndroidOS
import JavaKit
import JavaRuntime

@JavaClass("com.google.android.material.datepicker.MaterialStyledDatePickerDialog")
open class MaterialStyledDatePickerDialog: DatePickerDialog {
  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Context?, _ arg1: Int32, _ arg2: DatePickerDialog.OnDateSetListener?, _ arg3: Int32, _ arg4: Int32, _ arg5: Int32, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Context?, _ arg1: DatePickerDialog.OnDateSetListener?, _ arg2: Int32, _ arg3: Int32, _ arg4: Int32, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Context?, _ arg1: Int32, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Context?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func onCreate(_ arg0: Bundle?)
}
extension JavaClass<MaterialStyledDatePickerDialog> {
  @JavaStaticField(isFinal: true)
  public var THEME_DEVICE_DEFAULT_DARK: Int32

  @JavaStaticField(isFinal: true)
  public var THEME_DEVICE_DEFAULT_LIGHT: Int32

  @JavaStaticField(isFinal: true)
  public var THEME_HOLO_DARK: Int32

  @JavaStaticField(isFinal: true)
  public var THEME_HOLO_LIGHT: Int32

  @JavaStaticField(isFinal: true)
  public var THEME_TRADITIONAL: Int32

  @JavaStaticField(isFinal: true)
  public var BUTTON1: Int32

  @JavaStaticField(isFinal: true)
  public var BUTTON2: Int32

  @JavaStaticField(isFinal: true)
  public var BUTTON3: Int32

  @JavaStaticField(isFinal: true)
  public var BUTTON_NEGATIVE: Int32

  @JavaStaticField(isFinal: true)
  public var BUTTON_NEUTRAL: Int32

  @JavaStaticField(isFinal: true)
  public var BUTTON_POSITIVE: Int32
}
