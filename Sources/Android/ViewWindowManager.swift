//
//  WindowManager.swift
//  Android
//
//  Created by Marco Estrella on 8/22/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View {
    
    public typealias WindowManager = AndroidWindowManager
}

/**
 * The interface that apps use to talk to the window manager.
 *
 * Each window manager instance is bound to a particular Display. To obtain a WindowManager for a different display,
 * use Context.createDisplayContext(Display) to obtain a Context for that display, then use Context.getSystemService(Context.WINDOW_SERVICE)
 * to get the WindowManager.
 *
 * The simplest way to show a window on another display is to create a Presentation. The presentation will automatically
 * obtain a WindowManager and Context for that display.
 *
 * Instances of this class must be obtained using Context.getSystemService(Class) with the argument WindowManager.class
 * or Context.getSystemService(String) with the argument Context.WINDOW_SERVICE.
 */
public class AndroidWindowManager: JavaObject {
    
    public var defaultDisplay: AndroidDisplay? {
        get {
            return getDefaultDisplay()
        }
    }
    
    @inline(__always)
    private func getDefaultDisplay() -> AndroidDisplay? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getDefaultDisplay",
            methodSig: "()Landroid/view/Display;",
            methodCache: &JNICacheWindowManager.MethodID.getDefaultDisplay,
            args: &__args,
            locals: &__locals )
        
        return __return != nil ? AndroidDisplay(javaObject: __return) : nil
    }
    
    public func removeViewImmediate(view: AndroidView)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeViewImmediate",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &JNICacheWindowManager.MethodID.removeViewImmediate,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Private

internal extension AndroidWindowManager {
    
    /// JNI Cache
    struct JNICacheWindowManager {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["WindowManager"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var getDefaultDisplay: jmethodID?
            static var removeViewImmediate: jmethodID?
        }
    }
}
