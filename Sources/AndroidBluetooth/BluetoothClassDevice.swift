//
//  BluetoothClassDevice.swift
//  Android
//
//  Created by Marco Estrella on 6/6/18.
//

import Foundation
import java_swift
import java_util
import Android

public extension Android.Bluetooth.Class {
    
    public typealias Device = AndroidBluetoothClassDevice
}

/**
 * Defines all device class constants.
 *
 * Each BluetoothClass encodes exactly one device class, with major and minor components.
 *
 * The constants in BluetoothClass.Device represent a combination of major and minor device components
 * (the complete device class). The constants in BluetoothClass.Device.Major represent only major device classes.
 *
 * See BluetoothClass.Service for service class constants.
 */
public struct AndroidBluetoothClassDevice: RawRepresentable {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let audioVideoCamcorder = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_CAMCORDER)
    
    public static let audioVideoCarAudio = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_CAR_AUDIO)
    
    public static let audioVideoHandfree = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_HANDSFREE)
    
    public static let audioVideoHeadphones = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_HEADPHONES)
    
    public static let audioVideoHifiAudio = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_HIFI_AUDIO)
    
    public static let audioVideoLoudSpeaker = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_LOUDSPEAKER)
    
    public static let audioVideoMicrophone = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_MICROPHONE)
    
    public static let audioVideoPortableAudio = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_PORTABLE_AUDIO)
    
    public static let audioVideoSetTopBox = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_SET_TOP_BOX)
    
    public static let audioVideoUncategorized = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_UNCATEGORIZED)
    
    public static let audioVideoVcr = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_VCR)
    
    public static let audioVideoVideocamera = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_VIDEO_CAMERA)
    
    public static let audioVideoVideoconferencing = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_VIDEO_CONFERENCING)
    
    public static let audioVideoVideodisplayAndLoudspeaker = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER)
    
    public static let audioVideoVideogamingToy = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_VIDEO_GAMING_TOY)
    
    public static let audioVideoVideomonitor = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_VIDEO_MONITOR)
    
    public static let audioVideoWearableHeadset = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.AUDIO_VIDEO_WEARABLE_HEADSET)
    
    public static let computerDesktop = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.COMPUTER_DESKTOP)
    
    public static let computerHandheldPcPda = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.COMPUTER_HANDHELD_PC_PDA)
    
    public static let computerLaptop = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.COMPUTER_LAPTOP)
    
    public static let computerPalmSizePcPda = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.COMPUTER_PALM_SIZE_PC_PDA)
    
    public static let computerServer = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.COMPUTER_SERVER)
    
    public static let computerUncategorized = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.COMPUTER_UNCATEGORIZED)
    
    public static let computerWearable = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.COMPUTER_WEARABLE)
    
    public static let health = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_BLOOD_PRESSURE)
    
    public static let healthBloodPressure = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_BLOOD_PRESSURE)
    
    public static let healthDataDisplay = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_DATA_DISPLAY)
    
    public static let healthGlucose = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_GLUCOSE)
    
    public static let healthPulseOximeter = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_PULSE_OXIMETER)
    
    public static let healthPulseRate = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_PULSE_RATE)
    
    public static let healthThermometer = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_THERMOMETER)
    
    public static let healthUncategorized = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_UNCATEGORIZED)
    
    public static let healthWeighing = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.HEALTH_WEIGHING)
    
    public static let phoneCellular = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.PHONE_CELLULAR)
    
    public static let phoneCordless = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.PHONE_CORDLESS)
    
    public static let phoneIsdn = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.PHONE_ISDN)
    
    public static let phoneModemOrGateway = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.PHONE_MODEM_OR_GATEWAY)
    
    public static let phoneSmart = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.PHONE_SMART)
    
    public static let phoneUncategorized = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.PHONE_UNCATEGORIZED)
    
    public static let toyController = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.TOY_CONTROLLER)
    
    public static let toyDollActionFigure = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.TOY_DOLL_ACTION_FIGURE)
    
    public static let toyGame = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.TOY_GAME)
    
    public static let toyRobot = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.TOY_ROBOT)
    
    public static let toyUncategorized = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.TOY_UNCATEGORIZED)
    
    public static let toyVehicle = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.TOY_VEHICLE)
    
    public static let wearableGlasses = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.WEARABLE_GLASSES)
    
    public static let wearableHelmet = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.WEARABLE_HELMET)
    
    public static let wearableJacket = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.WEARABLE_JACKET)
    
    public static let wearablePager = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.WEARABLE_PAGER)
    
    public static let wearableUncategorized = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.WEARABLE_UNCATEGORIZED)
    
    public static let wearableWristWatch = Android.Bluetooth.Class.Device(rawValue: AndroidBluetoothClassDeviceConstants.WEARABLE_WRIST_WATCH)
}

