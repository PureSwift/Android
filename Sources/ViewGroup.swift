//
//  AndroidViewGroup.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_lang

public extension Android.View {
    
    public typealias ViewGroup = AndroidViewGroup
}

/// `Android.View.View`
open class AndroidViewGroup: AndroidView {
    
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
        self.init(javaObject: nil)
        bindNewObject(context: context)
    }
    
    public func bindNewObject(context: Android.Content.Context){
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: ViewGroupJNICache.className,
            classCache: &ViewGroupJNICache.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &ViewGroupJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        super.javaObject = __object
        
        JNI.DeleteLocalRef( __object )
    }
    
    open override func clearFocus()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clearFocus",
            methodSig: "()V",
            methodCache: &ViewGroupJNICache.MethodID.clearFocus,
            args: &__args,
            locals: &__locals )
    }
    
    open override func dispatchCapturedPointerEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchCapturedPointerEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &ViewGroupJNICache.MethodID.dispatchCapturedPointerEvent,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open override func dispatchDisplayHint(hint: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(hint))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchDisplayHint",
            methodSig: "(I)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchDisplayHint,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    open override func dispatchDrawableHotspotChanged(x: Float, y: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(x))
        __args[1] = jvalue(f: jfloat(y))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchDrawableHotspotChanged",
            methodSig: "(FF)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchDrawableHotspotChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    open override func dispatchKeyEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchKeyEvent",
            methodSig: "(Landroid/view/KeyEvent;)Z",
            methodCache: &ViewGroupJNICache.MethodID.dispatchKeyEvent,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open override func dispatchKeyEventPreIme(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchKeyEventPreIme",
            methodSig: "(Landroid/view/KeyEvent;)Z",
            methodCache: &ViewGroupJNICache.MethodID.dispatchKeyEventPreIme,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open override func dispatchKeyShortcutEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchKeyShortcutEvent",
            methodSig: "(Landroid/view/KeyEvent;)Z",
            methodCache: &ViewGroupJNICache.MethodID.dispatchKeyShortcutEvent,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    open override func dispatchPointerCaptureChanged(hasCapture: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hasCapture ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchPointerCaptureChanged",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchPointerCaptureChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    open override func dispatchProvideAutofillStructure(structure: JavaObject, flags: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: structure, locals: &__locals)
        __args[1] = jvalue(i: jint(flags))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchProvideAutofillStructure",
            methodSig: "(Landroid/view/ViewStructure;I)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchProvideAutofillStructure,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    open override func dispatchProvideStructure(structure: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: structure, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchProvideStructure",
            methodSig: "(Landroid/view/ViewStructure;)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchProvideStructure,
            args: &__args,
            locals: &__locals )
    }
    
    open override func dispatchTrackballEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchTrackballEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &ViewGroupJNICache.MethodID.dispatchTrackballEvent,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open override func dispatchUnhandledMove(focused: Android.View.View, direction: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: focused, locals: &__locals)
        __args[1] = jvalue(i: jint(direction))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchUnhandledMove",
            methodSig: "(Landroid/view/View;I)Z",
            methodCache: &ViewGroupJNICache.MethodID.dispatchUnhandledMove,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    open override func dispatchWindowFocusChanged(hasFocus: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(hasFocus ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchWindowFocusChanged",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchWindowFocusChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    open override func dispatchWindowSystemUiVisiblityChanged(visible: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visible))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchWindowSystemUiVisiblityChanged",
            methodSig: "(I)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchWindowSystemUiVisiblityChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    open override func dispatchWindowVisibilityChanged(visibility: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visibility))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchWindowVisibilityChanged",
            methodSig: "(I)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchWindowVisibilityChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    open override func hasFocus() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasFocus",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.hasFocus,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open override func hasTransientState() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "hasTransientState",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.hasTransientState,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    open override func jumpDrawablesToCurrentState()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "jumpDrawablesToCurrentState",
            methodSig: "()V",
            methodCache: &ViewGroupJNICache.MethodID.jumpDrawablesToCurrentState,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    open override func layout(l: Int, t: Int, r: Int, b: Int)  {
        
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
            methodCache: &ViewGroupJNICache.MethodID.layout,
            args: &__args,
            locals: &__locals )
        
        
    }
    open override func requestFocus(direction: Int, previouslyFocusedRect: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(direction))
        __args[1] = JNIType.toJava(value: previouslyFocusedRect, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestFocus",
            methodSig: "(ILandroid/graphics/Rect;)Z",
            methodCache: &ViewGroupJNICache.MethodID.requestFocus,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    open override func restoreDefaultFocus() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "restoreDefaultFocus",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.restoreDefaultFocus,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    open func addView(_ child: Android.View.View, index: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = jvalue(i: jint(index))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;I)V",
            methodCache: &ViewGroupJNICache.MethodID.addView,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    open func addView(_ child: Android.View.View, index: Int, params: Android.View.ViewGroup.LayoutParams)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = jvalue(i: jint(index))
        __args[0] = JNIType.toJava(value: params, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &ViewGroupJNICache.MethodID.addView2,
            args: &__args,
            locals: &__locals )
    }
    
    open func addView(_ child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.addView3,
            args: &__args,
            locals: &__locals )
    }
    
    open func addView(_ child: Android.View.View, params: Android.View.ViewGroup.LayoutParams)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: params, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V",
            methodCache: &ViewGroupJNICache.MethodID.addView4,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    open func addView(child: Android.View.View, width: Int, height: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = jvalue(i: jint(width))
        __args[2] = jvalue(i: jint(height))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addView",
            methodSig: "(Landroid/view/View;II)V",
            methodCache: &ViewGroupJNICache.MethodID.addView5,
            args: &__args,
            locals: &__locals )
    }
    
    open func onLayout(changed: Bool, l: Int, t: Int, r: Int, b: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 5 )
        
        __args[0] = jvalue(z: jboolean(changed ? JNI_TRUE : JNI_FALSE))
        __args[1] = jvalue(i: jint(l))
        __args[2] = jvalue(i: jint(t))
        __args[3] = jvalue(i: jint(r))
        __args[4] = jvalue(i: jint(b))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onLayout",
            methodSig: "(ZIIII)V",
            methodCache: &ViewGroupJNICache.MethodID.onLayout,
            args: &__args,
            locals: &__locals )
    }
}

