// Auto-generated by Java-to-Swift wrapper generator.
import JavaIO
import JavaKit
import JavaRuntime

@JavaClass("android.os.Environment")
open class Environment: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)
}
extension JavaClass<Environment> {
  @JavaStaticField(isFinal: false)
  public var DIRECTORY_ALARMS: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_AUDIOBOOKS: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_DCIM: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_DOCUMENTS: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_DOWNLOADS: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_MOVIES: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_MUSIC: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_NOTIFICATIONS: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_PICTURES: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_PODCASTS: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_RECORDINGS: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_RINGTONES: String

  @JavaStaticField(isFinal: false)
  public var DIRECTORY_SCREENSHOTS: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_BAD_REMOVAL: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_CHECKING: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_EJECTING: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_MOUNTED: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_MOUNTED_READ_ONLY: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_NOFS: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_REMOVED: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_SHARED: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_UNKNOWN: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_UNMOUNTABLE: String

  @JavaStaticField(isFinal: true)
  public var MEDIA_UNMOUNTED: String

  @JavaStaticMethod
  public func getStorageDirectory() -> File!

  @JavaStaticMethod
  public func getDataDirectory() -> File!

  @JavaStaticMethod
  public func getExternalStorageDirectory() -> File!

  @JavaStaticMethod
  public func getExternalStoragePublicDirectory(_ arg0: String) -> File!

  @JavaStaticMethod
  public func getDownloadCacheDirectory() -> File!

  @JavaStaticMethod
  public func getExternalStorageState() -> String

  @JavaStaticMethod
  public func getExternalStorageState(_ arg0: File?) -> String

  @JavaStaticMethod
  public func getStorageState(_ arg0: File?) -> String

  @JavaStaticMethod
  public func isExternalStorageRemovable() -> Bool

  @JavaStaticMethod
  public func isExternalStorageRemovable(_ arg0: File?) -> Bool

  @JavaStaticMethod
  public func isExternalStorageEmulated(_ arg0: File?) -> Bool

  @JavaStaticMethod
  public func isExternalStorageEmulated() -> Bool

  @JavaStaticMethod
  public func isExternalStorageLegacy() -> Bool

  @JavaStaticMethod
  public func isExternalStorageLegacy(_ arg0: File?) -> Bool

  @JavaStaticMethod
  public func isExternalStorageManager() -> Bool

  @JavaStaticMethod
  public func isExternalStorageManager(_ arg0: File?) -> Bool

  @JavaStaticMethod
  public func getRootDirectory() -> File!
}
