//
//  ViewTreeObserver.swift
//  Android
//
//  Created by Marco Estrella on 1/22/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View {
    
    public typealias ViewTreeObserver = AndroidViewTreeObserver
}

/** A view tree observer is used to register listeners that can be notified of global changes in the view tree.
 * Such global events include, but are not limited to, layout of the whole tree, beginning of the drawing pass, touch mode change....
 * A ViewTreeObserver should never be instantiated by applications as it is provided by the views hierarchy. Refer to View.getViewTreeObserver() for more information.
 */
public class AndroidViewTreeObserver: JavaObject {
    
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
    
    private func isAlive() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isAlive",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isAlive,
            args: &__args,
            locals: &__locals )
        
        return jboolean(__return) != JNI_FALSE
    }
    
    public func addOnGlobalLayoutListener(_ listener: AndroidOnGlobalLayoutListener)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addOnGlobalLayoutListener",
            methodSig: "(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V",
            methodCache: &JNICache.MethodID.addOnGlobalLayoutListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func removeGlobalOnLayoutListener(_ listener: AndroidOnGlobalLayoutListener)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeGlobalOnLayoutListener",
            methodSig: "(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V",
            methodCache: &JNICache.MethodID.removeGlobalOnLayoutListener,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Private

internal extension AndroidViewTreeObserver {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["ViewTreeObserver"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var FEATURE_NO_TITLE: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var isAlive: jmethodID?
            static var addOnGlobalLayoutListener: jmethodID?
            static var removeGlobalOnLayoutListener: jmethodID?
        }
    }
}
