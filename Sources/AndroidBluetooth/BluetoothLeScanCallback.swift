//
//  AndroidLEScanCallback.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import Foundation
import java_swift
import java_util
import JNI
import Android

public extension Android.Bluetooth.LE {
    
    public typealias ScanCallback = AndroidBluetoothLowEnergyScanCallback
    
    public typealias ScanCallbackType = AndroidBluetoothLowEnergyScanCallbackType
}

public extension Android.Bluetooth.LE.ScanCallback {
    
    public typealias Error = AndroidBluetoothLowEnergyScanCallbackError
}

/// Proxy listener class for Android Bluetooth LE callbacks.
open class AndroidBluetoothLowEnergyScanCallback: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /// Create a Swift-owned Java Object.
    public convenience init() {
        
        self.init(javaObject: nil)
        bindNewJavaObject()
    }
    
    /// Initialize a new Java instance and bind to this Swift object.
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
                                                          methodCache: &JNICache.MethodID.new_method,
                                                          args: &args,
                                                          locals: &locals )
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
    }
    
    open func onScanResult(callbackType: Android.Bluetooth.LE.ScanCallbackType, result: Android.Bluetooth.LE.ScanResult){}
    
    open func onBatchScanResults(results: [Android.Bluetooth.LE.ScanResult]) {}
    
    open func onScanFailed(error: Android.Bluetooth.LE.ScanCallback.Error) {}
}

public extension AndroidBluetoothLowEnergyScanCallback {
    
    /// Fails to start scan as BLE scan with the same settings is already started by the app.
    public static var SCAN_FAILED_ALREADY_STARTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_FAILED_ALREADY_STARTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCAN_FAILED_ALREADY_STARTED,
                className: JNICache.className,
                classCache: &JNICache.jniClassConstants )
            
            return Int(__value)
        }
    }
    
    /// Fails to start scan as app cannot be registered.
    public static var SCAN_FAILED_APPLICATION_REGISTRATION_FAILED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_FAILED_APPLICATION_REGISTRATION_FAILED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCAN_FAILED_APPLICATION_REGISTRATION_FAILED,
                className: JNICache.className,
                classCache: &JNICache.jniClassConstants )
            
            return Int(__value)
        }
    }
    
    /// Fails to start power optimized scan as this feature is not supported.
    public static var SCAN_FAILED_FEATURE_UNSUPPORTED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_FAILED_FEATURE_UNSUPPORTED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCAN_FAILED_FEATURE_UNSUPPORTED,
                className: JNICache.className,
                classCache: &JNICache.jniClassConstants )
            
            return Int(__value)
        }
    }
    
    /// Fails to start scan due an internal error
    public static var SCAN_FAILED_INTERNAL_ERROR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "SCAN_FAILED_INTERNAL_ERROR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.SCAN_FAILED_INTERNAL_ERROR,
                className: JNICache.className,
                classCache: &JNICache.jniClassConstants )
            
            return Int(__value)
        }
    }
}

extension AndroidBluetoothLowEnergyScanCallback: JNIListener { }

