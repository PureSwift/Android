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
            methodCache: &JNICache.MethodID.length,
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
            methodCache: &JNICache.MethodID.getText,
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
            methodCache: &JNICache.MethodID.setText,
            args: &__args,
            locals: &__locals )
    }
    
    public var text: String {
        
        get { return getText() ?? "" }
        
        set { setText(newValue) }
    }
}

// MARK: - Private

fileprivate extension Android.Widget.TextView {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/widget/TextView"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var setText: jmethodID?
            static var getText: jmethodID?
            static var length: jmethodID?
        }
    }
}
