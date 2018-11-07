//
//  AndroidManifestPermission.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import java_swift

public extension Android {
    
    public typealias ManifestPermission = AndroidManifestPermission
}

public struct AndroidManifestPermission {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static let acceptHandover = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCEPT_HANDOVER)
    
    public static let accessCheckinProperties = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCESS_CHECKIN_PROPERTIES)
    
    public static let accessCoarseLocation = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCESS_COARSE_LOCATION)
    
    public static let accessFineLocation = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCESS_FINE_LOCATION)
    
    public static let accessLocationExtraCommands = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCESS_LOCATION_EXTRA_COMMANDS)
    
    public static let accessNetworkState = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCESS_NETWORK_STATE)
    
    public static let accessNotificationPolicy = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCESS_NOTIFICATION_POLICY)
    
    public static let accessWifiState = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCESS_WIFI_STATE)
    
    public static let accountManager = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ACCOUNT_MANAGER)
    
    public static let addVoicemail = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ADD_VOICEMAIL)
    
    public static let answerPhoneCalls = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.ANSWER_PHONE_CALLS)
    
    public static let batteryStats = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BATTERY_STATS)
    
    public static let bindAccessibilityService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_ACCESSIBILITY_SERVICE)
    
    public static let bindAppwidget = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_APPWIDGET)
    
    public static let bindAutofillService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_AUTOFILL_SERVICE)
    
    public static let bindCarrierServices = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_CARRIER_SERVICES)
    
    public static let bindChooserTargetService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_CHOOSER_TARGET_SERVICE)
    
    public static let bindConditionProviderService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_CONDITION_PROVIDER_SERVICE)
    
    public static let bindDeviceAdmin = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_DEVICE_ADMIN)
    
    public static let bindDreamService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_DREAM_SERVICE)
    
    public static let bindIncallService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_INCALL_SERVICE)
    
    public static let bindInputMethod = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_INPUT_METHOD)
    
    public static let bindMidiDeviceService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_MIDI_DEVICE_SERVICE)
    
    public static let bindNfcService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_NFC_SERVICE)
    
    public static let bindNotificationListenerService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_NOTIFICATION_LISTENER_SERVICE)
    
    public static let bindPrintService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_PRINT_SERVICE)
    
    public static let bindQuickSettingsTile = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_QUICK_SETTINGS_TILE)
    
    public static let bindRemoteviews = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_REMOTEVIEWS)
    
    public static let bindScreeningService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_SCREENING_SERVICE)
    
    public static let bindTelecomConnectionService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_TELECOM_CONNECTION_SERVICE)
    
    public static let bindTextService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_TEXT_SERVICE)
    
    public static let bindTvInput = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_TV_INPUT)
    
    public static let bindVisualVoicemailService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_VISUAL_VOICEMAIL_SERVICE)
    
    public static let bindVoiceInteraction = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_VOICE_INTERACTION)
    
    public static let bindVpnService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_VPN_SERVICE)
    
    public static let bindVrListenerService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_VR_LISTENER_SERVICE)
    
    public static let bindWallpaper = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BIND_WALLPAPER)
    
    public static let bluetooth = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BLUETOOTH)
    
    public static let bluetoothAdmin = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BLUETOOTH_ADMIN)
    
    public static let bluetoothPrivileged = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BLUETOOTH_PRIVILEGED)
    
    public static let bodySensors = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BODY_SENSORS)
    
    public static let broadcastPackageRemoved = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BROADCAST_PACKAGE_REMOVED)
    
    public static let broadcastSms = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BROADCAST_SMS)
    
    public static let broadcastSticky = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BROADCAST_STICKY)
    
    public static let broadcastWapPush = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.BROADCAST_WAP_PUSH)
    
    public static let callPhone = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CALL_PHONE)
    
    public static let callPrivileged = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CALL_PRIVILEGED)
    
    public static let camera = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CAMERA)
    
    public static let captureAudioOutput = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CAPTURE_AUDIO_OUTPUT)
    
    public static let captureSecureVideoOutput = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CAPTURE_SECURE_VIDEO_OUTPUT)
    
    public static let captureVideoOutput = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CAPTURE_VIDEO_OUTPUT)
    
    public static let changeComponentEnabledState = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CHANGE_COMPONENT_ENABLED_STATE)
    
    public static let changeConfiguration = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CHANGE_CONFIGURATION)
    
    public static let changeNetworkState = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CHANGE_NETWORK_STATE)
    
    public static let changeWifiMulticastState = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CHANGE_WIFI_MULTICAST_STATE)
    
    public static let changeWifiState = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CHANGE_WIFI_STATE)
    
    public static let clearAppCache = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CLEAR_APP_CACHE)
    
    public static let controlLocationUpdates = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.CONTROL_LOCATION_UPDATES)
    
    public static let deleteCacheFiles = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.DELETE_CACHE_FILES)
    
    public static let deletePackages = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.DELETE_PACKAGES)
    
    public static let diagnostic = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.DIAGNOSTIC)
    
    public static let disableKeyguard = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.DISABLE_KEYGUARD)
    
    public static let dump = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.DUMP)
    
    public static let expandStatusBar = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.EXPAND_STATUS_BAR)
    
    public static let factoryTest = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.FACTORY_TEST)
    
    public static let foregroundService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.FOREGROUND_SERVICE)
    
    public static let getAccounts = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.GET_ACCOUNTS)
    
    public static let getAccountsPrivileged = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.GET_ACCOUNTS_PRIVILEGED)
    
    public static let getPackageSize = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.GET_PACKAGE_SIZE)
    
    public static let globalSearch = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.GLOBAL_SEARCH)
    
    public static let installLocationProvider = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.INSTALL_LOCATION_PROVIDER)
    
    public static let installPackages = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.INSTALL_PACKAGES)
    
    public static let installShortcut = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.INSTALL_SHORTCUT)
    
    public static let instantAppForegroundService = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.INSTANT_APP_FOREGROUND_SERVICE)
    
    public static let internet = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.INTERNET)
    
    public static let killBackgroundProcesses = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.KILL_BACKGROUND_PROCESSES)
    
    public static let locationHardware = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.LOCATION_HARDWARE)
    
    public static let manageDocuments = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.MANAGE_DOCUMENTS)
    
    public static let manageOwnCalls = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.MANAGE_OWN_CALLS)
    
    public static let masterClear = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.MASTER_CLEAR)
    
    public static let mediaContentControl = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.MEDIA_CONTENT_CONTROL)
    
    public static let modifyAudioSettings = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.MODIFY_AUDIO_SETTINGS)
    
    public static let modifyPhoneState = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.MODIFY_PHONE_STATE)
    
    public static let mountFormatFilesystems = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.MOUNT_FORMAT_FILESYSTEMS)
    
    public static let mountUnmountFilesystems = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.MOUNT_UNMOUNT_FILESYSTEMS)
    
    public static let nfc = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.NFC)
    
    public static let nfcTransactionEvent = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.NFC_TRANSACTION_EVENT)
    
    public static let packageUsageStats = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.PACKAGE_USAGE_STATS)
    
    public static let processOutgoingCalls = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.PROCESS_OUTGOING_CALLS)
    
    public static let readCalendar = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_CALENDAR)
    
    public static let readCallLog = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_CALL_LOG)
    
    public static let readContacts = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_CONTACTS)
    
    public static let readExternalStorage = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_EXTERNAL_STORAGE)
    
    public static let readFrameBuffer = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_FRAME_BUFFER)
    
    public static let readLogs = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_LOGS)
    
    public static let readPhoneNumbers = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_PHONE_NUMBERS)
    
    public static let readPhoneState = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_PHONE_STATE)
    
    public static let readSms = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_SMS)
    
    public static let readSyncSettings = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_SYNC_SETTINGS)
    
    public static let readSyncStats = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_SYNC_STATS)
    
    public static let readVoicemail = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.READ_VOICEMAIL)
    
    public static let reboot = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.REBOOT)
    
    public static let receiveBootCompleted = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.RECEIVE_BOOT_COMPLETED)
    
    public static let receiveMms = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.RECEIVE_MMS)
    
    public static let receiveSms = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.RECEIVE_SMS)
    
    public static let receiveWapPush = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.RECEIVE_WAP_PUSH)
    
    public static let recordAudio = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.RECORD_AUDIO)
    
    public static let reorderTasks = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.REORDER_TASKS)
    
    public static let requestCompanionRunInBackground = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.REQUEST_COMPANION_RUN_IN_BACKGROUND)
    
    public static let requestCompanionUseDataInBackground = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND)
    
    public static let requestDeletePackages = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.REQUEST_DELETE_PACKAGES)
    
    public static let requestIgnoreBatteryOptimizations = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
    
    public static let requestInstallPackages = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.REQUEST_INSTALL_PACKAGES)
    
    public static let sendRespondViaMessage = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SEND_RESPOND_VIA_MESSAGE)
    
    public static let sendSms = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SEND_SMS)
    
    public static let setAlarm = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_ALARM)
    
    public static let setAlwaysFinish = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_ALWAYS_FINISH)
    
    public static let setAnimationScale = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_ANIMATION_SCALE)
    
    public static let setDebugApp = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_DEBUG_APP)
    
    public static let setProcessLimit = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_PROCESS_LIMIT)
    
    public static let setTime = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_TIME)
    
    public static let setTimeZone = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_TIME_ZONE)
    
    public static let setWallpaper = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_WALLPAPER)
    
    public static let setWallpaperHints = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SET_WALLPAPER_HINTS)
    
    public static let signalPersistentProcesses = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SIGNAL_PERSISTENT_PROCESSES)
    
    public static let statusBar = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.STATUS_BAR)
    
    public static let systemAlertWindow = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.SYSTEM_ALERT_WINDOW)
    
    public static let transmitIr = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.TRANSMIT_IR)
    
    public static let uninstallShortcut = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.UNINSTALL_SHORTCUT)
    
    public static let updateDeviceStats = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.UPDATE_DEVICE_STATS)
    
    public static let useBiometric = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.USE_BIOMETRIC)
    
    public static let useSip = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.USE_SIP)
    
    public static let vibrate = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.VIBRATE)
    
    public static let wakeLock = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WAKE_LOCK)
    
    public static let writeApnSettings = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_APN_SETTINGS)
    
    public static let writeCalendar = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_CALENDAR)
    
    public static let writeCallLog = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_CALL_LOG)
    
    public static let writeContacts = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_CONTACTS)
    
    public static let writeExternalStorage = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_EXTERNAL_STORAGE)
    
    public static let writeGservices = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_GSERVICES)
    
    public static let writeSecureSettings = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_SECURE_SETTINGS)
    
    public static let writeSettings = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_SETTINGS)
    
    public static let writeSyncSettings = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_SYNC_SETTINGS)
    
    public static let writeVoicemail = Android.ManifestPermission(rawValue:
        AndroidManifestPermissionConstants.WRITE_VOICEMAIL)
}

