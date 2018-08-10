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
        }
    }
}
