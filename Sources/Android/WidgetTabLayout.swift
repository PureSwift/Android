//
//  WidgetTabLayout.swift
//  Android
//
//  Created by Marco Estrella on 10/18/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias TabLayout = AndroidTabLayout
}

open class AndroidTabLayout: AndroidHorizontalScrollView {
    
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
    
    public override func bindNewJavaObject(context: Android.Content.Context){
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheTabLayout.className,
            classCache: &JNICacheTabLayout.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheTabLayout.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.javaObject = __object
        
        JNI.DeleteLocalRef( __object )
    }
    
    override open func addView(_ view: AndroidView){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(L\(AndroidView.JNICache.className);)V",
            methodCache: &JNICacheTabLayout.MethodID.addView1,
            args: &__args,
            locals: &__locals )
    }
    
    override open func addView(_ child: Android.View.View, index: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = jvalue(i: jint(index))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;I)V",
            methodCache: &JNICacheTabLayout.MethodID.addView2,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    override open func addView(_ child: Android.View.View, index: Int, params: Android.View.ViewGroup.LayoutParams)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = jvalue(i: jint(index))
        __args[0] = JNIType.toJava(value: params, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &JNICacheTabLayout.MethodID.addView3,
            args: &__args,
            locals: &__locals )
    }
    
    override open func addView(_ child: Android.View.View, params: Android.View.ViewGroup.LayoutParams)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: params, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &JNICacheTabLayout.MethodID.addView4,
            args: &__args,
            locals: &__locals )
    }
}

public extension AndroidTabLayout {
    
    public func addOnTabSelectedListener(_ listener: AndroidTabLayout.OnTabSelectedListener) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addOnTabSelectedListener",
            methodSig: "(Landroid/support/design/widget/TabLayout$OnTabSelectedListener;)V",
            methodCache: &JNICacheTabLayout.MethodID.addOnTabSelectedListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func addTab(_ tab: AndroidTabLayout.Tab, setSelected: Bool){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: tab, locals: &__locals)
        __args[1] = jvalue(z: jboolean( setSelected ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addTab",
            methodSig: "(L\(AndroidTab.JNICacheTab.className);Z)V",
            methodCache: &JNICacheTabLayout.MethodID.addTab1,
            args: &__args,
            locals: &__locals )
    }
    
