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
    
    public var context: Android.Content.Context {
        
        get {
            return getContext()
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
}

// MARK: - Constants

internal extension Android.View.View {
    
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
    public func findViewById(_ id: Android.R.ID) -> Android.View.View? {
        
        return findViewById(id.rawValue)
    }
    
    private func setId(_ id: Int) {
        
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
    
    private func getId() -> Int {
        
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
    
    private func getTag() -> JavaObject? {
        
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
    
    private func setTag(_ tag: JavaObject?) {
        
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
    internal func getContext() -> Android.Content.Context {
        
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
        
        return Android.Content.Context(javaObject: __return)
    }
}

// MARK: - JNICache

internal extension Android.View.View {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["View"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
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
        struct MethodID {
            
            static var findViewById: jmethodID?
            static var findViewWithTag: jmethodID?
            static var setId: jmethodID?
            static var getId: jmethodID?
            static var getTag: jmethodID?
            static var setTag: jmethodID?
            static var getContext: jmethodID?
        }
    }
}
