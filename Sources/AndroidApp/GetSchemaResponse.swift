// Auto-generated by Java-to-Swift wrapper generator.
import JavaUtil
import JavaKit
import JavaKitCollection
import JavaRuntime

@JavaClass("android.app.appsearch.GetSchemaResponse")
open class GetSchemaResponse: JavaObject {
  @JavaMethod
  open func getSchemas() -> JavaSet<AppSearchSchema>!

  @JavaMethod
  open func getSchemaTypesNotDisplayedBySystem() -> JavaSet<JavaString>!

  @JavaMethod
  open func getSchemaTypesVisibleToPackages() -> Map<JavaString, JavaSet<PackageIdentifier>>!

  @JavaMethod
  open func getRequiredPermissionsForSchemaTypeVisibility() -> Map<JavaString, JavaSet<JavaSet<JavaInteger>>>!

  @JavaMethod
  open func getVersion() -> Int32
}