// MARK: - Initialization

fileprivate class AndroidManifestPermissionConstants: JavaObject {
    
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
    
    public convenience init(){
        
        var __locals = [jobject]()
        var __args = [jvalue](repeating: jvalue(), count: 0)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.init_method1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

fileprivate extension AndroidManifestPermissionConstants {
    
    /**
     * Allows a calling app to continue a call which was started in another app.
     */
    fileprivate static var ACCEPT_HANDOVER: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCEPT_HANDOVER",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCEPT_HANDOVER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows read/write access to the "properties" table in the checkin database, to change values that get uploaded.
     */
    fileprivate static var ACCESS_CHECKIN_PROPERTIES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_CHECKIN_PROPERTIES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_CHECKIN_PROPERTIES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an app to access approximate location.
     */
    fileprivate static var ACCESS_COARSE_LOCATION: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_COARSE_LOCATION",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_COARSE_LOCATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an app to access precise location.
     */
    fileprivate static var ACCESS_FINE_LOCATION: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_FINE_LOCATION",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_FINE_LOCATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to access extra location provider commands.
     */
    fileprivate static var ACCESS_LOCATION_EXTRA_COMMANDS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_LOCATION_EXTRA_COMMANDS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_LOCATION_EXTRA_COMMANDS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to access information about networks.
     */
    fileprivate static var ACCESS_NETWORK_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_NETWORK_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_NETWORK_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Marker permission for applications that wish to access notification policy.
     */
    fileprivate static var ACCESS_NOTIFICATION_POLICY: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_NOTIFICATION_POLICY",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_NOTIFICATION_POLICY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to access information about Wi-Fi networks.
     */
    fileprivate static var ACCESS_WIFI_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCESS_WIFI_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCESS_WIFI_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to call into AccountAuthenticators.
     */
    fileprivate static var ACCOUNT_MANAGER: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACCOUNT_MANAGER",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACCOUNT_MANAGER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to add voicemails into the system.
     */
    fileprivate static var ADD_VOICEMAIL: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ADD_VOICEMAIL",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ADD_VOICEMAIL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows the app to answer an incoming phone call.
     */
    fileprivate static var ANSWER_PHONE_CALLS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ANSWER_PHONE_CALLS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ANSWER_PHONE_CALLS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to collect battery statistics
     */
    fileprivate static var BATTERY_STATS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BATTERY_STATS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BATTERY_STATS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by an AccessibilityService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_ACCESSIBILITY_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_ACCESSIBILITY_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_ACCESSIBILITY_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to tell the AppWidget service which application can access AppWidget's data.
     */
    fileprivate static var BIND_APPWIDGET: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_APPWIDGET",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_APPWIDGET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a AutofillService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_AUTOFILL_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_AUTOFILL_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_AUTOFILL_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * The system process that is allowed to bind to services in carrier apps will have this permission.
     */
    fileprivate static var BIND_CARRIER_SERVICES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_CARRIER_SERVICES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_CARRIER_SERVICES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a ChooserTargetService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_CHOOSER_TARGET_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_CHOOSER_TARGET_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_CHOOSER_TARGET_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a ConditionProviderService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_CONDITION_PROVIDER_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_CONDITION_PROVIDER_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_CONDITION_PROVIDER_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by device administration receiver, to ensure that only the system can interact with it.
     */
    fileprivate static var BIND_DEVICE_ADMIN: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_DEVICE_ADMIN",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_DEVICE_ADMIN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by an DreamService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_DREAM_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_DREAM_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_DREAM_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a InCallService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_INCALL_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_INCALL_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_INCALL_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by an InputMethodService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_INPUT_METHOD: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_INPUT_METHOD",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_INPUT_METHOD,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by an MidiDeviceService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_MIDI_DEVICE_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_MIDI_DEVICE_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_MIDI_DEVICE_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a HostApduService or OffHostApduService to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_NFC_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_NFC_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_NFC_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by an NotificationListenerService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_NOTIFICATION_LISTENER_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_NOTIFICATION_LISTENER_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_NOTIFICATION_LISTENER_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a PrintService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_PRINT_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_PRINT_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_PRINT_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to bind to third party quick settings tiles.
     */
    fileprivate static var BIND_QUICK_SETTINGS_TILE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_QUICK_SETTINGS_TILE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_QUICK_SETTINGS_TILE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a RemoteViewsService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_REMOTEVIEWS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_REMOTEVIEWS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_REMOTEVIEWS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a CallScreeningService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_SCREENING_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_SCREENING_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_SCREENING_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a ConnectionService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_TELECOM_CONNECTION_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_TELECOM_CONNECTION_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_TELECOM_CONNECTION_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a TextService (e.g.
     */
    fileprivate static var BIND_TEXT_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_TEXT_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_TEXT_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a TvInputService to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_TV_INPUT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_TV_INPUT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_TV_INPUT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a link VisualVoicemailService to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_VISUAL_VOICEMAIL_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_VISUAL_VOICEMAIL_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_VISUAL_VOICEMAIL_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a VoiceInteractionService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_VOICE_INTERACTION: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_VOICE_INTERACTION",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_VOICE_INTERACTION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a VpnService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_VPN_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_VPN_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_VPN_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by an VrListenerService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_VR_LISTENER_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_VR_LISTENER_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_VR_LISTENER_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Must be required by a WallpaperService, to ensure that only the system can bind to it.
     */
    fileprivate static var BIND_WALLPAPER: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BIND_WALLPAPER",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BIND_WALLPAPER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to connect to paired bluetooth devices.
     */
    fileprivate static var BLUETOOTH: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BLUETOOTH",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BLUETOOTH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to discover and pair bluetooth devices.
     */
    fileprivate static var BLUETOOTH_ADMIN: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BLUETOOTH_ADMIN",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BLUETOOTH_ADMIN,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to pair bluetooth devices without user interaction, and to allow or disallow phonebook access or message access.
     */
    fileprivate static var BLUETOOTH_PRIVILEGED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BLUETOOTH_PRIVILEGED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BLUETOOTH_PRIVILEGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to access data from sensors that the user uses to measure what is happening inside his/her body, such as heart rate.
     */
    fileprivate static var BODY_SENSORS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BODY_SENSORS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BODY_SENSORS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to broadcast a notification that an application package has been removed.
     */
    fileprivate static var BROADCAST_PACKAGE_REMOVED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BROADCAST_PACKAGE_REMOVED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BROADCAST_PACKAGE_REMOVED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to broadcast an SMS receipt notification.
     */
    fileprivate static var BROADCAST_SMS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BROADCAST_SMS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BROADCAST_SMS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to broadcast sticky intents.
     */
    fileprivate static var BROADCAST_STICKY: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BROADCAST_STICKY",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BROADCAST_STICKY,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to broadcast a WAP PUSH receipt notification.
     */
    fileprivate static var BROADCAST_WAP_PUSH: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BROADCAST_WAP_PUSH",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.BROADCAST_WAP_PUSH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to initiate a phone call without going through the Dialer user interface for the user to confirm the call.
     */
    fileprivate static var CALL_PHONE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CALL_PHONE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CALL_PHONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to call any phone number, including emergency numbers, without going through the Dialer user interface for the user to confirm the call being placed.
     */
    fileprivate static var CALL_PRIVILEGED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CALL_PRIVILEGED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CALL_PRIVILEGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Required to be able to access the camera device.
     */
    fileprivate static var CAMERA: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CAMERA",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CAMERA,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to capture audio output.
     */
    fileprivate static var CAPTURE_AUDIO_OUTPUT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CAPTURE_AUDIO_OUTPUT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CAPTURE_AUDIO_OUTPUT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to capture secure video output.
     */
    fileprivate static var CAPTURE_SECURE_VIDEO_OUTPUT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CAPTURE_SECURE_VIDEO_OUTPUT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CAPTURE_SECURE_VIDEO_OUTPUT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to capture video output.
     */
    fileprivate static var CAPTURE_VIDEO_OUTPUT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CAPTURE_VIDEO_OUTPUT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CAPTURE_VIDEO_OUTPUT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to change whether an application component (other than its own) is enabled or not.
     */
    fileprivate static var CHANGE_COMPONENT_ENABLED_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CHANGE_COMPONENT_ENABLED_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CHANGE_COMPONENT_ENABLED_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to modify the current configuration, such as locale.
     */
    fileprivate static var CHANGE_CONFIGURATION: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CHANGE_CONFIGURATION",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CHANGE_CONFIGURATION,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to change network connectivity state.
     */
    fileprivate static var CHANGE_NETWORK_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CHANGE_NETWORK_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CHANGE_NETWORK_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to enter Wi-Fi Multicast mode.
     */
    fileprivate static var CHANGE_WIFI_MULTICAST_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CHANGE_WIFI_MULTICAST_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CHANGE_WIFI_MULTICAST_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to change Wi-Fi connectivity state.
     */
    fileprivate static var CHANGE_WIFI_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CHANGE_WIFI_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CHANGE_WIFI_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to clear the caches of all installed applications on the device.
     */
    fileprivate static var CLEAR_APP_CACHE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CLEAR_APP_CACHE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CLEAR_APP_CACHE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows enabling/disabling location update notifications from the radio.
     */
    fileprivate static var CONTROL_LOCATION_UPDATES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "CONTROL_LOCATION_UPDATES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.CONTROL_LOCATION_UPDATES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Old permission for deleting an app's cache files, no longer used, but signals for us to quietly ignore calls instead of throwing an exception.
     */
    fileprivate static var DELETE_CACHE_FILES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "DELETE_CACHE_FILES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.DELETE_CACHE_FILES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to delete packages.
     */
    fileprivate static var DELETE_PACKAGES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "DELETE_PACKAGES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.DELETE_PACKAGES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to RW to diagnostic resources.
     */
    fileprivate static var DIAGNOSTIC: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "DIAGNOSTIC",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.DIAGNOSTIC,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to disable the keyguard if it is not secure.
     */
    fileprivate static var DISABLE_KEYGUARD: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "DISABLE_KEYGUARD",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.DISABLE_KEYGUARD,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to retrieve state dump information from system services.
     */
    fileprivate static var DUMP: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "DUMP",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.DUMP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to expand or collapse the status bar.
     */
    fileprivate static var EXPAND_STATUS_BAR: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXPAND_STATUS_BAR",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXPAND_STATUS_BAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Run as a manufacturer test application, running as the root user.
     */
    fileprivate static var FACTORY_TEST: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "FACTORY_TEST",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.FACTORY_TEST,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows a regular application to use Service.startForeground.
     */
    fileprivate static var FOREGROUND_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "FOREGROUND_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.FOREGROUND_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows access to the list of accounts in the Accounts Service.
     */
    fileprivate static var GET_ACCOUNTS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "GET_ACCOUNTS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.GET_ACCOUNTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows access to the list of accounts in the Accounts Service.
     */
    fileprivate static var GET_ACCOUNTS_PRIVILEGED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "GET_ACCOUNTS_PRIVILEGED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.GET_ACCOUNTS_PRIVILEGED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to find out the space used by any package.
     */
    fileprivate static var GET_PACKAGE_SIZE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "GET_PACKAGE_SIZE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.GET_PACKAGE_SIZE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * This permission can be used on content providers to allow the global search system to access their data.
     */
    fileprivate static var GLOBAL_SEARCH: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "GLOBAL_SEARCH",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.GLOBAL_SEARCH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to install a location provider into the Location Manager.
     */
    fileprivate static var INSTALL_LOCATION_PROVIDER: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "INSTALL_LOCATION_PROVIDER",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.INSTALL_LOCATION_PROVIDER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to install packages.
     */
    fileprivate static var INSTALL_PACKAGES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "INSTALL_PACKAGES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.INSTALL_PACKAGES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to install a shortcut in Launcher.
     */
    fileprivate static var INSTALL_SHORTCUT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "INSTALL_SHORTCUT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.INSTALL_SHORTCUT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an instant app to create foreground services.
     */
    fileprivate static var INSTANT_APP_FOREGROUND_SERVICE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "INSTANT_APP_FOREGROUND_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.INSTANT_APP_FOREGROUND_SERVICE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to open network sockets.
     */
    fileprivate static var INTERNET: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "INTERNET",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.INTERNET,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to call ActivityManager.killBackgroundProcesses(String).
     */
    fileprivate static var KILL_BACKGROUND_PROCESSES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "KILL_BACKGROUND_PROCESSES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.KILL_BACKGROUND_PROCESSES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to use location features in hardware, such as the geofencing api.
     */
    fileprivate static var LOCATION_HARDWARE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "LOCATION_HARDWARE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.LOCATION_HARDWARE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to manage access to documents, usually as part of a document picker.
     */
    fileprivate static var MANAGE_DOCUMENTS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MANAGE_DOCUMENTS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MANAGE_DOCUMENTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows a calling application which manages it own calls through the self-managed ConnectionService APIs.
     */
    fileprivate static var MANAGE_OWN_CALLS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MANAGE_OWN_CALLS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MANAGE_OWN_CALLS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Not for use by third-party applications.
     */
    fileprivate static var MASTER_CLEAR: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MASTER_CLEAR",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MASTER_CLEAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to know what content is playing and control its playback.
     */
    fileprivate static var MEDIA_CONTENT_CONTROL: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MEDIA_CONTENT_CONTROL",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MEDIA_CONTENT_CONTROL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to modify global audio settings.
     */
    fileprivate static var MODIFY_AUDIO_SETTINGS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MODIFY_AUDIO_SETTINGS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MODIFY_AUDIO_SETTINGS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows modification of the telephony state - power on, mmi, etc.
     */
    fileprivate static var MODIFY_PHONE_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MODIFY_PHONE_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MODIFY_PHONE_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows formatting file systems for removable storage.
     */
    fileprivate static var MOUNT_FORMAT_FILESYSTEMS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MOUNT_FORMAT_FILESYSTEMS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MOUNT_FORMAT_FILESYSTEMS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows mounting and unmounting file systems for removable storage.
     */
    fileprivate static var MOUNT_UNMOUNT_FILESYSTEMS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "MOUNT_UNMOUNT_FILESYSTEMS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.MOUNT_UNMOUNT_FILESYSTEMS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to perform I/O operations over NFC.
     */
    fileprivate static var NFC: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "NFC",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.NFC,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to receive NFC transaction events.
     */
    fileprivate static var NFC_TRANSACTION_EVENT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "NFC_TRANSACTION_EVENT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.NFC_TRANSACTION_EVENT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to collect component usage statistics
     *
     * Declaring the permission implies intention to use the API and the user of the device
     * can grant permission through the Settings application.
     */
    fileprivate static var PACKAGE_USAGE_STATS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "PACKAGE_USAGE_STATS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.PACKAGE_USAGE_STATS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to see the number being dialed during an outgoing call with the option to redirect the call to a different number or abort the call altogether.
     */
    fileprivate static var PROCESS_OUTGOING_CALLS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "PROCESS_OUTGOING_CALLS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.PROCESS_OUTGOING_CALLS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read the user's calendar data.
     */
    fileprivate static var READ_CALENDAR: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_CALENDAR",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_CALENDAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read the user's call log.
     */
    fileprivate static var READ_CALL_LOG: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_CALL_LOG",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_CALL_LOG,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read the user's contacts data.
     */
    fileprivate static var READ_CONTACTS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_CONTACTS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_CONTACTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read from external storage.
     */
    fileprivate static var READ_EXTERNAL_STORAGE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_EXTERNAL_STORAGE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_EXTERNAL_STORAGE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to take screen shots and more generally get access to the frame buffer data.
     */
    fileprivate static var READ_FRAME_BUFFER: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_FRAME_BUFFER",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_FRAME_BUFFER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read the low-level system log files.
     */
    fileprivate static var READ_LOGS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_LOGS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_LOGS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows read access to the device's phone number(s).
     */
    fileprivate static var READ_PHONE_NUMBERS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_PHONE_NUMBERS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_PHONE_NUMBERS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows read only access to phone state, including the phone number of the device, current cellular network information, the status of any ongoing calls, and a list of any PhoneAccounts registered on the device.
     */
    fileprivate static var READ_PHONE_STATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_PHONE_STATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_PHONE_STATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read SMS messages.
     */
    fileprivate static var READ_SMS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_SMS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_SMS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to read the sync settings.
     */
    fileprivate static var READ_SYNC_SETTINGS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_SYNC_SETTINGS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_SYNC_SETTINGS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to read the sync stats.
     */
    fileprivate static var READ_SYNC_STATS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_SYNC_STATS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_SYNC_STATS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read voicemails in the system.
     */
    fileprivate static var READ_VOICEMAIL: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "READ_VOICEMAIL",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.READ_VOICEMAIL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Required to be able to reboot the device.
     */
    fileprivate static var REBOOT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "REBOOT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.REBOOT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to receive the Intent.ACTION_BOOT_COMPLETED that is broadcast after the system finishes booting.
     */
    fileprivate static var RECEIVE_BOOT_COMPLETED: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "RECEIVE_BOOT_COMPLETED",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.RECEIVE_BOOT_COMPLETED,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to monitor incoming MMS messages.
     */
    fileprivate static var RECEIVE_MMS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "RECEIVE_MMS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.RECEIVE_MMS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to receive SMS messages.
     */
    fileprivate static var RECEIVE_SMS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "RECEIVE_SMS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.RECEIVE_SMS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to receive WAP push messages.
     */
    fileprivate static var RECEIVE_WAP_PUSH: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "RECEIVE_WAP_PUSH",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.RECEIVE_WAP_PUSH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to record audio.
     */
    fileprivate static var RECORD_AUDIO: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "RECORD_AUDIO",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.RECORD_AUDIO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to change the Z-order of tasks.
     */
    fileprivate static var REORDER_TASKS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "REORDER_TASKS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.REORDER_TASKS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows a companion app to run in the background.
     */
    fileprivate static var REQUEST_COMPANION_RUN_IN_BACKGROUND: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "REQUEST_COMPANION_RUN_IN_BACKGROUND",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.REQUEST_COMPANION_RUN_IN_BACKGROUND,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows a companion app to use data in the background.
     */
    fileprivate static var REQUEST_COMPANION_USE_DATA_IN_BACKGROUND: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "REQUEST_COMPANION_USE_DATA_IN_BACKGROUND",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to request deleting packages.
     */
    fileprivate static var REQUEST_DELETE_PACKAGES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "REQUEST_DELETE_PACKAGES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.REQUEST_DELETE_PACKAGES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Permission an application must hold in order to use Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS.
     */
    fileprivate static var REQUEST_IGNORE_BATTERY_OPTIMIZATIONS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "REQUEST_IGNORE_BATTERY_OPTIMIZATIONS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to request installing packages.
     */
    fileprivate static var REQUEST_INSTALL_PACKAGES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "REQUEST_INSTALL_PACKAGES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.REQUEST_INSTALL_PACKAGES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application (Phone) to send a request to other applications to handle the respond-via-message action during incoming calls.
     */
    fileprivate static var SEND_RESPOND_VIA_MESSAGE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SEND_RESPOND_VIA_MESSAGE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SEND_RESPOND_VIA_MESSAGE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to send SMS messages.
     */
    fileprivate static var SEND_SMS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SEND_SMS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SEND_SMS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to broadcast an Intent to set an alarm for the user.
     */
    fileprivate static var SET_ALARM: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_ALARM",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_ALARM,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to control whether activities are immediately finished when put in the background.
     */
    fileprivate static var SET_ALWAYS_FINISH: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_ALWAYS_FINISH",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_ALWAYS_FINISH,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Modify the global animation scaling factor.
     */
    fileprivate static var SET_ANIMATION_SCALE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_ANIMATION_SCALE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_ANIMATION_SCALE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Configure an application for debugging.
     */
    fileprivate static var SET_DEBUG_APP: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_DEBUG_APP",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_DEBUG_APP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to set the maximum number of (not needed) application processes that can be running.
     */
    fileprivate static var SET_PROCESS_LIMIT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_PROCESS_LIMIT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_PROCESS_LIMIT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to set the system time.
     */
    fileprivate static var SET_TIME: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_TIME",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_TIME,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to set the system time zone.
     */
    fileprivate static var SET_TIME_ZONE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_TIME_ZONE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_TIME_ZONE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to set the wallpaper.
     */
    fileprivate static var SET_WALLPAPER: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_WALLPAPER",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_WALLPAPER,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to set the wallpaper hints.
     */
    fileprivate static var SET_WALLPAPER_HINTS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SET_WALLPAPER_HINTS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SET_WALLPAPER_HINTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allow an application to request that a signal be sent to all persistent processes.
     */
    fileprivate static var SIGNAL_PERSISTENT_PROCESSES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SIGNAL_PERSISTENT_PROCESSES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SIGNAL_PERSISTENT_PROCESSES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to open, close, or disable the status bar and its icons.
     */
    fileprivate static var STATUS_BAR: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "STATUS_BAR",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.STATUS_BAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an app to create windows using the type WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, shown on top of all other apps.
     */
    fileprivate static var SYSTEM_ALERT_WINDOW: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "SYSTEM_ALERT_WINDOW",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.SYSTEM_ALERT_WINDOW,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows using the device's IR transmitter, if available.
     */
    fileprivate static var TRANSMIT_IR: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "TRANSMIT_IR",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.TRANSMIT_IR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * This permission is no longer supported.
     */
    fileprivate static var UNINSTALL_SHORTCUT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "UNINSTALL_SHORTCUT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.UNINSTALL_SHORTCUT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to update device statistics.
     */
    fileprivate static var UPDATE_DEVICE_STATS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "UPDATE_DEVICE_STATS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.UPDATE_DEVICE_STATS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an app to use device supported biometric modalities.
     */
    fileprivate static var USE_BIOMETRIC: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "USE_BIOMETRIC",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.USE_BIOMETRIC,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to use SIP service.
     */
    fileprivate static var USE_SIP: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "USE_SIP",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.USE_SIP,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows access to the vibrator.
     */
    fileprivate static var VIBRATE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "VIBRATE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.VIBRATE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows using PowerManager WakeLocks to keep processor from sleeping or screen from dimming.
     */
    fileprivate static var WAKE_LOCK: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WAKE_LOCK",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WAKE_LOCK,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to write the apn settings.
     */
    fileprivate static var WRITE_APN_SETTINGS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_APN_SETTINGS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_APN_SETTINGS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to write the user's calendar data.
     */
    fileprivate static var WRITE_CALENDAR: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_CALENDAR",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_CALENDAR,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to write (but not read) the user's call log data.
     */
    fileprivate static var WRITE_CALL_LOG: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_CALL_LOG",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_CALL_LOG,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to write the user's contacts data.
     */
    fileprivate static var WRITE_CONTACTS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_CONTACTS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_CONTACTS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to write to external storage.
     */
    fileprivate static var WRITE_EXTERNAL_STORAGE: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_EXTERNAL_STORAGE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_EXTERNAL_STORAGE,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to modify the Google service map.
     */
    fileprivate static var WRITE_GSERVICES: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_GSERVICES",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_GSERVICES,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read or write the secure system settings.
     */
    fileprivate static var WRITE_SECURE_SETTINGS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_SECURE_SETTINGS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_SECURE_SETTINGS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to read or write the system settings.
     */
    fileprivate static var WRITE_SETTINGS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_SETTINGS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_SETTINGS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows applications to write the sync settings.
     */
    fileprivate static var WRITE_SYNC_SETTINGS: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_SYNC_SETTINGS",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_SYNC_SETTINGS,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    /**
     * Allows an application to modify and remove existing voicemails in the system.
     */
    fileprivate static var WRITE_VOICEMAIL: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "WRITE_VOICEMAIL",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.WRITE_VOICEMAIL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
}


fileprivate extension AndroidManifestPermissionConstants {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/Manifest$permission"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            static var ACCEPT_HANDOVER: jfieldID?
            static var ACCESS_CHECKIN_PROPERTIES: jfieldID?
            static var ACCESS_COARSE_LOCATION: jfieldID?
            static var ACCESS_FINE_LOCATION: jfieldID?
            static var ACCESS_LOCATION_EXTRA_COMMANDS: jfieldID?
            static var ACCESS_NETWORK_STATE: jfieldID?
            static var ACCESS_NOTIFICATION_POLICY: jfieldID?
            static var ACCESS_WIFI_STATE: jfieldID?
            static var ACCOUNT_MANAGER: jfieldID?
            static var ADD_VOICEMAIL: jfieldID?
            static var ANSWER_PHONE_CALLS: jfieldID?
            static var BATTERY_STATS: jfieldID?
            static var BIND_ACCESSIBILITY_SERVICE: jfieldID?
            static var BIND_APPWIDGET: jfieldID?
            static var BIND_AUTOFILL_SERVICE: jfieldID?
            static var BIND_CARRIER_SERVICES: jfieldID?
            static var BIND_CHOOSER_TARGET_SERVICE: jfieldID?
            static var BIND_CONDITION_PROVIDER_SERVICE: jfieldID?
            static var BIND_DEVICE_ADMIN: jfieldID?
            static var BIND_DREAM_SERVICE: jfieldID?
            static var BIND_INCALL_SERVICE: jfieldID?
            static var BIND_INPUT_METHOD: jfieldID?
            static var BIND_MIDI_DEVICE_SERVICE: jfieldID?
            static var BIND_NFC_SERVICE: jfieldID?
            static var BIND_NOTIFICATION_LISTENER_SERVICE: jfieldID?
            static var BIND_PRINT_SERVICE: jfieldID?
            static var BIND_QUICK_SETTINGS_TILE: jfieldID?
            static var BIND_REMOTEVIEWS: jfieldID?
            static var BIND_SCREENING_SERVICE: jfieldID?
            static var BIND_TELECOM_CONNECTION_SERVICE: jfieldID?
            static var BIND_TEXT_SERVICE: jfieldID?
            static var BIND_TV_INPUT: jfieldID?
            static var BIND_VISUAL_VOICEMAIL_SERVICE: jfieldID?
            static var BIND_VOICE_INTERACTION: jfieldID?
            static var BIND_VPN_SERVICE: jfieldID?
            static var BIND_VR_LISTENER_SERVICE: jfieldID?
            static var BIND_WALLPAPER: jfieldID?
            static var BLUETOOTH: jfieldID?
            static var BLUETOOTH_ADMIN: jfieldID?
            static var BLUETOOTH_PRIVILEGED: jfieldID?
            static var BODY_SENSORS: jfieldID?
            static var BROADCAST_PACKAGE_REMOVED: jfieldID?
            static var BROADCAST_SMS: jfieldID?
            static var BROADCAST_STICKY: jfieldID?
            static var BROADCAST_WAP_PUSH: jfieldID?
            static var CALL_PHONE: jfieldID?
            static var CALL_PRIVILEGED: jfieldID?
            static var CAMERA: jfieldID?
            static var CAPTURE_AUDIO_OUTPUT: jfieldID?
            static var CAPTURE_SECURE_VIDEO_OUTPUT: jfieldID?
            static var CAPTURE_VIDEO_OUTPUT: jfieldID?
            static var CHANGE_COMPONENT_ENABLED_STATE: jfieldID?
            static var CHANGE_CONFIGURATION: jfieldID?
            static var CHANGE_NETWORK_STATE: jfieldID?
            static var CHANGE_WIFI_MULTICAST_STATE: jfieldID?
            static var CHANGE_WIFI_STATE: jfieldID?
            static var CLEAR_APP_CACHE: jfieldID?
            static var CONTROL_LOCATION_UPDATES: jfieldID?
            static var DELETE_CACHE_FILES: jfieldID?
            static var DELETE_PACKAGES: jfieldID?
            static var DIAGNOSTIC: jfieldID?
            static var DISABLE_KEYGUARD: jfieldID?
            static var DUMP: jfieldID?
            static var EXPAND_STATUS_BAR: jfieldID?
            static var FACTORY_TEST: jfieldID?
            static var FOREGROUND_SERVICE: jfieldID?
            static var GET_ACCOUNTS: jfieldID?
            static var GET_ACCOUNTS_PRIVILEGED: jfieldID?
            static var GET_PACKAGE_SIZE: jfieldID?
            static var GLOBAL_SEARCH: jfieldID?
            static var INSTALL_LOCATION_PROVIDER: jfieldID?
            static var INSTALL_PACKAGES: jfieldID?
            static var INSTALL_SHORTCUT: jfieldID?
            static var INSTANT_APP_FOREGROUND_SERVICE: jfieldID?
            static var INTERNET: jfieldID?
            static var KILL_BACKGROUND_PROCESSES: jfieldID?
            static var LOCATION_HARDWARE: jfieldID?
            static var MANAGE_DOCUMENTS: jfieldID?
            static var MANAGE_OWN_CALLS: jfieldID?
            static var MASTER_CLEAR: jfieldID?
            static var MEDIA_CONTENT_CONTROL: jfieldID?
            static var MODIFY_AUDIO_SETTINGS: jfieldID?
            static var MODIFY_PHONE_STATE: jfieldID?
            static var MOUNT_FORMAT_FILESYSTEMS: jfieldID?
            static var MOUNT_UNMOUNT_FILESYSTEMS: jfieldID?
            static var NFC: jfieldID?
            static var NFC_TRANSACTION_EVENT: jfieldID?
            static var PACKAGE_USAGE_STATS: jfieldID?
            static var PROCESS_OUTGOING_CALLS: jfieldID?
            static var READ_CALENDAR: jfieldID?
            static var READ_CALL_LOG: jfieldID?
            static var READ_CONTACTS: jfieldID?
            static var READ_EXTERNAL_STORAGE: jfieldID?
            static var READ_FRAME_BUFFER: jfieldID?
            static var READ_LOGS: jfieldID?
            static var READ_PHONE_NUMBERS: jfieldID?
            static var READ_PHONE_STATE: jfieldID?
            static var READ_SMS: jfieldID?
            static var READ_SYNC_SETTINGS: jfieldID?
            static var READ_SYNC_STATS: jfieldID?
            static var READ_VOICEMAIL: jfieldID?
            static var REBOOT: jfieldID?
            static var RECEIVE_BOOT_COMPLETED: jfieldID?
            static var RECEIVE_MMS: jfieldID?
            static var RECEIVE_SMS: jfieldID?
            static var RECEIVE_WAP_PUSH: jfieldID?
            static var RECORD_AUDIO: jfieldID?
            static var REORDER_TASKS: jfieldID?
            static var REQUEST_COMPANION_RUN_IN_BACKGROUND: jfieldID?
            static var REQUEST_COMPANION_USE_DATA_IN_BACKGROUND: jfieldID?
            static var REQUEST_DELETE_PACKAGES: jfieldID?
            static var REQUEST_IGNORE_BATTERY_OPTIMIZATIONS: jfieldID?
            static var REQUEST_INSTALL_PACKAGES: jfieldID?
            static var SEND_RESPOND_VIA_MESSAGE: jfieldID?
            static var SEND_SMS: jfieldID?
            static var SET_ALARM: jfieldID?
            static var SET_ALWAYS_FINISH: jfieldID?
            static var SET_ANIMATION_SCALE: jfieldID?
            static var SET_DEBUG_APP: jfieldID?
            static var SET_PROCESS_LIMIT: jfieldID?
            static var SET_TIME: jfieldID?
            static var SET_TIME_ZONE: jfieldID?
            static var SET_WALLPAPER: jfieldID?
            static var SET_WALLPAPER_HINTS: jfieldID?
            static var SIGNAL_PERSISTENT_PROCESSES: jfieldID?
            static var STATUS_BAR: jfieldID?
            static var SYSTEM_ALERT_WINDOW: jfieldID?
            static var TRANSMIT_IR: jfieldID?
            static var UNINSTALL_SHORTCUT: jfieldID?
            static var UPDATE_DEVICE_STATS: jfieldID?
            static var USE_BIOMETRIC: jfieldID?
            static var USE_SIP: jfieldID?
            static var VIBRATE: jfieldID?
            static var WAKE_LOCK: jfieldID?
            static var WRITE_APN_SETTINGS: jfieldID?
            static var WRITE_CALENDAR: jfieldID?
            static var WRITE_CALL_LOG: jfieldID?
            static var WRITE_CONTACTS: jfieldID?
            static var WRITE_EXTERNAL_STORAGE: jfieldID?
            static var WRITE_GSERVICES: jfieldID?
            static var WRITE_SECURE_SETTINGS: jfieldID?
            static var WRITE_SETTINGS: jfieldID?
            static var WRITE_SYNC_SETTINGS: jfieldID?
            static var WRITE_VOICEMAIL: jfieldID?
            
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method1: jmethodID?
        }
    }
}
