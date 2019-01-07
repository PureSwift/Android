//
//  WidgetSearchView.swift
//  Android
//
//  Created by Marco Estrella on 1/4/19.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias SearchView = AndroidSearchView
}

open class AndroidSearchView: Android.Widget.LinearLayoutCompat {
    
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
            className: JNICacheSearchView.className,
            classCache: &JNICacheSearchView.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheSearchView.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    open override func clearFocus() {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "clearFocus",
                                 methodSig: "()V",
                                 methodCache: &JNICacheSearchView.MethodID.clearFocus,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    open override func onWindowFocusChanged(hasWindowFocus: Bool) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(hasWindowFocus ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "onWindowFocusChanged",
                                 methodSig: "(Z)V",
                                 methodCache: &JNICacheSearchView.MethodID.onWindowFocusChanged,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    open override func requestFocus(direction: Int, previouslyFocusedRect: JavaObject) -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 2)
        __args[0] = jvalue(i: jint(direction))
        __args[1] = JNIType.toJava(value: previouslyFocusedRect, locals: &__locals)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "requestFocus",
                                                   methodSig: "(ILandroid/graphics/Rect;)Z",
                                                   methodCache: &JNICacheSearchView.MethodID.requestFocus,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != JNI_FALSE
    }
}

public extension AndroidSearchView {
    
    public func getImeOptions() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getImeOptions",
                                               methodSig: "()I",
                                               methodCache: &JNICacheSearchView.MethodID.getImeOptions,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int(__return)
    }
    
    public func getInputType() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getInputType",
                                               methodSig: "()I",
                                               methodCache: &JNICacheSearchView.MethodID.getInputType,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int(__return)
    }
    
    public func getMaxWidth() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getMaxWidth",
                                               methodSig: "()I",
                                               methodCache: &JNICacheSearchView.MethodID.getMaxWidth,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int(__return)
    }
    
    public func setOnCloseListener(_ block: @escaping () -> (Bool)) {
        
        let onClickListener = AndroidSearchView.OnCloseListener(block: block)
        
        setOnCloseListener(onClickListener)
    }
    
    public func setOnCloseListener(_ listener: AndroidSearchView.OnCloseListener?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnCloseListener",
            methodSig: "(Landroid/support/v7/widget/SearchView$OnCloseListener;)V",
            methodCache: &JNICacheSearchView.MethodID.setOnCloseListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func setOnSearchClickListener(_ listener: AndroidView.OnClickListener) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnSearchClickListener",
            methodSig: "(Landroid/view/View$OnClickListener;)V",
            methodCache: &JNICacheSearchView.MethodID.setOnSearchClickListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func setOnQueryTextListener(_ listener: AndroidSearchView.OnQueryTextListener) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnQueryTextListener",
            methodSig: "(Landroid/support/v7/widget/SearchView$OnQueryTextListener;)V",
            methodCache: &JNICacheSearchView.MethodID.setOnQueryTextListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func setOnSuggestionListener(_ listener: AndroidSearchView.OnSuggestionListener) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: listener, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setOnSuggestionListener",
            methodSig: "(Landroid/support/v7/widget/SearchView$OnSuggestionListener;)V",
            methodCache: &JNICacheSearchView.MethodID.setOnSuggestionListener,
            args: &__args,
            locals: &__locals )
    }
    
    public func getQuery() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getQuery",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &JNICacheSearchView.MethodID.getQuery,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    public func getQueryHint() -> String? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getQueryHint",
            methodSig: "()Ljava/lang/CharSequence;",
            methodCache: &JNICacheSearchView.MethodID.getQueryHint,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? String(javaObject: __return) : nil
    }
    
    public func getSuggestionsAdapter() -> JavaObject? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod(
            object: javaObject,
            methodName: "getSuggestionsAdapter",
            methodSig: "()Landroid/support/v4/widget/CursorAdapter;",
            methodCache: &JNICacheSearchView.MethodID.getSuggestionsAdapter,
            args: &__args,
            locals: &__locals )
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? JavaObject(javaObject: __return) : nil
    }
    
    public func isIconfiedByDefault() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isIconfiedByDefault",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICacheSearchView.MethodID.isIconfiedByDefault,
                                                   args: &__args,
                                                   locals: &__locals)
        
        return __return != JNI_FALSE
    }
    
    public func isIconified() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isIconified",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICacheSearchView.MethodID.isIconified,
                                                   args: &__args,
                                                   locals: &__locals)
        
        return __return != JNI_FALSE
    }
    
    public func isQueryRefinementEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isQueryRefinementEnabled",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICacheSearchView.MethodID.isQueryRefinementEnabled,
                                                   args: &__args,
                                                   locals: &__locals)
        
        return __return != JNI_FALSE
    }
    
    public func isSubmitButtonEnabled() -> Bool {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "isSubmitButtonEnabled",
                                                   methodSig: "()Z",
                                                   methodCache: &JNICacheSearchView.MethodID.isSubmitButtonEnabled,
                                                   args: &__args,
                                                   locals: &__locals)
        return __return != JNI_FALSE
    }
    
    public func onActionViewCollapsed() {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "onActionViewCollapsed",
                                 methodSig: "()V",
                                 methodCache: &JNICacheSearchView.MethodID.onActionViewCollapsed,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func onActionViewExpanded() {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "onActionViewExpanded",
                                 methodSig: "()V",
                                 methodCache: &JNICacheSearchView.MethodID.onActionViewExpanded,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setIconified(_ iconify: Bool) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(iconify ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setIconified",
                                 methodSig: "(Z)V",
                                 methodCache: &JNICacheSearchView.MethodID.setIconified,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setIconifiedByDefault(iconified: Bool) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(iconified ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setIconifiedByDefault",
                                 methodSig: "(Z)V",
                                 methodCache: &JNICacheSearchView.MethodID.setIconifiedByDefault,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setImeOptions(imeOptions: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = jvalue(i: jint(imeOptions))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setImeOptions",
                                 methodSig: "(I)V",
                                 methodCache: &JNICacheSearchView.MethodID.setImeOptions,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setInputType(inputType: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = jvalue(i: jint(inputType))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setInputType",
                                 methodSig: "(I)V",
                                 methodCache: &JNICacheSearchView.MethodID.setInputType,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setMaxWidth(maxpixels: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue](repeating: jvalue(), count: 1)
        __args[0] = jvalue(i: jint(maxpixels))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setMaxWidth",
                                 methodSig: "(I)V",
                                 methodCache: &JNICacheSearchView.MethodID.setMaxWidth,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setQuery(query: String?, submit: Bool) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: query, locals: &__locals)
        __args[1] = jvalue(z: jboolean(submit ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setQuery",
            methodSig: "(Ljava/lang/CharSequence;Z)V",
            methodCache: &JNICacheSearchView.MethodID.setQuery,
            args: &__args,
            locals: &__locals )
    }
    
    public func setQueryHint(_ hint: String?) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: hint, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setQueryHint",
            methodSig: "(Ljava/lang/CharSequence;)V",
            methodCache: &JNICacheSearchView.MethodID.setQueryHint,
            args: &__args,
            locals: &__locals )
    }
    
    public func setSearchableInfo(_ searchable: JavaObject) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: searchable, locals: &__locals)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setSearchableInfo",
                                 methodSig: "(Landroid/app/SearchableInfo;)V",
                                 methodCache: &JNICacheSearchView.MethodID.setSearchableInfo,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setQueryRefinementEnabled(_ enable: Bool) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(enable ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setQueryRefinementEnabled",
                                 methodSig: "(Z)V",
                                 methodCache: &JNICacheSearchView.MethodID.setQueryRefinementEnabled,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setSubmitButtonEnabled(_ enabled: Bool) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue(z: jboolean(enabled ? JNI_TRUE : JNI_FALSE ))
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setSubmitButtonEnabled",
                                 methodSig: "(Z)V",
                                 methodCache: &JNICacheSearchView.MethodID.setSubmitButtonEnabled,
                                 args: &__args,
                                 locals: &__locals)
    }
    
    public func setSuggestionsAdapter(_ adapter: JavaObject) {
        
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: adapter, locals: &__locals)
        
        JNIMethod.CallVoidMethod(object: javaObject,
                                 methodName: "setSuggestionsAdapter",
                                 methodSig: "(Landroid/support/v7/widget/CursorAdapter;)V",
                                 methodCache: &JNICacheSearchView.MethodID.setSuggestionsAdapter,
                                 args: &__args,
                                 locals: &__locals)
    }
}

