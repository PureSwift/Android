// Auto-generated by Java-to-Swift wrapper generator.
import AndroidOS
import AndroidUtil
import JavaKit
import JavaRuntime

@JavaClass("android.content.pm.ServiceInfo", implements: Parcelable.self)
open class ServiceInfo: ComponentInfo {
  @JavaField(isFinal: false)
  public var flags: Int32

  @JavaField(isFinal: false)
  public var permission: String

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: ServiceInfo?, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func describeContents() -> Int32

  @JavaMethod
  open override func writeToParcel(_ arg0: Parcel?, _ arg1: Int32)

  @JavaMethod
  open func getForegroundServiceType() -> Int32

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open func dump(_ arg0: Printer?, _ arg1: String)
}
extension JavaClass<ServiceInfo> {
  @JavaStaticField(isFinal: true)
  public var CREATOR: Parcelable.Creator<ServiceInfo>!

  @JavaStaticField(isFinal: true)
  public var FLAG_EXTERNAL_SERVICE: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_ISOLATED_PROCESS: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_SINGLE_USER: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_STOP_WITH_TASK: Int32

  @JavaStaticField(isFinal: true)
  public var FLAG_USE_APP_ZYGOTE: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_CAMERA: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_DATA_SYNC: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_LOCATION: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_MANIFEST: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_MEDIA_PROJECTION: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_MICROPHONE: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_NONE: Int32

  @JavaStaticField(isFinal: true)
  public var FOREGROUND_SERVICE_TYPE_PHONE_CALL: Int32

  @JavaStaticField(isFinal: true)
  public var CONTENTS_FILE_DESCRIPTOR: Int32

  @JavaStaticField(isFinal: true)
  public var PARCELABLE_WRITE_RETURN_VALUE: Int32
}
