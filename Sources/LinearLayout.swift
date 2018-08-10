//
//  LinearLayout.swift
//  Android
//
//  Created by Killian Greene on 8/10/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidViewGroup {
    public typealias LinearLayout = AndroidLinearLayout
}

open class AndroidLinearLayout: Android.View.ViewGroup {
    // MARK: - Initialization
    public convenience init(context: Android.Content.Context) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: LinearLayoutJNICache.className,
            classCache: &LinearLayoutJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V)",
            methodCache: &LinearLayoutJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals)
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    /**
     * Return the offset of the widget's text baseline from the widget's top boundary.
     */
    open override func getBaseline() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getBaseline",
            methodSig: "()I",
            methodCache: &LinearLayoutJNICache.MethodID.getBaseline,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Called when any RTL property (layout direction or text direction or text alignment) has been changed.
     */
    open override func onRtlPropertiesChanged(layoutDirection: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(layoutDirection))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onRtlPropertiesChanged",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.onRtlPropertiesChanged,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Return true if the pressed state should be delayed for children or descendants of this ViewGroup.
     */
    open override func shouldDelayChildPressedState() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "shouldDelayChildPressedState",
            methodSig: "()Z",
            methodCache: &LinearLayoutJNICache.MethodID.shouldDelayChildPressedState,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
}

// MARK: - Methods
public extension AndroidLinearLayout {
    
    public func getBaselineAlignedChildIndex() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getBaselineAlignedChildIndex",
            methodSig: "()I",
            methodCache: &LinearLayoutJNICache.MethodID.getBaselineAlignedChildIndex,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Get the padding size used to inset dividers in pixels
     */
    public func getDividerPadding() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getDividerPadding",
            methodSig: "()I",
            methodCache: &LinearLayoutJNICache.MethodID.getDividerPadding,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the current gravity.
     */
    public func getGravity() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getGravity",
            methodSig: "()I",
            methodCache: &LinearLayoutJNICache.MethodID.getGravity,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the current orientation.
     */
    public func getOrientation() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getOrientation",
            methodSig: "()I",
            methodCache: &LinearLayoutJNICache.MethodID.getOrientation,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    
    public func getShowDividers() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getShowDividers",
            methodSig: "()I",
            methodCache: &LinearLayoutJNICache.MethodID.getShowDividers,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the desired weights sum.
     */
    public func getWeightSum() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getWeightSum",
            methodSig: "()F",
            methodCache: &LinearLayoutJNICache.MethodID.getWeightSum,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    /**
     * Indicates whether widgets contained within this layout are aligned on their baseline or not.
     */
    public func isBaselineAligned() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isBaselineAligned",
            methodSig: "()Z",
            methodCache: &LinearLayoutJNICache.MethodID.isBaselineAligned,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * When true, all children with a weight will be considered having the minimum size of the largest child.
     */
    public func isMeasureWithLargestChildEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isMeasureWithLargestChildEnabled",
            methodSig: "()Z",
            methodCache: &LinearLayoutJNICache.MethodID.isMeasureWithLargestChildEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Defines whether widgets contained in this layout are baseline-aligned or not.
     */
    public func setBaselineAligned(baselineAligned: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(baselineAligned ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setBaselineAligned",
            methodSig: "(Z)V",
            methodCache: &LinearLayoutJNICache.MethodID.setBaselineAligned,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setBaselineAlignedChildIndex(i: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(i))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setBaselineAlignedChildIndex",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.setBaselineAlignedChildIndex,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Set a drawable to be used as a divider between items.
     */
    public func setDividerDrawable(divider: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: divider, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDividerDrawable",
            methodSig: "(Landroid/graphics/drawable/Drawable;)V",
            methodCache: &LinearLayoutJNICache.MethodID.setDividerDrawable,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Set padding displayed on both ends of dividers.
     */
    public func setDividerPadding(padding: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(padding))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDividerPadding",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.setDividerPadding,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Describes how the child views are positioned.
     */
    public func setGravity(gravity: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(gravity))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setGravity",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.setGravity,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setHorizontalGravity(horizontalGravity: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(horizontalGravity))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHorizontalGravity",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.setHorizontalGravity,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * When set to true, all children with a weight will be considered having the minimum size of the largest child.
     */
    public func setMeasureWithLargestChildEnabled(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMeasureWithLargestChildEnabled",
            methodSig: "(Z)V",
            methodCache: &LinearLayoutJNICache.MethodID.setMeasureWithLargestChildEnabled,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Should the layout be a column or a row.
     */
    public func setOrientation(orientation: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(orientation))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOrientation",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.setOrientation,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Set how dividers should be shown between items in this layout
     */
    public func setShowDividers(showDividers: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(showDividers))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setShowDividers",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.setShowDividers,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setVerticalGravity(verticalGravity: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(verticalGravity))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setVerticalGravity",
            methodSig: "(I)V",
            methodCache: &LinearLayoutJNICache.MethodID.setVerticalGravity,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Defines the desired weights sum.
     */
    public func setWeightSum(weightSum: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(weightSum))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setWeightSum",
            methodSig: "(F)V",
            methodCache: &LinearLayoutJNICache.MethodID.setWeightSum,
            args: &__args,
            locals: &__locals )
    }
    
}

// MARK: - Private
internal extension AndroidLinearLayout {
    
    /// JNI Cache
    struct LinearLayoutJNICache {
        
        /// JNI Java class signature
        static let classSignature = SwiftSupport.View.className(["LinearLayout"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var init_method_1: jmethodID?
            static var getBaseline: jmethodID?
            static var getBaselineAlignedChildIndex: jmethodID?
            static var getDividerPadding: jmethodID?
            static var getGravity: jmethodID?
            static var getOrientation: jmethodID?
            static var getShowDividers: jmethodID?
            static var getWeightSum: jmethodID?
            static var isBaselineAligned: jmethodID?
            static var isMeasureWithLargestChildEnabled: jmethodID?
            static var onRtlPropertiesChanged: jmethodID?
            static var setBaselineAligned: jmethodID?
            static var setBaselineAlignedChildIndex: jmethodID?
            static var setDividerDrawable: jmethodID?
            static var setDividerPadding: jmethodID?
            static var setGravity: jmethodID?
            static var setHorizontalGravity: jmethodID?
            static var setMeasureWithLargestChildEnabled: jmethodID?
            static var setOrientation: jmethodID?
            static var setShowDividers: jmethodID?
            static var setVerticalGravity: jmethodID?
            static var setWeightSum: jmethodID?
            static var shouldDelayChildPressedState: jmethodID?
        }
    }
}
