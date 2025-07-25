// Auto-generated by Java-to-Swift wrapper generator.
import AndroidContent
import AndroidOS
import AndroidView
import AndroidWidget
import JavaKit
import JavaKitCollection
import JavaRuntime

@JavaInterface("com.google.android.material.datepicker.DateSelector", extends: Parcelable.self)
public struct DateSelector {
  @JavaMethod
  public func getSelection() -> JavaObject!

  @JavaMethod
  public func isSelectionComplete() -> Bool

  @JavaMethod
  public func select(_ arg0: Int64)

  @JavaMethod
  public func getSelectionDisplayString(_ arg0: Context?) -> String

  @JavaMethod
  public func getSelectionContentDescription(_ arg0: Context?) -> String

  @JavaMethod
  public func getError() -> String

  @JavaMethod
  public func getDefaultThemeResId(_ arg0: Context?) -> Int32

  @JavaMethod
  //public func onCreateTextInputView(_ arg0: LayoutInflater?, _ arg1: ViewGroup?, _ arg2: Bundle?, _ arg3: CalendarConstraints?, _ arg4: OnSelectionChangedListener<JavaObject>?) -> View!

  @JavaMethod
  public func setSelection(_ arg0: JavaObject?)

  @JavaMethod
  public func getDefaultTitleResId() -> Int32

  @JavaMethod
  public func getSelectedDays() -> JavaCollection<JavaLong>!

  @JavaMethod
  public func describeContents() -> Int32

  @JavaMethod
  public func writeToParcel(_ arg0: Parcel?, _ arg1: Int32)
}

extension JavaClass<DateSelector> {
  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32

  @JavaStaticMethod
  public func showKeyboardWithAutoHideBehavior(_ arg0: [EditText?])
}
