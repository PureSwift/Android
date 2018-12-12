//
//  WidgetSeekBar.swift
//  Android
//
//  Created by Marco Estrella on 12/12/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias SeekBar = AndroidSeekBar
}

/* https://developer.android.com/reference/android/widget/SeekBar
 *
 * A SeekBar is an extension of ProgressBar that adds a draggable thumb.
 * The user can touch the thumb and drag left or right to set the current progress level or use the arrow keys.
 * Placing focusable widgets to the left or right of a SeekBar is discouraged.
 *
 * Clients of the SeekBar can attach a SeekBar.OnSeekBarChangeListener to be notified of the user's actions.
 */
open class AndroidSeekBar: AndroidAbsSeekBar {
    
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
            className: JNICacheSeekBar.className,
            classCache: &JNICacheSeekBar.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheSeekBar.MethodID.init_method_1,
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
            className: JNICacheSeekBar.className,
            classCache: &JNICacheSeekBar.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
            methodCache: &JNICacheSeekBar.MethodID.init_method_2,
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
            className: JNICacheSeekBar.className,
            classCache: &JNICacheSeekBar.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
            methodCache: &JNICacheSeekBar.MethodID.init_method_3,
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
            className: JNICacheSeekBar.className,
            classCache: &JNICacheSeekBar.jniClass,
            methodSig: "(Landroid/content/Context;Landroid/util/AttributeSet;II)V",
            methodCache: &JNICacheSeekBar.MethodID.init_method_4,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
}

public extension AndroidSeekBar {
    
    public func setOnSeekBarChangeListener(_ l: AndroidOnSeekBarChangeListener){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: l, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnSeekBarChangeListener",
            methodSig: "(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V",
            methodCache: &JNICacheSeekBar.MethodID.setOnSeekBarChangeListener,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidSeekBar {
    
    /// JNI Cache
    struct JNICacheSeekBar {
        
        static let classSignature = Android.Widget.className(["SeekBar"])
        
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
            static var setOnSeekBarChangeListener: jmethodID?
        }
    }
}
