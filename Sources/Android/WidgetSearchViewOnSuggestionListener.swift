//
//  WidgetSearchViewOnSuggestionListener.swift
//  Android
//
//  Created by Marco Estrella on 1/4/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidSearchView {
    
    public typealias OnSuggestionListener = AndroidSearchViewOnSuggestionListener
}

open class AndroidSearchViewOnSuggestionListener: JavaObject {
    
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
        guard let __object: jobject = JNIMethod.NewObject(className: AndroidSearchViewOnSuggestionListener.JNICache.className,
                                                          classObject: AndroidSearchViewOnSuggestionListener.JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &AndroidSearchViewOnSuggestionListener.JNICache.MethodID.newMethod,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    /** Called when a suggestion was clicked.
     * int: the absolute position in the list of suggestions.
     * @return true if the listener handles the event and wants to override the default behavior of launching any intent or submitting a search query specified on that item. Return false otherwise.
     */
    fileprivate func onSuggestionClick(position: Int) -> Bool {
        
        return true;
    }
    
    /** Called when a suggestion was selected by navigating to it.
     *
     * @return true if the listener handles the event and wants to override the default behavior of possibly rewriting the query based on the selected item, false otherwise.
     */
    fileprivate func onSuggestionSelect(position: Int) -> Bool {
        
        return true;
    }
}

extension AndroidSearchViewOnSuggestionListener: JNIListener { }

// MARK: - Private

fileprivate extension AndroidSearchViewOnSuggestionListener {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["SearchViewOnSuggestionListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onSuggestionSelectThunk: AndroidSearchViewOnSuggestionListener_onSuggestionSelect_type = AndroidSearchViewOnSuggestionListener_onSuggestionSelect
            
            natives.append( JNINativeMethod(name: strdup("__onSuggestionSelect"),
                                            signature: strdup("(JI)Z"),
                                            fnPtr: unsafeBitCast( onSuggestionSelectThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let onSuggestionClickThunk: AndroidSearchViewOnSuggestionListener_onSuggestionClick_type = AndroidSearchViewOnSuggestionListener_onSuggestionClick
            
            natives.append( JNINativeMethod(name: strdup("__onSuggestionClick"),
                                            signature: strdup("(JI)Z"),
                                            fnPtr: unsafeBitCast( onSuggestionClickThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: AndroidSearchViewOnSuggestionListener_finalize_type = AndroidSearchViewOnSuggestionListener_finalize
            
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

private typealias AndroidSearchViewOnSuggestionListener_onSuggestionSelect_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint) -> (jboolean)

public func AndroidSearchViewOnSuggestionListener_onSuggestionSelect( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                     _ __this: jobject?,
                                                                     _ __swiftObject: jlong,
                                                                     _ __position: jint) -> (jboolean) {
    
    let position = Int(__position)
    
    let result = AndroidSearchViewOnSuggestionListener
        .swiftObject(from: __swiftObject)?
        .onSuggestionSelect(position: position)
    
    return jboolean( result! ? JNI_TRUE : JNI_FALSE)
}

private typealias AndroidSearchViewOnSuggestionListener_onSuggestionClick_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint) -> (jboolean)

public func AndroidSearchViewOnSuggestionListener_onSuggestionClick( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                    _ __this: jobject?,
                                                                    _ __swiftObject: jlong,
                                                                    _ __position: jint) -> (jboolean) {
    
    let position = Int(__position)
    
    let result = AndroidSearchViewOnSuggestionListener
        .swiftObject(from: __swiftObject)?
        .onSuggestionClick(position: position)
    
    return jboolean( result! ? JNI_TRUE : JNI_FALSE)
}

private typealias AndroidSearchViewOnSuggestionListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()

public func AndroidSearchViewOnSuggestionListener_finalize ( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                            _ __this: jobject?,
                                                            _ __swiftObject: jlong) -> () {
    
    AndroidSearchViewOnSuggestionListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}

