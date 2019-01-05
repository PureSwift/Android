//
//  WidgetSearchViewOnQueryTextListener.swift
//  Android
//
//  Created by Marco Estrella on 1/4/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidSearchView {
    
    public typealias OnQueryTextListener = AndroidSearchViewOnQueryTextListener
}

open class AndroidSearchViewOnQueryTextListener: JavaObject {
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        self.bindNewJavaObject()
    }
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    // Initialize a new Java instance and bind to this Swift object.
    public func bindNewJavaObject() {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: AndroidSearchViewOnQueryTextListener.JNICache.className,
                                                          classObject: AndroidSearchViewOnQueryTextListener.JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &AndroidSearchViewOnQueryTextListener.JNICache.MethodID.newMethod,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    /** Called when the query text is changed by the user.
     *
     * @return false if the SearchView should perform the default action of showing any suggestions if available, true if the action was handled by the listener.
     */
    open func onQueryTextChange(newText: String?) -> Bool {
        
        return false;
    }
    
    /** Called when the user submits the query. This could be due to a key press on the keyboard or
     * due to pressing a submit button. The listener can override the standard behavior by returning true to indicate
     * that it has handled the submit request. Otherwise return false to let the SearchView handle the submission by launching any associated intent.
     *
     * @return true if the query has been handled by the listener, false to let the SearchView perform the default action.
     */
    open func onQueryTextSubmit(query: String?) -> Bool {
        
        return false;
    }
}

extension AndroidSearchViewOnQueryTextListener: JNIListener { }

// MARK: - Private

fileprivate extension AndroidSearchViewOnQueryTextListener {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["SearchViewOnQueryTextListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onQueryTextSubmitThunk: AndroidSearchViewOnQueryTextListener_onQueryTextSubmit_type = AndroidSearchViewOnQueryTextListener_onQueryTextSubmit
            
            natives.append( JNINativeMethod(name: strdup("__onQueryTextSubmit"),
                                            signature: strdup("(JLjava/lang/String;)Z"),
                                            fnPtr: unsafeBitCast( onQueryTextSubmitThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let OnQueryTextListenerThunk: AndroidSearchViewOnQueryTextListener_onQueryTextChange_type = AndroidSearchViewOnQueryTextListener_onQueryTextChange
            
            natives.append( JNINativeMethod(name: strdup("onQueryTextChange"),
                                            signature: strdup("(JLjava/lang/String;)Z"),
                                            fnPtr: unsafeBitCast( OnQueryTextListenerThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidSearchViewOnQueryTextListener_finalize_type = AndroidSearchViewOnQueryTextListener_finalize
            
            natives.append( JNINativeMethod( name: strdup("__finalize"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( finalizeThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let clazz = JNI.FindClass( className )
            
            let nativesCount = jint(natives.count)
            withUnsafePointer(to: &natives[0]) { nativesPtr in
                if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, nativesCount ) != jint(JNI_OK) {
                    JNI.report( "Unable to register java natives" )
                }
            }
            
            defer { JNI.DeleteLocalRef( clazz ) }
            
            return JNI.api.NewGlobalRef( JNI.env, clazz )!
        }()
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var newMethod: jmethodID?
        }
    }
}

private typealias AndroidSearchViewOnQueryTextListener_onQueryTextSubmit_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> (jboolean)

public func AndroidSearchViewOnQueryTextListener_onQueryTextSubmit( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                    _ __this: jobject?,
                                                                    _ __swiftObject: jlong,
                                                                    _ __query: jobject?) -> (jboolean) {
    
    let query = __query != nil ? String(javaObject: __query) : nil
    
    let result = AndroidSearchViewOnQueryTextListener
        .swiftObject(from: __swiftObject)?
        .onQueryTextSubmit(query: query)
    
    return jboolean( result! ? JNI_TRUE : JNI_FALSE)
}

private typealias AndroidSearchViewOnQueryTextListener_onQueryTextChange_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> (jboolean)

public func AndroidSearchViewOnQueryTextListener_onQueryTextChange( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                    _ __this: jobject?,
                                                                    _ __swiftObject: jlong,
                                                                    _ __newText: jobject?) -> (jboolean) {
    
    let newText = __newText != nil ? String(javaObject: __newText) : nil
    
    let result = AndroidSearchViewOnQueryTextListener
        .swiftObject(from: __swiftObject)?
        .onQueryTextChange(newText: newText)
    
    return jboolean( result! ? JNI_TRUE : JNI_FALSE)
}

private typealias AndroidSearchViewOnQueryTextListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidSearchViewOnQueryTextListener_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                            _ __this: jobject?,
                                                            _ __swiftObject: jlong) -> () {
    
    AndroidSearchViewOnQueryTextListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
