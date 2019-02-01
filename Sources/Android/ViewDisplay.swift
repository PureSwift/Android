//
//  ViewDisplay.swift
//  Android
//
//  Created by Marco Estrella on 8/22/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.View {
    
    public typealias Display = AndroidDisplay
}

/**
 * Provides information about the size and density of a logical display.
 *
 * The display area is described in two different ways.
 *
 * - The application display area specifies the part of the display that may contain an application window,
 * excluding the system decorations. The application display area may be smaller than the real display area because
 * the system subtracts the space needed for decor elements such as the status bar. Use the following methods to query
 * the application display area: getSize(Point), getRectSize(Rect) and getMetrics(DisplayMetrics).
 *
 * - The real display area specifies the part of the display that contains content including the system decorations.
 * Even so, the real display area may be smaller than the physical size of the display if the window manager is emulating a
 * smaller display using (adb shell wm size). Use the following methods to query the real display area: getRealSize(Point), getRealMetrics(DisplayMetrics).
 *
 * A logical display does not necessarily represent a particular physical display device such as the built-in screen or an external monitor.
 * The contents of a logical display may be presented on one or more physical displays according to the devices that are currently attached and
 * whether mirroring has been enabled.
 */
public class AndroidDisplay: JavaObject {
    
    public func getMetrics(outMetrics: AndroidDisplayMetrics){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: outMetrics, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getMetrics",
            methodSig: "(Landroid/util/DisplayMetrics;)V",
            methodCache: &JNICacheDisplay.MethodID.getMetrics,
            args: &__args,
            locals: &__locals )
    }
    
    public func getRealMetrics(outMetrics: AndroidDisplayMetrics){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: outMetrics, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getRealMetrics",
            methodSig: "(Landroid/util/DisplayMetrics;)V",
            methodCache: &JNICacheDisplay.MethodID.getRealMetrics,
            args: &__args,
            locals: &__locals )
    }
    
    public func getSize(outSize: AndroidPoint){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: outSize, locals: &__locals)
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "getSize",
            methodSig: "(L\(AndroidPoint.JNICache.className);)V",
            methodCache: &JNICacheDisplay.MethodID.getSize,
            args: &__args,
            locals: &__locals )
    }
}

// MARK: - Private

internal extension AndroidDisplay {
    
    /// JNI Cache
    struct JNICacheDisplay {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["Display"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var getMetrics: jmethodID?
            static var getRealMetrics: jmethodID?
            static var getSize: jmethodID?
        }
    }
}
