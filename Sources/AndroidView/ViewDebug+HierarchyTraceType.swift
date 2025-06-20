// Auto-generated by Java-to-Swift wrapper generator.
import JavaLang
import JavaKit
import JavaRuntime

extension ViewDebug {
  @JavaClass("android.view.ViewDebug$HierarchyTraceType")
  open class HierarchyTraceType: Enum {
    public enum HierarchyTraceTypeCases: Equatable {
      case INVALIDATE
  case INVALIDATE_CHILD
  case INVALIDATE_CHILD_IN_PARENT
  case REQUEST_LAYOUT
  case ON_LAYOUT
  case ON_MEASURE
  case DRAW
  case BUILD_CACHE
    }

    public var enumValue: HierarchyTraceTypeCases! {
      let classObj = self.javaClass
      if self.equals(classObj.INVALIDATE?.as(JavaObject.self)) {
        return HierarchyTraceTypeCases.INVALIDATE
  } else if self.equals(classObj.INVALIDATE_CHILD?.as(JavaObject.self)) {
        return HierarchyTraceTypeCases.INVALIDATE_CHILD
  } else if self.equals(classObj.INVALIDATE_CHILD_IN_PARENT?.as(JavaObject.self)) {
        return HierarchyTraceTypeCases.INVALIDATE_CHILD_IN_PARENT
  } else if self.equals(classObj.REQUEST_LAYOUT?.as(JavaObject.self)) {
        return HierarchyTraceTypeCases.REQUEST_LAYOUT
  } else if self.equals(classObj.ON_LAYOUT?.as(JavaObject.self)) {
        return HierarchyTraceTypeCases.ON_LAYOUT
  } else if self.equals(classObj.ON_MEASURE?.as(JavaObject.self)) {
        return HierarchyTraceTypeCases.ON_MEASURE
  } else if self.equals(classObj.DRAW?.as(JavaObject.self)) {
        return HierarchyTraceTypeCases.DRAW
  } else if self.equals(classObj.BUILD_CACHE?.as(JavaObject.self)) {
        return HierarchyTraceTypeCases.BUILD_CACHE
  } else {
        return nil
      }
    }

  public convenience init(_ enumValue: HierarchyTraceTypeCases, environment: JNIEnvironment? = nil) {
    let _environment = if let environment {
      environment
    } else {
      try! JavaVirtualMachine.shared().environment()
    }
    let classObj = try! JavaClass<HierarchyTraceType>(environment: _environment)
    switch enumValue {
      case .INVALIDATE:
        if let INVALIDATE = classObj.INVALIDATE {
          self.init(javaHolder: INVALIDATE.javaHolder)
        } else {
          fatalError("Enum value INVALIDATE was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .INVALIDATE_CHILD:
        if let INVALIDATE_CHILD = classObj.INVALIDATE_CHILD {
          self.init(javaHolder: INVALIDATE_CHILD.javaHolder)
        } else {
          fatalError("Enum value INVALIDATE_CHILD was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .INVALIDATE_CHILD_IN_PARENT:
        if let INVALIDATE_CHILD_IN_PARENT = classObj.INVALIDATE_CHILD_IN_PARENT {
          self.init(javaHolder: INVALIDATE_CHILD_IN_PARENT.javaHolder)
        } else {
          fatalError("Enum value INVALIDATE_CHILD_IN_PARENT was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .REQUEST_LAYOUT:
        if let REQUEST_LAYOUT = classObj.REQUEST_LAYOUT {
          self.init(javaHolder: REQUEST_LAYOUT.javaHolder)
        } else {
          fatalError("Enum value REQUEST_LAYOUT was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .ON_LAYOUT:
        if let ON_LAYOUT = classObj.ON_LAYOUT {
          self.init(javaHolder: ON_LAYOUT.javaHolder)
        } else {
          fatalError("Enum value ON_LAYOUT was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .ON_MEASURE:
        if let ON_MEASURE = classObj.ON_MEASURE {
          self.init(javaHolder: ON_MEASURE.javaHolder)
        } else {
          fatalError("Enum value ON_MEASURE was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .DRAW:
        if let DRAW = classObj.DRAW {
          self.init(javaHolder: DRAW.javaHolder)
        } else {
          fatalError("Enum value DRAW was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
      case .BUILD_CACHE:
        if let BUILD_CACHE = classObj.BUILD_CACHE {
          self.init(javaHolder: BUILD_CACHE.javaHolder)
        } else {
          fatalError("Enum value BUILD_CACHE was unexpectedly nil, please re-run Java2Swift on the most updated Java class")
        }
    }
  }
  }
}
extension ViewDebug.HierarchyTraceType {
  @JavaClass("java.lang.Enum$EnumDesc")
  open class EnumDesc<E: AnyJavaObject>: JavaObject {
  @JavaMethod
  open override func toString() -> String
  }
}
extension JavaClass<ViewDebug.HierarchyTraceType> {
  @JavaStaticField(isFinal: true)
  public var INVALIDATE: ViewDebug.HierarchyTraceType!

  @JavaStaticField(isFinal: true)
  public var INVALIDATE_CHILD: ViewDebug.HierarchyTraceType!

  @JavaStaticField(isFinal: true)
  public var INVALIDATE_CHILD_IN_PARENT: ViewDebug.HierarchyTraceType!

  @JavaStaticField(isFinal: true)
  public var REQUEST_LAYOUT: ViewDebug.HierarchyTraceType!

  @JavaStaticField(isFinal: true)
  public var ON_LAYOUT: ViewDebug.HierarchyTraceType!

  @JavaStaticField(isFinal: true)
  public var ON_MEASURE: ViewDebug.HierarchyTraceType!

  @JavaStaticField(isFinal: true)
  public var DRAW: ViewDebug.HierarchyTraceType!

  @JavaStaticField(isFinal: true)
  public var BUILD_CACHE: ViewDebug.HierarchyTraceType!

  @JavaStaticMethod
  public func values() -> [ViewDebug.HierarchyTraceType?]

  @JavaStaticMethod
  public func valueOf(_ arg0: String) -> ViewDebug.HierarchyTraceType!
}
