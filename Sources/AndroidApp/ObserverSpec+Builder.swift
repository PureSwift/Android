// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaKitCollection
import JavaRuntime

extension ObserverSpec {
  @JavaClass("android.app.appsearch.observer.ObserverSpec$Builder")
  open class Builder: JavaObject {
  @JavaMethod
  @_nonoverride public convenience init(environment: JNIEnvironment? = nil)

  @JavaMethod
  open func addFilterSchemas(_ arg0: JavaCollection<JavaString>?) -> ObserverSpec.Builder!

  @JavaMethod
  open func addFilterSchemas(_ arg0: [String]) -> ObserverSpec.Builder!

  @JavaMethod
  open func build() -> ObserverSpec!
  }
}
