// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaRuntime

@JavaClass("java.io.StreamTokenizer")
open class StreamTokenizer: JavaObject {
  @JavaField(isFinal: false)
  public var ttype: Int32

  @JavaField(isFinal: false)
  public var sval: String

  @JavaField(isFinal: false)
  public var nval: Double

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: InputStream?, environment: JNIEnvironment? = nil)

  @JavaMethod
  @_nonoverride public convenience init(_ arg0: Reader?, environment: JNIEnvironment? = nil)

  @JavaMethod
  open func pushBack()

  @JavaMethod
  open func wordChars(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func whitespaceChars(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func commentChar(_ arg0: Int32)

  @JavaMethod
  open func quoteChar(_ arg0: Int32)

  @JavaMethod
  open func parseNumbers()

  @JavaMethod
  open func resetSyntax()

  @JavaMethod
  open func ordinaryChars(_ arg0: Int32, _ arg1: Int32)

  @JavaMethod
  open func ordinaryChar(_ arg0: Int32)

  @JavaMethod
  open func eolIsSignificant(_ arg0: Bool)

  @JavaMethod
  open func slashStarComments(_ arg0: Bool)

  @JavaMethod
  open func slashSlashComments(_ arg0: Bool)

  @JavaMethod
  open func lowerCaseMode(_ arg0: Bool)

  @JavaMethod
  open func lineno() -> Int32

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open func nextToken() throws -> Int32
}
extension JavaClass<StreamTokenizer> {
  @JavaStaticField(isFinal: true)
  public var TT_EOF: Int32

  @JavaStaticField(isFinal: true)
  public var TT_EOL: Int32

  @JavaStaticField(isFinal: true)
  public var TT_NUMBER: Int32

  @JavaStaticField(isFinal: true)
  public var TT_WORD: Int32
}
