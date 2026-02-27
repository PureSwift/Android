//
//  AndroidManifestPermission.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

/// Android Manifest Permission
public struct Permission: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}


public extension Permission {
    
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCEPT_HANDOVER`
    /// - Java Constant: `Manifest.permission.ACCEPT_HANDOVER`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCEPT_HANDOVER>
    static var acceptHandover: Permission { Permission(rawValue: "android.permission.ACCEPT_HANDOVER") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_CHECKIN_PROPERTIES`
    /// - Java Constant: `Manifest.permission.ACCESS_CHECKIN_PROPERTIES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_CHECKIN_PROPERTIES>
    static var accessCheckinProperties: Permission { Permission(rawValue: "android.permission.ACCESS_CHECKIN_PROPERTIES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_COARSE_LOCATION`
    /// - Java Constant: `Manifest.permission.ACCESS_COARSE_LOCATION`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_COARSE_LOCATION>
    static var accessCoarseLocation: Permission { Permission(rawValue: "android.permission.ACCESS_COARSE_LOCATION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_FINE_LOCATION`
    /// - Java Constant: `Manifest.permission.ACCESS_FINE_LOCATION`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_FINE_LOCATION>
    static var accessFineLocation: Permission { Permission(rawValue: "android.permission.ACCESS_FINE_LOCATION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_LOCATION_EXTRA_COMMANDS`
    /// - Java Constant: `Manifest.permission.ACCESS_LOCATION_EXTRA_COMMANDS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_LOCATION_EXTRA_COMMANDS>
    static var accessLocationExtraCommands: Permission { Permission(rawValue: "android.permission.ACCESS_LOCATION_EXTRA_COMMANDS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_NETWORK_STATE`
    /// - Java Constant: `Manifest.permission.ACCESS_NETWORK_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_NETWORK_STATE>
    static var accessNetworkState: Permission { Permission(rawValue: "android.permission.ACCESS_NETWORK_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_NOTIFICATION_POLICY`
    /// - Java Constant: `Manifest.permission.ACCESS_NOTIFICATION_POLICY`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_NOTIFICATION_POLICY>
    static var accessNotificationPolicy: Permission { Permission(rawValue: "android.permission.ACCESS_NOTIFICATION_POLICY") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_WIFI_STATE`
    /// - Java Constant: `Manifest.permission.ACCESS_WIFI_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_WIFI_STATE>
    static var accessWifiState: Permission { Permission(rawValue: "android.permission.ACCESS_WIFI_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_BACKGROUND_LOCATION`
    /// - Java Constant: `Manifest.permission.ACCESS_BACKGROUND_LOCATION`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_BACKGROUND_LOCATION>
    @available(Android 29, *)
    static var accessBackgroundLocation: Permission { Permission(rawValue: "android.permission.ACCESS_BACKGROUND_LOCATION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_MEDIA_LOCATION`
    /// - Java Constant: `Manifest.permission.ACCESS_MEDIA_LOCATION`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_MEDIA_LOCATION>
    @available(Android 29, *)
    static var accessMediaLocation: Permission { Permission(rawValue: "android.permission.ACCESS_MEDIA_LOCATION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCOUNT_MANAGER`
    /// - Java Constant: `Manifest.permission.ACCOUNT_MANAGER`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCOUNT_MANAGER>
    static var accountManager: Permission { Permission(rawValue: "android.permission.ACCOUNT_MANAGER") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACTIVITY_RECOGNITION`
    /// - Java Constant: `Manifest.permission.ACTIVITY_RECOGNITION`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACTIVITY_RECOGNITION>
    @available(Android 29, *)
    static var activityRecognition: Permission { Permission(rawValue: "android.permission.ACTIVITY_RECOGNITION") }
    /// Android manifest permission.
    /// - Constant Value: `com.android.voicemail.permission.ADD_VOICEMAIL`
    /// - Java Constant: `Manifest.permission.ADD_VOICEMAIL`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ADD_VOICEMAIL>
    static var addVoicemail: Permission { Permission(rawValue: "com.android.voicemail.permission.ADD_VOICEMAIL") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ANSWER_PHONE_CALLS`
    /// - Java Constant: `Manifest.permission.ANSWER_PHONE_CALLS`
    /// - Added: Android 26+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ANSWER_PHONE_CALLS>
    @available(Android 26, *)
    static var answerPhoneCalls: Permission { Permission(rawValue: "android.permission.ANSWER_PHONE_CALLS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BATTERY_STATS`
    /// - Java Constant: `Manifest.permission.BATTERY_STATS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BATTERY_STATS>
    static var batteryStats: Permission { Permission(rawValue: "android.permission.BATTERY_STATS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_ACCESSIBILITY_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_ACCESSIBILITY_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_ACCESSIBILITY_SERVICE>
    static var bindAccessibilityService: Permission { Permission(rawValue: "android.permission.BIND_ACCESSIBILITY_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_APPWIDGET`
    /// - Java Constant: `Manifest.permission.BIND_APPWIDGET`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_APPWIDGET>
    static var bindAppwidget: Permission { Permission(rawValue: "android.permission.BIND_APPWIDGET") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_AUTOFILL_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_AUTOFILL_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_AUTOFILL_SERVICE>
    static var bindAutofillService: Permission { Permission(rawValue: "android.permission.BIND_AUTOFILL_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_CARRIER_SERVICES`
    /// - Java Constant: `Manifest.permission.BIND_CARRIER_SERVICES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_CARRIER_SERVICES>
    static var bindCarrierServices: Permission { Permission(rawValue: "android.permission.BIND_CARRIER_SERVICES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_CHOOSER_TARGET_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_CHOOSER_TARGET_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_CHOOSER_TARGET_SERVICE>
    static var bindChooserTargetService: Permission { Permission(rawValue: "android.permission.BIND_CHOOSER_TARGET_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_CONDITION_PROVIDER_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_CONDITION_PROVIDER_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_CONDITION_PROVIDER_SERVICE>
    static var bindConditionProviderService: Permission { Permission(rawValue: "android.permission.BIND_CONDITION_PROVIDER_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_DEVICE_ADMIN`
    /// - Java Constant: `Manifest.permission.BIND_DEVICE_ADMIN`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_DEVICE_ADMIN>
    static var bindDeviceAdmin: Permission { Permission(rawValue: "android.permission.BIND_DEVICE_ADMIN") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_DREAM_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_DREAM_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_DREAM_SERVICE>
    static var bindDreamService: Permission { Permission(rawValue: "android.permission.BIND_DREAM_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_INCALL_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_INCALL_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_INCALL_SERVICE>
    static var bindIncallService: Permission { Permission(rawValue: "android.permission.BIND_INCALL_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_INPUT_METHOD`
    /// - Java Constant: `Manifest.permission.BIND_INPUT_METHOD`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_INPUT_METHOD>
    static var bindInputMethod: Permission { Permission(rawValue: "android.permission.BIND_INPUT_METHOD") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_MIDI_DEVICE_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_MIDI_DEVICE_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_MIDI_DEVICE_SERVICE>
    static var bindMidiDeviceService: Permission { Permission(rawValue: "android.permission.BIND_MIDI_DEVICE_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_NFC_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_NFC_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_NFC_SERVICE>
    static var bindNfcService: Permission { Permission(rawValue: "android.permission.BIND_NFC_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_NOTIFICATION_LISTENER_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_NOTIFICATION_LISTENER_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_NOTIFICATION_LISTENER_SERVICE>
    static var bindNotificationListenerService: Permission { Permission(rawValue: "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_PRINT_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_PRINT_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_PRINT_SERVICE>
    static var bindPrintService: Permission { Permission(rawValue: "android.permission.BIND_PRINT_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_QUICK_SETTINGS_TILE`
    /// - Java Constant: `Manifest.permission.BIND_QUICK_SETTINGS_TILE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_QUICK_SETTINGS_TILE>
    static var bindQuickSettingsTile: Permission { Permission(rawValue: "android.permission.BIND_QUICK_SETTINGS_TILE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_REMOTEVIEWS`
    /// - Java Constant: `Manifest.permission.BIND_REMOTEVIEWS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_REMOTEVIEWS>
    static var bindRemoteviews: Permission { Permission(rawValue: "android.permission.BIND_REMOTEVIEWS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_SCREENING_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_SCREENING_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_SCREENING_SERVICE>
    static var bindScreeningService: Permission { Permission(rawValue: "android.permission.BIND_SCREENING_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_TELECOM_CONNECTION_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_TELECOM_CONNECTION_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_TELECOM_CONNECTION_SERVICE>
    static var bindTelecomConnectionService: Permission { Permission(rawValue: "android.permission.BIND_TELECOM_CONNECTION_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_TEXT_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_TEXT_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_TEXT_SERVICE>
    static var bindTextService: Permission { Permission(rawValue: "android.permission.BIND_TEXT_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_TV_INPUT`
    /// - Java Constant: `Manifest.permission.BIND_TV_INPUT`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_TV_INPUT>
    static var bindTvInput: Permission { Permission(rawValue: "android.permission.BIND_TV_INPUT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_VISUAL_VOICEMAIL_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_VISUAL_VOICEMAIL_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_VISUAL_VOICEMAIL_SERVICE>
    static var bindVisualVoicemailService: Permission { Permission(rawValue: "android.permission.BIND_VISUAL_VOICEMAIL_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_VOICE_INTERACTION`
    /// - Java Constant: `Manifest.permission.BIND_VOICE_INTERACTION`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_VOICE_INTERACTION>
    static var bindVoiceInteraction: Permission { Permission(rawValue: "android.permission.BIND_VOICE_INTERACTION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_VPN_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_VPN_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_VPN_SERVICE>
    static var bindVpnService: Permission { Permission(rawValue: "android.permission.BIND_VPN_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_VR_LISTENER_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_VR_LISTENER_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_VR_LISTENER_SERVICE>
    static var bindVrListenerService: Permission { Permission(rawValue: "android.permission.BIND_VR_LISTENER_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_WALLPAPER`
    /// - Java Constant: `Manifest.permission.BIND_WALLPAPER`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_WALLPAPER>
    static var bindWallpaper: Permission { Permission(rawValue: "android.permission.BIND_WALLPAPER") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BLUETOOTH`
    /// - Java Constant: `Manifest.permission.BLUETOOTH`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BLUETOOTH>
    static var bluetooth: Permission { Permission(rawValue: "android.permission.BLUETOOTH") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BLUETOOTH_ADMIN`
    /// - Java Constant: `Manifest.permission.BLUETOOTH_ADMIN`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BLUETOOTH_ADMIN>
    static var bluetoothAdmin: Permission { Permission(rawValue: "android.permission.BLUETOOTH_ADMIN") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BLUETOOTH_PRIVILEGED`
    /// - Java Constant: `Manifest.permission.BLUETOOTH_PRIVILEGED`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BLUETOOTH_PRIVILEGED>
    static var bluetoothPrivileged: Permission { Permission(rawValue: "android.permission.BLUETOOTH_PRIVILEGED") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BLUETOOTH_ADVERTISE`
    /// - Java Constant: `Manifest.permission.BLUETOOTH_ADVERTISE`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BLUETOOTH_ADVERTISE>
    @available(Android 31, *)
    static var bluetoothAdvertise: Permission { Permission(rawValue: "android.permission.BLUETOOTH_ADVERTISE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BLUETOOTH_CONNECT`
    /// - Java Constant: `Manifest.permission.BLUETOOTH_CONNECT`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BLUETOOTH_CONNECT>
    @available(Android 31, *)
    static var bluetoothConnect: Permission { Permission(rawValue: "android.permission.BLUETOOTH_CONNECT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BLUETOOTH_SCAN`
    /// - Java Constant: `Manifest.permission.BLUETOOTH_SCAN`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BLUETOOTH_SCAN>
    @available(Android 31, *)
    static var bluetoothScan: Permission { Permission(rawValue: "android.permission.BLUETOOTH_SCAN") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BODY_SENSORS`
    /// - Java Constant: `Manifest.permission.BODY_SENSORS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BODY_SENSORS>
    static var bodySensors: Permission { Permission(rawValue: "android.permission.BODY_SENSORS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BODY_SENSORS_BACKGROUND`
    /// - Java Constant: `Manifest.permission.BODY_SENSORS_BACKGROUND`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BODY_SENSORS_BACKGROUND>
    @available(Android 33, *)
    static var bodySensorsBackground: Permission { Permission(rawValue: "android.permission.BODY_SENSORS_BACKGROUND") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BROADCAST_PACKAGE_REMOVED`
    /// - Java Constant: `Manifest.permission.BROADCAST_PACKAGE_REMOVED`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BROADCAST_PACKAGE_REMOVED>
    static var broadcastPackageRemoved: Permission { Permission(rawValue: "android.permission.BROADCAST_PACKAGE_REMOVED") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BROADCAST_SMS`
    /// - Java Constant: `Manifest.permission.BROADCAST_SMS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BROADCAST_SMS>
    static var broadcastSms: Permission { Permission(rawValue: "android.permission.BROADCAST_SMS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BROADCAST_STICKY`
    /// - Java Constant: `Manifest.permission.BROADCAST_STICKY`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BROADCAST_STICKY>
    static var broadcastSticky: Permission { Permission(rawValue: "android.permission.BROADCAST_STICKY") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BROADCAST_WAP_PUSH`
    /// - Java Constant: `Manifest.permission.BROADCAST_WAP_PUSH`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BROADCAST_WAP_PUSH>
    static var broadcastWapPush: Permission { Permission(rawValue: "android.permission.BROADCAST_WAP_PUSH") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CALL_PHONE`
    /// - Java Constant: `Manifest.permission.CALL_PHONE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CALL_PHONE>
    static var callPhone: Permission { Permission(rawValue: "android.permission.CALL_PHONE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CALL_PRIVILEGED`
    /// - Java Constant: `Manifest.permission.CALL_PRIVILEGED`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CALL_PRIVILEGED>
    static var callPrivileged: Permission { Permission(rawValue: "android.permission.CALL_PRIVILEGED") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CAMERA`
    /// - Java Constant: `Manifest.permission.CAMERA`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CAMERA>
    static var camera: Permission { Permission(rawValue: "android.permission.CAMERA") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CAPTURE_AUDIO_OUTPUT`
    /// - Java Constant: `Manifest.permission.CAPTURE_AUDIO_OUTPUT`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CAPTURE_AUDIO_OUTPUT>
    static var captureAudioOutput: Permission { Permission(rawValue: "android.permission.CAPTURE_AUDIO_OUTPUT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CAPTURE_SECURE_VIDEO_OUTPUT`
    /// - Java Constant: `Manifest.permission.CAPTURE_SECURE_VIDEO_OUTPUT`
    /// - Added: Android 21+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CAPTURE_SECURE_VIDEO_OUTPUT>
    @available(Android 21, *)
    static var captureSecureVideoOutput: Permission { Permission(rawValue: "android.permission.CAPTURE_SECURE_VIDEO_OUTPUT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CAPTURE_VIDEO_OUTPUT`
    /// - Java Constant: `Manifest.permission.CAPTURE_VIDEO_OUTPUT`
    /// - Added: Android 21+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CAPTURE_VIDEO_OUTPUT>
    @available(Android 21, *)
    static var captureVideoOutput: Permission { Permission(rawValue: "android.permission.CAPTURE_VIDEO_OUTPUT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CHANGE_COMPONENT_ENABLED_STATE`
    /// - Java Constant: `Manifest.permission.CHANGE_COMPONENT_ENABLED_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CHANGE_COMPONENT_ENABLED_STATE>
    static var changeComponentEnabledState: Permission { Permission(rawValue: "android.permission.CHANGE_COMPONENT_ENABLED_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CHANGE_CONFIGURATION`
    /// - Java Constant: `Manifest.permission.CHANGE_CONFIGURATION`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CHANGE_CONFIGURATION>
    static var changeConfiguration: Permission { Permission(rawValue: "android.permission.CHANGE_CONFIGURATION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CHANGE_NETWORK_STATE`
    /// - Java Constant: `Manifest.permission.CHANGE_NETWORK_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CHANGE_NETWORK_STATE>
    static var changeNetworkState: Permission { Permission(rawValue: "android.permission.CHANGE_NETWORK_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CHANGE_WIFI_MULTICAST_STATE`
    /// - Java Constant: `Manifest.permission.CHANGE_WIFI_MULTICAST_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CHANGE_WIFI_MULTICAST_STATE>
    static var changeWifiMulticastState: Permission { Permission(rawValue: "android.permission.CHANGE_WIFI_MULTICAST_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CHANGE_WIFI_STATE`
    /// - Java Constant: `Manifest.permission.CHANGE_WIFI_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CHANGE_WIFI_STATE>
    static var changeWifiState: Permission { Permission(rawValue: "android.permission.CHANGE_WIFI_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CLEAR_APP_CACHE`
    /// - Java Constant: `Manifest.permission.CLEAR_APP_CACHE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CLEAR_APP_CACHE>
    static var clearAppCache: Permission { Permission(rawValue: "android.permission.CLEAR_APP_CACHE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CONTROL_LOCATION_UPDATES`
    /// - Java Constant: `Manifest.permission.CONTROL_LOCATION_UPDATES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CONTROL_LOCATION_UPDATES>
    static var controlLocationUpdates: Permission { Permission(rawValue: "android.permission.CONTROL_LOCATION_UPDATES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.DELETE_CACHE_FILES`
    /// - Java Constant: `Manifest.permission.DELETE_CACHE_FILES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#DELETE_CACHE_FILES>
    static var deleteCacheFiles: Permission { Permission(rawValue: "android.permission.DELETE_CACHE_FILES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.DELETE_PACKAGES`
    /// - Java Constant: `Manifest.permission.DELETE_PACKAGES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#DELETE_PACKAGES>
    static var deletePackages: Permission { Permission(rawValue: "android.permission.DELETE_PACKAGES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.DIAGNOSTIC`
    /// - Java Constant: `Manifest.permission.DIAGNOSTIC`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#DIAGNOSTIC>
    static var diagnostic: Permission { Permission(rawValue: "android.permission.DIAGNOSTIC") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.DISABLE_KEYGUARD`
    /// - Java Constant: `Manifest.permission.DISABLE_KEYGUARD`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#DISABLE_KEYGUARD>
    static var disableKeyguard: Permission { Permission(rawValue: "android.permission.DISABLE_KEYGUARD") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.DUMP`
    /// - Java Constant: `Manifest.permission.DUMP`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#DUMP>
    static var dump: Permission { Permission(rawValue: "android.permission.DUMP") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.EXPAND_STATUS_BAR`
    /// - Java Constant: `Manifest.permission.EXPAND_STATUS_BAR`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#EXPAND_STATUS_BAR>
    static var expandStatusBar: Permission { Permission(rawValue: "android.permission.EXPAND_STATUS_BAR") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FACTORY_TEST`
    /// - Java Constant: `Manifest.permission.FACTORY_TEST`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FACTORY_TEST>
    static var factoryTest: Permission { Permission(rawValue: "android.permission.FACTORY_TEST") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE`
    /// - Added: Android 28+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE>
    @available(Android 28, *)
    static var foregroundService: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_CAMERA`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_CAMERA`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_CAMERA>
    @available(Android 34, *)
    static var foregroundServiceCamera: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_CAMERA") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_CONNECTED_DEVICE`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_CONNECTED_DEVICE`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_CONNECTED_DEVICE>
    @available(Android 34, *)
    static var foregroundServiceConnectedDevice: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_CONNECTED_DEVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_DATA_SYNC`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_DATA_SYNC`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_DATA_SYNC>
    @available(Android 34, *)
    static var foregroundServiceDataSync: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_DATA_SYNC") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_HEALTH`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_HEALTH`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_HEALTH>
    @available(Android 34, *)
    static var foregroundServiceHealth: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_HEALTH") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_LOCATION`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_LOCATION`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_LOCATION>
    @available(Android 34, *)
    static var foregroundServiceLocation: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_LOCATION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_MEDIA_PLAYBACK>
    @available(Android 34, *)
    static var foregroundServiceMediaPlayback: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_MEDIA_PROJECTION>
    @available(Android 34, *)
    static var foregroundServiceMediaProjection: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_MICROPHONE`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_MICROPHONE`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_MICROPHONE>
    @available(Android 34, *)
    static var foregroundServiceMicrophone: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_MICROPHONE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_PHONE_CALL`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_PHONE_CALL`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_PHONE_CALL>
    @available(Android 34, *)
    static var foregroundServicePhoneCall: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_PHONE_CALL") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_REMOTE_MESSAGING`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_REMOTE_MESSAGING`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_REMOTE_MESSAGING>
    @available(Android 34, *)
    static var foregroundServiceRemoteMessaging: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_REMOTE_MESSAGING") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_SPECIAL_USE`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_SPECIAL_USE`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_SPECIAL_USE>
    @available(Android 34, *)
    static var foregroundServiceSpecialUse: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_SPECIAL_USE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.FOREGROUND_SERVICE_SYSTEM_EXEMPTED`
    /// - Java Constant: `Manifest.permission.FOREGROUND_SERVICE_SYSTEM_EXEMPTED`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE_SYSTEM_EXEMPTED>
    @available(Android 34, *)
    static var foregroundServiceSystemExempted: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_SYSTEM_EXEMPTED") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.GET_ACCOUNTS`
    /// - Java Constant: `Manifest.permission.GET_ACCOUNTS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#GET_ACCOUNTS>
    static var getAccounts: Permission { Permission(rawValue: "android.permission.GET_ACCOUNTS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.GET_ACCOUNTS_PRIVILEGED`
    /// - Java Constant: `Manifest.permission.GET_ACCOUNTS_PRIVILEGED`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#GET_ACCOUNTS_PRIVILEGED>
    static var getAccountsPrivileged: Permission { Permission(rawValue: "android.permission.GET_ACCOUNTS_PRIVILEGED") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.GET_PACKAGE_SIZE`
    /// - Java Constant: `Manifest.permission.GET_PACKAGE_SIZE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#GET_PACKAGE_SIZE>
    static var getPackageSize: Permission { Permission(rawValue: "android.permission.GET_PACKAGE_SIZE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.GLOBAL_SEARCH`
    /// - Java Constant: `Manifest.permission.GLOBAL_SEARCH`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#GLOBAL_SEARCH>
    static var globalSearch: Permission { Permission(rawValue: "android.permission.GLOBAL_SEARCH") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.INSTALL_LOCATION_PROVIDER`
    /// - Java Constant: `Manifest.permission.INSTALL_LOCATION_PROVIDER`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#INSTALL_LOCATION_PROVIDER>
    static var installLocationProvider: Permission { Permission(rawValue: "android.permission.INSTALL_LOCATION_PROVIDER") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.INSTALL_PACKAGES`
    /// - Java Constant: `Manifest.permission.INSTALL_PACKAGES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#INSTALL_PACKAGES>
    static var installPackages: Permission { Permission(rawValue: "android.permission.INSTALL_PACKAGES") }
    /// Android manifest permission.
    /// - Constant Value: `com.android.launcher.permission.INSTALL_SHORTCUT`
    /// - Java Constant: `Manifest.permission.INSTALL_SHORTCUT`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#INSTALL_SHORTCUT>
    static var installShortcut: Permission { Permission(rawValue: "com.android.launcher.permission.INSTALL_SHORTCUT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.INSTANT_APP_FOREGROUND_SERVICE`
    /// - Java Constant: `Manifest.permission.INSTANT_APP_FOREGROUND_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#INSTANT_APP_FOREGROUND_SERVICE>
    static var instantAppForegroundService: Permission { Permission(rawValue: "android.permission.INSTANT_APP_FOREGROUND_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.INTERNET`
    /// - Java Constant: `Manifest.permission.INTERNET`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#INTERNET>
    static var internet: Permission { Permission(rawValue: "android.permission.INTERNET") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.KILL_BACKGROUND_PROCESSES`
    /// - Java Constant: `Manifest.permission.KILL_BACKGROUND_PROCESSES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#KILL_BACKGROUND_PROCESSES>
    static var killBackgroundProcesses: Permission { Permission(rawValue: "android.permission.KILL_BACKGROUND_PROCESSES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.LOCATION_HARDWARE`
    /// - Java Constant: `Manifest.permission.LOCATION_HARDWARE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#LOCATION_HARDWARE>
    static var locationHardware: Permission { Permission(rawValue: "android.permission.LOCATION_HARDWARE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MANAGE_DOCUMENTS`
    /// - Java Constant: `Manifest.permission.MANAGE_DOCUMENTS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MANAGE_DOCUMENTS>
    static var manageDocuments: Permission { Permission(rawValue: "android.permission.MANAGE_DOCUMENTS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MANAGE_OWN_CALLS`
    /// - Java Constant: `Manifest.permission.MANAGE_OWN_CALLS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MANAGE_OWN_CALLS>
    static var manageOwnCalls: Permission { Permission(rawValue: "android.permission.MANAGE_OWN_CALLS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MANAGE_EXTERNAL_STORAGE`
    /// - Java Constant: `Manifest.permission.MANAGE_EXTERNAL_STORAGE`
    /// - Added: Android 30+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MANAGE_EXTERNAL_STORAGE>
    @available(Android 30, *)
    static var manageExternalStorage: Permission { Permission(rawValue: "android.permission.MANAGE_EXTERNAL_STORAGE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MANAGE_MEDIA`
    /// - Java Constant: `Manifest.permission.MANAGE_MEDIA`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MANAGE_MEDIA>
    @available(Android 31, *)
    static var manageMedia: Permission { Permission(rawValue: "android.permission.MANAGE_MEDIA") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MANAGE_ONGOING_CALLS`
    /// - Java Constant: `Manifest.permission.MANAGE_ONGOING_CALLS`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MANAGE_ONGOING_CALLS>
    @available(Android 31, *)
    static var manageOngoingCalls: Permission { Permission(rawValue: "android.permission.MANAGE_ONGOING_CALLS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MASTER_CLEAR`
    /// - Java Constant: `Manifest.permission.MASTER_CLEAR`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MASTER_CLEAR>
    static var masterClear: Permission { Permission(rawValue: "android.permission.MASTER_CLEAR") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MEDIA_CONTENT_CONTROL`
    /// - Java Constant: `Manifest.permission.MEDIA_CONTENT_CONTROL`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MEDIA_CONTENT_CONTROL>
    static var mediaContentControl: Permission { Permission(rawValue: "android.permission.MEDIA_CONTENT_CONTROL") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MODIFY_AUDIO_SETTINGS`
    /// - Java Constant: `Manifest.permission.MODIFY_AUDIO_SETTINGS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MODIFY_AUDIO_SETTINGS>
    static var modifyAudioSettings: Permission { Permission(rawValue: "android.permission.MODIFY_AUDIO_SETTINGS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MODIFY_PHONE_STATE`
    /// - Java Constant: `Manifest.permission.MODIFY_PHONE_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MODIFY_PHONE_STATE>
    static var modifyPhoneState: Permission { Permission(rawValue: "android.permission.MODIFY_PHONE_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MOUNT_FORMAT_FILESYSTEMS`
    /// - Java Constant: `Manifest.permission.MOUNT_FORMAT_FILESYSTEMS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MOUNT_FORMAT_FILESYSTEMS>
    static var mountFormatFilesystems: Permission { Permission(rawValue: "android.permission.MOUNT_FORMAT_FILESYSTEMS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MOUNT_UNMOUNT_FILESYSTEMS`
    /// - Java Constant: `Manifest.permission.MOUNT_UNMOUNT_FILESYSTEMS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MOUNT_UNMOUNT_FILESYSTEMS>
    static var mountUnmountFilesystems: Permission { Permission(rawValue: "android.permission.MOUNT_UNMOUNT_FILESYSTEMS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.NFC`
    /// - Java Constant: `Manifest.permission.NFC`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#NFC>
    static var nfc: Permission { Permission(rawValue: "android.permission.NFC") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.NFC_TRANSACTION_EVENT`
    /// - Java Constant: `Manifest.permission.NFC_TRANSACTION_EVENT`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#NFC_TRANSACTION_EVENT>
    static var nfcTransactionEvent: Permission { Permission(rawValue: "android.permission.NFC_TRANSACTION_EVENT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.NFC_PREFERRED_PAYMENT_INFO`
    /// - Java Constant: `Manifest.permission.NFC_PREFERRED_PAYMENT_INFO`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#NFC_PREFERRED_PAYMENT_INFO>
    @available(Android 33, *)
    static var nfcPreferredPaymentInfo: Permission { Permission(rawValue: "android.permission.NFC_PREFERRED_PAYMENT_INFO") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.NEARBY_WIFI_DEVICES`
    /// - Java Constant: `Manifest.permission.NEARBY_WIFI_DEVICES`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#NEARBY_WIFI_DEVICES>
    @available(Android 33, *)
    static var nearbyWifiDevices: Permission { Permission(rawValue: "android.permission.NEARBY_WIFI_DEVICES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.PACKAGE_USAGE_STATS`
    /// - Java Constant: `Manifest.permission.PACKAGE_USAGE_STATS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#PACKAGE_USAGE_STATS>
    static var packageUsageStats: Permission { Permission(rawValue: "android.permission.PACKAGE_USAGE_STATS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.POST_NOTIFICATIONS`
    /// - Java Constant: `Manifest.permission.POST_NOTIFICATIONS`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#POST_NOTIFICATIONS>
    @available(Android 33, *)
    static var postNotifications: Permission { Permission(rawValue: "android.permission.POST_NOTIFICATIONS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.PROCESS_OUTGOING_CALLS`
    /// - Java Constant: `Manifest.permission.PROCESS_OUTGOING_CALLS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#PROCESS_OUTGOING_CALLS>
    static var processOutgoingCalls: Permission { Permission(rawValue: "android.permission.PROCESS_OUTGOING_CALLS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_CALENDAR`
    /// - Java Constant: `Manifest.permission.READ_CALENDAR`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_CALENDAR>
    static var readCalendar: Permission { Permission(rawValue: "android.permission.READ_CALENDAR") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_CALL_LOG`
    /// - Java Constant: `Manifest.permission.READ_CALL_LOG`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_CALL_LOG>
    static var readCallLog: Permission { Permission(rawValue: "android.permission.READ_CALL_LOG") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_CONTACTS`
    /// - Java Constant: `Manifest.permission.READ_CONTACTS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_CONTACTS>
    static var readContacts: Permission { Permission(rawValue: "android.permission.READ_CONTACTS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_EXTERNAL_STORAGE`
    /// - Java Constant: `Manifest.permission.READ_EXTERNAL_STORAGE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_EXTERNAL_STORAGE>
    static var readExternalStorage: Permission { Permission(rawValue: "android.permission.READ_EXTERNAL_STORAGE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_MEDIA_AUDIO`
    /// - Java Constant: `Manifest.permission.READ_MEDIA_AUDIO`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_MEDIA_AUDIO>
    @available(Android 33, *)
    static var readMediaAudio: Permission { Permission(rawValue: "android.permission.READ_MEDIA_AUDIO") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_MEDIA_IMAGES`
    /// - Java Constant: `Manifest.permission.READ_MEDIA_IMAGES`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_MEDIA_IMAGES>
    @available(Android 33, *)
    static var readMediaImages: Permission { Permission(rawValue: "android.permission.READ_MEDIA_IMAGES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_MEDIA_VIDEO`
    /// - Java Constant: `Manifest.permission.READ_MEDIA_VIDEO`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_MEDIA_VIDEO>
    @available(Android 33, *)
    static var readMediaVideo: Permission { Permission(rawValue: "android.permission.READ_MEDIA_VIDEO") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_MEDIA_VISUAL_USER_SELECTED`
    /// - Java Constant: `Manifest.permission.READ_MEDIA_VISUAL_USER_SELECTED`
    /// - Added: Android 34+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_MEDIA_VISUAL_USER_SELECTED>
    @available(Android 34, *)
    static var readMediaVisualUserSelected: Permission { Permission(rawValue: "android.permission.READ_MEDIA_VISUAL_USER_SELECTED") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_FRAME_BUFFER`
    /// - Java Constant: `Manifest.permission.READ_FRAME_BUFFER`
    /// - Added: Android 21+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_FRAME_BUFFER>
    @available(Android 21, *)
    static var readFrameBuffer: Permission { Permission(rawValue: "android.permission.READ_FRAME_BUFFER") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_LOGS`
    /// - Java Constant: `Manifest.permission.READ_LOGS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_LOGS>
    static var readLogs: Permission { Permission(rawValue: "android.permission.READ_LOGS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_PHONE_NUMBERS`
    /// - Java Constant: `Manifest.permission.READ_PHONE_NUMBERS`
    /// - Added: Android 26+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_PHONE_NUMBERS>
    @available(Android 26, *)
    static var readPhoneNumbers: Permission { Permission(rawValue: "android.permission.READ_PHONE_NUMBERS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_PHONE_STATE`
    /// - Java Constant: `Manifest.permission.READ_PHONE_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_PHONE_STATE>
    static var readPhoneState: Permission { Permission(rawValue: "android.permission.READ_PHONE_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_SMS`
    /// - Java Constant: `Manifest.permission.READ_SMS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_SMS>
    static var readSms: Permission { Permission(rawValue: "android.permission.READ_SMS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_SYNC_SETTINGS`
    /// - Java Constant: `Manifest.permission.READ_SYNC_SETTINGS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_SYNC_SETTINGS>
    static var readSyncSettings: Permission { Permission(rawValue: "android.permission.READ_SYNC_SETTINGS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_SYNC_STATS`
    /// - Java Constant: `Manifest.permission.READ_SYNC_STATS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_SYNC_STATS>
    static var readSyncStats: Permission { Permission(rawValue: "android.permission.READ_SYNC_STATS") }
    /// Android manifest permission.
    /// - Constant Value: `com.android.voicemail.permission.READ_VOICEMAIL`
    /// - Java Constant: `Manifest.permission.READ_VOICEMAIL`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_VOICEMAIL>
    static var readVoicemail: Permission { Permission(rawValue: "com.android.voicemail.permission.READ_VOICEMAIL") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REBOOT`
    /// - Java Constant: `Manifest.permission.REBOOT`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REBOOT>
    static var reboot: Permission { Permission(rawValue: "android.permission.REBOOT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.RECEIVE_BOOT_COMPLETED`
    /// - Java Constant: `Manifest.permission.RECEIVE_BOOT_COMPLETED`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#RECEIVE_BOOT_COMPLETED>
    static var receiveBootCompleted: Permission { Permission(rawValue: "android.permission.RECEIVE_BOOT_COMPLETED") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.RECEIVE_MMS`
    /// - Java Constant: `Manifest.permission.RECEIVE_MMS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#RECEIVE_MMS>
    static var receiveMms: Permission { Permission(rawValue: "android.permission.RECEIVE_MMS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.RECEIVE_SMS`
    /// - Java Constant: `Manifest.permission.RECEIVE_SMS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#RECEIVE_SMS>
    static var receiveSms: Permission { Permission(rawValue: "android.permission.RECEIVE_SMS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.RECEIVE_WAP_PUSH`
    /// - Java Constant: `Manifest.permission.RECEIVE_WAP_PUSH`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#RECEIVE_WAP_PUSH>
    static var receiveWapPush: Permission { Permission(rawValue: "android.permission.RECEIVE_WAP_PUSH") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.RECORD_AUDIO`
    /// - Java Constant: `Manifest.permission.RECORD_AUDIO`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#RECORD_AUDIO>
    static var recordAudio: Permission { Permission(rawValue: "android.permission.RECORD_AUDIO") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REORDER_TASKS`
    /// - Java Constant: `Manifest.permission.REORDER_TASKS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REORDER_TASKS>
    static var reorderTasks: Permission { Permission(rawValue: "android.permission.REORDER_TASKS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND`
    /// - Java Constant: `Manifest.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_COMPANION_RUN_IN_BACKGROUND>
    static var requestCompanionRunInBackground: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND`
    /// - Java Constant: `Manifest.permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_COMPANION_USE_DATA_IN_BACKGROUND>
    static var requestCompanionUseDataInBackground: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_DELETE_PACKAGES`
    /// - Java Constant: `Manifest.permission.REQUEST_DELETE_PACKAGES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_DELETE_PACKAGES>
    static var requestDeletePackages: Permission { Permission(rawValue: "android.permission.REQUEST_DELETE_PACKAGES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`
    /// - Java Constant: `Manifest.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_IGNORE_BATTERY_OPTIMIZATIONS>
    static var requestIgnoreBatteryOptimizations: Permission { Permission(rawValue: "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_INSTALL_PACKAGES`
    /// - Java Constant: `Manifest.permission.REQUEST_INSTALL_PACKAGES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_INSTALL_PACKAGES>
    static var requestInstallPackages: Permission { Permission(rawValue: "android.permission.REQUEST_INSTALL_PACKAGES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_PASSWORD_COMPLEXITY`
    /// - Java Constant: `Manifest.permission.REQUEST_PASSWORD_COMPLEXITY`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_PASSWORD_COMPLEXITY>
    @available(Android 31, *)
    static var requestPasswordComplexity: Permission { Permission(rawValue: "android.permission.REQUEST_PASSWORD_COMPLEXITY") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SCHEDULE_EXACT_ALARM`
    /// - Java Constant: `Manifest.permission.SCHEDULE_EXACT_ALARM`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SCHEDULE_EXACT_ALARM>
    @available(Android 31, *)
    static var scheduleExactAlarm: Permission { Permission(rawValue: "android.permission.SCHEDULE_EXACT_ALARM") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SEND_RESPOND_VIA_MESSAGE`
    /// - Java Constant: `Manifest.permission.SEND_RESPOND_VIA_MESSAGE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SEND_RESPOND_VIA_MESSAGE>
    static var sendRespondViaMessage: Permission { Permission(rawValue: "android.permission.SEND_RESPOND_VIA_MESSAGE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SEND_SMS`
    /// - Java Constant: `Manifest.permission.SEND_SMS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SEND_SMS>
    static var sendSms: Permission { Permission(rawValue: "android.permission.SEND_SMS") }
    /// Android manifest permission.
    /// - Constant Value: `com.android.alarm.permission.SET_ALARM`
    /// - Java Constant: `Manifest.permission.SET_ALARM`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_ALARM>
    static var setAlarm: Permission { Permission(rawValue: "com.android.alarm.permission.SET_ALARM") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_ALWAYS_FINISH`
    /// - Java Constant: `Manifest.permission.SET_ALWAYS_FINISH`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_ALWAYS_FINISH>
    static var setAlwaysFinish: Permission { Permission(rawValue: "android.permission.SET_ALWAYS_FINISH") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_ANIMATION_SCALE`
    /// - Java Constant: `Manifest.permission.SET_ANIMATION_SCALE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_ANIMATION_SCALE>
    static var setAnimationScale: Permission { Permission(rawValue: "android.permission.SET_ANIMATION_SCALE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_DEBUG_APP`
    /// - Java Constant: `Manifest.permission.SET_DEBUG_APP`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_DEBUG_APP>
    static var setDebugApp: Permission { Permission(rawValue: "android.permission.SET_DEBUG_APP") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_PROCESS_LIMIT`
    /// - Java Constant: `Manifest.permission.SET_PROCESS_LIMIT`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_PROCESS_LIMIT>
    static var setProcessLimit: Permission { Permission(rawValue: "android.permission.SET_PROCESS_LIMIT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_TIME`
    /// - Java Constant: `Manifest.permission.SET_TIME`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_TIME>
    static var setTime: Permission { Permission(rawValue: "android.permission.SET_TIME") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_TIME_ZONE`
    /// - Java Constant: `Manifest.permission.SET_TIME_ZONE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_TIME_ZONE>
    static var setTimeZone: Permission { Permission(rawValue: "android.permission.SET_TIME_ZONE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_WALLPAPER`
    /// - Java Constant: `Manifest.permission.SET_WALLPAPER`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_WALLPAPER>
    static var setWallpaper: Permission { Permission(rawValue: "android.permission.SET_WALLPAPER") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_WALLPAPER_HINTS`
    /// - Java Constant: `Manifest.permission.SET_WALLPAPER_HINTS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_WALLPAPER_HINTS>
    static var setWallpaperHints: Permission { Permission(rawValue: "android.permission.SET_WALLPAPER_HINTS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SIGNAL_PERSISTENT_PROCESSES`
    /// - Java Constant: `Manifest.permission.SIGNAL_PERSISTENT_PROCESSES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SIGNAL_PERSISTENT_PROCESSES>
    static var signalPersistentProcesses: Permission { Permission(rawValue: "android.permission.SIGNAL_PERSISTENT_PROCESSES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.STATUS_BAR`
    /// - Java Constant: `Manifest.permission.STATUS_BAR`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#STATUS_BAR>
    static var statusBar: Permission { Permission(rawValue: "android.permission.STATUS_BAR") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SYSTEM_ALERT_WINDOW`
    /// - Java Constant: `Manifest.permission.SYSTEM_ALERT_WINDOW`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SYSTEM_ALERT_WINDOW>
    static var systemAlertWindow: Permission { Permission(rawValue: "android.permission.SYSTEM_ALERT_WINDOW") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.TRANSMIT_IR`
    /// - Java Constant: `Manifest.permission.TRANSMIT_IR`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#TRANSMIT_IR>
    static var transmitIr: Permission { Permission(rawValue: "android.permission.TRANSMIT_IR") }
    /// Android manifest permission.
    /// - Constant Value: `com.android.launcher.permission.UNINSTALL_SHORTCUT`
    /// - Java Constant: `Manifest.permission.UNINSTALL_SHORTCUT`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#UNINSTALL_SHORTCUT>
    static var uninstallShortcut: Permission { Permission(rawValue: "com.android.launcher.permission.UNINSTALL_SHORTCUT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.UPDATE_DEVICE_STATS`
    /// - Java Constant: `Manifest.permission.UPDATE_DEVICE_STATS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#UPDATE_DEVICE_STATS>
    static var updateDeviceStats: Permission { Permission(rawValue: "android.permission.UPDATE_DEVICE_STATS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.USE_BIOMETRIC`
    /// - Java Constant: `Manifest.permission.USE_BIOMETRIC`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#USE_BIOMETRIC>
    static var useBiometric: Permission { Permission(rawValue: "android.permission.USE_BIOMETRIC") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.USE_EXACT_ALARM`
    /// - Java Constant: `Manifest.permission.USE_EXACT_ALARM`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#USE_EXACT_ALARM>
    @available(Android 33, *)
    static var useExactAlarm: Permission { Permission(rawValue: "android.permission.USE_EXACT_ALARM") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.USE_FULL_SCREEN_INTENT`
    /// - Java Constant: `Manifest.permission.USE_FULL_SCREEN_INTENT`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#USE_FULL_SCREEN_INTENT>
    @available(Android 29, *)
    static var useFullScreenIntent: Permission { Permission(rawValue: "android.permission.USE_FULL_SCREEN_INTENT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.USE_SIP`
    /// - Java Constant: `Manifest.permission.USE_SIP`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#USE_SIP>
    static var useSip: Permission { Permission(rawValue: "android.permission.USE_SIP") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.UWB_RANGING`
    /// - Java Constant: `Manifest.permission.UWB_RANGING`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#UWB_RANGING>
    @available(Android 31, *)
    static var uwbRanging: Permission { Permission(rawValue: "android.permission.UWB_RANGING") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.VIBRATE`
    /// - Java Constant: `Manifest.permission.VIBRATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#VIBRATE>
    static var vibrate: Permission { Permission(rawValue: "android.permission.VIBRATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WAKE_LOCK`
    /// - Java Constant: `Manifest.permission.WAKE_LOCK`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WAKE_LOCK>
    static var wakeLock: Permission { Permission(rawValue: "android.permission.WAKE_LOCK") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_APN_SETTINGS`
    /// - Java Constant: `Manifest.permission.WRITE_APN_SETTINGS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_APN_SETTINGS>
    static var writeApnSettings: Permission { Permission(rawValue: "android.permission.WRITE_APN_SETTINGS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_CALENDAR`
    /// - Java Constant: `Manifest.permission.WRITE_CALENDAR`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_CALENDAR>
    static var writeCalendar: Permission { Permission(rawValue: "android.permission.WRITE_CALENDAR") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_CALL_LOG`
    /// - Java Constant: `Manifest.permission.WRITE_CALL_LOG`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_CALL_LOG>
    static var writeCallLog: Permission { Permission(rawValue: "android.permission.WRITE_CALL_LOG") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_CONTACTS`
    /// - Java Constant: `Manifest.permission.WRITE_CONTACTS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_CONTACTS>
    static var writeContacts: Permission { Permission(rawValue: "android.permission.WRITE_CONTACTS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_EXTERNAL_STORAGE`
    /// - Java Constant: `Manifest.permission.WRITE_EXTERNAL_STORAGE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_EXTERNAL_STORAGE>
    static var writeExternalStorage: Permission { Permission(rawValue: "android.permission.WRITE_EXTERNAL_STORAGE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_GSERVICES`
    /// - Java Constant: `Manifest.permission.WRITE_GSERVICES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_GSERVICES>
    static var writeGservices: Permission { Permission(rawValue: "android.permission.WRITE_GSERVICES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_SECURE_SETTINGS`
    /// - Java Constant: `Manifest.permission.WRITE_SECURE_SETTINGS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_SECURE_SETTINGS>
    static var writeSecureSettings: Permission { Permission(rawValue: "android.permission.WRITE_SECURE_SETTINGS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_SETTINGS`
    /// - Java Constant: `Manifest.permission.WRITE_SETTINGS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_SETTINGS>
    static var writeSettings: Permission { Permission(rawValue: "android.permission.WRITE_SETTINGS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.WRITE_SYNC_SETTINGS`
    /// - Java Constant: `Manifest.permission.WRITE_SYNC_SETTINGS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_SYNC_SETTINGS>
    static var writeSyncSettings: Permission { Permission(rawValue: "android.permission.WRITE_SYNC_SETTINGS") }
    /// Android manifest permission.
    /// - Constant Value: `com.android.voicemail.permission.WRITE_VOICEMAIL`
    /// - Java Constant: `Manifest.permission.WRITE_VOICEMAIL`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#WRITE_VOICEMAIL>
    static var writeVoicemail: Permission { Permission(rawValue: "com.android.voicemail.permission.WRITE_VOICEMAIL") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.ACCESS_BLOBS_ACROSS_USERS`
    /// - Java Constant: `Manifest.permission.ACCESS_BLOBS_ACROSS_USERS`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#ACCESS_BLOBS_ACROSS_USERS>
    @available(Android 31, *)
    static var accessBlobsAcrossUsers: Permission { Permission(rawValue: "android.permission.ACCESS_BLOBS_ACROSS_USERS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_CALL_REDIRECTION_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_CALL_REDIRECTION_SERVICE`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_CALL_REDIRECTION_SERVICE>
    @available(Android 29, *)
    static var bindCallRedirectionService: Permission { Permission(rawValue: "android.permission.BIND_CALL_REDIRECTION_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_CARRIER_MESSAGING_CLIENT_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_CARRIER_MESSAGING_CLIENT_SERVICE`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_CARRIER_MESSAGING_CLIENT_SERVICE>
    @available(Android 29, *)
    static var bindCarrierMessagingClientService: Permission { Permission(rawValue: "android.permission.BIND_CARRIER_MESSAGING_CLIENT_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_CARRIER_MESSAGING_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_CARRIER_MESSAGING_SERVICE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_CARRIER_MESSAGING_SERVICE>
    static var bindCarrierMessagingService: Permission { Permission(rawValue: "android.permission.BIND_CARRIER_MESSAGING_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_COMPANION_DEVICE_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_COMPANION_DEVICE_SERVICE`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_COMPANION_DEVICE_SERVICE>
    @available(Android 31, *)
    static var bindCompanionDeviceService: Permission { Permission(rawValue: "android.permission.BIND_COMPANION_DEVICE_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_CONTROLS`
    /// - Java Constant: `Manifest.permission.BIND_CONTROLS`
    /// - Added: Android 30+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_CONTROLS>
    @available(Android 30, *)
    static var bindControls: Permission { Permission(rawValue: "android.permission.BIND_CONTROLS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_QUICK_ACCESS_WALLET_SERVICE`
    /// - Java Constant: `Manifest.permission.BIND_QUICK_ACCESS_WALLET_SERVICE`
    /// - Added: Android 30+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_QUICK_ACCESS_WALLET_SERVICE>
    @available(Android 30, *)
    static var bindQuickAccessWalletService: Permission { Permission(rawValue: "android.permission.BIND_QUICK_ACCESS_WALLET_SERVICE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.BIND_TV_INTERACTIVE_APP`
    /// - Java Constant: `Manifest.permission.BIND_TV_INTERACTIVE_APP`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#BIND_TV_INTERACTIVE_APP>
    @available(Android 33, *)
    static var bindTvInteractiveApp: Permission { Permission(rawValue: "android.permission.BIND_TV_INTERACTIVE_APP") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.CALL_COMPANION_APP`
    /// - Java Constant: `Manifest.permission.CALL_COMPANION_APP`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#CALL_COMPANION_APP>
    @available(Android 29, *)
    static var callCompanionApp: Permission { Permission(rawValue: "android.permission.CALL_COMPANION_APP") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.DELIVER_COMPANION_MESSAGES`
    /// - Java Constant: `Manifest.permission.DELIVER_COMPANION_MESSAGES`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#DELIVER_COMPANION_MESSAGES>
    @available(Android 33, *)
    static var deliverCompanionMessages: Permission { Permission(rawValue: "android.permission.DELIVER_COMPANION_MESSAGES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.GET_TASKS`
    /// - Java Constant: `Manifest.permission.GET_TASKS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#GET_TASKS>
    static var getTasks: Permission { Permission(rawValue: "android.permission.GET_TASKS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.HIDE_OVERLAY_WINDOWS`
    /// - Java Constant: `Manifest.permission.HIDE_OVERLAY_WINDOWS`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#HIDE_OVERLAY_WINDOWS>
    @available(Android 31, *)
    static var hideOverlayWindows: Permission { Permission(rawValue: "android.permission.HIDE_OVERLAY_WINDOWS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.HIGH_SAMPLING_RATE_SENSORS`
    /// - Java Constant: `Manifest.permission.HIGH_SAMPLING_RATE_SENSORS`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#HIGH_SAMPLING_RATE_SENSORS>
    @available(Android 31, *)
    static var highSamplingRateSensors: Permission { Permission(rawValue: "android.permission.HIGH_SAMPLING_RATE_SENSORS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.INTERACT_ACROSS_PROFILES`
    /// - Java Constant: `Manifest.permission.INTERACT_ACROSS_PROFILES`
    /// - Added: Android 30+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#INTERACT_ACROSS_PROFILES>
    @available(Android 30, *)
    static var interactAcrossProfiles: Permission { Permission(rawValue: "android.permission.INTERACT_ACROSS_PROFILES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.LAUNCH_MULTI_PANE_SETTINGS_DEEP_LINK`
    /// - Java Constant: `Manifest.permission.LAUNCH_MULTI_PANE_SETTINGS_DEEP_LINK`
    /// - Added: Android 32+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#LAUNCH_MULTI_PANE_SETTINGS_DEEP_LINK>
    @available(Android 32, *)
    static var launchMultiPaneSettingsDeepLink: Permission { Permission(rawValue: "android.permission.LAUNCH_MULTI_PANE_SETTINGS_DEEP_LINK") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.LOADER_USAGE_STATS`
    /// - Java Constant: `Manifest.permission.LOADER_USAGE_STATS`
    /// - Added: Android 30+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#LOADER_USAGE_STATS>
    @available(Android 30, *)
    static var loaderUsageStats: Permission { Permission(rawValue: "android.permission.LOADER_USAGE_STATS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MANAGE_WIFI_INTERFACES`
    /// - Java Constant: `Manifest.permission.MANAGE_WIFI_INTERFACES`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MANAGE_WIFI_INTERFACES>
    @available(Android 33, *)
    static var manageWifiInterfaces: Permission { Permission(rawValue: "android.permission.MANAGE_WIFI_INTERFACES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.MANAGE_WIFI_NETWORK_SELECTION`
    /// - Java Constant: `Manifest.permission.MANAGE_WIFI_NETWORK_SELECTION`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#MANAGE_WIFI_NETWORK_SELECTION>
    @available(Android 33, *)
    static var manageWifiNetworkSelection: Permission { Permission(rawValue: "android.permission.MANAGE_WIFI_NETWORK_SELECTION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.OVERRIDE_WIFI_CONFIG`
    /// - Java Constant: `Manifest.permission.OVERRIDE_WIFI_CONFIG`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#OVERRIDE_WIFI_CONFIG>
    @available(Android 33, *)
    static var overrideWifiConfig: Permission { Permission(rawValue: "android.permission.OVERRIDE_WIFI_CONFIG") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.PERSISTENT_ACTIVITY`
    /// - Java Constant: `Manifest.permission.PERSISTENT_ACTIVITY`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#PERSISTENT_ACTIVITY>
    static var persistentActivity: Permission { Permission(rawValue: "android.permission.PERSISTENT_ACTIVITY") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.QUERY_ALL_PACKAGES`
    /// - Java Constant: `Manifest.permission.QUERY_ALL_PACKAGES`
    /// - Added: Android 30+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#QUERY_ALL_PACKAGES>
    @available(Android 30, *)
    static var queryAllPackages: Permission { Permission(rawValue: "android.permission.QUERY_ALL_PACKAGES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_ASSISTANT_APP_SEARCH_DATA`
    /// - Java Constant: `Manifest.permission.READ_ASSISTANT_APP_SEARCH_DATA`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_ASSISTANT_APP_SEARCH_DATA>
    @available(Android 33, *)
    static var readAssistantAppSearchData: Permission { Permission(rawValue: "android.permission.READ_ASSISTANT_APP_SEARCH_DATA") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_BASIC_PHONE_STATE`
    /// - Java Constant: `Manifest.permission.READ_BASIC_PHONE_STATE`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_BASIC_PHONE_STATE>
    @available(Android 33, *)
    static var readBasicPhoneState: Permission { Permission(rawValue: "android.permission.READ_BASIC_PHONE_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_HOME_APP_SEARCH_DATA`
    /// - Java Constant: `Manifest.permission.READ_HOME_APP_SEARCH_DATA`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_HOME_APP_SEARCH_DATA>
    @available(Android 33, *)
    static var readHomeAppSearchData: Permission { Permission(rawValue: "android.permission.READ_HOME_APP_SEARCH_DATA") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_INPUT_STATE`
    /// - Java Constant: `Manifest.permission.READ_INPUT_STATE`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_INPUT_STATE>
    static var readInputState: Permission { Permission(rawValue: "android.permission.READ_INPUT_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_NEARBY_STREAMING_POLICY`
    /// - Java Constant: `Manifest.permission.READ_NEARBY_STREAMING_POLICY`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_NEARBY_STREAMING_POLICY>
    @available(Android 33, *)
    static var readNearbyStreamingPolicy: Permission { Permission(rawValue: "android.permission.READ_NEARBY_STREAMING_POLICY") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.READ_PRECISE_PHONE_STATE`
    /// - Java Constant: `Manifest.permission.READ_PRECISE_PHONE_STATE`
    /// - Added: Android 30+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#READ_PRECISE_PHONE_STATE>
    @available(Android 30, *)
    static var readPrecisePhoneState: Permission { Permission(rawValue: "android.permission.READ_PRECISE_PHONE_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_COMPANION_PROFILE_APP_STREAMING`
    /// - Java Constant: `Manifest.permission.REQUEST_COMPANION_PROFILE_APP_STREAMING`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_COMPANION_PROFILE_APP_STREAMING>
    @available(Android 33, *)
    static var requestCompanionProfileAppStreaming: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_PROFILE_APP_STREAMING") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION`
    /// - Java Constant: `Manifest.permission.REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION>
    @available(Android 33, *)
    static var requestCompanionProfileAutomotiveProjection: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_COMPANION_PROFILE_COMPUTER`
    /// - Java Constant: `Manifest.permission.REQUEST_COMPANION_PROFILE_COMPUTER`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_COMPANION_PROFILE_COMPUTER>
    @available(Android 33, *)
    static var requestCompanionProfileComputer: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_PROFILE_COMPUTER") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_COMPANION_PROFILE_WATCH`
    /// - Java Constant: `Manifest.permission.REQUEST_COMPANION_PROFILE_WATCH`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_COMPANION_PROFILE_WATCH>
    @available(Android 31, *)
    static var requestCompanionProfileWatch: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_PROFILE_WATCH") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_COMPANION_SELF_MANAGED`
    /// - Java Constant: `Manifest.permission.REQUEST_COMPANION_SELF_MANAGED`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_COMPANION_SELF_MANAGED>
    @available(Android 33, *)
    static var requestCompanionSelfManaged: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_SELF_MANAGED") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_COMPANION_START_FOREGROUND_SERVICES_FROM_BACKGROUND`
    /// - Java Constant: `Manifest.permission.REQUEST_COMPANION_START_FOREGROUND_SERVICES_FROM_BACKGROUND`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_COMPANION_START_FOREGROUND_SERVICES_FROM_BACKGROUND>
    @available(Android 31, *)
    static var requestCompanionStartForegroundServicesFromBackground: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_START_FOREGROUND_SERVICES_FROM_BACKGROUND") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.REQUEST_OBSERVE_COMPANION_DEVICE_PRESENCE`
    /// - Java Constant: `Manifest.permission.REQUEST_OBSERVE_COMPANION_DEVICE_PRESENCE`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#REQUEST_OBSERVE_COMPANION_DEVICE_PRESENCE>
    @available(Android 31, *)
    static var requestObserveCompanionDevicePresence: Permission { Permission(rawValue: "android.permission.REQUEST_OBSERVE_COMPANION_DEVICE_PRESENCE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.RESTART_PACKAGES`
    /// - Java Constant: `Manifest.permission.RESTART_PACKAGES`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#RESTART_PACKAGES>
    static var restartPackages: Permission { Permission(rawValue: "android.permission.RESTART_PACKAGES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SET_PREFERRED_APPLICATIONS`
    /// - Java Constant: `Manifest.permission.SET_PREFERRED_APPLICATIONS`
    /// - Added: Android 1+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SET_PREFERRED_APPLICATIONS>
    static var setPreferredApplications: Permission { Permission(rawValue: "android.permission.SET_PREFERRED_APPLICATIONS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SMS_FINANCIAL_TRANSACTIONS`
    /// - Java Constant: `Manifest.permission.SMS_FINANCIAL_TRANSACTIONS`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SMS_FINANCIAL_TRANSACTIONS>
    @available(Android 29, *)
    static var smsFinancialTransactions: Permission { Permission(rawValue: "android.permission.SMS_FINANCIAL_TRANSACTIONS") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.START_FOREGROUND_SERVICES_FROM_BACKGROUND`
    /// - Java Constant: `Manifest.permission.START_FOREGROUND_SERVICES_FROM_BACKGROUND`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#START_FOREGROUND_SERVICES_FROM_BACKGROUND>
    @available(Android 31, *)
    static var startForegroundServicesFromBackground: Permission { Permission(rawValue: "android.permission.START_FOREGROUND_SERVICES_FROM_BACKGROUND") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.START_VIEW_APP_FEATURES`
    /// - Java Constant: `Manifest.permission.START_VIEW_APP_FEATURES`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#START_VIEW_APP_FEATURES>
    @available(Android 33, *)
    static var startViewAppFeatures: Permission { Permission(rawValue: "android.permission.START_VIEW_APP_FEATURES") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.START_VIEW_PERMISSION_USAGE`
    /// - Java Constant: `Manifest.permission.START_VIEW_PERMISSION_USAGE`
    /// - Added: Android 29+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#START_VIEW_PERMISSION_USAGE>
    @available(Android 29, *)
    static var startViewPermissionUsage: Permission { Permission(rawValue: "android.permission.START_VIEW_PERMISSION_USAGE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.SUBSCRIBE_TO_KEYGUARD_LOCKED_STATE`
    /// - Java Constant: `Manifest.permission.SUBSCRIBE_TO_KEYGUARD_LOCKED_STATE`
    /// - Added: Android 33+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#SUBSCRIBE_TO_KEYGUARD_LOCKED_STATE>
    @available(Android 33, *)
    static var subscribeToKeyguardLockedState: Permission { Permission(rawValue: "android.permission.SUBSCRIBE_TO_KEYGUARD_LOCKED_STATE") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION`
    /// - Java Constant: `Manifest.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#UPDATE_PACKAGES_WITHOUT_USER_ACTION>
    @available(Android 31, *)
    static var updatePackagesWithoutUserAction: Permission { Permission(rawValue: "android.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.USE_FINGERPRINT`
    /// - Java Constant: `Manifest.permission.USE_FINGERPRINT`
    /// - Added: Android 23+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#USE_FINGERPRINT>
    @available(Android 23, *)
    static var useFingerprint: Permission { Permission(rawValue: "android.permission.USE_FINGERPRINT") }
    /// Android manifest permission.
    /// - Constant Value: `android.permission.USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER`
    /// - Java Constant: `Manifest.permission.USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER`
    /// - Added: Android 31+
    /// - SeeAlso: <https://developer.android.com/reference/android/Manifest.permission#USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER>
    @available(Android 31, *)
    static var useIccAuthWithDeviceIdentifier: Permission { Permission(rawValue: "android.permission.USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER") }
}