public extension Android.View.ViewGroup {
    
    public func addStatesFromChildren() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "addStatesFromChildren",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.addStatesFromChildren,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func bringChildToFront(child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "bringChildToFront",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.bringChildToFront,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func childDrawableStateChanged(child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "childDrawableStateChanged",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.childDrawableStateChanged,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func childHasTransientStateChanged(child: Android.View.View, childHasTransientState: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = jvalue(z: jboolean(childHasTransientState ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "childHasTransientStateChanged",
            methodSig: "(Landroid/view/View;Z)V",
            methodCache: &ViewGroupJNICache.MethodID.childHasTransientStateChanged,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func clearChildFocus(child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clearChildFocus",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.clearChildFocus,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func clearDisappearingChildren()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "clearDisappearingChildren",
            methodSig: "()V",
            methodCache: &ViewGroupJNICache.MethodID.clearDisappearingChildren,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    
    
    public func dispatchSetActivated(activated: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(activated ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchSetActivated",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchSetActivated,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func dispatchSetSelected(selected: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(selected ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchSetSelected",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchSetSelected,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func dispatchSystemUiVisibilityChanged(visible: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(visible))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "dispatchSystemUiVisibilityChanged",
            methodSig: "(I)V",
            methodCache: &ViewGroupJNICache.MethodID.dispatchSystemUiVisibilityChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func dispatchTouchEvent(ev: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: ev, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "dispatchTouchEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &ViewGroupJNICache.MethodID.dispatchTouchEvent,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    
    
    public func endViewTransition(view: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "endViewTransition",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.endViewTransition,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func findFocus() -> Android.View.View {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "findFocus",
            methodSig: "()Landroid/view/View;",
            methodCache: &ViewGroupJNICache.MethodID.findFocus,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        
        
        return Android.View.View(javaObject: __return)
    }
    
    
    public func focusSearch(focused: Android.View.View, direction: Int) -> Android.View.View {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: focused, locals: &__locals)
        __args[1] = jvalue(i: jint(direction))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "focusSearch",
            methodSig: "(Landroid/view/View;I)Landroid/view/View;",
            methodCache: &ViewGroupJNICache.MethodID.focusSearch,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        
        
        return Android.View.View(javaObject: __return)
    }
    
    
    public func focusableViewAvailable(v: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: v, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "focusableViewAvailable",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.focusableViewAvailable,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func getChildAt(index: Int) -> Android.View.View {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(index))
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getChildAt",
            methodSig: "(I)Landroid/view/View;",
            methodCache: &ViewGroupJNICache.MethodID.getChildAt,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        
        
        return Android.View.View(javaObject: __return)
    }
    
    
    public func getChildCount() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getChildCount",
            methodSig: "()I",
            methodCache: &ViewGroupJNICache.MethodID.getChildCount,
            args: &__args,
            locals: &__locals )
        
        
        
        return Int(__return)
    }
    
    
    public func getChildMeasureSpec(spec: Int, padding: Int, childDimension: Int) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = jvalue(i: jint(spec))
        __args[1] = jvalue(i: jint(padding))
        __args[2] = jvalue(i: jint(childDimension))
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getChildMeasureSpec",
            methodSig: "(III)I",
            methodCache: &ViewGroupJNICache.MethodID.getChildMeasureSpec,
            args: &__args,
            locals: &__locals )
        
        
        
        return Int(__return)
    }
    
    /**
     * Ask one of the children of this view to measure itself, taking into account both
     * the MeasureSpec requirements for this view and its padding.
     */
    public func measureChild(child: Android.View.View, parentWidthMeasureSpec: Int, parentHeightMeasureSpec: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = jvalue(i: jint(parentWidthMeasureSpec))
        __args[2] = jvalue(i: jint(parentHeightMeasureSpec))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "measureChild",
            methodSig: "(Landroid/view/View;II)V",
            methodCache: &ViewGroupJNICache.MethodID.measureChild,
            args: &__args,
            locals: &__locals )
    }
    
    public func getClipChildren() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getClipChildren",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.getClipChildren,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func getClipToPadding() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getClipToPadding",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.getClipToPadding,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func getDescendantFocusability() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getDescendantFocusability",
            methodSig: "()I",
            methodCache: &ViewGroupJNICache.MethodID.getDescendantFocusability,
            args: &__args,
            locals: &__locals )
        
        
        
        return Int(__return)
    }
    
    
    public func getFocusedChild() -> Android.View.View {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getFocusedChild",
            methodSig: "()Landroid/view/View;",
            methodCache: &ViewGroupJNICache.MethodID.getFocusedChild,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        
        
        return Android.View.View(javaObject: __return)
    }
    
    
    public func getLayoutMode() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getLayoutMode",
            methodSig: "()I",
            methodCache: &ViewGroupJNICache.MethodID.getLayoutMode,
            args: &__args,
            locals: &__locals )
        
        
        
        return Int(__return)
    }
    
    
    public func getNestedScrollAxes() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getNestedScrollAxes",
            methodSig: "()I",
            methodCache: &ViewGroupJNICache.MethodID.getNestedScrollAxes,
            args: &__args,
            locals: &__locals )
        
        
        
        return Int(__return)
    }
    
    
    public func getPersistentDrawingCache() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getPersistentDrawingCache",
            methodSig: "()I",
            methodCache: &ViewGroupJNICache.MethodID.getPersistentDrawingCache,
            args: &__args,
            locals: &__locals )
        
        
        
        return Int(__return)
    }
    
    
    public func getTouchscreenBlocksFocus() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getTouchscreenBlocksFocus",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.getTouchscreenBlocksFocus,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func indexOfChild(child: Android.View.View) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "indexOfChild",
            methodSig: "(Landroid/view/View;)I",
            methodCache: &ViewGroupJNICache.MethodID.indexOfChild,
            args: &__args,
            locals: &__locals )
        
        
        
        return Int(__return)
    }
    
    
    public func invalidateChild(child: Android.View.View, dirty: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: dirty, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "invalidateChild",
            methodSig: "(Landroid/view/View;Landroid/graphics/Rect;)V",
            methodCache: &ViewGroupJNICache.MethodID.invalidateChild,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func isAlwaysDrawnWithCacheEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isAlwaysDrawnWithCacheEnabled",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.isAlwaysDrawnWithCacheEnabled,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isAnimationCacheEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isAnimationCacheEnabled",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.isAnimationCacheEnabled,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isMotionEventSplittingEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isMotionEventSplittingEnabled",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.isMotionEventSplittingEnabled,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isTransitionGroup() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isTransitionGroup",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.isTransitionGroup,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    
    
    public func notifySubtreeAccessibilityStateChanged(child: Android.View.View, source: Android.View.View, changeType: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: source, locals: &__locals)
        __args[2] = jvalue(i: jint(changeType))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "notifySubtreeAccessibilityStateChanged",
            methodSig: "(Landroid/view/View;Landroid/view/View;I)V",
            methodCache: &ViewGroupJNICache.MethodID.notifySubtreeAccessibilityStateChanged,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func offsetDescendantRectToMyCoords(descendant: Android.View.View, rect: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: descendant, locals: &__locals)
        __args[1] = JNIType.toJava(value: rect, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "offsetDescendantRectToMyCoords",
            methodSig: "(Landroid/view/View;Landroid/graphics/Rect;)V",
            methodCache: &ViewGroupJNICache.MethodID.offsetDescendantRectToMyCoords,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func offsetRectIntoDescendantCoords(descendant: Android.View.View, rect: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: descendant, locals: &__locals)
        __args[1] = JNIType.toJava(value: rect, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "offsetRectIntoDescendantCoords",
            methodSig: "(Landroid/view/View;Landroid/graphics/Rect;)V",
            methodCache: &ViewGroupJNICache.MethodID.offsetRectIntoDescendantCoords,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onDescendantInvalidated(child: Android.View.View, target: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: target, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onDescendantInvalidated",
            methodSig: "(Landroid/view/View;Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.onDescendantInvalidated,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onInterceptHoverEvent(event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onInterceptHoverEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &ViewGroupJNICache.MethodID.onInterceptHoverEvent,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onInterceptTouchEvent(ev: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: ev, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onInterceptTouchEvent",
            methodSig: "(Landroid/view/MotionEvent;)Z",
            methodCache: &ViewGroupJNICache.MethodID.onInterceptTouchEvent,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onNestedFling(target: Android.View.View, velocityX: Float, velocityY: Float, consumed: Bool) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = JNIType.toJava(value: target, locals: &__locals)
        __args[1] = jvalue(f: jfloat(velocityX))
        __args[2] = jvalue(f: jfloat(velocityY))
        __args[3] = jvalue(z: jboolean(consumed ? JNI_TRUE : JNI_FALSE))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onNestedFling",
            methodSig: "(Landroid/view/View;FFZ)Z",
            methodCache: &ViewGroupJNICache.MethodID.onNestedFling,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onNestedPreFling(target: Android.View.View, velocityX: Float, velocityY: Float) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: target, locals: &__locals)
        __args[1] = jvalue(f: jfloat(velocityX))
        __args[2] = jvalue(f: jfloat(velocityY))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onNestedPreFling",
            methodSig: "(Landroid/view/View;FF)Z",
            methodCache: &ViewGroupJNICache.MethodID.onNestedPreFling,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onNestedPreScroll(target: Android.View.View, dx: Int, dy: Int, consumed: [Int])  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = JNIType.toJava(value: target, locals: &__locals)
        __args[1] = jvalue(i: jint(dx))
        __args[2] = jvalue(i: jint(dy))
        __args[3] = JNIType.toJava(value: consumed, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onNestedPreScroll",
            methodSig: "(Landroid/view/View;II[I)V",
            methodCache: &ViewGroupJNICache.MethodID.onNestedPreScroll,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onNestedScroll(target: Android.View.View, dxConsumed: Int, dyConsumed: Int, dxUnconsumed: Int, dyUnconsumed: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 5 )
        
        __args[0] = JNIType.toJava(value: target, locals: &__locals)
        __args[1] = jvalue(i: jint(dxConsumed))
        __args[2] = jvalue(i: jint(dyConsumed))
        __args[3] = jvalue(i: jint(dxUnconsumed))
        __args[4] = jvalue(i: jint(dyUnconsumed))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onNestedScroll",
            methodSig: "(Landroid/view/View;IIII)V",
            methodCache: &ViewGroupJNICache.MethodID.onNestedScroll,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onNestedScrollAccepted(child: Android.View.View, target: Android.View.View, axes: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: target, locals: &__locals)
        __args[2] = jvalue(i: jint(axes))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onNestedScrollAccepted",
            methodSig: "(Landroid/view/View;Landroid/view/View;I)V",
            methodCache: &ViewGroupJNICache.MethodID.onNestedScrollAccepted,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onStartNestedScroll(child: Android.View.View, target: Android.View.View, nestedScrollAxes: Int) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: target, locals: &__locals)
        __args[2] = jvalue(i: jint(nestedScrollAxes))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onStartNestedScroll",
            methodSig: "(Landroid/view/View;Landroid/view/View;I)Z",
            methodCache: &ViewGroupJNICache.MethodID.onStartNestedScroll,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func onStopNestedScroll(child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onStopNestedScroll",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.onStopNestedScroll,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onViewAdded(child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onViewAdded",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.onViewAdded,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func onViewRemoved(child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "onViewRemoved",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.onViewRemoved,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func recomputeViewAttributes(child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "recomputeViewAttributes",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.recomputeViewAttributes,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func removeAllViews()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeAllViews",
            methodSig: "()V",
            methodCache: &ViewGroupJNICache.MethodID.removeAllViews,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func removeAllViewsInLayout()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeAllViewsInLayout",
            methodSig: "()V",
            methodCache: &ViewGroupJNICache.MethodID.removeAllViewsInLayout,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func removeView(view: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeView",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.removeView,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func removeViewAt(index: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(index))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeViewAt",
            methodSig: "(I)V",
            methodCache: &ViewGroupJNICache.MethodID.removeViewAt,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func removeViewInLayout(view: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeViewInLayout",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.removeViewInLayout,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func removeViews(start: Int, count: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(start))
        __args[1] = jvalue(i: jint(count))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeViews",
            methodSig: "(II)V",
            methodCache: &ViewGroupJNICache.MethodID.removeViews,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func removeViewsInLayout(start: Int, count: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(start))
        __args[1] = jvalue(i: jint(count))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "removeViewsInLayout",
            methodSig: "(II)V",
            methodCache: &ViewGroupJNICache.MethodID.removeViewsInLayout,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func requestChildFocus(child: Android.View.View, focused: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: focused, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "requestChildFocus",
            methodSig: "(Landroid/view/View;Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.requestChildFocus,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func requestChildRectangleOnScreen(child: Android.View.View, rectangle: JavaObject, immediate: Bool) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        __args[1] = JNIType.toJava(value: rectangle, locals: &__locals)
        __args[2] = jvalue(z: jboolean(immediate ? JNI_TRUE : JNI_FALSE))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "requestChildRectangleOnScreen",
            methodSig: "(Landroid/view/View;Landroid/graphics/Rect;Z)Z",
            methodCache: &ViewGroupJNICache.MethodID.requestChildRectangleOnScreen,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func requestDisallowInterceptTouchEvent(disallowIntercept: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(disallowIntercept ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "requestDisallowInterceptTouchEvent",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.requestDisallowInterceptTouchEvent,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    
    public func requestTransparentRegion(child: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: child, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "requestTransparentRegion",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.requestTransparentRegion,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func scheduleLayoutAnimation()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "scheduleLayoutAnimation",
            methodSig: "()V",
            methodCache: &ViewGroupJNICache.MethodID.scheduleLayoutAnimation,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setAddStatesFromChildren(addsStates: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(addsStates ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAddStatesFromChildren",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.setAddStatesFromChildren,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setAlwaysDrawnWithCacheEnabled(always: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(always ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAlwaysDrawnWithCacheEnabled",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.setAlwaysDrawnWithCacheEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setAnimationCacheEnabled(enabled: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setAnimationCacheEnabled",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.setAnimationCacheEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setClipChildren(clipChildren: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(clipChildren ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setClipChildren",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.setClipChildren,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setClipToPadding(clipToPadding: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(clipToPadding ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setClipToPadding",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.setClipToPadding,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setDescendantFocusability(focusability: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(focusability))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setDescendantFocusability",
            methodSig: "(I)V",
            methodCache: &ViewGroupJNICache.MethodID.setDescendantFocusability,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setLayoutMode(layoutMode: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(layoutMode))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLayoutMode",
            methodSig: "(I)V",
            methodCache: &ViewGroupJNICache.MethodID.setLayoutMode,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setMotionEventSplittingEnabled(split: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(split ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMotionEventSplittingEnabled",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.setMotionEventSplittingEnabled,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setPersistentDrawingCache(drawingCacheToKeep: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(drawingCacheToKeep))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPersistentDrawingCache",
            methodSig: "(I)V",
            methodCache: &ViewGroupJNICache.MethodID.setPersistentDrawingCache,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTouchscreenBlocksFocus(touchscreenBlocksFocus: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(touchscreenBlocksFocus ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTouchscreenBlocksFocus",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.setTouchscreenBlocksFocus,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func setTransitionGroup(isTransitionGroup: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(isTransitionGroup ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTransitionGroup",
            methodSig: "(Z)V",
            methodCache: &ViewGroupJNICache.MethodID.setTransitionGroup,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func shouldDelayChildPressedState() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "shouldDelayChildPressedState",
            methodSig: "()Z",
            methodCache: &ViewGroupJNICache.MethodID.shouldDelayChildPressedState,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func showContextMenuForChild(originalView: Android.View.View, x: Float, y: Float) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: originalView, locals: &__locals)
        __args[1] = jvalue(f: jfloat(x))
        __args[2] = jvalue(f: jfloat(y))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "showContextMenuForChild",
            methodSig: "(Landroid/view/View;FF)Z",
            methodCache: &ViewGroupJNICache.MethodID.showContextMenuForChild,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func showContextMenuForChild(originalView: Android.View.View) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: originalView, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "showContextMenuForChild2",
            methodSig: "(Landroid/view/View;)Z",
            methodCache: &ViewGroupJNICache.MethodID.showContextMenuForChild2,
            args: &__args,
            locals: &__locals )
        
        
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func startLayoutAnimation()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startLayoutAnimation",
            methodSig: "()V",
            methodCache: &ViewGroupJNICache.MethodID.startLayoutAnimation,
            args: &__args,
            locals: &__locals )
        
        
    }
    
    
    public func startViewTransition(view: Android.View.View)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: view, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "startViewTransition",
            methodSig: "(Landroid/view/View;)V",
            methodCache: &ViewGroupJNICache.MethodID.startViewTransition,
            args: &__args,
            locals: &__locals )
        
        
    }
}

// MARK: - JNICache

internal extension Android.View.ViewGroup {
    
    /// JNI Cache
    struct ViewGroupJNICache {
        
        /// JNI Java class signature
        static let classSignature = SwiftSupport.View.className(["SwiftViewGroup"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            
            static var addView: jmethodID?
            static var addView2: jmethodID?
            static var addView3: jmethodID?
            static var addView4: jmethodID?
            static var addView5: jmethodID?
            
            static var addStatesFromChildren: jmethodID?
            static var bringChildToFront: jmethodID?
            static var childDrawableStateChanged: jmethodID?
            static var childHasTransientStateChanged: jmethodID?
            static var clearChildFocus: jmethodID?
            static var clearDisappearingChildren: jmethodID?
            static var clearFocus: jmethodID?
            static var dispatchCapturedPointerEvent: jmethodID?
            static var dispatchDisplayHint: jmethodID?
            static var dispatchDrawableHotspotChanged: jmethodID?
            static var dispatchKeyEvent: jmethodID?
            static var dispatchKeyEventPreIme: jmethodID?
            static var dispatchKeyShortcutEvent: jmethodID?
            static var dispatchPointerCaptureChanged: jmethodID?
            static var dispatchProvideAutofillStructure: jmethodID?
            static var dispatchProvideStructure: jmethodID?
            static var dispatchSetActivated: jmethodID?
            static var dispatchSetSelected: jmethodID?
            static var dispatchSystemUiVisibilityChanged: jmethodID?
            static var dispatchTouchEvent: jmethodID?
            static var dispatchTrackballEvent: jmethodID?
            static var dispatchUnhandledMove: jmethodID?
            static var dispatchWindowFocusChanged: jmethodID?
            static var dispatchWindowSystemUiVisiblityChanged: jmethodID?
            static var dispatchWindowVisibilityChanged: jmethodID?
            static var endViewTransition: jmethodID?
            static var findFocus: jmethodID?
            static var focusSearch: jmethodID?
            static var focusableViewAvailable: jmethodID?
            static var getChildAt: jmethodID?
            static var getChildCount: jmethodID?
            static var getChildMeasureSpec: jmethodID?
            static var getClipChildren: jmethodID?
            static var getClipToPadding: jmethodID?
            static var getDescendantFocusability: jmethodID?
            static var getFocusedChild: jmethodID?
            static var getLayoutMode: jmethodID?
            static var getNestedScrollAxes: jmethodID?
            static var getPersistentDrawingCache: jmethodID?
            static var getTouchscreenBlocksFocus: jmethodID?
            static var hasFocus: jmethodID?
            static var hasTransientState: jmethodID?
            static var indexOfChild: jmethodID?
            static var invalidateChild: jmethodID?
            static var isAlwaysDrawnWithCacheEnabled: jmethodID?
            static var isAnimationCacheEnabled: jmethodID?
            static var isMotionEventSplittingEnabled: jmethodID?
            static var isTransitionGroup: jmethodID?
            static var jumpDrawablesToCurrentState: jmethodID?
            static var layout: jmethodID?
            static var notifySubtreeAccessibilityStateChanged: jmethodID?
            static var offsetDescendantRectToMyCoords: jmethodID?
            static var offsetRectIntoDescendantCoords: jmethodID?
            static var onDescendantInvalidated: jmethodID?
            static var onInterceptHoverEvent: jmethodID?
            static var onInterceptTouchEvent: jmethodID?
            static var onNestedFling: jmethodID?
            static var onNestedPreFling: jmethodID?
            static var onNestedPreScroll: jmethodID?
            static var onNestedScroll: jmethodID?
            static var onNestedScrollAccepted: jmethodID?
            static var onStartNestedScroll: jmethodID?
            static var onStopNestedScroll: jmethodID?
            static var onViewAdded: jmethodID?
            static var onViewRemoved: jmethodID?
            static var recomputeViewAttributes: jmethodID?
            static var removeAllViews: jmethodID?
            static var removeAllViewsInLayout: jmethodID?
            static var removeView: jmethodID?
            static var removeViewAt: jmethodID?
            static var removeViewInLayout: jmethodID?
            static var removeViews: jmethodID?
            static var removeViewsInLayout: jmethodID?
            static var requestChildFocus: jmethodID?
            static var requestChildRectangleOnScreen: jmethodID?
            static var requestDisallowInterceptTouchEvent: jmethodID?
            static var requestFocus: jmethodID?
            static var requestTransparentRegion: jmethodID?
            static var restoreDefaultFocus: jmethodID?
            static var scheduleLayoutAnimation: jmethodID?
            static var setAddStatesFromChildren: jmethodID?
            static var setAlwaysDrawnWithCacheEnabled: jmethodID?
            static var setAnimationCacheEnabled: jmethodID?
            static var setClipChildren: jmethodID?
            static var setClipToPadding: jmethodID?
            static var setDescendantFocusability: jmethodID?
            static var setLayoutMode: jmethodID?
            static var setMotionEventSplittingEnabled: jmethodID?
            static var setPersistentDrawingCache: jmethodID?
            static var setTouchscreenBlocksFocus: jmethodID?
            static var setTransitionGroup: jmethodID?
            static var shouldDelayChildPressedState: jmethodID?
            static var showContextMenuForChild: jmethodID?
            static var showContextMenuForChild2: jmethodID?
            static var startLayoutAnimation: jmethodID?
            static var startViewTransition: jmethodID?
            static var onLayout: jmethodID?
            static var measureChild: jmethodID?
        }
    }
}
