//
//  ViewWindow.swift
//  Android
//
//  Created by Marco Estrella on 11/26/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View {
    
    public typealias Window = AndroidWindow
}

/**
 * Abstract base class for a top-level window look and behavior policy. An instance of this class should be used as the top-level view added to the window manager.
 * It provides standard UI policies such as a background, title area, default key processing, etc.
 *
 * The only existing implementation of this abstract class is android.view.PhoneWindow, which you should instantiate when needing a Window.
 */
public class AndroidWindow: JavaObject {
    
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
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public func setFlags(flags: Int, mask: Int) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(flags))
        __args[1] = jvalue(i: jint(mask))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFlags",
            methodSig: "(II)V",
            methodCache: &JNICache.MethodID.setFlags,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Private

internal extension AndroidWindow {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["Window"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var init_method_1: jmethodID?
            static var setFlags: jmethodID?
        }
    }
}
