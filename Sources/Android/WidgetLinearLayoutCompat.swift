//
//  WidgetLinearLayoutCompat.swift
//  Android
//
//  Created by Marco Estrella on 1/4/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias LinearLayoutCompat = AndroidLinearLayoutCompat
}

open class AndroidLinearLayoutCompat: Android.View.ViewGroup {
    
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
    
    public convenience init(context: Android.Content.Context) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheLinearLayoutCompat.className,
            classCache: &JNICacheLinearLayoutCompat.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheLinearLayoutCompat.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - JNICache

internal extension AndroidLinearLayoutCompat {
    
    /// JNI Cache
    struct JNICacheLinearLayoutCompat {
        
        /// JNI Java class signature
        static let classSignature = SupportV7.Widget.className(["LinearLayoutCompat"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            //static var LENGTH_LONG: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
        }
    }
}
