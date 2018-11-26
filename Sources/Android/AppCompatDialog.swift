//
//  AppCompatDialog.swift
//  Android
//
//  Created by Marco Estrella on 11/26/18.
//

import Foundation
import java_swift
import java_lang
import JNI

open class AppCompatDialog: AndroidDialog {
    
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
    
    public convenience init(context: Android.Content.Context) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: AppCompatDialogJNICache.className,
            classCache: &AppCompatDialogJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &AppCompatDialogJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, themeResId: Int) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(themeResId))
        
        let __object = JNIMethod.NewObject(
            className: AppCompatDialogJNICache.className,
            classCache: &AppCompatDialogJNICache.jniClass,
            methodSig: "(Landroid/content/Context;I)V",
            methodCache: &AppCompatDialogJNICache.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
}

internal extension AppCompatDialog {
    
    /// JNI Cache
    struct AppCompatDialogJNICache {
        
        static let classSignature = SupportV7.App.className(["AppCompatDialog"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            
            //static var setTitle: jmethodID?
        }
    }
}

