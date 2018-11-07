//
//  BluetoothLeScanSettingsBuilder.swift
//  Android
//
//  Created by Marco Estrella on 5/24/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth.LE.ScanSettings {
    
    public typealias Builder = AndroidBluetoothLowEnergyScanSettingsBuilder
}

// android.bluetooth.le.ScanSettings.Builder
///
/// Builder for ScanSettings.
public final class AndroidBluetoothLowEnergyScanSettingsBuilder: JavaObject {
    
    private static let javaClassName = "android/bluetooth/le/ScanSettings$Builder"
    
    private static var JNIClass: jclass?
    
    private static var init_MethodID: jmethodID?
    
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
    
    public convenience init() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: AndroidBluetoothLowEnergyScanSettingsBuilder.javaClassName,
            classCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.JNIClass,
            methodSig: "()V",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.init_MethodID,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: METHODS

public extension Android.Bluetooth.LE.ScanSettings.Builder {
    
    private static var build_MethodID: jmethodID?
    /// Build ScanSettings.
    public func build() -> Android.Bluetooth.LE.ScanSettings {
        
        var __locals = [jobject]()
        
        var __args = [jvalue].init(repeating: jvalue(), count: 1)
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "build",
                                                  methodSig: "()Landroid/bluetooth/le/ScanSettings;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.build_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettings( javaObject: __return )
    }
    
    private static var setCallbackType_MethodID: jmethodID?
    /// Set callback type for Bluetooth LE scan.
    public func setCallbackType(callbackType: Android.Bluetooth.LE.ScanSettings.CallbackType) -> Android.Bluetooth.LE.ScanSettings.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(callbackType.rawValue))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setCallbackType",
            methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setCallbackType_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setCallbackType",
                                                  methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setCallbackType_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettingsBuilder(javaObject: __return)
    }
    
    private static var setLegacy_MethodID: jmethodID?
    
    /// Set whether only legacy advertisments should be returned in scan results. Legacy advertisements include
    /// advertisements as specified by the Bluetooth core specification 4.2 and below. This is true by default for compatibility
    /// with older apps.
    public func setLegacy(legacy: Bool) -> Android.Bluetooth.LE.ScanSettings.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(z: jboolean(legacy ?  JNI_TRUE : JNI_FALSE) )
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setLegacy",
            methodSig: "(Z)Landroid/bluetooth/le/ScanSettings$Builder;",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setLegacy_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setLegacy",
                                                  methodSig: "(Z)Landroid/bluetooth/le/ScanSettings$Builder;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setLegacy_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettingsBuilder(javaObject: __return)
    }
    
    private static var setMatchMode_MethodID: jmethodID?
    
    /// Set match mode for Bluetooth LE scan filters hardware match
    public func setMatchMode(matchMode: Android.Bluetooth.LE.ScanSettings.MatchMode) -> Android.Bluetooth.LE.ScanSettings.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(matchMode.rawValue))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setMatchMode",
            methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setMatchMode_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setMatchMode",
                                                  methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setMatchMode_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettingsBuilder(javaObject: __return)
    }
    
    private static var setNumOfMatches_MethodID: jmethodID?
    
    public func setNumOfMatches(numOfMatches: Android.Bluetooth.LE.ScanSettings.MatchNum) -> Android.Bluetooth.LE.ScanSettings.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(numOfMatches.rawValue))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setNumOfMatches",
            methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setNumOfMatches_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setNumOfMatches",
                                                  methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setNumOfMatches_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettingsBuilder(javaObject: __return)
    }
    
    private static var setPhy_MethodID: jmethodID?
    
    public func setPhy(phy: Android.Bluetooth.LE.ScanSettings.Phy) -> Android.Bluetooth.LE.ScanSettings.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(phy.rawValue))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setPhy",
            methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setPhy_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setPhy",
                                                  methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setPhy_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettingsBuilder(javaObject: __return)
    }
    
    private static var setReportDelay_MethodID: jmethodID?
    
    public func setReportDelay(reportDelayMillis: Int64) -> Android.Bluetooth.LE.ScanSettings.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(j: jlong(reportDelayMillis))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setReportDelay",
            methodSig: "(J)Landroid/bluetooth/le/ScanSettings$Builder;",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setReportDelay_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setReportDelay",
                                                  methodSig: "(J)Landroid/bluetooth/le/ScanSettings$Builder;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setReportDelay_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettingsBuilder(javaObject: __return)
    }
    
    private static var setScanMode_MethodID: jmethodID?
    
    // Set scan mode for Bluetooth LE scan.
    public func setScanMode(_ scanMode: Android.Bluetooth.LE.ScanSettings.ScanMode) -> Android.Bluetooth.LE.ScanSettings.Builder {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = jvalue(i: jint(scanMode.rawValue))
        
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "setScanMode",
            methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
            methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setScanMode_MethodID,
            args: &__args,
            locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setScanMode",
                                                  methodSig: "(I)Landroid/bluetooth/le/ScanSettings$Builder;",
                                                  methodCache: &AndroidBluetoothLowEnergyScanSettingsBuilder.setScanMode_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return AndroidBluetoothLowEnergyScanSettingsBuilder(javaObject: __return)
    }
}
