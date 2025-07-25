// Auto-generated by Java-to-Swift wrapper generator.
import AndroidOS
import JavaKit
import JavaRuntime

extension AsyncQueryHandler {
  @JavaClass("android.content.AsyncQueryHandler$WorkerArgs")
  open class WorkerArgs: JavaObject {
  @JavaField(isFinal: false)
  public var cookie: JavaObject!

  @JavaField(isFinal: false)
  public var handler: Handler!

  @JavaField(isFinal: false)
  public var orderBy: String

  @JavaField(isFinal: false)
  public var projection: [String]

  @JavaField(isFinal: false)
  public var result: JavaObject!

  @JavaField(isFinal: false)
  public var selection: String

  @JavaField(isFinal: false)
  public var selectionArgs: [String]

  @JavaField(isFinal: false)
  public var values: ContentValues!
  }
}
