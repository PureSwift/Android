//
//  AndroidView.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View {
    
    public typealias View = AndroidView
}

/// `Android.View.View`
open class AndroidView: JavaObject {
    
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
    
    public var viewTreeObserver: AndroidViewTreeObserver? {
        get {
            return getViewTreeObserver()
        }
    }
    
    public var rootView: AndroidView? {
        get {
            return getRootView()
        }
    }
    
    public var layoutParams: Android.View.ViewGroup.LayoutParams? {
        
        get { return getLayoutParams() }
        
        set { setLayoutParams(newValue) }
    }
    
    public var context: Android.Content.Context? {
        
        get {
            return getContext()
        }
    }
    
    public var background: Android.Graphics.Drawable.Drawable? {
        get {
            return getBackground()
        }
        set {
            setBackground(newValue)
        }
    }
    
    public var parent: Android.Widget.FrameLayout? {
        get {
            return getParent()
        }
    }
    
    open func findViewById(_ id: Int) -> Android.View.View? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: id, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "findViewById",
            methodSig: "(I)Landroid/view/View;",
            methodCache: &JNICache.MethodID.findViewById,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.View.View(javaObject: __return) : nil
    }
    
    open func findViewWithTag(_ tag: JavaObject) -> Android.View.View? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: tag, locals: &__locals)
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "findViewWithTag",
            methodSig: "(Ljava/lang/Object;)Landroid/view/View;",
            methodCache: &JNICache.MethodID.findViewWithTag,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.View.View(javaObject: __return) : nil
    }
    
    open func performClick() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "performClick",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.performClick,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    // Overridable func
    /**
     * Called when this view wants to give up focus.
     */
    open func clearFocus()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clearFocus",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.clearFocus,
            args: &__args,
            locals: &__locals )
    }
    
    open func onWindowFocusChanged(hasWindowFocus: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hasWindowFocus ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onWindowFocusChanged",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.onWindowFocusChanged,
            args: &__args,
            locals: &__locals )
    }
    
    open func dispatchPointerCaptureChanged(hasCapture: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hasCapture ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchPointerCaptureChanged",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.dispatchPointerCaptureChanged,
            args: &__args,
            locals: &__locals )
    }
    
    open func dispatchCapturedPointerEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchCapturedPointerEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.dispatchCapturedPointerEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Dispatch a hint about whether this view is displayed.
     */
    open func dispatchDisplayHint(hint: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(hint))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchDisplayHint",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.dispatchDisplayHint,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Dispatches drawableHotspotChanged to all of this View's children.
     */
    open func dispatchDrawableHotspotChanged(x: Float, y: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(x))
        __args[1] = jvalue(f: jfloat(y))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchDrawableHotspotChanged",
            methodSig: "(FF)V",
            methodCache: &JNICache.MethodID.dispatchDrawableHotspotChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    open func dispatchKeyEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchKeyEvent",
            methodSig: "(Landroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.dispatchKeyEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open func dispatchKeyEventPreIme(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchKeyEventPreIme",
            methodSig: "(Landroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.dispatchKeyEventPreIme,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open func dispatchKeyShortcutEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchKeyShortcutEvent",
            methodSig: "(Landroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.dispatchKeyShortcutEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open func dispatchProvideAutofillStructure(structure: JavaObject, flags: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: structure, locals: &__locals)
        __args[1] = jvalue(i: jint(flags))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchProvideAutofillStructure",
            methodSig: "(Landroid/view/ViewStructure;I)V",
            methodCache: &JNICache.MethodID.dispatchProvideAutofillStructure,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    
    open func dispatchProvideStructure(structure: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: structure, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchProvideStructure",
            methodSig: "(Landroid/view/ViewStructure;)V",
            methodCache: &JNICache.MethodID.dispatchProvideStructure,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    open func dispatchTrackballEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchTrackballEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.dispatchTrackballEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open func dispatchUnhandledMove(focused: Android.View.View, direction: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: focused, locals: &__locals)
        __args[1] = jvalue(i: jint(direction))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchUnhandledMove",
            methodSig: "(Landroid/view/View;I)Z",
            methodCache: &JNICache.MethodID.dispatchUnhandledMove,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Called when the window containing this view gains or loses window focus.
     */
    open func dispatchWindowFocusChanged(hasFocus: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hasFocus ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchWindowFocusChanged",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.dispatchWindowFocusChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Dispatch callbacks to setOnSystemUiVisibilityChangeListener(View.OnSystemUiVisibilityChangeListener) down the view hierarchy.
     */
    open func dispatchSystemUiVisibilityChanged(visibility: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visibility))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchSystemUiVisibilityChanged",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.dispatchSystemUiVisibilityChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    
    /**
     * Dispatch callbacks to onWindowSystemUiVisibilityChanged(int) down the view hierarchy.
     */
    open func dispatchWindowSystemUiVisiblityChanged(visible: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visible))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchWindowSystemUiVisiblityChanged",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.dispatchWindowSystemUiVisiblityChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Dispatch a window visibility change down the view hierarchy.
     */
    open func dispatchWindowVisibilityChanged(visibility: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visibility))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchWindowVisibilityChanged",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.dispatchWindowVisibilityChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Returns true if this view has focus itself, or is the ancestor of the view that has focus.
     */
    open func hasFocus() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasFocus",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasFocus,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether the view is currently tracking transient state that the app should not need to concern itself with saving and restoring, but that the framework should take special note to preserve when possible.
     */
    open func hasTransientState() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasTransientState",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasTransientState,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Call Drawable.jumpToCurrentState() on all Drawable objects associated with this view.
     */
    open func jumpDrawablesToCurrentState()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "jumpDrawablesToCurrentState",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.jumpDrawablesToCurrentState,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Assign a size and position to a view and all of its descendants
     */
    open func layout(l: Int, t: Int, r: Int, b: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(l))
        __args[1] = jvalue(i: jint(t))
        __args[2] = jvalue(i: jint(r))
        __args[3] = jvalue(i: jint(b))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "layout",
            methodSig: "(IIII)V",
            methodCache: &JNICache.MethodID.layout,
            args: &__args,
            locals: &__locals )
        
        
    }
    open func requestFocus(direction: Int, previouslyFocusedRect: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(direction))
        __args[1] = JNIType.toJava(value: previouslyFocusedRect, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestFocus",
            methodSig: "(ILandroid/graphics/Rect;)Z",
            methodCache: &JNICache.MethodID.requestFocus,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    open func restoreDefaultFocus() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "restoreDefaultFocus",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.restoreDefaultFocus,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Measure the view and its content to determine the measured width and the measured height.
     */
    open func onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(widthMeasureSpec))
        __args[1] = jvalue(i: jint(heightMeasureSpec))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onMeasure",
            methodSig: "(II)V",
            methodCache: &JNICache.MethodID.onMeasure,
            args: &__args,
            locals: &__locals )
    }
    
    open func onKeyDown(keyCode: Int, event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(keyCode))
        __args[1] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onKeyDown",
            methodSig: "(ILandroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.onKeyDown,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    open func setPadding(left: Int, top: Int, right: Int, bottom: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(left))
        __args[1] = jvalue(i: jint(top))
        __args[2] = jvalue(i: jint(right))
        __args[3] = jvalue(i: jint(bottom))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPadding",
            methodSig: "(IIII)V",
            methodCache: &JNICache.MethodID.setPadding,
            args: &__args,
            locals: &__locals )
    }
    
    
    open func setPaddingRelative(start: Int, top: Int, end: Int, bottom: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(start))
        __args[1] = jvalue(i: jint(top))
        __args[2] = jvalue(i: jint(end))
        __args[3] = jvalue(i: jint(bottom))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPaddingRelative",
            methodSig: "(IIII)V",
            methodCache: &JNICache.MethodID.setPaddingRelative,
            args: &__args,
            locals: &__locals )
    }
    
    open func setSelected(selected: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(selected ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSelected",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setSelected,
            args: &__args,
            locals: &__locals )
    }
    
    open func showContextMenu() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "showContextMenu",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.showContextMenu,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open func showContextMenu(x: Float, y: Float) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(x))
        __args[1] = jvalue(f: jfloat(y))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "showContextMenu",
            methodSig: "(FF)Z",
            methodCache: &JNICache.MethodID.showContextMenu2,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Cancels a pending long press.
     */
    open func cancelLongPress()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "cancelLongPress",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.cancelLongPress,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Constants

public extension Android.View.View {
    