// MARK: - JNICache

internal extension AndroidSearchView {
    
    /// JNI Cache
    struct JNICacheSearchView {
        
        /// JNI Java class signature
        static let classSignature = SupportV7.Widget.className(["SearchView"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
            static var clearFocus: jmethodID?
            static var getImeOptions: jmethodID?
            static var getMaxWidth: jmethodID?
            static var getInputType: jmethodID?
            static var getQuery: jmethodID?
            static var getQueryHint: jmethodID?
            static var getSuggestionsAdapter: jmethodID?
            static var isIconfiedByDefault: jmethodID?
            static var isIconified: jmethodID?
            static var isQueryRefinementEnabled: jmethodID?
            static var isSubmitButtonEnabled: jmethodID?
            static var onActionViewCollapsed: jmethodID?
            static var onActionViewExpanded: jmethodID?
            static var onWindowFocusChanged: jmethodID?
            static var requestFocus: jmethodID?
            static var setIconified: jmethodID?
            static var setIconifiedByDefault: jmethodID?
            static var setImeOptions: jmethodID?
            static var setInputType: jmethodID?
            static var setMaxWidth: jmethodID?
            static var setOnCloseListener: jmethodID?
            static var setOnQueryTextFocusChangeListener: jmethodID?
            static var setOnQueryTextListener: jmethodID?
            static var setOnSearchClickListener: jmethodID?
            static var setOnSuggestionListener: jmethodID?
            static var setQuery: jmethodID?
            static var setQueryHint: jmethodID?
            static var setQueryRefinementEnabled: jmethodID?
            static var setSearchableInfo: jmethodID?
            static var setSubmitButtonEnabled: jmethodID?
            static var setSuggestionsAdapter: jmethodID?
        }
    }
}
