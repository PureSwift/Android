// Auto-generated by Java-to-Swift wrapper generator.
import JavaIO
import JavaLang
import AndroidUtil
import JavaKit
import JavaRuntime

@JavaInterface("android.content.res.XmlResourceParser", extends: AttributeSet.self, AutoCloseable.self)
public struct XmlResourceParser {
  @JavaMethod
  public func getAttributeNamespace(_ arg0: Int32) -> String

  @JavaMethod
  public func close()

  @JavaMethod
  public func getPositionDescription() -> String

  @JavaMethod
  public func setFeature(_ arg0: String, _ arg1: Bool) throws

  @JavaMethod
  public func getFeature(_ arg0: String) -> Bool

  @JavaMethod
  public func getInputEncoding() -> String

  @JavaMethod
  public func defineEntityReplacementText(_ arg0: String, _ arg1: String) throws

  @JavaMethod
  public func getNamespaceCount(_ arg0: Int32) throws -> Int32

  @JavaMethod
  public func getNamespacePrefix(_ arg0: Int32) throws -> String

  @JavaMethod
  public func getNamespaceUri(_ arg0: Int32) throws -> String

  @JavaMethod
  public func getNamespace() -> String

  @JavaMethod
  public func getNamespace(_ arg0: String) -> String

  @JavaMethod
  public func getDepth() -> Int32

  @JavaMethod
  public func getColumnNumber() -> Int32

  @JavaMethod
  public func getTextCharacters(_ arg0: [Int32]) -> [UInt16]

  @JavaMethod
  public func getPrefix() -> String

  @JavaMethod
  public func isEmptyElementTag() throws -> Bool

  @JavaMethod
  public func getAttributeCount() -> Int32

  @JavaMethod
  public func getAttributeName(_ arg0: Int32) -> String

  @JavaMethod
  public func getAttributePrefix(_ arg0: Int32) -> String

  @JavaMethod
  public func getAttributeType(_ arg0: Int32) -> String

  @JavaMethod
  public func isAttributeDefault(_ arg0: Int32) -> Bool

  @JavaMethod
  public func getAttributeValue(_ arg0: Int32) -> String

  @JavaMethod
  public func getAttributeValue(_ arg0: String, _ arg1: String) -> String

  @JavaMethod
  public func getEventType() throws -> Int32

  @JavaMethod
  public func require(_ arg0: Int32, _ arg1: String, _ arg2: String) throws

  @JavaMethod
  public func nextText() throws -> String

  @JavaMethod
  public func getName() -> String

  @JavaMethod
  public func getProperty(_ arg0: String) -> JavaObject!

  @JavaMethod
  public func isWhitespace() throws -> Bool

  @JavaMethod
  public func next() throws -> Int32

  @JavaMethod
  public func setProperty(_ arg0: String, _ arg1: JavaObject?) throws

  @JavaMethod
  public func getLineNumber() -> Int32

  @JavaMethod
  public func nextToken() throws -> Int32

  @JavaMethod
  public func nextTag() throws -> Int32

  @JavaMethod
  public func getText() -> String

  @JavaMethod
  public func setInput(_ arg0: InputStream?, _ arg1: String) throws

  @JavaMethod
  public func setInput(_ arg0: Reader?) throws

  @JavaMethod
  public func getIdAttribute() -> String

  @JavaMethod
  public func getAttributeNameResource(_ arg0: Int32) -> Int32

  @JavaMethod
  public func getAttributeListValue(_ arg0: String, _ arg1: String, _ arg2: [String], _ arg3: Int32) -> Int32

  @JavaMethod
  public func getAttributeListValue(_ arg0: Int32, _ arg1: [String], _ arg2: Int32) -> Int32

  @JavaMethod
  public func getAttributeBooleanValue(_ arg0: Int32, _ arg1: Bool) -> Bool

  @JavaMethod
  public func getAttributeBooleanValue(_ arg0: String, _ arg1: String, _ arg2: Bool) -> Bool

  @JavaMethod
  public func getAttributeResourceValue(_ arg0: Int32, _ arg1: Int32) -> Int32

  @JavaMethod
  public func getAttributeResourceValue(_ arg0: String, _ arg1: String, _ arg2: Int32) -> Int32

  @JavaMethod
  public func getAttributeIntValue(_ arg0: Int32, _ arg1: Int32) -> Int32

  @JavaMethod
  public func getAttributeIntValue(_ arg0: String, _ arg1: String, _ arg2: Int32) -> Int32

  @JavaMethod
  public func getAttributeUnsignedIntValue(_ arg0: Int32, _ arg1: Int32) -> Int32

  @JavaMethod
  public func getAttributeUnsignedIntValue(_ arg0: String, _ arg1: String, _ arg2: Int32) -> Int32

  @JavaMethod
  public func getAttributeFloatValue(_ arg0: String, _ arg1: String, _ arg2: Float) -> Float

  @JavaMethod
  public func getAttributeFloatValue(_ arg0: Int32, _ arg1: Float) -> Float

  @JavaMethod
  public func getClassAttribute() -> String

  @JavaMethod
  public func getIdAttributeResourceValue(_ arg0: Int32) -> Int32

  @JavaMethod
  public func getStyleAttribute() -> Int32
}
extension JavaClass<XmlResourceParser> {
  @JavaStaticField(isFinal: true)
  public var CDSECT: Int32

  @JavaStaticField(isFinal: true)
  public var COMMENT: Int32

  @JavaStaticField(isFinal: true)
  public var DOCDECL: Int32

  @JavaStaticField(isFinal: true)
  public var END_DOCUMENT: Int32

  @JavaStaticField(isFinal: true)
  public var END_TAG: Int32

  @JavaStaticField(isFinal: true)
  public var ENTITY_REF: Int32

  @JavaStaticField(isFinal: true)
  public var FEATURE_PROCESS_DOCDECL: String

  @JavaStaticField(isFinal: true)
  public var FEATURE_PROCESS_NAMESPACES: String

  @JavaStaticField(isFinal: true)
  public var FEATURE_REPORT_NAMESPACE_ATTRIBUTES: String

  @JavaStaticField(isFinal: true)
  public var FEATURE_VALIDATION: String

  @JavaStaticField(isFinal: true)
  public var IGNORABLE_WHITESPACE: Int32

  @JavaStaticField(isFinal: true)
  public var NO_NAMESPACE: String

  @JavaStaticField(isFinal: true)
  public var PROCESSING_INSTRUCTION: Int32

  @JavaStaticField(isFinal: true)
  public var START_DOCUMENT: Int32

  @JavaStaticField(isFinal: true)
  public var START_TAG: Int32

  @JavaStaticField(isFinal: true)
  public var TEXT: Int32

  @JavaStaticField(isFinal: true)
  public var TYPES: [String]
}
