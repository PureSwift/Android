//
//  WidgetBaseAdapter.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias BaseAdapter = AndroidWidgetBaseAdapter
}

open class AndroidWidgetBaseAdapter: JavaObject {
    
    // MARK: - Properties
    
    open override var javaObject: jobject? {
        
        get { return listener.javaObject }
        
        set { listener.javaObject = newValue }
    }
    
    /// The underlying listener object.
    internal let listener: JNIListenerDelegate<AndroidWidgetBaseAdapter>
    
    // MARK: - Initialization
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        var locals = [jobject]()
        
        var methodID: jmethodID?
        
        var args: [jvalue] = [listener.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: className, classObject: classObject,
                                                          methodSig: "(J)V", methodCache: &methodID,
                                                          args: &args, locals: &locals )
            else { fatalError("Could not initialize \(className)") }
        
        self.init(javaObject: __object, swiftObject: swiftObject)
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
        
        self.listener = JNIListenerDelegate<AndroidWidgetBaseAdapter>(javaObject: javaObject, swiftObject: self)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    open override func localJavaObject( _ locals: UnsafeMutablePointer<[jobject]> ) -> jobject? {
        
        return listener.localJavaObject( locals )
    }
    
    // MARK: - Responder
    
    func notifyDataSetChanged() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        withJavaObject {
            
            JNIMethod.CallVoidMethod(object: $0,
                                     methodName: "notifyDataSetChanged",
                                     methodSig: "()V",
                                     methodCache: &Android.Widget.BaseAdapter.JNICache.MethodID.notifyDataSetChanged,
                                     args: &__args,
                                     locals: &__locals)
        }
    }
    
    // MARK: - Listener
    
    open func getCount() -> Int { return 0 }
    
    open func getView(position: Int, convertView: Android.View.View?, parent: Android.View.ViewGroup) -> Android.View.View {
        
        fatalError("\(#function) must be implemented in subclass")
    }
}

// MARK: - Private

fileprivate extension Android.Widget.BaseAdapter {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["SwiftBaseAdapter"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass? = AndroidWidgetBaseAdapterListenerLocal._proxyClass
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var notifyDataSetChanged: jmethodID?
        }
    }
}

private typealias AndroidWidgetBaseAdapter_getCount_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> (jint)

private func AndroidWidgetBaseAdapter_getCount( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                            _ __this: jobject?,
                                            _ __swiftObject: jlong) -> jint {
    
    let result = AndroidWidgetBaseAdapterListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .getCount()
    
    return jint(result)
}

private typealias AndroidWidgetBaseAdapter_getView_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint, _: jobject?, _: jobject?) -> jobject?

private func AndroidWidgetBaseAdapter_getView( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                           _ __this: jobject?,
                                           _ __swiftObject: jlong,
                                           _ __position: jint,
                                           _ __convertView: jobject?,
                                           _ __parent: jobject?) -> jobject? {
    
    let convertView = __convertView != nil ? Android.View.View(javaObject: __convertView) : nil
    
    let parentView = Android.View.ViewGroup(javaObject: __parent)
    
    let result = AndroidWidgetBaseAdapterListenerLocal
        .swiftObject( jniEnv: __env, javaObject: __this, swiftObject: __swiftObject )
        .getView(position: Int(__position), convertView: convertView, parent: parentView)
    
    var __locals = [jobject]()
    
    return result?.localJavaObject(&__locals)
}

fileprivate final class AndroidWidgetBaseAdapterListenerProxy: AndroidWidgetBaseAdapterListenerProtocol {
    
    weak var swiftObject: Android.Widget.BaseAdapter?
    
    func getCount() -> Int {
        
        return swiftObject?.getCount() ?? 0
    }
    
    func getView(position: Int, convertView: Android.View.View?, parent: Android.View.ViewGroup) -> Android.View.View? {
        
        return swiftObject?.getView(position: position, convertView: convertView, parent: parent)
    }
}

fileprivate protocol AndroidWidgetBaseAdapterListenerProtocol {
    
    func getCount() -> Int
    
    func getView(position: Int, convertView: Android.View.View?, parent: Android.View.ViewGroup) -> Android.View.View?
}