fileprivate extension AndroidBluetoothLowEnergyScanCallback {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Bluetooth.LE.className(["SwiftScanCallback"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        static var jniClassConstants: jclass?
        
        /// JNI Java class
        static let jniClass: jclass = {
            
            var natives = [JNINativeMethod]()
            
            // onScanResult
            let onScanResultSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .int,
                    .object(Android.Bluetooth.LE.ScanResult.JNICache.classSignature)
                ], returnType: .void)
            
            let onScanResult: AndroidBluetoothLowEnergyScanCallback_onScanResult_type = AndroidBluetoothLowEnergyScanCallback_onScanResult
            
            natives.append( JNINativeMethod(name: strdup("__on_scan_result"),
                                            signature: strdup(onScanResultSignature.rawValue),
                                            fnPtr: unsafeBitCast( onScanResult, to: UnsafeMutableRawPointer.self ) ))
            
            // onBatchScanResults
            let onBatchScanResultsSignature = JNIMethodSignature(
                argumentTypes: [
                    .long,
                    .object(JNIClassName(rawValue: "java/util/List")!),
                    ], returnType: .void)
            
            let onBatchScanResults: AndroidBluetoothLowEnergyScanCallback_onBatchScanResults_type = AndroidBluetoothLowEnergyScanCallback_onBatchScanResults
            
            natives.append( JNINativeMethod(name: strdup("__on_batch_scan_results"),
                                            signature: strdup(onBatchScanResultsSignature.rawValue),
                                            fnPtr: unsafeBitCast( onBatchScanResults, to: UnsafeMutableRawPointer.self ) ))
            
            // onScanFailed
            let onScanFailedSignature = JNIMethodSignature(argumentTypes: [.long, .int], returnType: .void)
            
            let onScanFailed: AndroidBluetoothLowEnergyScanCallback_onScanFailed_type = AndroidBluetoothLowEnergyScanCallback_onScanFailed
            
            natives.append( JNINativeMethod(name: strdup("__on_scan_failed"),
                                            signature: strdup(onScanFailedSignature.rawValue),
                                            fnPtr: unsafeBitCast( onScanFailed, to: UnsafeMutableRawPointer.self ) ))
            
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
        
        struct FieldID {
            
            static var SCAN_FAILED_ALREADY_STARTED: jfieldID?
            static var SCAN_FAILED_APPLICATION_REGISTRATION_FAILED: jfieldID?
            static var SCAN_FAILED_FEATURE_UNSUPPORTED: jfieldID?
            static var SCAN_FAILED_INTERNAL_ERROR: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var new_method: jmethodID?
        }
    }
}

// MARK: - Private Methods

private typealias AndroidBluetoothLowEnergyScanCallback_onScanResult_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint, _: jobject?) -> ()

private func AndroidBluetoothLowEnergyScanCallback_onScanResult( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ callbackType: jint,
                                                                 _ result: jobject? ) -> () {
    
    let swiftCallbackType = AndroidBluetoothLowEnergyScanCallbackType(rawValue: Int(callbackType))
    
    let swiftResult = AndroidBluetoothLowEnergyScanResult(javaObject: result)
    
    AndroidBluetoothLowEnergyScanCallback
        .swiftObject(from: __swiftObject)?
        .onScanResult(callbackType: swiftCallbackType, result: swiftResult)
}

private typealias AndroidBluetoothLowEnergyScanCallback_onBatchScanResults_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jobject?) -> ()

private func AndroidBluetoothLowEnergyScanCallback_onBatchScanResults( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                       _ __this: jobject?,
                                                                       _ __swiftObject: jlong,
                                                                       _ __results: jobject?) -> () {
    
    let swiftResultsList = __results != nil ? ListForward(javaObject: __results) : nil
    
    let results = swiftResultsList?.toArray()?.map { AndroidBluetoothLowEnergyScanResult(casting: $0)! } ?? []
    
    AndroidBluetoothLowEnergyScanCallback
        .swiftObject(from: __swiftObject)?
        .onBatchScanResults(results: results)
}

private typealias AndroidBluetoothLowEnergyScanCallback_onScanFailed_type = @convention(c) ( _: UnsafeMutablePointer<JNIEnv?>, _: jobject?, _: jlong, _: jint) -> ()

private func AndroidBluetoothLowEnergyScanCallback_onScanFailed( _ __env: UnsafeMutablePointer<JNIEnv?>,
                                                                 _ __this: jobject?,
                                                                 _ __swiftObject: jlong,
                                                                 _ __errorCode: jint) -> () {
    
    let error = AndroidBluetoothLowEnergyScanCallbackError(rawValue: Int(__errorCode))
    
    AndroidBluetoothLowEnergyScanCallback
        .swiftObject(from: __swiftObject)?
        .onScanFailed(error: error)
}

// MARK: - Supporting Types

public struct AndroidBluetoothLowEnergyScanCallbackType: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        
        self.rawValue = rawValue
    }
}

public struct AndroidBluetoothLowEnergyScanCallbackError: RawRepresentable, Swift.Error {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        
        self.rawValue = rawValue
    }
}
