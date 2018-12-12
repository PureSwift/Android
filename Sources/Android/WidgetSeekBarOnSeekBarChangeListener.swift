//
//  WidgetSeekBarOnSeekBarChangeListener.swift
//  Android
//
//  Created by Marco Estrella on 12/12/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidSeekBar {
    
    public typealias OnSeekBarChangeListener = AndroidOnSeekBarChangeListener
}

/* https://developer.android.com/reference/android/widget/SeekBar.OnSeekBarChangeListener
 *
 * A callback that notifies clients when the progress level has been changed.
 * This includes changes that were initiated by the user through a touch gesture or arrow key/trackball as well as changes that were initiated programmatically.
 */
open class AndroidOnSeekBarChangeListener: JavaObject {
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        self.bindNewJavaObject()
    }
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    // Initialize a new Java instance and bind to this Swift object.
    public func bindNewJavaObject() {
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var locals = [jobject]()
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: JNICache.className,
                                                          classObject: JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &JNICache.MethodID.newMethod,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    /// // Notification that the progress level has changed.
    open func onProgressChanged(seekBar: AndroidSeekBar?, progress: Int, fromUser: Bool) {
        
    }
    
    /// Notification that the user has started a touch gesture.
    open func onStartTrackingTouch(seekBar: AndroidSeekBar?) {
        
    }
    
    /// Notification that the user has finished a touch gesture.
    open func onStopTrackingTouch(seekBar: AndroidSeekBar?) {
        
    }
}

extension AndroidOnSeekBarChangeListener: JNIListener { }

// MARK: - Private

internal extension AndroidOnSeekBarChangeListener {
    
    /// JNI Cache
    internal struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["SeekBarOnSeekBarChangeListener"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            let onProgressChangedThunk: SeekBarOnSeekBarChangeListener_onProgressChanged_type = SeekBarOnSeekBarChangeListener_onProgressChanged
            natives.append( JNINativeMethod(name: strdup("__onProgressChanged"),
                                            signature: strdup("(JL\(AndroidSeekBar.JNICacheSeekBar.className);IZ)V"),
                                            fnPtr: unsafeBitCast( onProgressChangedThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let onStartTrackingTouchThunk: SeekBarOnSeekBarChangeListener_onStartTrackingTouch_type = SeekBarOnSeekBarChangeListener_onStartTrackingTouch
            natives.append( JNINativeMethod(name: strdup("__onStartTrackingTouch"),
                                            signature: strdup("(JL\(AndroidSeekBar.JNICacheSeekBar.className);)V"),
                                            fnPtr: unsafeBitCast( onStartTrackingTouchThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let onStopTrackingTouchThunk: SeekBarOnSeekBarChangeListener_onStopTrackingTouch_type = SeekBarOnSeekBarChangeListener_onStopTrackingTouch
            natives.append( JNINativeMethod(name: strdup("__onStopTrackingTouch"),
                                            signature: strdup("(JL\(AndroidSeekBar.JNICacheSeekBar.className);)V"),
                                            fnPtr: unsafeBitCast( onStopTrackingTouchThunk, to: UnsafeMutableRawPointer.self ) ))
            
            let finalizeThunk: SeekBarOnSeekBarChangeListener_finalize_type = SeekBarOnSeekBarChangeListener_finalize
            natives.append( JNINativeMethod( name: strdup("__finalize"),
                                             signature: strdup("(J)V"),
                                             fnPtr: unsafeBitCast( finalizeThunk, to: UnsafeMutableRawPointer.self ) ) )
            
            let clazz = JNI.FindClass( className )
            
            let nativesCount = jint(natives.count)
            withUnsafePointer(to: &natives[0]) { nativesPtr in
                if JNI.api.RegisterNatives( JNI.env, clazz, nativesPtr, nativesCount ) != jint(JNI_OK) {
                    JNI.report( "Unable to register java natives" )
                }
            }
            
            defer { JNI.DeleteLocalRef( clazz ) }
            
            return JNI.api.NewGlobalRef( JNI.env, clazz )!
        }()
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var newMethod: jmethodID?
        }
    }
}

private typealias SeekBarOnSeekBarChangeListener_onProgressChanged_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?, _: jint, _: jboolean) -> ()

public func SeekBarOnSeekBarChangeListener_onProgressChanged( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                              _ __this: jobject?,
                                                              _ __swiftObject: jlong,
                                                              _ __seekBarObject: jobject?,
                                                              _ __progress: jint,
                                                              _ __fromUser: jboolean) -> () {
    let seekBar: AndroidSeekBar? = __seekBarObject != nil ? AndroidSeekBar(javaObject: __seekBarObject) : nil
    let progress = Int(__progress)
    let fromUser = __fromUser != JNI_FALSE
    
    AndroidOnSeekBarChangeListener
        .swiftObject(from: __swiftObject)?
        .onProgressChanged(seekBar: seekBar, progress: progress, fromUser: fromUser)
}

private typealias SeekBarOnSeekBarChangeListener_onStartTrackingTouch_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> ()
public func SeekBarOnSeekBarChangeListener_onStartTrackingTouch( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ __seekBar: jobject?) -> () {
    let seekBar: AndroidSeekBar? = __seekBar != nil ? AndroidSeekBar(javaObject: __seekBar) : nil
    
    AndroidOnSeekBarChangeListener
        .swiftObject(from: __swiftObject)?
        .onStartTrackingTouch(seekBar: seekBar)
}

private typealias SeekBarOnSeekBarChangeListener_onStopTrackingTouch_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> ()
public func SeekBarOnSeekBarChangeListener_onStopTrackingTouch( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                _ __this: jobject?,
                                                                _ __swiftObject: jlong,
                                                                _ __seekBar: jobject?) -> () {
    let seekBar: AndroidSeekBar? = __seekBar != nil ? AndroidSeekBar(javaObject: __seekBar) : nil
    
    AndroidOnSeekBarChangeListener
        .swiftObject(from: __swiftObject)?
        .onStopTrackingTouch(seekBar: seekBar)
}

private typealias SeekBarOnSeekBarChangeListener_finalize_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong) -> ()
public func SeekBarOnSeekBarChangeListener_finalize( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                     _ __this: jobject?,
                                                     _ __swiftObject: jlong) -> () {
    
    AndroidOnSeekBarChangeListener.release(swiftObject: __swiftObject )
    
    NSLog("native \(#function)")
}
