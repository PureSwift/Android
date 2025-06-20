// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaKit
import JavaRuntime

extension Path {
  @JavaClass("android.graphics.Path$Direction")
  open class Direction: Enum {
    public enum DirectionCases: Equatable {
      case CW
  case CCW
    }

    public var enumValue: DirectionCases! {
      let classObj = self.javaClass
      if self.equals(classObj.CW?.as(JavaObject.self)) {
        return DirectionCases.CW
  } else if self.equals(classObj.CCW?.as(JavaObject.self)) {
        return DirectionCases.CCW
  } else {
        return nil
      }
    }

  public convenience init(_ enumValue: DirectionCases, environment: JNIEnvironment? = nil) {
    let _environment = if let environment {
      environment
    } else {
      try! JavaVirtualMachine.shared().environment()
    }
    let classObj = try! JavaClass<Direction>(environment: _environment)
    switch enumValue {
      case .CW:
        if let CW = classObj.CW {
          self.init(javaHolder: CW.javaHolder)
        } else {
          fatalError("Enum value CW was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .CCW:
        if let CCW = classObj.CCW {
          self.init(javaHolder: CCW.javaHolder)
        } else {
          fatalError("Enum value CCW was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
    }
  }
  }
}
extension JavaClass<Path.Direction> {
  @JavaStaticField(isFinal: true)
  public var CW: Path.Direction!

  @JavaStaticField(isFinal: true)
  public var CCW: Path.Direction!

  @JavaStaticMethod
  public func values() -> [Path.Direction?]

  @JavaStaticMethod
  public func valueOf(_ arg0: String) -> Path.Direction!
}