// MARK: - Constants

fileprivate class AndroidBluetoothClassDeviceConstants {
    
    fileprivate static var AUDIO_VIDEO_CAMCORDER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_CAMCORDER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_CAMCORDER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_CAR_AUDIO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_CAR_AUDIO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_CAR_AUDIO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_HANDSFREE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_HANDSFREE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_HANDSFREE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_HEADPHONES: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_HEADPHONES",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_HEADPHONES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_HIFI_AUDIO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_HIFI_AUDIO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_HIFI_AUDIO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_LOUDSPEAKER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_LOUDSPEAKER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_LOUDSPEAKER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_MICROPHONE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_MICROPHONE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_MICROPHONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_PORTABLE_AUDIO: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_PORTABLE_AUDIO",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_PORTABLE_AUDIO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_SET_TOP_BOX: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_SET_TOP_BOX",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_SET_TOP_BOX,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_UNCATEGORIZED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_UNCATEGORIZED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_UNCATEGORIZED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_VCR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_VCR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_VCR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_VIDEO_CAMERA: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_VIDEO_CAMERA",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_VIDEO_CAMERA,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_VIDEO_CONFERENCING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_VIDEO_CONFERENCING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_VIDEO_CONFERENCING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_VIDEO_GAMING_TOY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_VIDEO_GAMING_TOY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_VIDEO_GAMING_TOY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_VIDEO_MONITOR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_VIDEO_MONITOR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_VIDEO_MONITOR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var AUDIO_VIDEO_WEARABLE_HEADSET: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "AUDIO_VIDEO_WEARABLE_HEADSET",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.AUDIO_VIDEO_WEARABLE_HEADSET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var COMPUTER_DESKTOP: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "COMPUTER_DESKTOP",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.COMPUTER_DESKTOP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var COMPUTER_HANDHELD_PC_PDA: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "COMPUTER_HANDHELD_PC_PDA",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.COMPUTER_HANDHELD_PC_PDA,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var COMPUTER_LAPTOP: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "COMPUTER_LAPTOP",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.COMPUTER_LAPTOP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var COMPUTER_PALM_SIZE_PC_PDA: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "COMPUTER_PALM_SIZE_PC_PDA",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.COMPUTER_PALM_SIZE_PC_PDA,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var COMPUTER_SERVER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "COMPUTER_SERVER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.COMPUTER_SERVER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var COMPUTER_UNCATEGORIZED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "COMPUTER_UNCATEGORIZED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.COMPUTER_UNCATEGORIZED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var COMPUTER_WEARABLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "COMPUTER_WEARABLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.COMPUTER_WEARABLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var HEALTH_BLOOD_PRESSURE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH_BLOOD_PRESSURE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH_BLOOD_PRESSURE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    fileprivate static var HEALTH_DATA_DISPLAY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH_DATA_DISPLAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH_DATA_DISPLAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var HEALTH_GLUCOSE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH_GLUCOSE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH_GLUCOSE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var HEALTH_PULSE_OXIMETER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH_PULSE_OXIMETER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH_PULSE_OXIMETER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var HEALTH_PULSE_RATE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH_PULSE_RATE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH_PULSE_RATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var HEALTH_THERMOMETER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH_THERMOMETER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH_THERMOMETER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var HEALTH_UNCATEGORIZED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH_UNCATEGORIZED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH_UNCATEGORIZED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var HEALTH_WEIGHING: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HEALTH_WEIGHING",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.HEALTH_WEIGHING,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var PHONE_CELLULAR: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHONE_CELLULAR",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHONE_CELLULAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var PHONE_CORDLESS: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHONE_CORDLESS",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHONE_CORDLESS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var PHONE_ISDN: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHONE_ISDN",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHONE_ISDN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var PHONE_MODEM_OR_GATEWAY: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHONE_MODEM_OR_GATEWAY",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHONE_MODEM_OR_GATEWAY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var PHONE_SMART: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHONE_SMART",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHONE_SMART,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var PHONE_UNCATEGORIZED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "PHONE_UNCATEGORIZED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.PHONE_UNCATEGORIZED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var TOY_CONTROLLER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TOY_CONTROLLER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TOY_CONTROLLER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var TOY_DOLL_ACTION_FIGURE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TOY_DOLL_ACTION_FIGURE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TOY_DOLL_ACTION_FIGURE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var TOY_GAME: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TOY_GAME",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TOY_GAME,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var TOY_ROBOT: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TOY_ROBOT",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TOY_ROBOT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var TOY_UNCATEGORIZED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TOY_UNCATEGORIZED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TOY_UNCATEGORIZED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var TOY_VEHICLE: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "TOY_VEHICLE",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.TOY_VEHICLE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var WEARABLE_GLASSES: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WEARABLE_GLASSES",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WEARABLE_GLASSES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var WEARABLE_HELMET: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WEARABLE_HELMET",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WEARABLE_HELMET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var WEARABLE_JACKET: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WEARABLE_JACKET",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WEARABLE_JACKET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var WEARABLE_PAGER: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WEARABLE_PAGER",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WEARABLE_PAGER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var WEARABLE_UNCATEGORIZED: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WEARABLE_UNCATEGORIZED",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WEARABLE_UNCATEGORIZED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
    
    fileprivate static var WEARABLE_WRIST_WATCH: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "WEARABLE_WRIST_WATCH",
                fieldType: "I",
                fieldCache: &JNICache.FieldID.WEARABLE_WRIST_WATCH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            
            return Int(__value)
        }
    }
}

