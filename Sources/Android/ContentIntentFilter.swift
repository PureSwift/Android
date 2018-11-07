//
//  ContentIntentFilter.swift
//  Android
//
//  Created by Marco Estrella on 6/25/18.
//

import Foundation
import java_swift
import java_util

public extension Android.Content {
    public typealias IntentFilter = AndroidIntentFilter
}

/**
 * Structured description of Intent values to be matched. An IntentFilter can match against actions,
 * categories, and data (either via its type, scheme, and/or path) in an Intent. It also includes a "priority" value which is used to order multiple matching filters.
 *
 * IntentFilter objects are often created in XML as part of a package's AndroidManifest.xml file, using intent-filter tags.
 */
public final class AndroidIntentFilter: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString =  #file,
                              _ line: Int = #line) {
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /// New empty IntentFilter.
    public convenience init(){
        
        var __locals = [jobject]()
        var __args = [jvalue](repeating: jvalue(), count: 0)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.init_method1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    /// New IntentFilter that matches a single action with no data.
    public convenience init(action: String){
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: action, locals: &__locals)
        ]
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Ljava/lang/String;)V",
            methodCache: &JNICache.MethodID.init_method2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    /// New IntentFilter that matches a single action and data type.
    public convenience init(action: String, dataType: String){
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: action, locals: &__locals),
            JNIType.toJava(value: dataType, locals: &__locals)
        ]
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Ljava/lang/String;Ljava/lang/String;)V",
            methodCache: &JNICache.MethodID.init_method3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    /// New IntentFilter containing a copy of an existing filter.
    public convenience init(o: Android.Content.IntentFilter){
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: o, locals: &__locals)
        ]
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/IntentFilter;)V",
            methodCache: &JNICache.MethodID.init_method4,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension Android.Content.IntentFilter {
    
    /**
     * Add a new Intent action to match against.
     */
    public func addAction( _ action: String) {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: action, locals: &__locals)
        ]
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                  methodName: "addAction",
                                  methodSig: "(Ljava/lang/String;)V",
                                  methodCache: &JNICache.MethodID.addAction,
                                  args: &__args,
                                  locals: &__locals)
    }
    
    /**
     * Add a new Intent action to match against.
     */
    public func getAction(index: Int) -> String {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: index, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                 methodName: "getAction",
                                 methodSig: "(I)Ljava/lang/String;",
                                 methodCache: &JNICache.MethodID.getAction,
                                 args: &__args,
                                 locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return String(javaObject: __return)
    }
}

internal extension Android.Content.IntentFilter {
    // JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Content.className(["IntentFilter"])
        
        // JNI Java class name
        static let className = classSignature.rawValue
        
        // JNI Java class
        static var jniClass: jclass?
        
        // JNI Field ID cache
        struct FieldID {
            static var MATCH_ADJUSTMENT_MASK: jfieldID?
            static var MATCH_ADJUSTMENT_NORMAL: jfieldID?
            static var MATCH_CATEGORY_EMPTY: jfieldID?
            static var MATCH_CATEGORY_HOST: jfieldID?
            static var MATCH_CATEGORY_MASK: jfieldID?
            static var MATCH_CATEGORY_PATH: jfieldID?
            static var MATCH_CATEGORY_PORT: jfieldID?
            static var MATCH_CATEGORY_SCHEME: jfieldID?
            static var MATCH_CATEGORY_SCHEME_SPECIFIC_PART: jfieldID?
            static var MATCH_CATEGORY_TYPE: jfieldID?
            static var NO_MATCH_ACTION: jfieldID?
            static var NO_MATCH_CATEGORY: jfieldID?
            static var NO_MATCH_DATA: jfieldID?
            static var NO_MATCH_TYPE: jfieldID?
            static var SYSTEM_HIGH_PRIORITY: jfieldID?
            static var SYSTEM_LOW_PRIORITY: jfieldID?
        }
        
        // JNI Method ID cache
        struct MethodID {
            static var init_method1: jmethodID?
            static var init_method2: jmethodID?
            static var init_method3: jmethodID?
            static var init_method4: jmethodID?
            
            static var getAction: jmethodID?
            static var addAction: jmethodID?
        }
    }
}
