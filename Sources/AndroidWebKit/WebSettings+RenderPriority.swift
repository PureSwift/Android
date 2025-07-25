// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaKit
import JavaRuntime

extension WebSettings {
  @JavaClass("android.webkit.WebSettings$RenderPriority")
  open class RenderPriority: Enum {
    public enum RenderPriorityCases: Equatable {
      case NORMAL
  case HIGH
  case LOW
    }

    public var enumValue: RenderPriorityCases! {
      let classObj = self.javaClass
      if self.equals(classObj.NORMAL?.as(JavaObject.self)) {
        return RenderPriorityCases.NORMAL
  } else if self.equals(classObj.HIGH?.as(JavaObject.self)) {
        return RenderPriorityCases.HIGH
  } else if self.equals(classObj.LOW?.as(JavaObject.self)) {
        return RenderPriorityCases.LOW
  } else {
        return nil
      }
    }

  public convenience init(_ enumValue: RenderPriorityCases, environment: JNIEnvironment? = nil) {
    let _environment = if let environment {
      environment
    } else {
      try! JavaVirtualMachine.shared().environment()
    }
    let classObj = try! JavaClass<RenderPriority>(environment: _environment)
    switch enumValue {
      case .NORMAL:
        if let NORMAL = classObj.NORMAL {
          self.init(javaHolder: NORMAL.javaHolder)
        } else {
          fatalError("Enum value NORMAL was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .HIGH:
        if let HIGH = classObj.HIGH {
          self.init(javaHolder: HIGH.javaHolder)
        } else {
          fatalError("Enum value HIGH was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .LOW:
        if let LOW = classObj.LOW {
          self.init(javaHolder: LOW.javaHolder)
        } else {
          fatalError("Enum value LOW was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
    }
  }
  }
}
extension JavaClass<WebSettings.RenderPriority> {
  @JavaStaticField(isFinal: true)
  public var NORMAL: WebSettings.RenderPriority!

  @JavaStaticField(isFinal: true)
  public var HIGH: WebSettings.RenderPriority!

  @JavaStaticField(isFinal: true)
  public var LOW: WebSettings.RenderPriority!

  @JavaStaticMethod
  public func values() -> [WebSettings.RenderPriority?]

  @JavaStaticMethod
  public func valueOf(_ arg0: String) -> WebSettings.RenderPriority!
}