// MARK: - JNI Cache

fileprivate extension AndroidBluetoothClassDeviceConstants {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Bluetooth.className(["BluetoothClass$Device"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var AUDIO_VIDEO_CAMCORDER: jfieldID?
            static var AUDIO_VIDEO_CAR_AUDIO: jfieldID?
            static var AUDIO_VIDEO_HANDSFREE: jfieldID?
            static var AUDIO_VIDEO_HEADPHONES: jfieldID?
            static var AUDIO_VIDEO_HIFI_AUDIO: jfieldID?
            static var AUDIO_VIDEO_LOUDSPEAKER: jfieldID?
            static var AUDIO_VIDEO_MICROPHONE: jfieldID?
            static var AUDIO_VIDEO_PORTABLE_AUDIO: jfieldID?
            static var AUDIO_VIDEO_SET_TOP_BOX: jfieldID?
            static var AUDIO_VIDEO_UNCATEGORIZED: jfieldID?
            static var AUDIO_VIDEO_VCR: jfieldID?
            static var AUDIO_VIDEO_VIDEO_CAMERA: jfieldID?
            static var AUDIO_VIDEO_VIDEO_CONFERENCING: jfieldID?
            static var AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER: jfieldID?
            static var AUDIO_VIDEO_VIDEO_GAMING_TOY: jfieldID?
            static var AUDIO_VIDEO_VIDEO_MONITOR: jfieldID?
            static var AUDIO_VIDEO_WEARABLE_HEADSET: jfieldID?
            static var COMPUTER_DESKTOP: jfieldID?
            static var COMPUTER_HANDHELD_PC_PDA: jfieldID?
            static var COMPUTER_LAPTOP: jfieldID?
            static var COMPUTER_PALM_SIZE_PC_PDA: jfieldID?
            static var COMPUTER_SERVER: jfieldID?
            static var COMPUTER_UNCATEGORIZED: jfieldID?
            static var COMPUTER_WEARABLE: jfieldID?
            static var HEALTH_BLOOD_PRESSURE: jfieldID?
            static var HEALTH_DATA_DISPLAY: jfieldID?
            static var HEALTH_GLUCOSE: jfieldID?
            static var HEALTH_PULSE_OXIMETER: jfieldID?
            static var HEALTH_PULSE_RATE: jfieldID?
            static var HEALTH_THERMOMETER: jfieldID?
            static var HEALTH_UNCATEGORIZED: jfieldID?
            static var HEALTH_WEIGHING: jfieldID?
            static var PHONE_CELLULAR: jfieldID?
            static var PHONE_CORDLESS: jfieldID?
            static var PHONE_ISDN: jfieldID?
            static var PHONE_MODEM_OR_GATEWAY: jfieldID?
            static var PHONE_SMART: jfieldID?
            static var PHONE_UNCATEGORIZED: jfieldID?
            static var TOY_CONTROLLER: jfieldID?
            static var TOY_DOLL_ACTION_FIGURE: jfieldID?
            static var TOY_GAME: jfieldID?
            static var TOY_ROBOT: jfieldID?
            static var TOY_UNCATEGORIZED: jfieldID?
            static var TOY_VEHICLE: jfieldID?
            static var WEARABLE_GLASSES: jfieldID?
            static var WEARABLE_HELMET: jfieldID?
            static var WEARABLE_JACKET: jfieldID?
            static var WEARABLE_PAGER: jfieldID?
            static var WEARABLE_UNCATEGORIZED: jfieldID?
            static var WEARABLE_WRIST_WATCH: jfieldID?
        }
    }
}