    /**
     * Live region mode specifying that accessibility services should interrupt ongoing speech to immediately announce changes to this view.
     */
    internal static var ACCESSIBILITY_LIVE_REGION_ASSERTIVE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACCESSIBILITY_LIVE_REGION_ASSERTIVE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACCESSIBILITY_LIVE_REGION_ASSERTIVE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Live region mode specifying that accessibility services should not automatically announce changes to this view.
     */
    internal static var ACCESSIBILITY_LIVE_REGION_NONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACCESSIBILITY_LIVE_REGION_NONE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACCESSIBILITY_LIVE_REGION_NONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Live region mode specifying that accessibility services should announce changes to this view.
     */
    internal static var ACCESSIBILITY_LIVE_REGION_POLITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "ACCESSIBILITY_LIVE_REGION_POLITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.ACCESSIBILITY_LIVE_REGION_POLITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag requesting you to add views that are marked as not important for autofill (see setImportantForAutofill(int)) to a ViewStructure.
     */
    internal static var AUTOFILL_FLAG_INCLUDE_NOT_IMPORTANT_VIEWS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUTOFILL_FLAG_INCLUDE_NOT_IMPORTANT_VIEWS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUTOFILL_FLAG_INCLUDE_NOT_IMPORTANT_VIEWS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a credit card expiration date.
     */
    internal static var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a credit card expiration day.
     */
    internal static var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DAY: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DAY",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a credit card expiration month.
     */
    internal static var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_MONTH: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_MONTH",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_MONTH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a credit card expiration year.
     */
    internal static var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_YEAR: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_YEAR",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_YEAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a credit card number.
     */
    internal static var AUTOFILL_HINT_CREDIT_CARD_NUMBER: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_CREDIT_CARD_NUMBER",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_CREDIT_CARD_NUMBER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a credit card security code.
     */
    internal static var AUTOFILL_HINT_CREDIT_CARD_SECURITY_CODE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_CREDIT_CARD_SECURITY_CODE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_CREDIT_CARD_SECURITY_CODE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with an email address.
     */
    internal static var AUTOFILL_HINT_EMAIL_ADDRESS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_EMAIL_ADDRESS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_EMAIL_ADDRESS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a user's real name.
     */
    internal static var AUTOFILL_HINT_NAME: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_NAME",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_NAME,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a password.
     */
    internal static var AUTOFILL_HINT_PASSWORD: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_PASSWORD",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_PASSWORD,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a phone number.
     */
    internal static var AUTOFILL_HINT_PHONE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_PHONE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_PHONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a postal address.
     */
    internal static var AUTOFILL_HINT_POSTAL_ADDRESS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_POSTAL_ADDRESS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_POSTAL_ADDRESS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a postal code.
     */
    internal static var AUTOFILL_HINT_POSTAL_CODE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_POSTAL_CODE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_POSTAL_CODE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Hint indicating that this view can be autofilled with a username.
     */
    internal static var AUTOFILL_HINT_USERNAME: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "AUTOFILL_HINT_USERNAME",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.AUTOFILL_HINT_USERNAME,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Autofill type for a field that contains a date, which is represented by a long representing the number of milliseconds since the standard base time known as "the epoch", namely January 1, 1970, 00:00:00 GMT (see Date.getTime().
     */
    internal static var AUTOFILL_TYPE_DATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUTOFILL_TYPE_DATE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUTOFILL_TYPE_DATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Autofill type for a selection list field, which is filled by an int representing the element index inside the list (starting at 0).
     */
    internal static var AUTOFILL_TYPE_LIST: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUTOFILL_TYPE_LIST",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUTOFILL_TYPE_LIST,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Autofill type for views that cannot be autofilled.
     */
    internal static var AUTOFILL_TYPE_NONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUTOFILL_TYPE_NONE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUTOFILL_TYPE_NONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Autofill type for a text field, which is filled by a CharSequence.
     */
    internal static var AUTOFILL_TYPE_TEXT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUTOFILL_TYPE_TEXT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUTOFILL_TYPE_TEXT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Autofill type for a togglable field, which is filled by a boolean.
     */
    internal static var AUTOFILL_TYPE_TOGGLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUTOFILL_TYPE_TOGGLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUTOFILL_TYPE_TOGGLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag indicating that a drag can cross window boundaries.
     */
    internal static var DRAG_FLAG_GLOBAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DRAG_FLAG_GLOBAL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DRAG_FLAG_GLOBAL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * When this flag is used with DRAG_FLAG_GLOBAL_URI_READ and/or DRAG_FLAG_GLOBAL_URI_WRITE, the URI permission grant can be persisted across device reboots until explicitly revoked with Context.revokeUriPermission(Uri, int) Context.revokeUriPermission}.
     */
    internal static var DRAG_FLAG_GLOBAL_PERSISTABLE_URI_PERMISSION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DRAG_FLAG_GLOBAL_PERSISTABLE_URI_PERMISSION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DRAG_FLAG_GLOBAL_PERSISTABLE_URI_PERMISSION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * When this flag is used with DRAG_FLAG_GLOBAL_URI_READ and/or DRAG_FLAG_GLOBAL_URI_WRITE, the URI permission grant applies to any URI that is a prefix match against the original granted URI.
     */
    internal static var DRAG_FLAG_GLOBAL_PREFIX_URI_PERMISSION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DRAG_FLAG_GLOBAL_PREFIX_URI_PERMISSION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DRAG_FLAG_GLOBAL_PREFIX_URI_PERMISSION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * When this flag is used with DRAG_FLAG_GLOBAL, the drag recipient will be able to request read access to the content URI(s) contained in the ClipData object.
     */
    internal static var DRAG_FLAG_GLOBAL_URI_READ: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DRAG_FLAG_GLOBAL_URI_READ",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DRAG_FLAG_GLOBAL_URI_READ,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * When this flag is used with DRAG_FLAG_GLOBAL, the drag recipient will be able to request write access to the content URI(s) contained in the ClipData object.
     */
    internal static var DRAG_FLAG_GLOBAL_URI_WRITE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DRAG_FLAG_GLOBAL_URI_WRITE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DRAG_FLAG_GLOBAL_URI_WRITE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag indicating that the drag shadow will be opaque.
     */
    internal static var DRAG_FLAG_OPAQUE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "DRAG_FLAG_OPAQUE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.DRAG_FLAG_OPAQUE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Find find views that contain the specified content description.
     */
    internal static var FIND_VIEWS_WITH_CONTENT_DESCRIPTION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FIND_VIEWS_WITH_CONTENT_DESCRIPTION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FIND_VIEWS_WITH_CONTENT_DESCRIPTION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Find views that render the specified text.
     */
    internal static var FIND_VIEWS_WITH_TEXT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FIND_VIEWS_WITH_TEXT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FIND_VIEWS_WITH_TEXT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * This view wants keystrokes.
     */
    internal static var FOCUSABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUSABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUSABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * View flag indicating whether addFocusables(ArrayList, int, int) should add all focusable Views regardless if they are focusable in touch mode.
     */
    internal static var FOCUSABLES_ALL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUSABLES_ALL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUSABLES_ALL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * View flag indicating whether addFocusables(ArrayList, int, int) should add only Views focusable in touch mode.
     */
    internal static var FOCUSABLES_TOUCH_MODE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUSABLES_TOUCH_MODE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUSABLES_TOUCH_MODE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * This view determines focusability automatically.
     */
    internal static var FOCUSABLE_AUTO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUSABLE_AUTO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUSABLE_AUTO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Use with focusSearch(int).
     */
    internal static var FOCUS_BACKWARD: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUS_BACKWARD",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUS_BACKWARD,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Use with focusSearch(int).
     */
    internal static var FOCUS_DOWN: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUS_DOWN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUS_DOWN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Use with focusSearch(int).
     */
    internal static var FOCUS_FORWARD: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUS_FORWARD",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUS_FORWARD,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Use with focusSearch(int).
     */
    internal static var FOCUS_LEFT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUS_LEFT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUS_LEFT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Use with focusSearch(int).
     */
    internal static var FOCUS_RIGHT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUS_RIGHT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUS_RIGHT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Use with focusSearch(int).
     */
    internal static var FOCUS_UP: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "FOCUS_UP",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.FOCUS_UP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * This view is invisible, and it doesn't take any space for layout purposes.
     */
    internal static var GONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "GONE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.GONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * View flag indicating whether this view should have haptic feedback enabled for events such as long presses.
     */
    internal static var HAPTIC_FEEDBACK_ENABLED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HAPTIC_FEEDBACK_ENABLED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HAPTIC_FEEDBACK_ENABLED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Automatically determine whether a view is important for accessibility.
     */
    internal static var IMPORTANT_FOR_ACCESSIBILITY_AUTO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_ACCESSIBILITY_AUTO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_ACCESSIBILITY_AUTO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The view is not important for accessibility.
     */
    internal static var IMPORTANT_FOR_ACCESSIBILITY_NO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_ACCESSIBILITY_NO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_ACCESSIBILITY_NO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The view is not important for accessibility, nor are any of its descendant views.
     */
    internal static var IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The view is important for accessibility.
     */
    internal static var IMPORTANT_FOR_ACCESSIBILITY_YES: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_ACCESSIBILITY_YES",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_ACCESSIBILITY_YES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Automatically determine whether a view is important for autofill.
     */
    internal static var IMPORTANT_FOR_AUTOFILL_AUTO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_AUTOFILL_AUTO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_AUTOFILL_AUTO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The view is not important for autofill, but its children (if any) will be traversed.
     */
    internal static var IMPORTANT_FOR_AUTOFILL_NO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_AUTOFILL_NO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_AUTOFILL_NO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The view is not important for autofill, and its children (if any) will not be traversed.
     */
    internal static var IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The view is important for autofill, and its children (if any) will be traversed.
     */
    internal static var IMPORTANT_FOR_AUTOFILL_YES: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_AUTOFILL_YES",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_AUTOFILL_YES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The view is important for autofill, but its children (if any) will not be traversed.
     */
    internal static var IMPORTANT_FOR_AUTOFILL_YES_EXCLUDE_DESCENDANTS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "IMPORTANT_FOR_AUTOFILL_YES_EXCLUDE_DESCENDANTS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.IMPORTANT_FOR_AUTOFILL_YES_EXCLUDE_DESCENDANTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * This view is invisible, but it still takes up space for layout purposes.
     */
    internal static var INVISIBLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "INVISIBLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.INVISIBLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * View flag indicating that the screen should remain on while the window containing this view is visible to the user.
     */
    internal static var KEEP_SCREEN_ON: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "KEEP_SCREEN_ON",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.KEEP_SCREEN_ON,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Indicates that the view has a hardware layer.
     */
    internal static var LAYER_TYPE_HARDWARE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LAYER_TYPE_HARDWARE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LAYER_TYPE_HARDWARE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Indicates that the view does not have a layer.
     */
    internal static var LAYER_TYPE_NONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LAYER_TYPE_NONE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LAYER_TYPE_NONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Indicates that the view has a software layer.
     */
    internal static var LAYER_TYPE_SOFTWARE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LAYER_TYPE_SOFTWARE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LAYER_TYPE_SOFTWARE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Horizontal layout direction of this view is inherited from its parent.
     */
    internal static var LAYOUT_DIRECTION_INHERIT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LAYOUT_DIRECTION_INHERIT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LAYOUT_DIRECTION_INHERIT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Horizontal layout direction of this view is from deduced from the default language script for the locale.
     */
    internal static var LAYOUT_DIRECTION_LOCALE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LAYOUT_DIRECTION_LOCALE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LAYOUT_DIRECTION_LOCALE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Horizontal layout direction of this view is from Left to Right.
     */
    internal static var LAYOUT_DIRECTION_LTR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LAYOUT_DIRECTION_LTR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LAYOUT_DIRECTION_LTR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Horizontal layout direction of this view is from Right to Left.
     */
    internal static var LAYOUT_DIRECTION_RTL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "LAYOUT_DIRECTION_RTL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.LAYOUT_DIRECTION_RTL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Bit shift of MEASURED_STATE_MASK to get to the height bits for functions that combine both width and height into a single int, such as getMeasuredState() and the childState argument of resolveSizeAndState(int, int, int).
     */
    internal static var MEASURED_HEIGHT_STATE_SHIFT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MEASURED_HEIGHT_STATE_SHIFT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.MEASURED_HEIGHT_STATE_SHIFT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Bits of getMeasuredWidthAndState() and getMeasuredWidthAndState() that provide the actual measured size.
     */
    internal static var MEASURED_SIZE_MASK: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MEASURED_SIZE_MASK",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.MEASURED_SIZE_MASK,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Bits of getMeasuredWidthAndState() and getMeasuredWidthAndState() that provide the additional state bits.
     */
    internal static var MEASURED_STATE_MASK: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MEASURED_STATE_MASK",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.MEASURED_STATE_MASK,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Bit of getMeasuredWidthAndState() and getMeasuredWidthAndState() that indicates the measured size is smaller that the space the view would like to have.
     */
    internal static var MEASURED_STATE_TOO_SMALL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "MEASURED_STATE_TOO_SMALL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.MEASURED_STATE_TOO_SMALL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * This view does not want keystrokes.
     */
    internal static var NOT_FOCUSABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "NOT_FOCUSABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.NOT_FOCUSABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Used to mark a View that has no ID.
     */
    internal static var NO_ID: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "NO_ID",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.NO_ID,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Always allow a user to over-scroll this view, provided it is a view that can scroll.
     */
    internal static var OVER_SCROLL_ALWAYS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "OVER_SCROLL_ALWAYS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.OVER_SCROLL_ALWAYS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Allow a user to over-scroll this view only if the content is large enough to meaningfully scroll, provided it is a view that can scroll.
     */
    internal static var OVER_SCROLL_IF_CONTENT_SCROLLS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "OVER_SCROLL_IF_CONTENT_SCROLLS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.OVER_SCROLL_IF_CONTENT_SCROLLS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Never allow a user to over-scroll this view.
     */
    internal static var OVER_SCROLL_NEVER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "OVER_SCROLL_NEVER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.OVER_SCROLL_NEVER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Indicates that the screen has changed state and is now off.
     */
    internal static var SCREEN_STATE_OFF: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCREEN_STATE_OFF",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCREEN_STATE_OFF,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Indicates that the screen has changed state and is now on.
     */
    internal static var SCREEN_STATE_ON: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCREEN_STATE_ON",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCREEN_STATE_ON,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The scrollbar style to display the scrollbars inside the padded area, increasing the padding of the view.
     */
    internal static var SCROLLBARS_INSIDE_INSET: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLLBARS_INSIDE_INSET",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLLBARS_INSIDE_INSET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The scrollbar style to display the scrollbars inside the content area, without increasing the padding.
     */
    internal static var SCROLLBARS_INSIDE_OVERLAY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLLBARS_INSIDE_OVERLAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLLBARS_INSIDE_OVERLAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The scrollbar style to display the scrollbars at the edge of the view, increasing the padding of the view.
     */
    internal static var SCROLLBARS_OUTSIDE_INSET: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLLBARS_OUTSIDE_INSET",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLLBARS_OUTSIDE_INSET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The scrollbar style to display the scrollbars at the edge of the view, without increasing the padding.
     */
    internal static var SCROLLBARS_OUTSIDE_OVERLAY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLLBARS_OUTSIDE_OVERLAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLLBARS_OUTSIDE_OVERLAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Position the scroll bar at the default position as determined by the system.
     */
    internal static var SCROLLBAR_POSITION_DEFAULT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLLBAR_POSITION_DEFAULT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLLBAR_POSITION_DEFAULT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Position the scroll bar along the left edge.
     */
    internal static var SCROLLBAR_POSITION_LEFT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLLBAR_POSITION_LEFT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLLBAR_POSITION_LEFT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Position the scroll bar along the right edge.
     */
    internal static var SCROLLBAR_POSITION_RIGHT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLLBAR_POSITION_RIGHT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLLBAR_POSITION_RIGHT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Indicates scrolling along the horizontal axis.
     */
    internal static var SCROLL_AXIS_HORIZONTAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_AXIS_HORIZONTAL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_AXIS_HORIZONTAL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Indicates no axis of view scrolling.
     */
    internal static var SCROLL_AXIS_NONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_AXIS_NONE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_AXIS_NONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Indicates scrolling along the vertical axis.
     */
    internal static var SCROLL_AXIS_VERTICAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_AXIS_VERTICAL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_AXIS_VERTICAL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Scroll indicator direction for the bottom edge of the view.
     */
    internal static var SCROLL_INDICATOR_BOTTOM: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_INDICATOR_BOTTOM",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_INDICATOR_BOTTOM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Scroll indicator direction for the ending edge of the view.
     */
    internal static var SCROLL_INDICATOR_END: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_INDICATOR_END",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_INDICATOR_END,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Scroll indicator direction for the left edge of the view.
     */
    internal static var SCROLL_INDICATOR_LEFT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_INDICATOR_LEFT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_INDICATOR_LEFT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Scroll indicator direction for the right edge of the view.
     */
    internal static var SCROLL_INDICATOR_RIGHT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_INDICATOR_RIGHT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_INDICATOR_RIGHT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Scroll indicator direction for the starting edge of the view.
     */
    internal static var SCROLL_INDICATOR_START: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_INDICATOR_START",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_INDICATOR_START,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Scroll indicator direction for the top edge of the view.
     */
    internal static var SCROLL_INDICATOR_TOP: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCROLL_INDICATOR_TOP",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCROLL_INDICATOR_TOP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * View flag indicating whether this view should have sound effects enabled for events such as clicking and touching.
     */
    internal static var SOUND_EFFECTS_ENABLED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SOUND_EFFECTS_ENABLED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SOUND_EFFECTS_ENABLED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * This constant was deprecated in API level 14. Use SYSTEM_UI_FLAG_LOW_PROFILE instead.
     */
    internal static var STATUS_BAR_HIDDEN: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATUS_BAR_HIDDEN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATUS_BAR_HIDDEN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * This constant was deprecated in API level 14. Use SYSTEM_UI_FLAG_VISIBLE instead.
     */
    internal static var STATUS_BAR_VISIBLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "STATUS_BAR_VISIBLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.STATUS_BAR_VISIBLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): View has requested to go into the normal fullscreen mode so that its content can take over the screen while still allowing the user to interact with the application.
     */
    internal static var SYSTEM_UI_FLAG_FULLSCREEN: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_FULLSCREEN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_FULLSCREEN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): View has requested that the system navigation be temporarily hidden.
     */
    internal static var SYSTEM_UI_FLAG_HIDE_NAVIGATION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_HIDE_NAVIGATION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_HIDE_NAVIGATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): View would like to remain interactive when hiding the navigation bar with SYSTEM_UI_FLAG_HIDE_NAVIGATION.
     */
    internal static var SYSTEM_UI_FLAG_IMMERSIVE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_IMMERSIVE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_IMMERSIVE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): View would like to remain interactive when hiding the status bar with SYSTEM_UI_FLAG_FULLSCREEN and/or hiding the navigation bar with SYSTEM_UI_FLAG_HIDE_NAVIGATION.
     */
    internal static var SYSTEM_UI_FLAG_IMMERSIVE_STICKY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_IMMERSIVE_STICKY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_IMMERSIVE_STICKY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): View would like its window to be laid out as if it has requested SYSTEM_UI_FLAG_FULLSCREEN, even if it currently hasn't.
     */
    internal static var SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): View would like its window to be laid out as if it has requested SYSTEM_UI_FLAG_HIDE_NAVIGATION, even if it currently hasn't.
     */
    internal static var SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): When using other layout flags, we would like a stable view of the content insets given to fitSystemWindows(Rect).
     */
    internal static var SYSTEM_UI_FLAG_LAYOUT_STABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_LAYOUT_STABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_LAYOUT_STABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): Requests the navigation bar to draw in a mode that is compatible with light navigation bar backgrounds.
     */
    internal static var SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): Requests the status bar to draw in a mode that is compatible with light status bar backgrounds.
     */
    internal static var SYSTEM_UI_FLAG_LIGHT_STATUS_BAR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_LIGHT_STATUS_BAR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flag for setSystemUiVisibility(int): View has requested the system UI to enter an unobtrusive "low profile" mode.
     */
    internal static var SYSTEM_UI_FLAG_LOW_PROFILE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_LOW_PROFILE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_LOW_PROFILE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Special constant for setSystemUiVisibility(int): View has requested the system UI (status bar) to be visible (the default).
     */
    internal static var SYSTEM_UI_FLAG_VISIBLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_FLAG_VISIBLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_FLAG_VISIBLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Flags that can impact the layout in relation to system UI.
     */
    internal static var SYSTEM_UI_LAYOUT_FLAGS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SYSTEM_UI_LAYOUT_FLAGS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SYSTEM_UI_LAYOUT_FLAGS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Center the paragraph, e.g.
     */
    internal static var TEXT_ALIGNMENT_CENTER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_ALIGNMENT_CENTER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_ALIGNMENT_CENTER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Default for the root view.
     */
    internal static var TEXT_ALIGNMENT_GRAVITY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_ALIGNMENT_GRAVITY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_ALIGNMENT_GRAVITY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Default text alignment.
     */
    internal static var TEXT_ALIGNMENT_INHERIT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_ALIGNMENT_INHERIT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_ALIGNMENT_INHERIT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Align to the end of the paragraph, e.g.
     */
    internal static var TEXT_ALIGNMENT_TEXT_END: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_ALIGNMENT_TEXT_END",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_ALIGNMENT_TEXT_END,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Align to the start of the paragraph, e.g.
     */
    internal static var TEXT_ALIGNMENT_TEXT_START: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_ALIGNMENT_TEXT_START",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_ALIGNMENT_TEXT_START,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Align to the end of the view, which is ALIGN_RIGHT if the view’s resolved layoutDirection is LTR, and ALIGN_LEFT otherwise.
     */
    internal static var TEXT_ALIGNMENT_VIEW_END: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_ALIGNMENT_VIEW_END",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_ALIGNMENT_VIEW_END,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Align to the start of the view, which is ALIGN_LEFT if the view’s resolved layoutDirection is LTR, and ALIGN_RIGHT otherwise.
     */
    internal static var TEXT_ALIGNMENT_VIEW_START: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_ALIGNMENT_VIEW_START",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_ALIGNMENT_VIEW_START,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Text direction is using "any-RTL" algorithm.
     */
    internal static var TEXT_DIRECTION_ANY_RTL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_DIRECTION_ANY_RTL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_DIRECTION_ANY_RTL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Text direction is using "first strong algorithm".
     */
    internal static var TEXT_DIRECTION_FIRST_STRONG: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_DIRECTION_FIRST_STRONG",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_DIRECTION_FIRST_STRONG,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Text direction is using "first strong algorithm".
     */
    internal static var TEXT_DIRECTION_FIRST_STRONG_LTR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_DIRECTION_FIRST_STRONG_LTR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_DIRECTION_FIRST_STRONG_LTR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Text direction is using "first strong algorithm".
     */
    internal static var TEXT_DIRECTION_FIRST_STRONG_RTL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_DIRECTION_FIRST_STRONG_RTL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_DIRECTION_FIRST_STRONG_RTL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Text direction is inherited through ViewGroup
     */
    internal static var TEXT_DIRECTION_INHERIT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_DIRECTION_INHERIT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_DIRECTION_INHERIT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Text direction is coming from the system Locale.
     */
    internal static var TEXT_DIRECTION_LOCALE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_DIRECTION_LOCALE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_DIRECTION_LOCALE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Text direction is forced to LTR.
     */
    internal static var TEXT_DIRECTION_LTR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_DIRECTION_LTR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_DIRECTION_LTR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * Text direction is forced to RTL.
     */
    internal static var TEXT_DIRECTION_RTL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TEXT_DIRECTION_RTL",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TEXT_DIRECTION_RTL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    /**
     * The logging tag used by this class with android.util.Log.
     */
    internal static var VIEW_LOG_TAG: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "VIEW_LOG_TAG",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.VIEW_LOG_TAG,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * This view is visible.
     */
    internal static var VISIBLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "VISIBLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.VISIBLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - Methods

