// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaKit
import JavaRuntime

@JavaClass("android.os.AsyncTask")
open class AsyncTask: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func getStatus() -> AsyncTask.Status!

  @JavaMethod
  open func doInBackground(_ arg0: [JavaObject?]) -> JavaObject!

  @JavaMethod
  open func onPreExecute()

  @JavaMethod
  open func onPostExecute(_ arg0: JavaObject?)

  @JavaMethod
  open func onProgressUpdate(_ arg0: [JavaObject?])

  @JavaMethod
  open func onCancelled()

  @JavaMethod
  open func onCancelled(_ arg0: JavaObject?)

  @JavaMethod
  open func publishProgress(_ arg0: [JavaObject?])

  @JavaMethod
  open func get() throws -> JavaObject!

  @JavaMethod
  open func cancel(_ arg0: Bool) -> Bool

  @JavaMethod
  open func execute(_ arg0: [JavaObject?]) -> AsyncTask!

  @JavaMethod
  open func isCancelled() -> Bool
}
extension JavaClass {
  @JavaStaticMethod
  public func execute(_ arg0: Runnable?)
}
