import JavaKit
import JavaRuntime

@JavaClass("java.net.InetAddress")
open class InetAddress: JavaObject {
    
    @JavaMethod
    open override func equals(_ arg0: JavaObject?) -> Bool

    @JavaMethod
    open override func hashCode() -> Int32

    @JavaMethod
    open func getAddress() -> [Int8]

    @JavaMethod
    open func getHostAddress() -> String

    @JavaMethod
    open func isLinkLocalAddress() -> Bool

    @JavaMethod
    open func getScopeId() -> Int32

    @JavaMethod
    open func isAnyLocalAddress() -> Bool

    @JavaMethod
    open func isMulticastAddress() -> Bool

    @JavaMethod
    open func isLoopbackAddress() -> Bool

    @JavaMethod
    open func isSiteLocalAddress() -> Bool

    @JavaMethod
    open func isMCGlobal() -> Bool

    @JavaMethod
    open func isMCNodeLocal() -> Bool

    @JavaMethod
    open func isMCLinkLocal() -> Bool

    @JavaMethod
    open func isMCSiteLocal() -> Bool

    @JavaMethod
    open func isMCOrgLocal() -> Bool
}