public extension Android.View.View {
    
    @inline(__always)
    internal func setBackground(_ background: Android.Graphics.Drawable.Drawable?)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: background, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setBackground",
            methodSig: "(Landroid/graphics/drawable/Drawable;)V",
            methodCache: &JNICache.MethodID.setBackground,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getBackground() -> Android.Graphics.Drawable.Drawable? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getBackground",
            methodSig: "()Landroid/graphics/drawable/Drawable;",
            methodCache: &JNICache.MethodID.getBackground,
            args: &__args,
            locals: &__locals )
        
        return __return != nil ? Android.Graphics.Drawable.Drawable(javaObject: __return) : nil
    }
    
    @inline(__always)
    public func findViewById(_ id: Android.R.ID) -> Android.View.View? {
        
        return findViewById(id.rawValue)
    }
    
    public func setId(_ id: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: id, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setId,
            args: &__args,
            locals: &__locals )
    }
    
    public func getId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public var identifier: Int {
        
        get { return getId() }
        
        set { setId(newValue) }
    }
    
    public func getTag() -> JavaObject? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTag",
            methodSig: "()Ljava/lang/Object;",
            methodCache: &JNICache.MethodID.getTag,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? JavaObject(javaObject: __return) : nil
    }
    
    public func setTag(_ tag: JavaObject?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: tag, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTag",
            methodSig: "(Ljava/lang/Object;)V",
            methodCache: &JNICache.MethodID.setTag,
            args: &__args,
            locals: &__locals )
    }
    
    public var tag: JavaObject? {
        
        get { return getTag() }
        
        set { setTag(newValue) }
    }
    
    @inline(__always)
    internal func getContext() -> Android.Content.Context? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getContext",
            methodSig: "()Landroid/content/Context;",
            methodCache: &JNICache.MethodID.getContext,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.Content.Context(javaObject: __return) : nil
    }
    
    /**
     * Enables or disables click events for this view.
     */
    public func setClickable(clickable: Bool) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(clickable ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setClickable",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setClickable,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Indicates whether this view reacts to click events or not.
     */
    public func isClickable() -> Bool {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isClickable",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isClickable,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns the enabled status for this view.
     */
    public func isEnabled() -> Bool {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    //////////////////////////////////////////////////////////////////////////////
    
    /**
     * Change the view's z order in the tree, so it's on top of other sibling views.
     */
    public func bringToFront()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "bringToFront",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.bringToFront,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Forces this view's layer to be created and this view to be rendered into its layer.
     */
    public func buildLayer()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "buildLayer",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.buildLayer,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Directly call any attached OnClickListener.
     */
    public func callOnClick() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "callOnClick",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.callOnClick,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Check if layout direction resolution can be done.
     */
    public func canResolveLayoutDirection() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "canResolveLayoutDirection",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.canResolveLayoutDirection,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Check if text alignment resolution can be done.
     */
    public func canResolveTextAlignment() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "canResolveTextAlignment",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.canResolveTextAlignment,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Check if text direction resolution can be done.
     */
    public func canResolveTextDirection() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "canResolveTextDirection",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.canResolveTextDirection,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Check if this view can be scrolled horizontally in a certain direction.
     */
    public func canScrollHorizontally(direction: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(direction))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "canScrollHorizontally",
            methodSig: "(I)Z",
            methodCache: &JNICache.MethodID.canScrollHorizontally,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Check if this view can be scrolled vertically in a certain direction.
     */
    public func canScrollVertically(direction: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(direction))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "canScrollVertically",
            methodSig: "(I)Z",
            methodCache: &JNICache.MethodID.canScrollVertically,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Cancels an ongoing drag and drop operation.
     */
    public func cancelDragAndDrop()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "cancelDragAndDrop",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.cancelDragAndDrop,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Cancel any deferred high-level input events that were previously posted to the event queue.
     */
    public func cancelPendingInputEvents()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "cancelPendingInputEvents",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.cancelPendingInputEvents,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Cancels any animations for this view.
     */
    public func clearAnimation()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clearAnimation",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.clearAnimation,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    
    /**
     * Merge two states as returned by getMeasuredState().
     */
    public func combineMeasuredStates(curState: Int, newState: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(curState))
        __args[1] = jvalue(i: jint(newState))
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "combineMeasuredStates",
            methodSig: "(II)I",
            methodCache: &JNICache.MethodID.combineMeasuredStates,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Called by a parent to request that a child update its values for mScrollX and mScrollY if necessary.
     */
    public func computeScroll()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "computeScroll",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.computeScroll,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    /**
     * Dispatch onFinishTemporaryDetach() to this View and its direct children if this is a container View.
     */
    public func dispatchFinishTemporaryDetach()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchFinishTemporaryDetach",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.dispatchFinishTemporaryDetach,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Dispatch a fling to a nested scrolling parent.
     */
    public func dispatchNestedFling(velocityX: Float, velocityY: Float, consumed: Bool) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = jvalue(f: jfloat(velocityX))
        __args[1] = jvalue(f: jfloat(velocityY))
        __args[2] = jvalue(z: jboolean(consumed ? JNI_TRUE : JNI_FALSE))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchNestedFling",
            methodSig: "(FFZ)Z",
            methodCache: &JNICache.MethodID.dispatchNestedFling,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Dispatch a fling to a nested scrolling parent before it is processed by this view.
     */
    public func dispatchNestedPreFling(velocityX: Float, velocityY: Float) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(velocityX))
        __args[1] = jvalue(f: jfloat(velocityY))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchNestedPreFling",
            methodSig: "(FF)Z",
            methodCache: &JNICache.MethodID.dispatchNestedPreFling,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Dispatch one step of a nested scroll in progress before this view consumes any portion of it.
     */
    public func dispatchNestedPreScroll(dx: Int, dy: Int, consumed: [Int], offsetInWindow: [Int]) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(dx))
        __args[1] = jvalue(i: jint(dy))
        __args[2] = JNIType.toJava(value: consumed, locals: &__locals)
        __args[3] = JNIType.toJava(value: offsetInWindow, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchNestedPreScroll",
            methodSig: "(II[I[I)Z",
            methodCache: &JNICache.MethodID.dispatchNestedPreScroll,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Dispatch one step of a nested scroll in progress.
     */
    public func dispatchNestedScroll(dxConsumed: Int, dyConsumed: Int, dxUnconsumed: Int, dyUnconsumed: Int, offsetInWindow: [Int]) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 5 )
        
        __args[0] = jvalue(i: jint(dxConsumed))
        __args[1] = jvalue(i: jint(dyConsumed))
        __args[2] = jvalue(i: jint(dxUnconsumed))
        __args[3] = jvalue(i: jint(dyUnconsumed))
        __args[4] = JNIType.toJava(value: offsetInWindow, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchNestedScroll",
            methodSig: "(IIII[I)Z",
            methodCache: &JNICache.MethodID.dispatchNestedScroll,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    
    /**
     * Dispatch onStartTemporaryDetach() to this View and its direct children if this is a container View.
     */
    public func dispatchStartTemporaryDetach()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchStartTemporaryDetach",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.dispatchStartTemporaryDetach,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    
    /**
     * This function is called whenever the view hotspot changes and needs to be propagated to drawables or child views managed by the view.
     */
    public func drawableHotspotChanged(x: Float, y: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(x))
        __args[1] = jvalue(f: jfloat(y))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "drawableHotspotChanged",
            methodSig: "(FF)V",
            methodCache: &JNICache.MethodID.drawableHotspotChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Sets the behavior for overlapping rendering for this view (see hasOverlappingRendering() for more details on this behavior).
     */
    public func forceHasOverlappingRendering(hasOverlappingRendering: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hasOverlappingRendering ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "forceHasOverlappingRendering",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.forceHasOverlappingRendering,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Forces this view to be laid out during the next layout pass.
     */
    public func forceLayout()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "forceLayout",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.forceLayout,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Generate a value suitable for use in setId(int).
     */
    public func generateViewId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "generateViewId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.generateViewId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the live region mode for this View.
     */
    public func getAccessibilityLiveRegion() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getAccessibilityLiveRegion",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getAccessibilityLiveRegion,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the id of a view after which this one is visited in accessibility traversal.
     */
    public func getAccessibilityTraversalAfter() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getAccessibilityTraversalAfter",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getAccessibilityTraversalAfter,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the id of a view before which this one is visited in accessibility traversal.
     */
    public func getAccessibilityTraversalBefore() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getAccessibilityTraversalBefore",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getAccessibilityTraversalBefore,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the hints that help an AutofillService determine how to autofill the view with the user's data.
     */
    public func getAutofillHints() -> [String]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getAutofillHints",
            methodSig: "()Ljava/lang/String;",
            methodCache: &JNICache.MethodID.getAutofillHints,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        
        
        return JNIType.toSwift(type: [String].self, from: __return)
    }
    
    /**
     * Describes the autofill type of this view, so an AutofillService can create the proper AutofillValue when autofilling the view.
     */
    public func getAutofillType() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getAutofillType",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getAutofillType,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return the offset of the widget's text baseline from the widget's top boundary.
     */
    public func getBaseline() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getBaseline",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getBaseline,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Bottom position of this view relative to its parent.
     */
    public func getBottom() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getBottom",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getBottom,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns whether the Outline should be used to clip the contents of the View.
     */
    public func getClipToOutline() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getClipToOutline",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.getClipToOutline,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     *  Returns whether this View should use a default focus highlight when it gets focused but doesn't have R.attr.state_focused defined in its background.
     */
    public func getDefaultFocusHighlightEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getDefaultFocusHighlightEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.getDefaultFocusHighlightEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Utility to return a default size.
     */
    public func getDefaultSize(size: Int, measureSpec: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(size))
        __args[1] = jvalue(i: jint(measureSpec))
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getDefaultSize",
            methodSig: "(II)I",
            methodCache: &JNICache.MethodID.getDefaultSize,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return an array of resource IDs of the drawable states representing the current state of the view.
     */
    public func getDrawableState() -> [Int]? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getDrawableState",
            methodSig: "()[I",
            methodCache: &JNICache.MethodID.getDrawableState,
            args: &__args,
            locals: &__locals )
        
        return JNIType.toSwift(type: [Int].self, from: __return)
    }
    
    /**
     * Gets whether the framework should discard touches when the view's window is obscured by another visible window.
     */
    public func getFilterTouchesWhenObscured() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getFilterTouchesWhenObscured",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.getFilterTouchesWhenObscured,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Check for state of setFitsSystemWindows(boolean).
     */
    public func getFitsSystemWindows() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getFitsSystemWindows",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.getFitsSystemWindows,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns the focusable setting for this view.
     */
    public func getFocusable() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getFocusable",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getFocusable,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Describes how the foreground is positioned.
     */
    public func getForegroundGravity() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getForegroundGravity",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getForegroundGravity,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the value for overlapping rendering that is used internally.
     */
    public func getHasOverlappingRendering() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getHasOverlappingRendering",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.getHasOverlappingRendering,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return the height of your view.
     */
    public func getHeight() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getHeight",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getHeight,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the size of the horizontal faded edges used to indicate that more content in this view is visible.
     */
    public func getHorizontalFadingEdgeLength() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getHorizontalFadingEdgeLength",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getHorizontalFadingEdgeLength,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the mode for determining whether this View is important for accessibility.
     */
    public func getImportantForAccessibility() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getImportantForAccessibility",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getImportantForAccessibility,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the mode for determining whether this view is important for autofill.
     */
    public func getImportantForAutofill() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getImportantForAutofill",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getImportantForAutofill,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns whether the screen should remain on, corresponding to the current value of KEEP_SCREEN_ON.
     */
    public func getKeepScreenOn() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getKeepScreenOn",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.getKeepScreenOn,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Gets the id of a view for which this view serves as a label for accessibility purposes.
     */
    public func getLabelFor() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getLabelFor",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getLabelFor,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Indicates what type of layer is currently associated with this view.
     */
    public func getLayerType() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getLayerType",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getLayerType,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    
    //////////////////////
    
    /**
     * Returns the resolved layout direction for this view.
     */
    public func getLayoutDirection() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getLayoutDirection",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getLayoutDirection,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Left position of this view relative to its parent.
     */
    public func getLeft() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getLeft",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getLeft,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Computes the coordinates of this view in its window.
     */
    public func getLocationInWindow(outLocation: [Int])  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: outLocation, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getLocationInWindow",
            methodSig: "([I)V",
            methodCache: &JNICache.MethodID.getLocationInWindow,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Computes the coordinates of this view on the screen.
     */
    public func getLocationOnScreen(outLocation: [Int])  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: outLocation, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getLocationOnScreen",
            methodSig: "([I)V",
            methodCache: &JNICache.MethodID.getLocationOnScreen,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Like getMeasuredHeightAndState(), but only returns the raw height component (that is the result is masked by MEASURED_SIZE_MASK).
     */
    public func getMeasuredHeight() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMeasuredHeight",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getMeasuredHeight,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return the full height measurement information for this view as computed by the most recent call to measure(int, int).
     */
    public func getMeasuredHeightAndState() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMeasuredHeightAndState",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getMeasuredHeightAndState,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return only the state bits of getMeasuredWidthAndState() and getMeasuredHeightAndState(), combined into one integer.
     */
    public func getMeasuredState() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMeasuredState",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getMeasuredState,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Like getMeasuredWidthAndState(), but only returns the raw width component (that is the result is masked by MEASURED_SIZE_MASK).
     */
    public func getMeasuredWidth() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMeasuredWidth",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getMeasuredWidth,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return the full width measurement information for this view as computed by the most recent call to measure(int, int).
     */
    public func getMeasuredWidthAndState() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMeasuredWidthAndState",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getMeasuredWidthAndState,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the minimum height of the view.
     */
    public func getMinimumHeight() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMinimumHeight",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getMinimumHeight,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the minimum width of the view.
     */
    public func getMinimumWidth() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getMinimumWidth",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getMinimumWidth,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the id of the root of the next keyboard navigation cluster.
     */
    public func getNextClusterForwardId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getNextClusterForwardId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getNextClusterForwardId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the id of the view to use when the next focus is FOCUS_DOWN.
     */
    public func getNextFocusDownId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getNextFocusDownId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getNextFocusDownId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the id of the view to use when the next focus is FOCUS_FORWARD.
     */
    public func getNextFocusForwardId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getNextFocusForwardId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getNextFocusForwardId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the id of the view to use when the next focus is FOCUS_LEFT.
     */
    public func getNextFocusLeftId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getNextFocusLeftId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getNextFocusLeftId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the id of the view to use when the next focus is FOCUS_RIGHT.
     */
    public func getNextFocusRightId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getNextFocusRightId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getNextFocusRightId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the id of the view to use when the next focus is FOCUS_UP.
     */
    public func getNextFocusUpId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getNextFocusUpId",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getNextFocusUpId,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    
    public func getOutlineAmbientShadowColor() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getOutlineAmbientShadowColor",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getOutlineAmbientShadowColor,
            args: &__args,
            locals: &__locals )
        
        return Int64(__return)
    }
    
    
    public func getOutlineSpotShadowColor() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getOutlineSpotShadowColor",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getOutlineSpotShadowColor,
            args: &__args,
            locals: &__locals )
        
        return Int64(__return)
    }
    
    /**
     * Returns the over-scroll mode for this view.
     */
    public func getOverScrollMode() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getOverScrollMode",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getOverScrollMode,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the bottom padding of this view.
     */
    public func getPaddingBottom() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getPaddingBottom",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getPaddingBottom,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the end padding of this view depending on its resolved layout direction.
     */
    public func getPaddingEnd() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getPaddingEnd",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getPaddingEnd,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the left padding of this view.
     */
    public func getPaddingLeft() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getPaddingLeft",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getPaddingLeft,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the right padding of this view.
     */
    public func getPaddingRight() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getPaddingRight",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getPaddingRight,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the start padding of this view depending on its resolved layout direction.
     */
    public func getPaddingStart() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getPaddingStart",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getPaddingStart,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the top padding of this view.
     */
    public func getPaddingTop() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getPaddingTop",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getPaddingTop,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns this view's preference for reveal behavior when it gains focus.
     */
    public func getRevealOnFocusHint() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getRevealOnFocusHint",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.getRevealOnFocusHint,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Right position of this view relative to its parent.
     */
    public func getRight() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getRight",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getRight,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the delay before scrollbars fade.
     */
    public func getScrollBarDefaultDelayBeforeFade() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getScrollBarDefaultDelayBeforeFade",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getScrollBarDefaultDelayBeforeFade,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the scrollbar fade duration.
     */
    public func getScrollBarFadeDuration() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getScrollBarFadeDuration",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getScrollBarFadeDuration,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the scrollbar size.
     */
    public func getScrollBarSize() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getScrollBarSize",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getScrollBarSize,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the current scrollbar style.
     */
    public func getScrollBarStyle() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getScrollBarStyle",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getScrollBarStyle,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns a bitmask representing the enabled scroll indicators.
     */
    public func getScrollIndicators() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getScrollIndicators",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getScrollIndicators,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return the scrolled left position of this view.
     */
    public func getScrollX() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getScrollX",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getScrollX,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return the scrolled top position of this view.
     */
    public func getScrollY() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getScrollY",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getScrollY,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Override this if your view is known to always be drawn on top of a solid color background, and needs to draw fading edges.
     */
    public func getSolidColor() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getSolidColor",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getSolidColor,
            args: &__args,
            locals: &__locals )
        
        return Int64(__return)
    }
    
    /**
     * Returns the last setSystemUiVisibility(int) that this view has requested.
     */
    public func getSystemUiVisibility() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getSystemUiVisibility",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getSystemUiVisibility,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return the resolved text alignment.
     */
    public func getTextAlignment() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTextAlignment",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getTextAlignment,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Return the resolved text direction.
     */
    public func getTextDirection() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTextDirection",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getTextDirection,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Top position of this view relative to its parent.
     */
    public func getTop() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTop",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getTop,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the name of the View to be used to identify Views in Transitions.
     */
    public func getTransitionName() -> String {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getTransitionName",
            methodSig: "()Ljava/lang/String;",
            methodCache: &JNICache.MethodID.getTransitionName,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        
        
        return String(javaObject: __return)
    }
    
    /**
     * Returns the size of the vertical faded edges used to indicate that more content in this view is visible.
     */
    public func getVerticalFadingEdgeLength() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getVerticalFadingEdgeLength",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getVerticalFadingEdgeLength,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    
    public func getVerticalScrollbarPosition() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getVerticalScrollbarPosition",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getVerticalScrollbarPosition,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the width of the vertical scrollbar.
     */
    public func getVerticalScrollbarWidth() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getVerticalScrollbarWidth",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getVerticalScrollbarWidth,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the visibility status for this view.
     */
    private func getVisibility() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getVisibility",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getVisibility,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public var visibility: Android.View.View.Visibility {
        
        get { return Android.View.View.Visibility(rawValue: getVisibility()) }
        
        set { setVisibility(newValue.rawValue) }
    }
    
    /**
     * Return the width of your view.
     */
    public func getWidth() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getWidth",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getWidth,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the current system UI visibility that is currently set for the entire window.
     */
    public func getWindowSystemUiVisibility() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getWindowSystemUiVisibility",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getWindowSystemUiVisibility,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the current visibility of the window this view is attached to (either GONE, INVISIBLE, or VISIBLE).
     */
    private func getWindowVisibility() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getWindowVisibility",
            methodSig: "()I",
            methodCache: &JNICache.MethodID.getWindowVisibility,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public var windowVisibility: Android.View.View.Visibility {
        
        return Android.View.View.Visibility(rawValue: getWindowVisibility())
    }
    
    /**
     * Returns true if this view is focusable or if it contains a reachable View for which hasExplicitFocusable() returns true.
     */
    public func hasExplicitFocusable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasExplicitFocusable",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasExplicitFocusable,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    /**
     * Returns true if this view is focusable or if it contains a reachable View for which hasFocusable() returns true.
     */
    public func hasFocusable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasFocusable",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasFocusable,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns true if this view has a nested scrolling parent.
     */
    public func hasNestedScrollingParent() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasNestedScrollingParent",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasNestedScrollingParent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return whether this view has an attached OnClickListener.
     */
    public func hasOnClickListeners() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasOnClickListeners",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasOnClickListeners,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns whether this View has content which overlaps.
     */
    public func hasOverlappingRendering() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasOverlappingRendering",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasOverlappingRendering,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Checks pointer capture status.
     */
    public func hasPointerCapture() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasPointerCapture",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasPointerCapture,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    /**
     * Returns true if this view is in a window that currently has window focus.
     */
    public func hasWindowFocus() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasWindowFocus",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.hasWindowFocus,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Invalidate the whole view.
     */
    public func invalidate()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "invalidate",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.invalidate,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Called to rebuild this View's Outline from its outline provider
     */
    public func invalidateOutline()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "invalidateOutline",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.invalidateOutline,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * Returns whether this View is accessibility focused.
     */
    public func isAccessibilityFocused() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isAccessibilityFocused",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isAccessibilityFocused,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Gets whether this view is a heading for accessibility purposes.
     */
    public func isAccessibilityHeading() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isAccessibilityHeading",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isAccessibilityHeading,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates the activation state of this view.
     */
    public func isActivated() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isActivated",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isActivated,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns true if this view is currently attached to a window.
     */
    public func isAttachedToWindow() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isAttachedToWindow",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isAttachedToWindow,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether this view reacts to context clicks or not.
     */
    public func isContextClickable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isContextClickable",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isContextClickable,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * True if this view has changed since the last time being drawn.
     */
    public func isDirty() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isDirty",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isDirty,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether this duplicates its drawable state from its parent.
     */
    public func isDuplicateParentStateEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isDuplicateParentStateEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isDuplicateParentStateEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns whether this View is currently able to take focus.
     */
    public func isFocusable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isFocusable",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isFocusable,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * When a view is focusable, it may not want to take focus when in touch mode.
     */
    public func isFocusableInTouchMode() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isFocusableInTouchMode",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isFocusableInTouchMode,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns true if this view has focus
     */
    public func isFocused() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isFocused",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isFocused,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns whether this View should receive focus when the focus is restored for the view hierarchy containing this view.
     */
    public func isFocusedByDefault() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isFocusedByDefault",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isFocusedByDefault,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isHapticFeedbackEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isHapticFeedbackEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isHapticFeedbackEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether this view is attached to a hardware accelerated window or not.
     */
    public func isHardwareAccelerated() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isHardwareAccelerated",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isHardwareAccelerated,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicate whether the horizontal edges are faded when the view is scrolled horizontally.
     */
    public func isHorizontalFadingEdgeEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isHorizontalFadingEdgeEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isHorizontalFadingEdgeEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicate whether the horizontal scrollbar should be drawn or not.
     */
    public func isHorizontalScrollBarEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isHorizontalScrollBarEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isHorizontalScrollBarEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns true if the view is currently hovered.
     */
    public func isHovered() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isHovered",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isHovered,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Computes whether this view should be exposed for accessibility.
     */
    public func isImportantForAccessibility() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isImportantForAccessibility",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isImportantForAccessibility,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Hints the Android System whether the AssistStructure.ViewNode associated with this view is considered important for autofill purposes.
     */
    public func isImportantForAutofill() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isImportantForAutofill",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isImportantForAutofill,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether this View is currently in edit mode.
     */
    public func isInEditMode() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isInEditMode",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isInEditMode,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns whether the view hierarchy is currently undergoing a layout pass.
     */
    public func isInLayout() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isInLayout",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isInLayout,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns whether the device is currently in touch mode.
     */
    public func isInTouchMode() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isInTouchMode",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isInTouchMode,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns whether this View is a root of a keyboard navigation cluster.
     */
    public func isKeyboardNavigationCluster() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isKeyboardNavigationCluster",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isKeyboardNavigationCluster,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns true if this view has been through at least one layout since it was last attached to or detached from a window.
     */
    public func isLaidOut() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isLaidOut",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isLaidOut,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isLayoutDirectionResolved() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isLayoutDirectionResolved",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isLayoutDirectionResolved,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether or not this view's layout will be requested during the next hierarchy layout pass.
     */
    public func isLayoutRequested() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isLayoutRequested",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isLayoutRequested,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether this view reacts to long click events or not.
     */
    public func isLongClickable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isLongClickable",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isLongClickable,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns true if nested scrolling is enabled for this view.
     */
    public func isNestedScrollingEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isNestedScrollingEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isNestedScrollingEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether this View is opaque.
     */
    public func isOpaque() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isOpaque",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isOpaque,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Return if the padding has been set through relative values setPaddingRelative(int, int, int, int) or through
     */
    public func isPaddingRelative() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isPaddingRelative",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isPaddingRelative,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns whether or not a pivot has been set by a call to setPivotX(float) or setPivotY(float).
     */
    public func isPivotSet() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isPivotSet",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isPivotSet,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether the view is currently in pressed state.
     */
    public func isPressed() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isPressed",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isPressed,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether this view will save its state (that is, whether its onSaveInstanceState() method will be called).
     */
    public func isSaveEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isSaveEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isSaveEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether the entire hierarchy under this view will save its state when a state saving traversal occurs from its parent.
     */
    public func isSaveFromParentEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isSaveFromParentEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isSaveFromParentEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns whether the view should be treated as a focusable unit by screen reader accessibility tools.
     */
    public func isScreenReaderFocusable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isScreenReaderFocusable",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isScreenReaderFocusable,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates whether this view is one of the set of scrollable containers in its window.
     */
    public func isScrollContainer() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isScrollContainer",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isScrollContainer,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns true if scrollbars will fade when this view is not scrolling
     */
    public func isScrollbarFadingEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isScrollbarFadingEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isScrollbarFadingEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicates the selection state of this view.
     */
    public func isSelected() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isSelected",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isSelected,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Returns the visibility of this view and all of its ancestors
     */
    public func isShown() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isShown",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isShown,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isSoundEffectsEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isSoundEffectsEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isSoundEffectsEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Tells whether the View is in the state between onStartTemporaryDetach() and onFinishTemporaryDetach().
     */
    public func isTemporarilyDetached() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isTemporarilyDetached",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isTemporarilyDetached,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isTextAlignmentResolved() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isTextAlignmentResolved",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isTextAlignmentResolved,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isTextDirectionResolved() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isTextDirectionResolved",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isTextDirectionResolved,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicate whether the vertical edges are faded when the view is scrolled horizontally.
     */
    public func isVerticalFadingEdgeEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isVerticalFadingEdgeEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isVerticalFadingEdgeEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Indicate whether the vertical scrollbar should be drawn or not.
     */
    public func isVerticalScrollBarEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isVerticalScrollBarEnabled",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.isVerticalScrollBarEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Computes whether this virtual autofill view is visible to the user.
     */
    public func isVisibleToUserForAutofill(virtualId: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(virtualId))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isVisibleToUserForAutofill",
            methodSig: "(I)Z",
            methodCache: &JNICache.MethodID.isVisibleToUserForAutofill,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func measure(widthMeasureSpec: Int, heightMeasureSpec: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(widthMeasureSpec))
        __args[1] = jvalue(i: jint(heightMeasureSpec))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "measure",
            methodSig: "(II)V",
            methodCache: &JNICache.MethodID.measure,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func offsetLeftAndRight(offset: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(offset))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "offsetLeftAndRight",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.offsetLeftAndRight,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func offsetTopAndBottom(offset: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(offset))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "offsetTopAndBottom",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.offsetTopAndBottom,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onCancelPendingInputEvents()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onCancelPendingInputEvents",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.onCancelPendingInputEvents,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onCheckIsTextEditor() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onCheckIsTextEditor",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.onCheckIsTextEditor,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onFinishTemporaryDetach()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onFinishTemporaryDetach",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.onFinishTemporaryDetach,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onHoverChanged(hovered: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hovered ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onHoverChanged",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.onHoverChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onPointerCaptureChange(hasCapture: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hasCapture ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onPointerCaptureChange",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.onPointerCaptureChange,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onRtlPropertiesChanged(layoutDirection: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(layoutDirection))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onRtlPropertiesChanged",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.onRtlPropertiesChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onScreenStateChanged(screenState: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(screenState))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onScreenStateChanged",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.onScreenStateChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onStartTemporaryDetach()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onStartTemporaryDetach",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.onStartTemporaryDetach,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onVisibilityAggregated(isVisible: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(isVisible ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onVisibilityAggregated",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.onVisibilityAggregated,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func onWindowSystemUiVisibilityChanged(visible: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visible))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onWindowSystemUiVisibilityChanged",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.onWindowSystemUiVisibilityChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func performContextClick(x: Float, y: Float) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(x))
        __args[1] = jvalue(f: jfloat(y))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "performContextClick",
            methodSig: "(FF)Z",
            methodCache: &JNICache.MethodID.performContextClick,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func performContextClick() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "performContextClick",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.performContextClick2,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func performHapticFeedback(feedbackConstant: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(feedbackConstant))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "performHapticFeedback",
            methodSig: "(I)Z",
            methodCache: &JNICache.MethodID.performHapticFeedback,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func performHapticFeedback(feedbackConstant: Int, flags: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(feedbackConstant))
        __args[1] = jvalue(i: jint(flags))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "performHapticFeedback",
            methodSig: "(II)Z",
            methodCache: &JNICache.MethodID.performHapticFeedback2,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func performLongClick(x: Float, y: Float) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(x))
        __args[1] = jvalue(f: jfloat(y))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "performLongClick",
            methodSig: "(FF)Z",
            methodCache: &JNICache.MethodID.performLongClick,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func performLongClick() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "performLongClick",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.performLongClick2,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func playSoundEffect(soundConstant: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(soundConstant))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "playSoundEffect",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.playSoundEffect,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func postInvalidate()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "postInvalidate",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.postInvalidate,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func postInvalidate(left: Int, top: Int, right: Int, bottom: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(left))
        __args[1] = jvalue(i: jint(top))
        __args[2] = jvalue(i: jint(right))
        __args[3] = jvalue(i: jint(bottom))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "postInvalidate",
            methodSig: "(IIII)V",
            methodCache: &JNICache.MethodID.postInvalidate2,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func postInvalidateDelayed(delayMilliseconds: Int64, left: Int, top: Int, right: Int, bottom: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 5 )
        
        __args[0] = jvalue(j: jlong(delayMilliseconds))
        __args[1] = jvalue(i: jint(left))
        __args[2] = jvalue(i: jint(top))
        __args[3] = jvalue(i: jint(right))
        __args[4] = jvalue(i: jint(bottom))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "postInvalidateDelayed",
            methodSig: "(JIIII)V",
            methodCache: &JNICache.MethodID.postInvalidateDelayed,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func postInvalidateDelayed(delayMilliseconds: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(j: jlong(delayMilliseconds))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "postInvalidateDelayed",
            methodSig: "(J)V",
            methodCache: &JNICache.MethodID.postInvalidateDelayed2,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func postInvalidateOnAnimation(left: Int, top: Int, right: Int, bottom: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(i: jint(left))
        __args[1] = jvalue(i: jint(top))
        __args[2] = jvalue(i: jint(right))
        __args[3] = jvalue(i: jint(bottom))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "postInvalidateOnAnimation",
            methodSig: "(IIII)V",
            methodCache: &JNICache.MethodID.postInvalidateOnAnimation,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func postInvalidateOnAnimation()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "postInvalidateOnAnimation",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.postInvalidateOnAnimation2,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func refreshDrawableState()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "refreshDrawableState",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.refreshDrawableState,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func releasePointerCapture()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "releasePointerCapture",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.releasePointerCapture,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func requestApplyInsets()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "requestApplyInsets",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.requestApplyInsets,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func requestFitSystemWindows()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "requestFitSystemWindows",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.requestFitSystemWindows,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func requestFocus(direction: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(direction))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestFocus",
            methodSig: "(I)Z",
            methodCache: &JNICache.MethodID.requestFocus,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func requestFocus() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestFocus",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.requestFocus2,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func requestFocusFromTouch() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestFocusFromTouch",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.requestFocusFromTouch,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func requestLayout()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "requestLayout",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.requestLayout,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func requestPointerCapture()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "requestPointerCapture",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.requestPointerCapture,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func resetPivot()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "resetPivot",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.resetPivot,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func resolveSize(size: Int, measureSpec: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(size))
        __args[1] = jvalue(i: jint(measureSpec))
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "resolveSize",
            methodSig: "(II)I",
            methodCache: &JNICache.MethodID.resolveSize,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    
    public func resolveSizeAndState(size: Int, measureSpec: Int, childMeasuredState: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = jvalue(i: jint(size))
        __args[1] = jvalue(i: jint(measureSpec))
        __args[2] = jvalue(i: jint(childMeasuredState))
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "resolveSizeAndState",
            methodSig: "(III)I",
            methodCache: &JNICache.MethodID.resolveSizeAndState,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    public func scrollBy(x: Int, y: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(x))
        __args[1] = jvalue(i: jint(y))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "scrollBy",
            methodSig: "(II)V",
            methodCache: &JNICache.MethodID.scrollBy,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func scrollTo(x: Int, y: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(x))
        __args[1] = jvalue(i: jint(y))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "scrollTo",
            methodSig: "(II)V",
            methodCache: &JNICache.MethodID.scrollTo,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func sendAccessibilityEvent(eventType: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(eventType))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "sendAccessibilityEvent",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.sendAccessibilityEvent,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setAccessibilityHeading(isHeading: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(isHeading ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAccessibilityHeading",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setAccessibilityHeading,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setAccessibilityLiveRegion(mode: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(mode))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAccessibilityLiveRegion",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setAccessibilityLiveRegion,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setAccessibilityTraversalAfter(afterId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(afterId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAccessibilityTraversalAfter",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setAccessibilityTraversalAfter,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setAccessibilityTraversalBefore(beforeId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(beforeId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAccessibilityTraversalBefore",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setAccessibilityTraversalBefore,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setActivated(activated: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(activated ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setActivated",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setActivated,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setAlpha(alpha: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(alpha))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAlpha",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setAlpha,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setBackgroundColor(color: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        //__args[0] = jvalue(i: jint(color))
        __args[0] = jvalue(j: jlong(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setBackgroundColor",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setBackgroundColor,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setBackgroundResource(resid: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resid))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setBackgroundResource",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setBackgroundResource,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setBottom(bottom: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(bottom))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setBottom",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setBottom,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setCameraDistance(distance: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(distance))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setCameraDistance",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setCameraDistance,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setClipToOutline(clipToOutline: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(clipToOutline ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setClipToOutline",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setClipToOutline,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setContextClickable(contextClickable: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(contextClickable ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setContextClickable",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setContextClickable,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setDefaultFocusHighlightEnabled(defaultFocusHighlightEnabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(defaultFocusHighlightEnabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDefaultFocusHighlightEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setDefaultFocusHighlightEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setDrawingCacheBackgroundColor(color: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        //__args[0] = jvalue(i: jint(color))
        __args[0] = jvalue(j: jlong(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDrawingCacheBackgroundColor",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setDrawingCacheBackgroundColor,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setDrawingCacheEnabled(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDrawingCacheEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setDrawingCacheEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setDrawingCacheQuality(quality: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(quality))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDrawingCacheQuality",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setDrawingCacheQuality,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setDuplicateParentStateEnabled(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDuplicateParentStateEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setDuplicateParentStateEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setElevation(elevation: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(elevation))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setElevation",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setElevation,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setEnabled(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setFadingEdgeLength(length: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(length))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFadingEdgeLength",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setFadingEdgeLength,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func setFilterTouchesWhenObscured(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFilterTouchesWhenObscured",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setFilterTouchesWhenObscured,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setFitsSystemWindows(fitSystemWindows: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(fitSystemWindows ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFitsSystemWindows",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setFitsSystemWindows,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setFocusable(focusable: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(focusable ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFocusable",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setFocusable,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setFocusable(focusable: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(focusable))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFocusable",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setFocusable2,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setFocusableInTouchMode(focusableInTouchMode: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(focusableInTouchMode ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFocusableInTouchMode",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setFocusableInTouchMode,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setFocusedByDefault(isFocusedByDefault: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(isFocusedByDefault ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setFocusedByDefault",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setFocusedByDefault,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setForegroundGravity(gravity: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(gravity))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setForegroundGravity",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setForegroundGravity,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setHapticFeedbackEnabled(hapticFeedbackEnabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hapticFeedbackEnabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHapticFeedbackEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setHapticFeedbackEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setHasTransientState(hasTransientState: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hasTransientState ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHasTransientState",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setHasTransientState,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    @inline(__always)
    internal func getViewTreeObserver() -> AndroidViewTreeObserver? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getViewTreeObserver",
            methodSig: "()Landroid/view/ViewTreeObserver;",
            methodCache: &JNICache.MethodID.getViewTreeObserver,
            args: &__args,
            locals: &__locals )
        
        return __return != nil ? AndroidViewTreeObserver(javaObject: __return) : nil
    }
    
    
    public func setHorizontalFadingEdgeEnabled(horizontalFadingEdgeEnabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(horizontalFadingEdgeEnabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHorizontalFadingEdgeEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setHorizontalFadingEdgeEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setHorizontalScrollBarEnabled(horizontalScrollBarEnabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(horizontalScrollBarEnabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHorizontalScrollBarEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setHorizontalScrollBarEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setHovered(hovered: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hovered ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHovered",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setHovered,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setId(id: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(id))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setId,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setImportantForAccessibility(mode: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(mode))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setImportantForAccessibility",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setImportantForAccessibility,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setImportantForAutofill(mode: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(mode))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setImportantForAutofill",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setImportantForAutofill,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setKeepScreenOn(keepScreenOn: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(keepScreenOn ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setKeepScreenOn",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setKeepScreenOn,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setKeyboardNavigationCluster(isCluster: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(isCluster ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setKeyboardNavigationCluster",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setKeyboardNavigationCluster,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setLabelFor(id: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(id))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLabelFor",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setLabelFor,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setLayoutDirection(layoutDirection: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(layoutDirection))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLayoutDirection",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setLayoutDirection,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setLeft(left: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(left))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLeft",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setLeft,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setLongClickable(longClickable: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(longClickable ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLongClickable",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setLongClickable,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setMinimumHeight(minHeight: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(minHeight))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMinimumHeight",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setMinimumHeight,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setMinimumWidth(minWidth: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(minWidth))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMinimumWidth",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setMinimumWidth,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setNestedScrollingEnabled(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNestedScrollingEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setNestedScrollingEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setNextClusterForwardId(nextClusterForwardId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(nextClusterForwardId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNextClusterForwardId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setNextClusterForwardId,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setNextFocusDownId(nextFocusDownId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(nextFocusDownId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNextFocusDownId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setNextFocusDownId,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setNextFocusForwardId(nextFocusForwardId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(nextFocusForwardId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNextFocusForwardId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setNextFocusForwardId,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setNextFocusLeftId(nextFocusLeftId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(nextFocusLeftId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNextFocusLeftId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setNextFocusLeftId,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setNextFocusRightId(nextFocusRightId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(nextFocusRightId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNextFocusRightId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setNextFocusRightId,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func setNextFocusUpId(nextFocusUpId: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(nextFocusUpId))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNextFocusUpId",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setNextFocusUpId,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setOutlineAmbientShadowColor(color: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(j: jlong(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOutlineAmbientShadowColor",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setOutlineAmbientShadowColor,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setOutlineSpotShadowColor(color: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(j: jlong(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOutlineSpotShadowColor",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setOutlineSpotShadowColor,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setOverScrollMode(overScrollMode: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(overScrollMode))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOverScrollMode",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setOverScrollMode,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func setPivotX(pivotX: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(pivotX))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPivotX",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setPivotX,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setPivotY(pivotY: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(pivotY))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPivotY",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setPivotY,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setPressed(pressed: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(pressed ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPressed",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setPressed,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setRevealOnFocusHint(revealOnFocus: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(revealOnFocus ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setRevealOnFocusHint",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setRevealOnFocusHint,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setRight(right: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(right))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setRight",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setRight,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setRotation(rotation: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(rotation))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setRotation",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setRotation,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setRotationX(rotationX: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(rotationX))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setRotationX",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setRotationX,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setRotationY(rotationY: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(rotationY))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setRotationY",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setRotationY,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setSaveEnabled(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSaveEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setSaveEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setSaveFromParentEnabled(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSaveFromParentEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setSaveFromParentEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScaleX(scaleX: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(scaleX))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScaleX",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setScaleX,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScaleY(scaleY: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(scaleY))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScaleY",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setScaleY,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScreenReaderFocusable(screenReaderFocusable: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(screenReaderFocusable ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScreenReaderFocusable",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setScreenReaderFocusable,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollBarDefaultDelayBeforeFade(scrollBarDefaultDelayBeforeFade: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(scrollBarDefaultDelayBeforeFade))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollBarDefaultDelayBeforeFade",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setScrollBarDefaultDelayBeforeFade,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollBarFadeDuration(scrollBarFadeDuration: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(scrollBarFadeDuration))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollBarFadeDuration",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setScrollBarFadeDuration,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollBarSize(scrollBarSize: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(scrollBarSize))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollBarSize",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setScrollBarSize,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollBarStyle(style: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(style))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollBarStyle",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setScrollBarStyle,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollContainer(isScrollContainer: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(isScrollContainer ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollContainer",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setScrollContainer,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollIndicators(indicators: Int, mask: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(indicators))
        __args[1] = jvalue(i: jint(mask))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollIndicators",
            methodSig: "(II)V",
            methodCache: &JNICache.MethodID.setScrollIndicators,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollIndicators(indicators: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(indicators))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollIndicators",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setScrollIndicators2,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollX(value: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(value))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollX",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setScrollX,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollY(value: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(value))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollY",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setScrollY,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setScrollbarFadingEnabled(fadeScrollbars: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(fadeScrollbars ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScrollbarFadingEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setScrollbarFadingEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func setSoundEffectsEnabled(soundEffectsEnabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(soundEffectsEnabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSoundEffectsEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setSoundEffectsEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setSystemUiVisibility(visibility: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visibility))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSystemUiVisibility",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setSystemUiVisibility,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTextAlignment(textAlignment: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(textAlignment))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTextAlignment",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setTextAlignment,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTextDirection(textDirection: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(textDirection))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTextDirection",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setTextDirection,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTop(top: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(top))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTop",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setTop,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTransitionName(transitionName: String)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: transitionName, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTransitionName",
            methodSig: "(Ljava/lang/String;)V",
            methodCache: &JNICache.MethodID.setTransitionName,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTranslationX(translationX: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(translationX))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTranslationX",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setTranslationX,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTranslationY(translationY: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(translationY))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTranslationY",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setTranslationY,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTranslationZ(translationZ: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(translationZ))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTranslationZ",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setTranslationZ,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setVerticalFadingEdgeEnabled(verticalFadingEdgeEnabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(verticalFadingEdgeEnabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setVerticalFadingEdgeEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setVerticalFadingEdgeEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func setVerticalScrollBarEnabled(verticalScrollBarEnabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(verticalScrollBarEnabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setVerticalScrollBarEnabled",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setVerticalScrollBarEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setVerticalScrollbarPosition(position: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(position))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setVerticalScrollbarPosition",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setVerticalScrollbarPosition,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    private func setVisibility(_ visibility: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visibility))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setVisibility",
            methodSig: "(I)V",
            methodCache: &JNICache.MethodID.setVisibility,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setWillNotCacheDrawing(willNotCacheDrawing: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(willNotCacheDrawing ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setWillNotCacheDrawing",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setWillNotCacheDrawing,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setWillNotDraw(willNotDraw: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(willNotDraw ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setWillNotDraw",
            methodSig: "(Z)V",
            methodCache: &JNICache.MethodID.setWillNotDraw,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setX(x: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(x))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setX",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setX,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setY(y: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(y))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setY",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setY,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setZ(z: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(z))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setZ",
            methodSig: "(F)V",
            methodCache: &JNICache.MethodID.setZ,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func startNestedScroll(axes: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(axes))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "startNestedScroll",
            methodSig: "(I)Z",
            methodCache: &JNICache.MethodID.startNestedScroll,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func stopNestedScroll()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "stopNestedScroll",
            methodSig: "()V",
            methodCache: &JNICache.MethodID.stopNestedScroll,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func willNotCacheDrawing() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "willNotCacheDrawing",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.willNotCacheDrawing,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func willNotDraw() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "willNotDraw",
            methodSig: "()Z",
            methodCache: &JNICache.MethodID.willNotDraw,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    ////////////////////////////////////
    
    public func getAlpha() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getAlpha",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getAlpha,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getCameraDistance() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getCameraDistance",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getCameraDistance,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getElevation() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getElevation",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getElevation,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getPivotX() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getPivotX",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getPivotX,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getPivotY() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getPivotY",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getPivotY,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getRotation() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getRotation",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getRotation,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getRotationX() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getRotationX",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getRotationX,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getRotationY() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getRotationY",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getRotationY,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getScaleX() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getScaleX",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getScaleX,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getScaleY() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getScaleY",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getScaleY,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getTranslationX() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getTranslationX",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getTranslationX,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getTranslationY() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getTranslationY",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getTranslationY,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getTranslationZ() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getTranslationZ",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getTranslationZ,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getX() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getX",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getX,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    
    public func getY() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getY",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getY,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    public func getZ() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getZ",
            methodSig: "()F",
            methodCache: &JNICache.MethodID.getZ,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    public func setOnFocusChangeListener(_ block: @escaping (AndroidView?, Bool) -> ()) {
        
        let onFocusChangeListener = AndroidOnFocusChangeListener(block: block)
        
        setOnFocusChangeListener(onFocusChangeListener)
    }
    
    public func setOnFocusChangeListener(_ listener: AndroidOnFocusChangeListener) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnFocusChangeListener",
            methodSig: "(Landroid/view/View$OnFocusChangeListener;)V",
            methodCache: &JNICache.MethodID.setOnFocusChangeListener,
            args: &__args,
            locals: &__locals )
    }
    
    // JavaObjects
    public func setOnClickListener(_ block: @escaping () -> ()) {
        
        let onClickListener = Android.View.View.OnClickListener(block: block)
        
        setOnClickListener(onClickListener)
    }
    
    public func setOnClickListener(_ l: Android.View.View.OnClickListener?) {
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: l, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnClickListener",
            methodSig: "(Landroid/view/View$OnClickListener;)V",
            methodCache: &JNICache.MethodID.setOnClickListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func checkInputConnectionProxy(view: Android.View.View) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "checkInputConnectionProxy",
            methodSig: "(Landroid/view/View;)Z",
            methodCache: &JNICache.MethodID.checkInputConnectionProxy,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    
    
    public func dispatchGenericMotionEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchGenericMotionEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.dispatchGenericMotionEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    
    
    public func dispatchTouchEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchTouchEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.dispatchTouchEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    
    
    public func getClipBounds(outRect: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: outRect, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getClipBounds",
            methodSig: "(Landroid/graphics/Rect;)Z",
            methodCache: &JNICache.MethodID.getClipBounds,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func getDrawingRect(outRect: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: outRect, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getDrawingRect",
            methodSig: "(Landroid/graphics/Rect;)V",
            methodCache: &JNICache.MethodID.getDrawingRect,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func getFocusedRect(r: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: r, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getFocusedRect",
            methodSig: "(Landroid/graphics/Rect;)V",
            methodCache: &JNICache.MethodID.getFocusedRect,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func getGlobalVisibleRect(r: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: r, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getGlobalVisibleRect",
            methodSig: "(Landroid/graphics/Rect;)Z",
            methodCache: &JNICache.MethodID.getGlobalVisibleRect,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func getHitRect(outRect: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: outRect, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getHitRect",
            methodSig: "(Landroid/graphics/Rect;)V",
            methodCache: &JNICache.MethodID.getHitRect,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func getLocalVisibleRect(r: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: r, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getLocalVisibleRect",
            methodSig: "(Landroid/graphics/Rect;)Z",
            methodCache: &JNICache.MethodID.getLocalVisibleRect,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func getWindowVisibleDisplayFrame(_ outRect: AndroidRect)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: outRect, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getWindowVisibleDisplayFrame",
            methodSig: "(L\(AndroidRect.JNICache.className);)V",
            methodCache: &JNICache.MethodID.getWindowVisibleDisplayFrame,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func invalidate(dirty: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: dirty, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "invalidate",
            methodSig: "(Landroid/graphics/Rect;)V",
            methodCache: &JNICache.MethodID.invalidate,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func invalidateDrawable(drawable: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: drawable, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "invalidateDrawable",
            methodSig: "(Landroid/graphics/drawable/Drawable;)V",
            methodCache: &JNICache.MethodID.invalidateDrawable,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func onCapturedPointerEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onCapturedPointerEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.onCapturedPointerEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onFilterTouchEventForSecurity(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onFilterTouchEventForSecurity",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.onFilterTouchEventForSecurity,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func onGenericMotionEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onGenericMotionEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.onGenericMotionEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onHoverEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onHoverEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.onHoverEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func onKeyLongPress(keyCode: Int, event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(keyCode))
        __args[1] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onKeyLongPress",
            methodSig: "(ILandroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.onKeyLongPress,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onKeyMultiple(keyCode: Int, repeatCount: Int, event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = jvalue(i: jint(keyCode))
        __args[1] = jvalue(i: jint(repeatCount))
        __args[2] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onKeyMultiple",
            methodSig: "(IILandroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.onKeyMultiple,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onKeyPreIme(keyCode: Int, event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(keyCode))
        __args[1] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onKeyPreIme",
            methodSig: "(ILandroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.onKeyPreIme,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onKeyShortcut(keyCode: Int, event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(keyCode))
        __args[1] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onKeyShortcut",
            methodSig: "(ILandroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.onKeyShortcut,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onKeyUp(keyCode: Int, event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(keyCode))
        __args[1] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onKeyUp",
            methodSig: "(ILandroid/view/KeyEvent;)Z",
            methodCache: &JNICache.MethodID.onKeyUp,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onProvideAutofillStructure(structure: JavaObject, flags: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: structure, locals: &__locals)
        __args[1] = jvalue(i: jint(flags))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onProvideAutofillStructure",
            methodSig: "(Landroid/view/ViewStructure;I)V",
            methodCache: &JNICache.MethodID.onProvideAutofillStructure,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onProvideAutofillVirtualStructure(structure: JavaObject, flags: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: structure, locals: &__locals)
        __args[1] = jvalue(i: jint(flags))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onProvideAutofillVirtualStructure",
            methodSig: "(Landroid/view/ViewStructure;I)V",
            methodCache: &JNICache.MethodID.onProvideAutofillVirtualStructure,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onProvideStructure(structure: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: structure, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onProvideStructure",
            methodSig: "(Landroid/view/ViewStructure;)V",
            methodCache: &JNICache.MethodID.onProvideStructure,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onProvideVirtualStructure(structure: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: structure, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onProvideVirtualStructure",
            methodSig: "(Landroid/view/ViewStructure;)V",
            methodCache: &JNICache.MethodID.onProvideVirtualStructure,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onTouchEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onTouchEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.onTouchEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onTrackballEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onTrackballEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &JNICache.MethodID.onTrackballEvent,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func post(action: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: action, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "post",
            methodSig: "(Ljava/lang/Runnable;)Z",
            methodCache: &JNICache.MethodID.post,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func postDelayed(action: JavaObject, delayMillis: Int64) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: action, locals: &__locals)
        __args[1] = jvalue(j: jlong(delayMillis))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "postDelayed",
            methodSig: "(Ljava/lang/Runnable;J)Z",
            methodCache: &JNICache.MethodID.postDelayed,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func postOnAnimation(action: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: action, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "postOnAnimation",
            methodSig: "(Ljava/lang/Runnable;)V",
            methodCache: &JNICache.MethodID.postOnAnimation,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func postOnAnimationDelayed(action: JavaObject, delayMillis: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: action, locals: &__locals)
        __args[1] = jvalue(j: jlong(delayMillis))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "postOnAnimationDelayed",
            methodSig: "(Ljava/lang/Runnable;J)V",
            methodCache: &JNICache.MethodID.postOnAnimationDelayed,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func removeCallbacks(action: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: action, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "removeCallbacks",
            methodSig: "(Ljava/lang/Runnable;)Z",
            methodCache: &JNICache.MethodID.removeCallbacks,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    
    
    public func requestRectangleOnScreen(rectangle: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: rectangle, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestRectangleOnScreen",
            methodSig: "(Landroid/graphics/Rect;)Z",
            methodCache: &JNICache.MethodID.requestRectangleOnScreen,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func requestRectangleOnScreen(rectangle: JavaObject, immediate: Bool) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: rectangle, locals: &__locals)
        __args[1] = jvalue(z: jboolean(immediate ? JNI_TRUE : JNI_FALSE))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestRectangleOnScreen",
            methodSig: "(Landroid/graphics/Rect;Z)Z",
            methodCache: &JNICache.MethodID.requestRectangleOnScreen2,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func requestUnbufferedDispatch(event: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "requestUnbufferedDispatch",
            methodSig: "(Landroid/view/MotionEvent;)V",
            methodCache: &JNICache.MethodID.requestUnbufferedDispatch,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func scheduleDrawable(who: JavaObject, what: JavaObject, when: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: who, locals: &__locals)
        __args[1] = JNIType.toJava(value: what, locals: &__locals)
        __args[2] = jvalue(j: jlong(when))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "scheduleDrawable",
            methodSig: "(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V",
            methodCache: &JNICache.MethodID.scheduleDrawable,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    public func setClipBounds(clipBounds: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: clipBounds, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setClipBounds",
            methodSig: "(Landroid/graphics/Rect;)V",
            methodCache: &JNICache.MethodID.setClipBounds,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setForeground(foreground: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: foreground, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setForeground",
            methodSig: "(Landroid/graphics/drawable/Drawable;)V",
            methodCache: &JNICache.MethodID.setForeground,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func unscheduleDrawable(who: JavaObject, what: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: who, locals: &__locals)
        __args[1] = JNIType.toJava(value: what, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "unscheduleDrawable",
            methodSig: "(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V",
            methodCache: &JNICache.MethodID.unscheduleDrawable,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func unscheduleDrawable(who: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: who, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "unscheduleDrawable",
            methodSig: "(Landroid/graphics/drawable/Drawable;)V",
            methodCache: &JNICache.MethodID.unscheduleDrawable3,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    /**
     * This method must be called by onMeasure(int, int) to store the measured width and measured height.
     */
    public func setMeasuredDimension(measuredWidth: Int, measuredHeight: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(measuredWidth))
        __args[1] = jvalue(i: jint(measuredHeight))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMeasuredDimension",
            methodSig: "(II)V",
            methodCache: &JNICache.MethodID.setMeasuredDimension,
            args: &__args,
            locals: &__locals )
        
    }
    
    
    @inline(__always)
    internal func getLayoutParams() -> Android.View.ViewGroup.LayoutParams? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getLayoutParams",
            methodSig: "()Landroid/view/ViewGroup$LayoutParams;",
            methodCache: &JNICache.MethodID.getLayoutParams,
            args: &__args,
            locals: &__locals )
        
        return Android.View.ViewGroup.LayoutParams.init(javaObject: __return)
    }
    
    @inline(__always)
    internal func setLayoutParams(_ layoutParams: Android.View.ViewGroup.LayoutParams?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: layoutParams, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLayoutParams",
            methodSig: "(Landroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &JNICache.MethodID.setLayoutParams,
            args: &__args,
            locals: &__locals )
    }
    
    @inline(__always)
    internal func getParent() -> Android.Widget.FrameLayout? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getParent",
            methodSig: "()Landroid/view/ViewParent;",
            methodCache: &JNICache.MethodID.getParent,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.Widget.FrameLayout(casting: JavaObject(javaObject: __return)) : nil
    }
    
    @inline(__always)
    internal func getRootView() -> Android.View.View? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getRootView",
            methodSig: "()L\(AndroidView.JNICache.className);",
            methodCache: &JNICache.MethodID.getRootView,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? AndroidView(casting: JavaObject(javaObject: __return)) : nil
    }
    
    public func getWindowToken() -> JavaObject? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getWindowToken",
            methodSig: "()Landroid/os/IBinder;",
            methodCache: &JNICache.MethodID.getWindowToken,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? JavaObject(javaObject: __return) : nil
    }
    
}

// MARK: - JNICache

internal extension Android.View.View {
    
    /// JNI Cache
    enum JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["View"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        enum FieldID {
            static var ACCESSIBILITY_LIVE_REGION_ASSERTIVE: jfieldID?
            static var ACCESSIBILITY_LIVE_REGION_NONE: jfieldID?
            static var ACCESSIBILITY_LIVE_REGION_POLITE: jfieldID?
            static var AUTOFILL_FLAG_INCLUDE_NOT_IMPORTANT_VIEWS: jfieldID?
            static var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DATE: jfieldID?
            static var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_DAY: jfieldID?
            static var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_MONTH: jfieldID?
            static var AUTOFILL_HINT_CREDIT_CARD_EXPIRATION_YEAR: jfieldID?
            static var AUTOFILL_HINT_CREDIT_CARD_NUMBER: jfieldID?
            static var AUTOFILL_HINT_CREDIT_CARD_SECURITY_CODE: jfieldID?
            static var AUTOFILL_HINT_EMAIL_ADDRESS: jfieldID?
            static var AUTOFILL_HINT_NAME: jfieldID?
            static var AUTOFILL_HINT_PASSWORD: jfieldID?
            static var AUTOFILL_HINT_PHONE: jfieldID?
            static var AUTOFILL_HINT_POSTAL_ADDRESS: jfieldID?
            static var AUTOFILL_HINT_POSTAL_CODE: jfieldID?
            static var AUTOFILL_HINT_USERNAME: jfieldID?
            static var AUTOFILL_TYPE_DATE: jfieldID?
            static var AUTOFILL_TYPE_LIST: jfieldID?
            static var AUTOFILL_TYPE_NONE: jfieldID?
            static var AUTOFILL_TYPE_TEXT: jfieldID?
            static var AUTOFILL_TYPE_TOGGLE: jfieldID?
            static var DRAG_FLAG_GLOBAL: jfieldID?
            static var DRAG_FLAG_GLOBAL_PERSISTABLE_URI_PERMISSION: jfieldID?
            static var DRAG_FLAG_GLOBAL_PREFIX_URI_PERMISSION: jfieldID?
            static var DRAG_FLAG_GLOBAL_URI_READ: jfieldID?
            static var DRAG_FLAG_GLOBAL_URI_WRITE: jfieldID?
            static var DRAG_FLAG_OPAQUE: jfieldID?
            static var FIND_VIEWS_WITH_CONTENT_DESCRIPTION: jfieldID?
            static var FIND_VIEWS_WITH_TEXT: jfieldID?
            static var FOCUSABLE: jfieldID?
            static var FOCUSABLES_ALL: jfieldID?
            static var FOCUSABLES_TOUCH_MODE: jfieldID?
            static var FOCUSABLE_AUTO: jfieldID?
            static var FOCUS_BACKWARD: jfieldID?
            static var FOCUS_DOWN: jfieldID?
            static var FOCUS_FORWARD: jfieldID?
            static var FOCUS_LEFT: jfieldID?
            static var FOCUS_RIGHT: jfieldID?
            static var FOCUS_UP: jfieldID?
            static var GONE: jfieldID?
            static var HAPTIC_FEEDBACK_ENABLED: jfieldID?
            static var IMPORTANT_FOR_ACCESSIBILITY_AUTO: jfieldID?
            static var IMPORTANT_FOR_ACCESSIBILITY_NO: jfieldID?
            static var IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS: jfieldID?
            static var IMPORTANT_FOR_ACCESSIBILITY_YES: jfieldID?
            static var IMPORTANT_FOR_AUTOFILL_AUTO: jfieldID?
            static var IMPORTANT_FOR_AUTOFILL_NO: jfieldID?
            static var IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS: jfieldID?
            static var IMPORTANT_FOR_AUTOFILL_YES: jfieldID?
            static var IMPORTANT_FOR_AUTOFILL_YES_EXCLUDE_DESCENDANTS: jfieldID?
            static var INVISIBLE: jfieldID?
            static var KEEP_SCREEN_ON: jfieldID?
            static var LAYER_TYPE_HARDWARE: jfieldID?
            static var LAYER_TYPE_NONE: jfieldID?
            static var LAYER_TYPE_SOFTWARE: jfieldID?
            static var LAYOUT_DIRECTION_INHERIT: jfieldID?
            static var LAYOUT_DIRECTION_LOCALE: jfieldID?
            static var LAYOUT_DIRECTION_LTR: jfieldID?
            static var LAYOUT_DIRECTION_RTL: jfieldID?
            static var MEASURED_HEIGHT_STATE_SHIFT: jfieldID?
            static var MEASURED_SIZE_MASK: jfieldID?
            static var MEASURED_STATE_MASK: jfieldID?
            static var MEASURED_STATE_TOO_SMALL: jfieldID?
            static var NOT_FOCUSABLE: jfieldID?
            static var NO_ID: jfieldID?
            static var OVER_SCROLL_ALWAYS: jfieldID?
            static var OVER_SCROLL_IF_CONTENT_SCROLLS: jfieldID?
            static var OVER_SCROLL_NEVER: jfieldID?
            static var SCREEN_STATE_OFF: jfieldID?
            static var SCREEN_STATE_ON: jfieldID?
            static var SCROLLBARS_INSIDE_INSET: jfieldID?
            static var SCROLLBARS_INSIDE_OVERLAY: jfieldID?
            static var SCROLLBARS_OUTSIDE_INSET: jfieldID?
            static var SCROLLBARS_OUTSIDE_OVERLAY: jfieldID?
            static var SCROLLBAR_POSITION_DEFAULT: jfieldID?
            static var SCROLLBAR_POSITION_LEFT: jfieldID?
            static var SCROLLBAR_POSITION_RIGHT: jfieldID?
            static var SCROLL_AXIS_HORIZONTAL: jfieldID?
            static var SCROLL_AXIS_NONE: jfieldID?
            static var SCROLL_AXIS_VERTICAL: jfieldID?
            static var SCROLL_INDICATOR_BOTTOM: jfieldID?
            static var SCROLL_INDICATOR_END: jfieldID?
            static var SCROLL_INDICATOR_LEFT: jfieldID?
            static var SCROLL_INDICATOR_RIGHT: jfieldID?
            static var SCROLL_INDICATOR_START: jfieldID?
            static var SCROLL_INDICATOR_TOP: jfieldID?
            static var SOUND_EFFECTS_ENABLED: jfieldID?
            static var STATUS_BAR_HIDDEN: jfieldID?
            static var STATUS_BAR_VISIBLE: jfieldID?
            static var SYSTEM_UI_FLAG_FULLSCREEN: jfieldID?
            static var SYSTEM_UI_FLAG_HIDE_NAVIGATION: jfieldID?
            static var SYSTEM_UI_FLAG_IMMERSIVE: jfieldID?
            static var SYSTEM_UI_FLAG_IMMERSIVE_STICKY: jfieldID?
            static var SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN: jfieldID?
            static var SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION: jfieldID?
            static var SYSTEM_UI_FLAG_LAYOUT_STABLE: jfieldID?
            static var SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR: jfieldID?
            static var SYSTEM_UI_FLAG_LIGHT_STATUS_BAR: jfieldID?
            static var SYSTEM_UI_FLAG_LOW_PROFILE: jfieldID?
            static var SYSTEM_UI_FLAG_VISIBLE: jfieldID?
            static var SYSTEM_UI_LAYOUT_FLAGS: jfieldID?
            static var TEXT_ALIGNMENT_CENTER: jfieldID?
            static var TEXT_ALIGNMENT_GRAVITY: jfieldID?
            static var TEXT_ALIGNMENT_INHERIT: jfieldID?
            static var TEXT_ALIGNMENT_TEXT_END: jfieldID?
            static var TEXT_ALIGNMENT_TEXT_START: jfieldID?
            static var TEXT_ALIGNMENT_VIEW_END: jfieldID?
            static var TEXT_ALIGNMENT_VIEW_START: jfieldID?
            static var TEXT_DIRECTION_ANY_RTL: jfieldID?
            static var TEXT_DIRECTION_FIRST_STRONG: jfieldID?
            static var TEXT_DIRECTION_FIRST_STRONG_LTR: jfieldID?
            static var TEXT_DIRECTION_FIRST_STRONG_RTL: jfieldID?
            static var TEXT_DIRECTION_INHERIT: jfieldID?
            static var TEXT_DIRECTION_LOCALE: jfieldID?
            static var TEXT_DIRECTION_LTR: jfieldID?
            static var TEXT_DIRECTION_RTL: jfieldID?
            static var VIEW_LOG_TAG: jfieldID?
            static var VISIBLE: jfieldID?
        }
        
        /// JNI Method ID cache
        enum MethodID {
            static var init_method_1: jmethodID?
            
            static var getBackground: jmethodID?
            static var findViewById: jmethodID?
            static var findViewWithTag: jmethodID?
            static var getTag: jmethodID?
            static var setTag: jmethodID?
            static var getContext: jmethodID?
            static var bringToFront: jmethodID?
            static var buildDrawingCache: jmethodID?
            static var buildDrawingCache2: jmethodID?
            static var buildLayer: jmethodID?
            static var callOnClick: jmethodID?
            static var canResolveLayoutDirection: jmethodID?
            static var canResolveTextAlignment: jmethodID?
            static var canResolveTextDirection: jmethodID?
            static var canScrollHorizontally: jmethodID?
            static var canScrollVertically: jmethodID?
            static var cancelDragAndDrop: jmethodID?
            static var cancelLongPress: jmethodID?
            static var cancelPendingInputEvents: jmethodID?
            static var clearAnimation: jmethodID?
            static var clearFocus: jmethodID?
            static var combineMeasuredStates: jmethodID?
            static var computeScroll: jmethodID?
            static var destroyDrawingCache: jmethodID?
            static var dispatchDisplayHint: jmethodID?
            static var dispatchDrawableHotspotChanged: jmethodID?
            static var dispatchFinishTemporaryDetach: jmethodID?
            static var dispatchNestedFling: jmethodID?
            static var dispatchNestedPreFling: jmethodID?
            static var dispatchNestedPreScroll: jmethodID?
            static var dispatchNestedScroll: jmethodID?
            static var dispatchPointerCaptureChanged: jmethodID?
            static var dispatchStartTemporaryDetach: jmethodID?
            static var dispatchSystemUiVisibilityChanged: jmethodID?
            static var dispatchWindowFocusChanged: jmethodID?
            static var dispatchWindowSystemUiVisiblityChanged: jmethodID?
            static var dispatchWindowVisibilityChanged: jmethodID?
            static var drawableHotspotChanged: jmethodID?
            static var forceHasOverlappingRendering: jmethodID?
            static var forceLayout: jmethodID?
            static var generateViewId: jmethodID?
            static var getAccessibilityLiveRegion: jmethodID?
            static var getAccessibilityTraversalAfter: jmethodID?
            static var getAccessibilityTraversalBefore: jmethodID?
            static var getAutofillHints: jmethodID?
            static var getAutofillType: jmethodID?
            static var getBaseline: jmethodID?
            static var getBottom: jmethodID?
            static var getClipToOutline: jmethodID?
            static var getDefaultFocusHighlightEnabled: jmethodID?
            static var getDefaultSize: jmethodID?
            static var getDrawableState: jmethodID?
            static var getDrawingCacheBackgroundColor: jmethodID?
            static var getDrawingCacheQuality: jmethodID?
            static var getFilterTouchesWhenObscured: jmethodID?
            static var getFitsSystemWindows: jmethodID?
            static var getFocusable: jmethodID?
            static var getForegroundGravity: jmethodID?
            static var getHasOverlappingRendering: jmethodID?
            static var getHeight: jmethodID?
            static var getHorizontalFadingEdgeLength: jmethodID?
            static var getId: jmethodID?
            static var getImportantForAccessibility: jmethodID?
            static var getImportantForAutofill: jmethodID?
            static var getKeepScreenOn: jmethodID?
            static var getLabelFor: jmethodID?
            static var getLayerType: jmethodID?
            static var getLayoutDirection: jmethodID?
            static var getLeft: jmethodID?
            static var getLocationInWindow: jmethodID?
            static var getLocationOnScreen: jmethodID?
            static var getMeasuredHeight: jmethodID?
            static var getMeasuredHeightAndState: jmethodID?
            static var getMeasuredState: jmethodID?
            static var getMeasuredWidth: jmethodID?
            static var getMeasuredWidthAndState: jmethodID?
            static var getMinimumHeight: jmethodID?
            static var getMinimumWidth: jmethodID?
            static var getNextClusterForwardId: jmethodID?
            static var getNextFocusDownId: jmethodID?
            static var getNextFocusForwardId: jmethodID?
            static var getNextFocusLeftId: jmethodID?
            static var getNextFocusRightId: jmethodID?
            static var getNextFocusUpId: jmethodID?
            static var getOutlineAmbientShadowColor: jmethodID?
            static var getOutlineSpotShadowColor: jmethodID?
            static var getOverScrollMode: jmethodID?
            static var getPaddingBottom: jmethodID?
            static var getPaddingEnd: jmethodID?
            static var getPaddingLeft: jmethodID?
            static var getPaddingRight: jmethodID?
            static var getPaddingStart: jmethodID?
            static var getPaddingTop: jmethodID?
            static var getRevealOnFocusHint: jmethodID?
            static var getRight: jmethodID?
            static var getScrollBarDefaultDelayBeforeFade: jmethodID?
            static var getScrollBarFadeDuration: jmethodID?
            static var getScrollBarSize: jmethodID?
            static var getScrollBarStyle: jmethodID?
            static var getScrollIndicators: jmethodID?
            static var getScrollX: jmethodID?
            static var getScrollY: jmethodID?
            static var getSolidColor: jmethodID?
            static var getSystemUiVisibility: jmethodID?
            static var getTextAlignment: jmethodID?
            static var getTextDirection: jmethodID?
            static var getTop: jmethodID?
            static var getTransitionName: jmethodID?
            static var getVerticalFadingEdgeLength: jmethodID?
            static var getVerticalScrollbarPosition: jmethodID?
            static var getVerticalScrollbarWidth: jmethodID?
            static var getVisibility: jmethodID?
            static var getWidth: jmethodID?
            static var getWindowSystemUiVisibility: jmethodID?
            static var getWindowVisibility: jmethodID?
            static var hasExplicitFocusable: jmethodID?
            static var hasFocus: jmethodID?
            static var hasFocusable: jmethodID?
            static var hasNestedScrollingParent: jmethodID?
            static var hasOnClickListeners: jmethodID?
            static var hasOverlappingRendering: jmethodID?
            static var hasPointerCapture: jmethodID?
            static var hasTransientState: jmethodID?
            static var hasWindowFocus: jmethodID?
            static var invalidate: jmethodID?
            static var invalidate3: jmethodID?
            static var invalidateOutline: jmethodID?
            static var isAccessibilityFocused: jmethodID?
            static var isAccessibilityHeading: jmethodID?
            static var isActivated: jmethodID?
            static var isAttachedToWindow: jmethodID?
            static var isClickable: jmethodID?
            static var isContextClickable: jmethodID?
            static var isDirty: jmethodID?
            static var isDrawingCacheEnabled: jmethodID?
            static var isDuplicateParentStateEnabled: jmethodID?
            static var isEnabled: jmethodID?
            static var isFocusable: jmethodID?
            static var isFocusableInTouchMode: jmethodID?
            static var isFocused: jmethodID?
            static var isFocusedByDefault: jmethodID?
            static var isHapticFeedbackEnabled: jmethodID?
            static var isHardwareAccelerated: jmethodID?
            static var isHorizontalFadingEdgeEnabled: jmethodID?
            static var isHorizontalScrollBarEnabled: jmethodID?
            static var isHovered: jmethodID?
            static var isImportantForAccessibility: jmethodID?
            static var isImportantForAutofill: jmethodID?
            static var isInEditMode: jmethodID?
            static var isInLayout: jmethodID?
            static var isInTouchMode: jmethodID?
            static var isKeyboardNavigationCluster: jmethodID?
            static var isLaidOut: jmethodID?
            static var isLayoutDirectionResolved: jmethodID?
            static var isLayoutRequested: jmethodID?
            static var isLongClickable: jmethodID?
            static var isNestedScrollingEnabled: jmethodID?
            static var isOpaque: jmethodID?
            static var isPaddingRelative: jmethodID?
            static var isPivotSet: jmethodID?
            static var isPressed: jmethodID?
            static var isSaveEnabled: jmethodID?
            static var isSaveFromParentEnabled: jmethodID?
            static var isScreenReaderFocusable: jmethodID?
            static var isScrollContainer: jmethodID?
            static var isScrollbarFadingEnabled: jmethodID?
            static var isSelected: jmethodID?
            static var isShown: jmethodID?
            static var isSoundEffectsEnabled: jmethodID?
            static var isTemporarilyDetached: jmethodID?
            static var isTextAlignmentResolved: jmethodID?
            static var isTextDirectionResolved: jmethodID?
            static var isVerticalFadingEdgeEnabled: jmethodID?
            static var isVerticalScrollBarEnabled: jmethodID?
            static var isVisibleToUserForAutofill: jmethodID?
            static var jumpDrawablesToCurrentState: jmethodID?
            static var layout: jmethodID?
            static var measure: jmethodID?
            static var offsetLeftAndRight: jmethodID?
            static var offsetTopAndBottom: jmethodID?
            static var onCancelPendingInputEvents: jmethodID?
            static var onCheckIsTextEditor: jmethodID?
            static var onFinishTemporaryDetach: jmethodID?
            static var onHoverChanged: jmethodID?
            static var onPointerCaptureChange: jmethodID?
            static var onRtlPropertiesChanged: jmethodID?
            static var onScreenStateChanged: jmethodID?
            static var onStartTemporaryDetach: jmethodID?
            static var onVisibilityAggregated: jmethodID?
            static var onWindowFocusChanged: jmethodID?
            static var onWindowSystemUiVisibilityChanged: jmethodID?
            static var performClick: jmethodID?
            static var performContextClick: jmethodID?
            static var performContextClick2: jmethodID?
            static var performHapticFeedback: jmethodID?
            static var performHapticFeedback2: jmethodID?
            static var performLongClick: jmethodID?
            static var performLongClick2: jmethodID?
            static var playSoundEffect: jmethodID?
            static var postInvalidate: jmethodID?
            static var postInvalidate2: jmethodID?
            static var postInvalidateDelayed: jmethodID?
            static var postInvalidateDelayed2: jmethodID?
            static var postInvalidateOnAnimation: jmethodID?
            static var postInvalidateOnAnimation2: jmethodID?
            static var refreshDrawableState: jmethodID?
            static var releasePointerCapture: jmethodID?
            static var requestApplyInsets: jmethodID?
            static var requestFitSystemWindows: jmethodID?
            static var requestFocus: jmethodID?
            static var requestFocus2: jmethodID?
            static var requestFocusFromTouch: jmethodID?
            static var requestLayout: jmethodID?
            static var requestPointerCapture: jmethodID?
            static var resetPivot: jmethodID?
            static var resolveSize: jmethodID?
            static var resolveSizeAndState: jmethodID?
            static var restoreDefaultFocus: jmethodID?
            static var scrollBy: jmethodID?
            static var scrollTo: jmethodID?
            static var sendAccessibilityEvent: jmethodID?
            static var setAccessibilityHeading: jmethodID?
            static var setAccessibilityLiveRegion: jmethodID?
            static var setAccessibilityTraversalAfter: jmethodID?
            static var setAccessibilityTraversalBefore: jmethodID?
            static var setActivated: jmethodID?
            static var setAlpha: jmethodID?
            static var setBackgroundColor: jmethodID?
            static var setBackgroundResource: jmethodID?
            static var setBottom: jmethodID?
            static var setCameraDistance: jmethodID?
            static var setClickable: jmethodID?
            static var setClipToOutline: jmethodID?
            static var setContextClickable: jmethodID?
            static var setDefaultFocusHighlightEnabled: jmethodID?
            static var setDrawingCacheBackgroundColor: jmethodID?
            static var setDrawingCacheEnabled: jmethodID?
            static var setDrawingCacheQuality: jmethodID?
            static var setDuplicateParentStateEnabled: jmethodID?
            static var setElevation: jmethodID?
            static var setEnabled: jmethodID?
            static var setFadingEdgeLength: jmethodID?
            static var setFilterTouchesWhenObscured: jmethodID?
            static var setFitsSystemWindows: jmethodID?
            static var setFocusable: jmethodID?
            static var setFocusable2: jmethodID?
            static var setFocusableInTouchMode: jmethodID?
            static var setFocusedByDefault: jmethodID?
            static var setForegroundGravity: jmethodID?
            static var setHapticFeedbackEnabled: jmethodID?
            static var setHasTransientState: jmethodID?
            static var setHorizontalFadingEdgeEnabled: jmethodID?
            static var setHorizontalScrollBarEnabled: jmethodID?
            static var setHovered: jmethodID?
            static var setId: jmethodID?
            static var setImportantForAccessibility: jmethodID?
            static var setImportantForAutofill: jmethodID?
            static var setKeepScreenOn: jmethodID?
            static var setKeyboardNavigationCluster: jmethodID?
            static var setLabelFor: jmethodID?
            static var setLayoutDirection: jmethodID?
            static var setLeft: jmethodID?
            static var setLongClickable: jmethodID?
            static var setMinimumHeight: jmethodID?
            static var setMinimumWidth: jmethodID?
            static var setNestedScrollingEnabled: jmethodID?
            static var setNextClusterForwardId: jmethodID?
            static var setNextFocusDownId: jmethodID?
            static var setNextFocusForwardId: jmethodID?
            static var setNextFocusLeftId: jmethodID?
            static var setNextFocusRightId: jmethodID?
            static var setNextFocusUpId: jmethodID?
            static var setOutlineAmbientShadowColor: jmethodID?
            static var setOutlineSpotShadowColor: jmethodID?
            static var setOverScrollMode: jmethodID?
            static var setPadding: jmethodID?
            static var setPaddingRelative: jmethodID?
            static var setPivotX: jmethodID?
            static var setPivotY: jmethodID?
            static var setPressed: jmethodID?
            static var setRevealOnFocusHint: jmethodID?
            static var setRight: jmethodID?
            static var setRotation: jmethodID?
            static var setRotationX: jmethodID?
            static var setRotationY: jmethodID?
            static var setSaveEnabled: jmethodID?
            static var setSaveFromParentEnabled: jmethodID?
            static var setScaleX: jmethodID?
            static var setScaleY: jmethodID?
            static var setScreenReaderFocusable: jmethodID?
            static var setScrollBarDefaultDelayBeforeFade: jmethodID?
            static var setScrollBarFadeDuration: jmethodID?
            static var setScrollBarSize: jmethodID?
            static var setScrollBarStyle: jmethodID?
            static var setScrollContainer: jmethodID?
            static var setScrollIndicators: jmethodID?
            static var setScrollIndicators2: jmethodID?
            static var setScrollX: jmethodID?
            static var setScrollY: jmethodID?
            static var setScrollbarFadingEnabled: jmethodID?
            static var setSelected: jmethodID?
            static var setSoundEffectsEnabled: jmethodID?
            static var setSystemUiVisibility: jmethodID?
            static var setTextAlignment: jmethodID?
            static var setTextDirection: jmethodID?
            static var setTop: jmethodID?
            static var setTransitionName: jmethodID?
            static var setTranslationX: jmethodID?
            static var setTranslationY: jmethodID?
            static var setTranslationZ: jmethodID?
            static var setVerticalFadingEdgeEnabled: jmethodID?
            static var setVerticalScrollBarEnabled: jmethodID?
            static var setVerticalScrollbarPosition: jmethodID?
            static var setVisibility: jmethodID?
            static var setWillNotCacheDrawing: jmethodID?
            static var setWillNotDraw: jmethodID?
            static var setX: jmethodID?
            static var setY: jmethodID?
            static var setZ: jmethodID?
            static var showContextMenu: jmethodID?
            static var showContextMenu2: jmethodID?
            static var startNestedScroll: jmethodID?
            static var stopNestedScroll: jmethodID?
            static var toString: jmethodID?
            static var willNotCacheDrawing: jmethodID?
            static var willNotDraw: jmethodID?
            static var getAlpha: jmethodID?
            static var getCameraDistance: jmethodID?
            static var getElevation: jmethodID?
            static var getPivotX: jmethodID?
            static var getPivotY: jmethodID?
            static var getRotation: jmethodID?
            static var getRotationX: jmethodID?
            static var getRotationY: jmethodID?
            static var getScaleX: jmethodID?
            static var getScaleY: jmethodID?
            static var getTranslationX: jmethodID?
            static var getTranslationY: jmethodID?
            static var getTranslationZ: jmethodID?
            static var getX: jmethodID?
            static var getY: jmethodID?
            static var getZ: jmethodID?
            static var setOnClickListener: jmethodID?
            static var checkInputConnectionProxy: jmethodID?
            static var dispatchCapturedPointerEvent: jmethodID?
            static var dispatchGenericMotionEvent: jmethodID?
            static var dispatchKeyEvent: jmethodID?
            static var dispatchKeyEventPreIme: jmethodID?
            static var dispatchKeyShortcutEvent: jmethodID?
            static var dispatchProvideAutofillStructure: jmethodID?
            static var dispatchProvideAutofillStructure2: jmethodID?
            static var dispatchProvideStructure: jmethodID?
            static var dispatchProvideStructure2: jmethodID?
            static var dispatchTouchEvent: jmethodID?
            static var dispatchTrackballEvent: jmethodID?
            static var dispatchUnhandledMove: jmethodID?
            static var getClipBounds: jmethodID?
            static var getDrawingRect: jmethodID?
            static var getFocusedRect: jmethodID?
            static var getGlobalVisibleRect: jmethodID?
            static var getHitRect: jmethodID?
            static var getLocalVisibleRect: jmethodID?
            static var getWindowVisibleDisplayFrame: jmethodID?
            static var invalidateDrawable: jmethodID?
            static var onCapturedPointerEvent: jmethodID?
            static var onFilterTouchEventForSecurity: jmethodID?
            static var onGenericMotionEvent: jmethodID?
            static var onHoverEvent: jmethodID?
            static var onKeyDown: jmethodID?
            static var onKeyLongPress: jmethodID?
            static var onKeyMultiple: jmethodID?
            static var onKeyPreIme: jmethodID?
            static var onKeyShortcut: jmethodID?
            static var onKeyUp: jmethodID?
            static var onProvideAutofillStructure: jmethodID?
            static var onProvideAutofillStructure2: jmethodID?
            static var onProvideAutofillVirtualStructure: jmethodID?
            static var onProvideAutofillVirtualStructure2: jmethodID?
            static var onProvideStructure: jmethodID?
            static var onProvideStructure2: jmethodID?
            static var onProvideVirtualStructure: jmethodID?
            static var onProvideVirtualStructure2: jmethodID?
            static var onTouchEvent: jmethodID?
            static var onTrackballEvent: jmethodID?
            static var post: jmethodID?
            static var postDelayed: jmethodID?
            static var postOnAnimation: jmethodID?
            static var postOnAnimationDelayed: jmethodID?
            static var removeCallbacks: jmethodID?
            static var requestRectangleOnScreen: jmethodID?
            static var requestRectangleOnScreen2: jmethodID?
            static var requestUnbufferedDispatch: jmethodID?
            static var scheduleDrawable: jmethodID?
            static var scheduleDrawable2: jmethodID?
            static var setBackground: jmethodID?
            static var setBackgroundDrawable: jmethodID?
            static var setClipBounds: jmethodID?
            static var setForeground: jmethodID?
            static var unscheduleDrawable: jmethodID?
            static var unscheduleDrawable2: jmethodID?
            static var unscheduleDrawable3: jmethodID?
            static var setLayoutParams: jmethodID?
            static var getLayoutParams: jmethodID?
            static var onMeasure: jmethodID?
            static var setMeasuredDimension: jmethodID?
            static var getParent: jmethodID?
            static var setOnFocusChangeListener: jmethodID?
            static var getViewTreeObserver: jmethodID?
            static var getRootView: jmethodID?
            static var getWindowToken: jmethodID?
        }
    }
}

public extension Android.View.View {
    
    /// Android View Visibility
    public struct Visibility: RawRepresentable, Equatable, Hashable {
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            
            self.rawValue = rawValue
        }
    }
}

public extension Android.View.View.Visibility {
    
    public static let visible = Android.View.View.Visibility(rawValue: Android.View.View.VISIBLE)
    
    public static let invisible = Android.View.View.Visibility(rawValue: Android.View.View.INVISIBLE)
    
    public static let gone = Android.View.View.Visibility(rawValue: Android.View.View.GONE)
}

