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
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public var gravity: Int {
        
        get { return getGravity() ?? 0 }
        
        set { setGravity(newValue) }
    }
    
    public var text: String {
        
        get { return getText() ?? "" }
        
        set { setText(newValue) }
    }
    
    public var hint: String {
        
        get { return getHint() ?? "" }
        
        set { setHint(newValue) }
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
    
    private func getText() -> String? {
        
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
    
    private func setText(_ text: String) {
        
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
    
    private func getHint() -> String? {
        
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
    private func setHint(_ hint: String) {
        
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
    
    private func getGravity() -> Int? {
        
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
    
    public func setGravity(_ gravity: Int) {
        
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
            static var setSingleLine1: jmethodID?
            static var setSingleLine2: jmethodID?
            static var setEnabled: jmethodID?
            
        }
    }
}
