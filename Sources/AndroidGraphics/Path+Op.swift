// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaKit
import JavaRuntime

extension Path {
  @JavaClass("android.graphics.Path$Op")
  open class Op: Enum {
    public enum OpCases: Equatable {
      case DIFFERENCE
  case INTERSECT
  case UNION
  case XOR
  case REVERSE_DIFFERENCE
    }

    public var enumValue: OpCases! {
      let classObj = self.javaClass
      if self.equals(classObj.DIFFERENCE?.as(JavaObject.self)) {
        return OpCases.DIFFERENCE
  } else if self.equals(classObj.INTERSECT?.as(JavaObject.self)) {
        return OpCases.INTERSECT
  } else if self.equals(classObj.UNION?.as(JavaObject.self)) {
        return OpCases.UNION
  } else if self.equals(classObj.XOR?.as(JavaObject.self)) {
        return OpCases.XOR
  } else if self.equals(classObj.REVERSE_DIFFERENCE?.as(JavaObject.self)) {
        return OpCases.REVERSE_DIFFERENCE
  } else {
        return nil
      }
    }

  public convenience init(_ enumValue: OpCases, environment: JNIEnvironment? = nil) {
    let _environment = if let environment {
      environment
    } else {
      try! JavaVirtualMachine.shared().environment()
    }
    let classObj = try! JavaClass<Op>(environment: _environment)
    switch enumValue {
      case .DIFFERENCE:
        if let DIFFERENCE = classObj.DIFFERENCE {
          self.init(javaHolder: DIFFERENCE.javaHolder)
        } else {
          fatalError("Enum value DIFFERENCE was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .INTERSECT:
        if let INTERSECT = classObj.INTERSECT {
          self.init(javaHolder: INTERSECT.javaHolder)
        } else {
          fatalError("Enum value INTERSECT was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .UNION:
        if let UNION = classObj.UNION {
          self.init(javaHolder: UNION.javaHolder)
        } else {
          fatalError("Enum value UNION was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .XOR:
        if let XOR = classObj.XOR {
          self.init(javaHolder: XOR.javaHolder)
        } else {
          fatalError("Enum value XOR was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .REVERSE_DIFFERENCE:
        if let REVERSE_DIFFERENCE = classObj.REVERSE_DIFFERENCE {
          self.init(javaHolder: REVERSE_DIFFERENCE.javaHolder)
        } else {
          fatalError("Enum value REVERSE_DIFFERENCE was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
    }
  }
  }
}
extension JavaClass<Path.Op> {
  @JavaStaticField(isFinal: true)
  public var DIFFERENCE: Path.Op!

  @JavaStaticField(isFinal: true)
  public var INTERSECT: Path.Op!

  @JavaStaticField(isFinal: true)
  public var UNION: Path.Op!

  @JavaStaticField(isFinal: true)
  public var XOR: Path.Op!

  @JavaStaticField(isFinal: true)
  public var REVERSE_DIFFERENCE: Path.Op!

  @JavaStaticMethod
  public func values() -> [Path.Op?]

  @JavaStaticMethod
  public func valueOf(_ arg0: String) -> Path.Op!
}