internal class AndroidWidgetBaseAdapterInternal: JNIListenerResponder {
    
    fileprivate static let _proxyClass: jclass = {
        
        var natives = [JNINativeMethod]()
        
        let getCountThunk: AndroidWidgetBaseAdapter_getCount_type = AndroidWidgetBaseAdapter_getCount
        
        natives.append( JNINativeMethod(name: strdup("__getCount"),
                                        signature: strdup("(J)I"),
                                        fnPtr: unsafeBitCast( getCountThunk, to: UnsafeMutableRawPointer.self ) ))
        
        let getViewThunk: AndroidWidgetBaseAdapter_getView_type = AndroidWidgetBaseAdapter_getView
        
        natives.append( JNINativeMethod(name: strdup("__getView"),
                                        signature: strdup("(JILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;"),
                                        fnPtr: unsafeBitCast( getViewThunk, to: UnsafeMutableRawPointer.self ) ))
        
        natives.append( JNINativeMethod( name: strdup("__finalize"),
                                         signature: strdup("(J)V"),
                                         fnPtr: unsafeBitCast( JNIReleasableProxy__finalize_thunk, to: UnsafeMutableRawPointer.self ) ) )
        
        let clazz = JNI.FindClass( proxyClassName() )
        
        withUnsafePointer(to: &natives[0]) {
            nativesPtr in
            if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, jint(natives.count) ) != jint(JNI_OK) {
                JNI.report( "Unable to register java natives" )
            }
        }
        
        defer { JNI.DeleteLocalRef( clazz ) }
        
        return JNI.api.NewGlobalRef( JNI.env, clazz )!
    }()
    
    override open class func proxyClassName() -> String { return Android.Widget.BaseAdapter.JNICache.className }
    
    override open class func proxyClass() -> jclass? { return _proxyClass }
    
    
}

internal class JNIListenerDelegate <T: JavaObject>: JavaObject {
    
    private(set) weak var swiftObject: T?
    
    /// Designated initializer.
    convenience init(javaObject: jobject?, swiftObject: T) {
        
        self.swiftObject = swiftObject
        
        // initialize and store with new global ref
        self.init(javaObject: javaObject) // new global ref
    }
    
    static fileprivate func recoverPointer( _ swiftObject: jlong, _ file: StaticString = #file, _ line: Int = #line ) -> uintptr_t {
        #if os(Android)
        let swiftPointer = uintptr_t(swiftObject&0xffffffff)
        #else
        let swiftPointer = uintptr_t(swiftObject)
        #endif
        if swiftPointer == 0 {
            JNI.report( "Race condition setting swiftObject on Java Proxy. More thought required...", file, line )
        }
        return swiftPointer
    }
    
    private func swiftValue() -> jvalue {
        return jvalue( j: jlong(unsafeBitCast(Unmanaged.passRetained(self), to: uintptr_t.self)) )
    }
    
    private func takeOwnership( javaObject: jobject?, _ file: StaticString = #file, _ line: Int = #line ) {
        
        guard javaObject != nil else { return }
        var locals = [jobject]()
        var fieldID: jfieldID?
        
        let existing: jlong = JNIField.GetLongField( fieldName: "__swiftObject", fieldType: "J", fieldCache: &fieldID,
                                                     object: javaObject, file, line )
        
        // get retained pointer
        let swiftValue = self.swiftValue().j
        
        // store pointer in Java property
        JNIField.SetLongField( fieldName: "__swiftObject", fieldType: "J", fieldCache: &fieldID,
                               object: javaObject, value: swiftValue, locals: &locals, file, line )
        
        // release old instance (if any)
        if existing != 0 {
            JNIReleasableProxy.canrelease( swiftObject: existing )
        }
    }
    
    static func swiftObject( jniEnv: UnsafeMutablePointer<JNIEnv?>?, javaObject: jobject?, swiftObject: jlong ) -> T? {
        
        return unsafeBitCast( recoverPointer( swiftObject ), to: JNIListenerDelegate<T>.self ).swiftObject
    }
}
