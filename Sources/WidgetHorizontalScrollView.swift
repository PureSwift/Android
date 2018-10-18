//
//  HorizontalScrollView.swift
//  Android
//
//  Created by Marco Estrella on 10/18/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias HorizontalScrollView = AndroidHorizontalScrollView
}

open class AndroidHorizontalScrollView: AndroidWidgetFrameLayout {
    
    // MARK: - Initialization
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init(context: Android.Content.Context){
        
        self.init(javaObject: nil)
        bindNewJavaObject(context: context)
    }
    
    public func bindNewJavaObject(context: Android.Content.Context){
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheHorizontalScrollView.className,
            classCache: &JNICacheHorizontalScrollView.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheHorizontalScrollView.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.javaObject = __object
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidHorizontalScrollView {
    
}

internal extension AndroidHorizontalScrollView {
    
    /// JNI Cache
    struct JNICacheHorizontalScrollView {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["HorizontalScrollView"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
        }
    }
}