    public func addTab(_ tab: AndroidTabLayout.Tab, position: Int){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: tab, locals: &__locals)
        __args[1] = jvalue(i: jint(position))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addTab",
            methodSig: "(L\(AndroidTab.JNICacheTab.className);I)V",
            methodCache: &JNICacheTabLayout.MethodID.addTab2,
            args: &__args,
            locals: &__locals )
    }
    
    public func addTab(_ tab: AndroidTabLayout.Tab){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: tab, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addTab",
            methodSig: "(L\(AndroidTab.JNICacheTab.className);)V",
            methodCache: &JNICacheTabLayout.MethodID.addTab3,
            args: &__args,
            locals: &__locals )
    }
    
    public func addTab(_ tab: AndroidTabLayout.Tab, position: Int, setSelected: Bool){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = JNIType.toJava(value: tab, locals: &__locals)
        __args[1] = jvalue(i: jint(position))
        __args[2] = jvalue(z: jboolean( setSelected ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addTab",
            methodSig: "(L\(AndroidTab.JNICacheTab.className);IZ)V",
            methodCache: &JNICacheTabLayout.MethodID.addTab4,
            args: &__args,
            locals: &__locals )
    }
    
    public func clearOnTabSelectedListeners(){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clearOnTabSelectedListeners",
            methodSig: "()V",
            methodCache: &JNICacheTabLayout.MethodID.clearOnTabSelectedListeners,
            args: &__args,
            locals: &__locals )
    }
    
    public func generateLayoutParams(_ attrs: JavaObject){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: attrs, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "generateLayoutParams",
            methodSig: "(Landroid/util/AttributeSet;)V",
            methodCache: &JNICacheTabLayout.MethodID.generateLayoutParams,
            args: &__args,
            locals: &__locals )
    }
    
    public func getSelectedTabPosition() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getSelectedTabPosition",
            methodSig: "()I",
            methodCache: &JNICacheTabLayout.MethodID.getSelectedTabPosition,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func getTabAt(index: Int) -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(index))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTabAt",
            methodSig: "(I)L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTabLayout.MethodID.getTabAt,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    public func getTabCount() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTabCount",
            methodSig: "()I",
            methodCache: &JNICacheTabLayout.MethodID.getTabCount,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func getTabGravity() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTabGravity",
            methodSig: "()I",
            methodCache: &JNICacheTabLayout.MethodID.getTabGravity,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func getTabMod() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTabMod",
            methodSig: "()I",
            methodCache: &JNICacheTabLayout.MethodID.getTabMod,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func getTabTextColors() -> JavaObject {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTabTextColors",
            methodSig: "()Landroid/content/res/ColorStateList;",
            methodCache: &JNICacheTabLayout.MethodID.getTabTextColors,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return JavaObject(javaObject: __return)
    }
    
    public func newTab() -> AndroidTab {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "newTab",
            methodSig: "()L\(AndroidTab.JNICacheTab.className);",
            methodCache: &JNICacheTabLayout.MethodID.newTab,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidTab(javaObject: __return)
    }
    
    public func removeAllTabs(){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeAllTabs",
            methodSig: "()V",
            methodCache: &JNICacheTabLayout.MethodID.removeAllTabs,
            args: &__args,
            locals: &__locals )
    }
    
    public func removeOnTabSelectedListener(_ listener: AndroidTabLayout.OnTabSelectedListener) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeOnTabSelectedListener",
            methodSig: "(L\(AndroidOnTabSelectedListener.JNICache.className);)V",
            methodCache: &JNICacheTabLayout.MethodID.removeOnTabSelectedListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func removeTab(_ tab: AndroidTab){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: tab, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeTab",
            methodSig: "(L\(AndroidTab.JNICacheTab.className);)V",
            methodCache: &JNICacheTabLayout.MethodID.removeTab,
            args: &__args,
            locals: &__locals )
    }
    
    public func removeTabAt(position: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(position))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeTabAt",
            methodSig: "(I)V",
            methodCache: &JNICacheTabLayout.MethodID.removeTabAt,
            args: &__args,
            locals: &__locals )
    }
    
    public func setScrollPosition(position: Int, positionOffset: Float, updateSelectedText: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        __args[0] = jvalue(i: jint(position))
        __args[1] = jvalue(f: jfloat(positionOffset))
        __args[2] = jvalue(z: jboolean(updateSelectedText ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollPosition",
            methodSig: "(IFZ)V",
            methodCache: &JNICacheTabLayout.MethodID.setScrollPosition,
            args: &__args,
            locals: &__locals )
    }
    
    public func setSelectedTabIndicatorColor(color: Int64) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(j: jlong(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSelectedTabIndicatorColor",
            methodSig: "(I)V",
            methodCache: &JNICacheTabLayout.MethodID.setSelectedTabIndicatorColor,
            args: &__args,
            locals: &__locals )
    }
    
    public func setSelectedTabIndicatorHeight(height: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(height))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSelectedTabIndicatorHeight",
            methodSig: "(I)V",
            methodCache: &JNICacheTabLayout.MethodID.setSelectedTabIndicatorHeight,
            args: &__args,
            locals: &__locals )
    }
    
    public func setTabGravity(gravity: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(gravity))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTabGravity",
            methodSig: "(I)V",
            methodCache: &JNICacheTabLayout.MethodID.setTabGravity,
            args: &__args,
            locals: &__locals )
    }
    
    public func setTabMode(mode: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(i: jint(mode))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTabMode",
            methodSig: "(I)V",
            methodCache: &JNICacheTabLayout.MethodID.setTabMode,
            args: &__args,
            locals: &__locals )
    }
    
    public func setTabTextColors(normalColor: Int64, selectedColor: Int64) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = jvalue(j: jlong(normalColor))
        __args[1] = jvalue(j: jlong(selectedColor))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTabTextColors",
            methodSig: "(II)V",
            methodCache: &JNICacheTabLayout.MethodID.setTabTextColors1,
            args: &__args,
            locals: &__locals )
    }
    
    public func setTabTextColors(_ textcolor: JavaObject){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: textcolor, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTabTextColors",
            methodSig: "(Landroid/content/res/ColorStateList;)V",
            methodCache: &JNICacheTabLayout.MethodID.setTabTextColors2,
            args: &__args,
            locals: &__locals )
    }
    
    public func setupWithViewPager(_ viewPager: JavaObject, autoRefresh: Bool){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: viewPager, locals: &__locals)
        __args[1] = jvalue(z: jboolean(autoRefresh ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setupWithViewPager",
            methodSig: "(Landroid/support/v4/view/ViewPager;Z)V",
            methodCache: &JNICacheTabLayout.MethodID.setupWithViewPager1,
            args: &__args,
            locals: &__locals )
    }
    
    public func setupWithViewPager(_ viewPager: JavaObject){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: viewPager, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setupWithViewPager",
            methodSig: "(Landroid/support/v4/view/ViewPager;)V",
            methodCache: &JNICacheTabLayout.MethodID.setupWithViewPager2,
            args: &__args,
            locals: &__locals )
    }
}

internal extension AndroidTabLayout {
    
    /// JNI Cache
    struct JNICacheTabLayout {
        
        /// JNI Java class signature
        static let classSignature = SupportDesign.Widget.className(["TabLayout"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var addOnTabSelectedListener: jmethodID?
            static var addTab1: jmethodID?
            static var addTab2: jmethodID?
            static var addTab3: jmethodID?
            static var addTab4: jmethodID?
            static var addView1: jmethodID?
            static var addView2: jmethodID?
            static var addView3: jmethodID?
            static var addView4: jmethodID?
            static var clearOnTabSelectedListeners: jmethodID?
            static var generateLayoutParams: jmethodID?
            static var getSelectedTabPosition: jmethodID?
            static var getTabAt: jmethodID?
            static var getTabCount: jmethodID?
            static var getTabGravity: jmethodID?
            static var getTabMod: jmethodID?
            static var getTabTextColors: jmethodID?
            static var newTab: jmethodID?
            static var removeAllTabs: jmethodID?
            static var removeOnTabSelectedListener: jmethodID?
            static var removeTab: jmethodID?
            static var removeTabAt: jmethodID?
            static var setScrollPosition: jmethodID?
            static var setSelectedTabIndicatorColor: jmethodID?
            static var setSelectedTabIndicatorHeight: jmethodID?
            static var setTabGravity: jmethodID?
            static var setTabMode: jmethodID?
            static var setTabTextColors1: jmethodID?
            static var setTabTextColors2: jmethodID?
            static var setupWithViewPager1: jmethodID?
            static var setupWithViewPager2: jmethodID?
        }
    }
}
