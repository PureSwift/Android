//
//  WidgetProgressBar.swift
//  Android
//
//  Created by Marco Estrella on 12/12/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias ProgressBar = AndroidProgressBar
}

/* https://developer.android.com/reference/android/widget/ProgressBar
 *
 * A user interface element that indicates the progress of an operation. Progress bar supports two modes to represent progress:
 * determinate, and indeterminate. For a visual overview of the difference between determinate and indeterminate progress modes,
 * see Progress & activity. Display progress bars to a user in a non-interruptive way. Show the progress bar in your app's
 * user interface or in a notification instead of within a dialog.
 */
open class AndroidProgressBar: AndroidView {
    
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
    
    /// Create a new progress bar with range 0...100 and initial progress of 0.
    public convenience init(context: Android.Content.Context) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheProgressBar.className,
            classCache: &JNICacheProgressBar.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheProgressBar.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, attrs: JavaObject) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: attrs, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheProgressBar.className,
            classCache: &JNICacheProgressBar.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
            methodCache: &JNICacheProgressBar.MethodID.init_method_2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, attrs: JavaObject, defStyleAttr: Int) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: attrs, locals: &__locals)
        __args[2] = jvalue(i: jint(defStyleAttr))
        
        let __object = JNIMethod.NewObject(
            className: JNICacheProgressBar.className,
            classCache: &JNICacheProgressBar.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
            methodCache: &JNICacheProgressBar.MethodID.init_method_3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(context: Android.Content.Context, attrs: JavaObject, defStyleAttr: Int, defStyleRes: Int) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = JNIType.toJava(value: attrs, locals: &__locals)
        __args[2] = jvalue(i: jint(defStyleAttr))
        __args[3] = jvalue(i: jint(defStyleRes))
        
        let __object = JNIMethod.NewObject(
            className: JNICacheProgressBar.className,
            classCache: &JNICacheProgressBar.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;II)V",
            methodCache: &JNICacheProgressBar.MethodID.init_method_4,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    open func setMax(_ max: Int) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: max, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMax",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressBar.MethodID.setMax,
            args: &__args,
            locals: &__locals )
    }
    
    open func setMin(_ max: Int) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: max, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMin",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressBar.MethodID.setMin,
            args: &__args,
            locals: &__locals )
    }
}

public extension AndroidProgressBar {
    
    /// Return the upper limit of this progress bar's range.
    public func getMax() -> Int {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMax",
            methodSig: "()I",
            methodCache: &JNICacheProgressBar.MethodID.getMax,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /// Return the lower limit of this progress bar's range.
    public func getMin() -> Int {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMin",
            methodSig: "()I",
            methodCache: &JNICacheProgressBar.MethodID.getMin,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /// Get the progress bar's current level of progress.
    public func getProgress() -> Int {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getProgress",
            methodSig: "()I",
            methodCache: &JNICacheProgressBar.MethodID.getProgress,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func isIndeterminate() -> Bool {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isIndeterminate",
            methodSig: "()Z",
            methodCache: &JNICacheProgressBar.MethodID.isIndeterminate,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func setIndeterminate(_ indeterminate: Bool) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(indeterminate ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setIndeterminate",
            methodSig: "(Z)V",
            methodCache: &JNICacheProgressBar.MethodID.setIndeterminate,
            args: &__args,
            locals: &__locals )
    }
    
    public func setProgress(_ value: Int) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: value, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setProgress",
            methodSig: "(I)V",
            methodCache: &JNICacheProgressBar.MethodID.setProgress1,
            args: &__args,
            locals: &__locals )
    }
    
    public func setProgress(progress: Int, animate: Bool) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(i: jint(progress))
        __args[1] = jvalue(z: jboolean(animate ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setProgress",
            methodSig: "(IZ)V",
            methodCache: &JNICacheProgressBar.MethodID.setProgress2,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidProgressBar {
    
    /// JNI Cache
    struct JNICacheProgressBar {
        
        static let classSignature = Android.Widget.className(["ProgressBar"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var init_method_2: jmethodID?
            static var init_method_3: jmethodID?
            static var init_method_4: jmethodID?
            static var getMax: jmethodID?
            static var getMin: jmethodID?
            static var getProgress: jmethodID?
            static var isIndeterminate: jmethodID?
            static var setIndeterminate: jmethodID?
            static var setMax: jmethodID?
            static var setMin: jmethodID?
            static var setProgress1: jmethodID?
            static var setProgress2: jmethodID?
        }
    }
}
