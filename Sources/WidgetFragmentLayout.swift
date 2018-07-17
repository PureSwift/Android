//
//  ViewSwiftView.swift
//  Android
//
//  Created by Marco Estrella on 7/13/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias FragmentLayout = AndroidWidgetFragmentLayout
}

open class AndroidWidgetFragmentLayout: Android.View.ViewGroup {
    
    // MARK: - Initialization
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init(context: Android.Content.Context){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &FragmentLayoutJNICache.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - Methods

public extension AndroidWidgetFragmentLayout {
    
    
}

// MARK: - JNICache

internal extension AndroidWidgetFragmentLayout {
    
    /// JNI Cache
    struct FragmentLayoutJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["FragmentLayout"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var INVISIBLE: jfieldID?
            static var VISIBLE: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var newMethod: jmethodID?
        }
    }
}
