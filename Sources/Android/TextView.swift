//
//  AndroidTextView.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_swift

public extension Android.Widget {
    
    public typealias TextView = AndroidTextView
}

/**
 * Displays text to the user and optionally allows them to edit it.  A TextView
 * is a complete text editor, however the basic class is configured to not
 * allow editing; see `EditText` for a subclass that configures the text
 * view for editing.
 */
open class AndroidTextView: AndroidView {
    
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
    
    public func bindNewJavaObject(context: Android.Content.Context){
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheTextView.className,
            classCache: &JNICacheTextView.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheTextView.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.javaObject = __object
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var gravity: Int {
        
        get { return getGravity() ?? 0 }
        
        set { setGravity(newValue) }
    }
    
    public var text: String? {
        
        get { return getText() ?? "" }
        
        set { setText(newValue) }
    }
    
    public var hint: String? {
        
        get { return getHint() ?? "" }
        
        set { setHint(newValue) }
    }
    
    public var color: Int64 {
        get { return getCurrentTextColor() }
        
        set { setTextColor(newValue) }
    }
    
    public var letterSpacing: Float {
        get { return getLetterSpacing() }
        
        set { setLetterSpacing(letterSpacing: newValue) }
    }
    
    // MARK: - Accessors
    
    public var isEmpty: Bool {
        
        get { return length == 0 }
    }
    
    public var length: Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "length",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.length,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    internal func getText() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getText",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &JNICacheTextView.MethodID.getText,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    internal func setText(_ text: String?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setText",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &JNICacheTextView.MethodID.setText,
            args: &__args,
            locals: &__locals )
    }
    
    public func setText(_ resid: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resid))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setText",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setText2,
            args: &__args,
            locals: &__locals )
    }
    
    internal func getHint() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getHint",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &JNICacheTextView.MethodID.getHint,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    /// Sets the text to be displayed when the text of the TextView is empty.
    internal func setHint(_ hint: String?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: hint, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHint",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &JNICacheTextView.MethodID.setHint1,
            args: &__args,
            locals: &__locals )
    }
    
    /// Sets the text to be displayed when the text of the TextView is empty, from a resource.
    public func setHint(_ resid: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(resid))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHint",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setHint2,
            args: &__args,
            locals: &__locals )
    }
    
    internal func getGravity() -> Int? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getGravity",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getGravity,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    internal func setGravity(_ gravity: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(gravity))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setGravity",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setGravity,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Return the current color selected for normal text.
     */
    internal func getCurrentTextColor() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getCurrentTextColor",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getCurrentTextColor,
            args: &__args,
            locals: &__locals )
        
        return Int64(__return)
    }
    
    /**
     * Sets the text color for all the states (normal, selected, focused) to be this color.
     */
    internal func setTextColor(_ color: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        //__args[0] = jvalue(i: jint(color))
        __args[0] = jvalue(j: jlong(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTextColor",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setTextColor,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Gets the text letter-space value, which determines the spacing between characters.
     */
    internal func getLetterSpacing() -> Float {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallFloatMethod(
            object: javaObject,
            methodName: "getLetterSpacing",
            methodSig: "()F",
            methodCache: &JNICacheTextView.MethodID.getLetterSpacing,
            args: &__args,
            locals: &__locals )
        
        return Float(__return)
    }
    
    /**
     * Return the number of lines of text, or 0 if the internal Layout has not been built.
     */
    internal func getLineCount() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getLineCount",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getLineCount,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Gets the color of the shadow layer.
     */
    public func getShadowColor() -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getShadowColor",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getShadowColor,
            args: &__args,
            locals: &__locals )
        
        return Int64(__return)
    }
    
    
    
    /**
     * Returns the total bottom padding of the view, including the bottom Drawable if any, the extra space to keep more than maxLines from showing, and the vertical offset for gravity, if any.
     */
    public func getTotalPaddingBottom() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTotalPaddingBottom",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getTotalPaddingBottom,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the total end padding of the view, including the end Drawable if any.
     */
    public func getTotalPaddingEnd() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTotalPaddingEnd",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getTotalPaddingEnd,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the total left padding of the view, including the left Drawable if any.
     */
    public func getTotalPaddingLeft() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTotalPaddingLeft",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getTotalPaddingLeft,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the total right padding of the view, including the right Drawable if any.
     */
    public func getTotalPaddingRight() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTotalPaddingRight",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getTotalPaddingRight,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the total start padding of the view, including the start Drawable if any.
     */
    public func getTotalPaddingStart() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTotalPaddingStart",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getTotalPaddingStart,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    /**
     * Returns the total top padding of the view, including the top Drawable if any, the extra space to keep more than maxLines from showing, and the vertical offset for gravity, if any.
     */
    public func getTotalPaddingTop() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "getTotalPaddingTop",
            methodSig: "()I",
            methodCache: &JNICacheTextView.MethodID.getTotalPaddingTop,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
    
    
    public func isCursorVisible() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isCursorVisible",
            methodSig: "()Z",
            methodCache: &JNICacheTextView.MethodID.isCursorVisible,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func setCursorVisible(visible: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(visible ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setCursorVisible",
            methodSig: "(Z)V",
            methodCache: &JNICacheTextView.MethodID.setCursorVisible,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Return whether or not suggestions are enabled on this TextView.
     */
    public func isSuggestionsEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isSuggestionsEnabled",
            methodSig: "()Z",
            methodCache: &JNICacheTextView.MethodID.isSuggestionsEnabled,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    public func isTextSelectable() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "isTextSelectable",
            methodSig: "()Z",
            methodCache: &JNICacheTextView.MethodID.isTextSelectable,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func getShowSoftInputOnFocus() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "getShowSoftInputOnFocus",
            methodSig: "()Z",
            methodCache: &JNICacheTextView.MethodID.getShowSoftInputOnFocus,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open override func onKeyDown(keyCode: Int, event: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(keyCode))
        __args[1] = JNIType.toJava(value: event, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "onKeyDown",
            methodSig: "(ILandroid/view/KeyEvent;)Z",
            methodCache: &JNICacheTextView.MethodID.onKeyDown,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func append(text: String)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "append",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &JNICacheTextView.MethodID.append,
            args: &__args,
            locals: &__locals )
        
    }
    
    public func append(text: String, start: Int, end: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: text, locals: &__locals)
        __args[1] = jvalue(i: jint(start))
        __args[2] = jvalue(i: jint(end))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "append",
            methodSig: "(Ljava/lang/String;II)V",
            methodCache: &JNICacheTextView.MethodID.append2,
            args: &__args,
            locals: &__locals )
    }
    
    
    open override func cancelLongPress()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "cancelLongPress",
            methodSig: "()V",
            methodCache: &JNICacheTextView.MethodID.cancelLongPress,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Sets the right-hand compound drawable of the TextView to the "error" icon and sets an error message that will be displayed in a popup when the TextView has focus.
     */
    public func setError(error: String)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: error, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setError",
            methodSig: "(Ljava/lang/String;)V",
            methodCache: &JNICacheTextView.MethodID.setError,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Sets the right-hand compound drawable of the TextView to the specified icon and sets an error message that will be displayed in a popup when the TextView has focus.
     */
    public func setError(error: String, icon: JavaObject)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: error, locals: &__locals)
        __args[1] = JNIType.toJava(value: icon, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setError",
            methodSig: "(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V",
            methodCache: &JNICacheTextView.MethodID.setError2,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Sets text letter-spacing in em units.
     */
    internal func setLetterSpacing(letterSpacing: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(letterSpacing))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLetterSpacing",
            methodSig: "(F)V",
            methodCache: &JNICacheTextView.MethodID.setLetterSpacing,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Sets an explicit line height for this TextView.
     */
    public func setLineHeight(lineHeight: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(lineHeight))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLineHeight",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setLineHeight,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Sets line spacing for this TextView.
     */
    public func setLineSpacing(add: Float, mult: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(add))
        __args[1] = jvalue(f: jfloat(mult))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLineSpacing",
            methodSig: "(FF)V",
            methodCache: &JNICacheTextView.MethodID.setLineSpacing,
            args: &__args,
            locals: &__locals )
    }
    
    /**
     * Sets the height of the TextView to be exactly lines tall.
     */
    public func setLines(lines: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(lines))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLines",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setLines,
            args: &__args,
            locals: &__locals )
    }
    
    public func setLinkTextColor(color: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLinkTextColor",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setLinkTextColor,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setLinksClickable(whether: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(whether ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLinksClickable",
            methodSig: "(Z)V",
            methodCache: &JNICacheTextView.MethodID.setLinksClickable,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMarqueeRepeatLimit(marqueeLimit: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(marqueeLimit))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMarqueeRepeatLimit",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMarqueeRepeatLimit,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMaxEms(maxEms: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(maxEms))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMaxEms",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMaxEms,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMaxHeight(maxPixels: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(maxPixels))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMaxHeight",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMaxHeight,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMaxLines(maxLines: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(maxLines))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMaxLines",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMaxLines,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMaxWidth(maxPixels: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(maxPixels))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMaxWidth",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMaxWidth,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMinEms(minEms: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(minEms))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMinEms",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMinEms,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMinHeight(minPixels: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(minPixels))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMinHeight",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMinHeight,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMinLines(minLines: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(minLines))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMinLines",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMinLines,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setMinWidth(minPixels: Int)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(minPixels))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMinWidth",
            methodSig: "(I)V",
            methodCache: &JNICacheTextView.MethodID.setMinWidth,
            args: &__args,
            locals: &__locals )
    }
    
    
    open override func setPadding(left: Int, top: Int, right: Int, bottom: Int)  {
        
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
            methodCache: &JNICacheTextView.MethodID.setPadding,
            args: &__args,
            locals: &__locals )
    }
    
    
    open override func setPaddingRelative(start: Int, top: Int, end: Int, bottom: Int)  {
        
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
            methodCache: &JNICacheTextView.MethodID.setPaddingRelative,
            args: &__args,
            locals: &__locals )
    }
    
    
    open override func setSelected(selected: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(selected ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSelected",
            methodSig: "(Z)V",
            methodCache: &JNICacheTextView.MethodID.setSelected,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setShadowLayer(radius: Float, dx: Float, dy: Float, color: Int64)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 4 )
        
        __args[0] = jvalue(f: jfloat(radius))
        __args[1] = jvalue(f: jfloat(dx))
        __args[2] = jvalue(f: jfloat(dy))
        __args[3] = jvalue(j: jlong(color))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setShadowLayer",
            methodSig: "(FFFI)V",
            methodCache: &JNICacheTextView.MethodID.setShadowLayer,
            args: &__args,
            locals: &__locals )
    }
    
    public func setTextSize(unit: Int, size: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(i: jint(unit))
        __args[1] = jvalue(f: jfloat(size))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTextSize",
            methodSig: "(IF)V",
            methodCache: &JNICacheTextView.MethodID.setTextSize,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setTextSize(size: Float)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(f: jfloat(size))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setTextSize",
            methodSig: "(F)V",
            methodCache: &JNICacheTextView.MethodID.setTextSize2,
            args: &__args,
            locals: &__locals )
    }
    
    
    open override func showContextMenu() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "showContextMenu",
            methodSig: "()Z",
            methodCache: &JNICacheTextView.MethodID.showContextMenu,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    
    open override func showContextMenu(x: Float, y: Float) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = jvalue(f: jfloat(x))
        __args[1] = jvalue(f: jfloat(y))
        
        let __return = JNIMethod.CallBooleanMethod(
            object: javaObject,
            methodName: "showContextMenu",
            methodSig: "(FF)Z",
            methodCache: &JNICacheTextView.MethodID.showContextMenu2,
            args: &__args,
            locals: &__locals )
        
        return __return != jboolean(JNI_FALSE)
    }
    
    public func setSingleLine(singleLine: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(singleLine ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSingleLine",
            methodSig: "(Z)V",
            methodCache: &JNICacheTextView.MethodID.setSingleLine,
            args: &__args,
            locals: &__locals )
    }
    
    
    public func setSingleLine()  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setSingleLine",
            methodSig: "()V",
            methodCache: &JNICacheTextView.MethodID.setSingleLine2,
            args: &__args,
            locals: &__locals )
    }
    
    public func setHorizontallyScrolling(_ whether: Bool)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(whether ? JNI_TRUE : JNI_FALSE))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setHorizontallyScrolling",
            methodSig: "(Z)V",
            methodCache: &JNICacheTextView.MethodID.setHorizontallyScrolling,
            args: &__args,
            locals: &__locals )
    }
    
    public func setEllipsize(where _where: AndroidTextUtilsTruncateAt)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: _where, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setEllipsize",
            methodSig: "(L\(AndroidTextUtilsTruncateAt.JNICache.className);)V",
            methodCache: &JNICacheTextView.MethodID.setEllipsize,
            args: &__args,
            locals: &__locals )
    }
    
    /// Adds a TextWatcher to the list of those whose methods are called whenever this TextView's text changes.
    public func addTextChangedListener(_ watcher: AndroidTextWatcher)  {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: watcher, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "addTextChangedListener",
            methodSig: "(Landroid/text/TextWatcher;)V",
            methodCache: &JNICacheTextView.MethodID.addTextChangedListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func setShowSoftInputOnFocus(_ show: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean( show ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setShowSoftInputOnFocus",
            methodSig: "(Z)V",
            methodCache: &JNICacheTextView.MethodID.setShowSoftInputOnFocus,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Private

internal extension Android.Widget.TextView {
    
    /// JNI Cache
    struct JNICacheTextView {
        
        /// JNI Java class signature
        static let classSignature = Android.Widget.className(["TextView"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var setText: jmethodID?
            static var setText2: jmethodID?
            static var getText: jmethodID?
            static var length: jmethodID?
            static var getHint: jmethodID?
            static var setHint1: jmethodID?
            static var setHint2: jmethodID?
            static var getGravity: jmethodID?
            static var setGravity: jmethodID?
            static var getImeOptions: jmethodID?
            static var getInputType: jmethodID?
            static var getTextSize: jmethodID?
            static var setTypeface: jmethodID?
            static var setHintTextColor: jmethodID?
            static var setLines: jmethodID?
            static var setTextColor: jmethodID?
            static var setSingleLine: jmethodID?
            static var setSingleLine2: jmethodID?
            static var setEnabled: jmethodID?
            static var setHorizontallyScrolling: jmethodID?
            static var getTotalPaddingBottom: jmethodID?
            static var getTotalPaddingEnd: jmethodID?
            static var getTotalPaddingLeft: jmethodID?
            static var getTotalPaddingRight: jmethodID?
            static var getTotalPaddingStart: jmethodID?
            static var getTotalPaddingTop: jmethodID?
            static var isCursorVisible: jmethodID?
            static var setCursorVisible: jmethodID?
            static var isSuggestionsEnabled: jmethodID?
            static var isTextSelectable: jmethodID?
            static var onKeyDown: jmethodID?
            static var append: jmethodID?
            static var append2: jmethodID?
            static var cancelLongPress: jmethodID?
            static var setError: jmethodID?
            static var setError2: jmethodID?
            static var setLetterSpacing: jmethodID?
            static var setLineHeight: jmethodID?
            static var setLineSpacing: jmethodID?
            static var setLinkTextColor: jmethodID?
            static var setLinksClickable: jmethodID?
            static var setMarqueeRepeatLimit: jmethodID?
            static var setMaxEms: jmethodID?
            static var setMaxHeight: jmethodID?
            static var setMaxLines: jmethodID?
            static var setMaxWidth: jmethodID?
            static var setMinEms: jmethodID?
            static var setMinHeight: jmethodID?
            static var setMinLines: jmethodID?
            static var setMinWidth: jmethodID?
            static var setPadding: jmethodID?
            static var setPaddingRelative: jmethodID?
            static var setSelected: jmethodID?
            static var setShadowLayer: jmethodID?
            static var setTextSize: jmethodID?
            static var setTextSize2: jmethodID?
            static var showContextMenu: jmethodID?
            static var showContextMenu2: jmethodID?
            static var getCurrentTextColor: jmethodID?
            static var getLetterSpacing: jmethodID?
            static var getLineCount: jmethodID?
            static var getShadowColor: jmethodID?
            static var setEllipsize: jmethodID?
            static var addTextChangedListener: jmethodID?
            static var setShowSoftInputOnFocus: jmethodID?
            static var getShowSoftInputOnFocus: jmethodID?
        }
    }
}
