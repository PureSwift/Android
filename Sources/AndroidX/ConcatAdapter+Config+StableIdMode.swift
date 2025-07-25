// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaKit
import JavaRuntime

extension ConcatAdapter.Config {
  @JavaClass("androidx.recyclerview.widget.ConcatAdapter$Config$StableIdMode")
  open class StableIdMode: Enum {
    public enum StableIdModeCases: Equatable {
        case NO_STABLE_IDS
        case ISOLATED_STABLE_IDS
        case SHARED_STABLE_IDS
    }

    public var enumValue: StableIdModeCases! {
        let classObj = try! JavaClass<ConcatAdapter.Config.StableIdMode>(environment: javaEnvironment)
      if self.equals(classObj.NO_STABLE_IDS?.as(JavaObject.self)) {
        return StableIdModeCases.NO_STABLE_IDS
  } else if self.equals(classObj.ISOLATED_STABLE_IDS?.as(JavaObject.self)) {
        return StableIdModeCases.ISOLATED_STABLE_IDS
  } else if self.equals(classObj.SHARED_STABLE_IDS?.as(JavaObject.self)) {
        return StableIdModeCases.SHARED_STABLE_IDS
  } else {
        return nil
      }
    }

  public convenience init(_ enumValue: StableIdModeCases, environment: JNIEnvironment? = nil) {
    let _environment = if let environment {
      environment
    } else {
      try! JavaVirtualMachine.shared().environment()
    }
    let classObj = try! JavaClass<ConcatAdapter.Config.StableIdMode>(environment: _environment)
    switch enumValue {
      case .NO_STABLE_IDS:
        if let NO_STABLE_IDS = classObj.NO_STABLE_IDS {
          self.init(javaHolder: NO_STABLE_IDS.javaHolder)
        } else {
          fatalError("Enum value NO_STABLE_IDS was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .ISOLATED_STABLE_IDS:
        if let ISOLATED_STABLE_IDS = classObj.ISOLATED_STABLE_IDS {
          self.init(javaHolder: ISOLATED_STABLE_IDS.javaHolder)
        } else {
          fatalError("Enum value ISOLATED_STABLE_IDS was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .SHARED_STABLE_IDS:
        if let SHARED_STABLE_IDS = classObj.SHARED_STABLE_IDS {
          self.init(javaHolder: SHARED_STABLE_IDS.javaHolder)
        } else {
          fatalError("Enum value SHARED_STABLE_IDS was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
    }
  }
  }
}
extension ConcatAdapter.Config.StableIdMode {
  @JavaClass("java.lang.Enum$EnumDesc")
  open class EnumDesc<E: AnyJavaObject>: JavaObject {
  @JavaMethod
  open override func toString() -> String
  }
}
extension JavaClass<ConcatAdapter.Config.StableIdMode> {
  @JavaStaticField(isFinal: true)
  public var NO_STABLE_IDS: ConcatAdapter.Config.StableIdMode!

  @JavaStaticField(isFinal: true)
  public var ISOLATED_STABLE_IDS: ConcatAdapter.Config.StableIdMode!

  @JavaStaticField(isFinal: true)
  public var SHARED_STABLE_IDS: ConcatAdapter.Config.StableIdMode!

  @JavaStaticMethod
  public func values() -> [ConcatAdapter.Config.StableIdMode?]

  @JavaStaticMethod
  public func valueOf(_ arg0: String) -> ConcatAdapter.Config.StableIdMode!
}
