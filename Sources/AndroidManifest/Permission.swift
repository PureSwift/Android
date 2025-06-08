//
//  AndroidManifestPermission.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import JavaKit

/// Android Manifest Permission
public struct Permission: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension Permission {
    
    static let acceptHandover = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCEPT_HANDOVER)
    
    static let accessCheckinProperties = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCESS_CHECKIN_PROPERTIES)
    
    static let accessCoarseLocation = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCESS_COARSE_LOCATION)
    
    static let accessFineLocation = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCESS_FINE_LOCATION)
    
    static let accessLocationExtraCommands = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCESS_LOCATION_EXTRA_COMMANDS)
    
    static let accessNetworkState = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCESS_NETWORK_STATE)
    
    static let accessNotificationPolicy = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCESS_NOTIFICATION_POLICY)
    
    static let accessWifiState = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCESS_WIFI_STATE)
    
    static let accountManager = Permission(rawValue: try! JavaClass<Manifest.Permission>().ACCOUNT_MANAGER)
    
    static let addVoicemail = Permission(rawValue: try! JavaClass<Manifest.Permission>().ADD_VOICEMAIL)
    
    static let answerPhoneCalls = Permission(rawValue: try! JavaClass<Manifest.Permission>().ANSWER_PHONE_CALLS)
    
    static let batteryStats = Permission(rawValue: try! JavaClass<Manifest.Permission>().BATTERY_STATS)
    
    static let bindAccessibilityService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_ACCESSIBILITY_SERVICE)
    
    static let bindAppwidget = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_APPWIDGET)
    
    static let bindAutofillService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_AUTOFILL_SERVICE)
    
    static let bindCarrierServices = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_CARRIER_SERVICES)
    
    static let bindChooserTargetService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_CHOOSER_TARGET_SERVICE)
    
    static let bindConditionProviderService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_CONDITION_PROVIDER_SERVICE)
    
    static let bindDeviceAdmin = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_DEVICE_ADMIN)
    
    static let bindDreamService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_DREAM_SERVICE)
    
    static let bindIncallService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_INCALL_SERVICE)
    
    static let bindInputMethod = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_INPUT_METHOD)
    
    static let bindMidiDeviceService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_MIDI_DEVICE_SERVICE)
    
    static let bindNfcService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_NFC_SERVICE)
    
    static let bindNotificationListenerService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_NOTIFICATION_LISTENER_SERVICE)
    
    static let bindPrintService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_PRINT_SERVICE)
    
    static let bindQuickSettingsTile = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_QUICK_SETTINGS_TILE)
    
    static let bindRemoteviews = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_REMOTEVIEWS)
    
    static let bindScreeningService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_SCREENING_SERVICE)
    
    static let bindTelecomConnectionService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_TELECOM_CONNECTION_SERVICE)
    
    static let bindTextService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_TEXT_SERVICE)
    
    static let bindTvInput = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_TV_INPUT)
    
    static let bindVisualVoicemailService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_VISUAL_VOICEMAIL_SERVICE)
    
    static let bindVoiceInteraction = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_VOICE_INTERACTION)
    
    static let bindVpnService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_VPN_SERVICE)
    
    static let bindVrListenerService = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_VR_LISTENER_SERVICE)
    
    static let bindWallpaper = Permission(rawValue: try! JavaClass<Manifest.Permission>().BIND_WALLPAPER)
    
    static let bluetooth = Permission(rawValue: try! JavaClass<Manifest.Permission>().BLUETOOTH)
    
    static let bluetoothAdmin = Permission(rawValue: try! JavaClass<Manifest.Permission>().BLUETOOTH_ADMIN)
    
    static let bluetoothPrivileged = Permission(rawValue: try! JavaClass<Manifest.Permission>().BLUETOOTH_PRIVILEGED)
    
    static let bodySensors = Permission(rawValue: try! JavaClass<Manifest.Permission>().BODY_SENSORS)
    
    static let broadcastPackageRemoved = Permission(rawValue: try! JavaClass<Manifest.Permission>().BROADCAST_PACKAGE_REMOVED)
    
    static let broadcastSms = Permission(rawValue: try! JavaClass<Manifest.Permission>().BROADCAST_SMS)
    
    static let broadcastSticky = Permission(rawValue: try! JavaClass<Manifest.Permission>().BROADCAST_STICKY)
    
    static let broadcastWapPush = Permission(rawValue: try! JavaClass<Manifest.Permission>().BROADCAST_WAP_PUSH)
    
    static let callPhone = Permission(rawValue: try! JavaClass<Manifest.Permission>().CALL_PHONE)
    
    static let callPrivileged = Permission(rawValue: try! JavaClass<Manifest.Permission>().CALL_PRIVILEGED)
    
    static let camera = Permission(rawValue: try! JavaClass<Manifest.Permission>().CAMERA)
    
    static let captureAudioOutput = Permission(rawValue: try! JavaClass<Manifest.Permission>().CAPTURE_AUDIO_OUTPUT)
    
    //static let captureSecureVideoOutput = Permission(rawValue: try! JavaClass<Manifest.Permission>().CAPTURE_SECURE_VIDEO_OUTPUT)
    
    //static let captureVideoOutput = Permission(rawValue: try! JavaClass<Manifest.Permission>().CAPTURE_VIDEO_OUTPUT)
    
    static let changeComponentEnabledState = Permission(rawValue: try! JavaClass<Manifest.Permission>().CHANGE_COMPONENT_ENABLED_STATE)
    
    static let changeConfiguration = Permission(rawValue: try! JavaClass<Manifest.Permission>().CHANGE_CONFIGURATION)
    
    static let changeNetworkState = Permission(rawValue: try! JavaClass<Manifest.Permission>().CHANGE_NETWORK_STATE)
    
    static let changeWifiMulticastState = Permission(rawValue: try! JavaClass<Manifest.Permission>().CHANGE_WIFI_MULTICAST_STATE)
    
    static let changeWifiState = Permission(rawValue: try! JavaClass<Manifest.Permission>().CHANGE_WIFI_STATE)
    
    static let clearAppCache = Permission(rawValue: try! JavaClass<Manifest.Permission>().CLEAR_APP_CACHE)
    
    static let controlLocationUpdates = Permission(rawValue: try! JavaClass<Manifest.Permission>().CONTROL_LOCATION_UPDATES)
    
    static let deleteCacheFiles = Permission(rawValue: try! JavaClass<Manifest.Permission>().DELETE_CACHE_FILES)
    
    static let deletePackages = Permission(rawValue: try! JavaClass<Manifest.Permission>().DELETE_PACKAGES)
    
    static let diagnostic = Permission(rawValue: try! JavaClass<Manifest.Permission>().DIAGNOSTIC)
    
    static let disableKeyguard = Permission(rawValue: try! JavaClass<Manifest.Permission>().DISABLE_KEYGUARD)
    
    static let dump = Permission(rawValue: try! JavaClass<Manifest.Permission>().DUMP)
    
    static let expandStatusBar = Permission(rawValue: try! JavaClass<Manifest.Permission>().EXPAND_STATUS_BAR)
    
    static let factoryTest = Permission(rawValue: try! JavaClass<Manifest.Permission>().FACTORY_TEST)
    
    static let foregroundService = Permission(rawValue: try! JavaClass<Manifest.Permission>().FOREGROUND_SERVICE)
    
    static let getAccounts = Permission(rawValue: try! JavaClass<Manifest.Permission>().GET_ACCOUNTS)
    
    static let getAccountsPrivileged = Permission(rawValue: try! JavaClass<Manifest.Permission>().GET_ACCOUNTS_PRIVILEGED)
    
    static let getPackageSize = Permission(rawValue: try! JavaClass<Manifest.Permission>().GET_PACKAGE_SIZE)
    
    static let globalSearch = Permission(rawValue: try! JavaClass<Manifest.Permission>().GLOBAL_SEARCH)
    
    static let installLocationProvider = Permission(rawValue: try! JavaClass<Manifest.Permission>().INSTALL_LOCATION_PROVIDER)
    
    static let installPackages = Permission(rawValue: try! JavaClass<Manifest.Permission>().INSTALL_PACKAGES)
    
    static let installShortcut = Permission(rawValue: try! JavaClass<Manifest.Permission>().INSTALL_SHORTCUT)
    
    static let instantAppForegroundService = Permission(rawValue: try! JavaClass<Manifest.Permission>().INSTANT_APP_FOREGROUND_SERVICE)
    
    static let internet = Permission(rawValue: try! JavaClass<Manifest.Permission>().INTERNET)
    
    static let killBackgroundProcesses = Permission(rawValue: try! JavaClass<Manifest.Permission>().KILL_BACKGROUND_PROCESSES)
    
    static let locationHardware = Permission(rawValue: try! JavaClass<Manifest.Permission>().LOCATION_HARDWARE)
    
    static let manageDocuments = Permission(rawValue: try! JavaClass<Manifest.Permission>().MANAGE_DOCUMENTS)
    
    static let manageOwnCalls = Permission(rawValue: try! JavaClass<Manifest.Permission>().MANAGE_OWN_CALLS)
    
    static let masterClear = Permission(rawValue: try! JavaClass<Manifest.Permission>().MASTER_CLEAR)
    
    static let mediaContentControl = Permission(rawValue: try! JavaClass<Manifest.Permission>().MEDIA_CONTENT_CONTROL)
    
    static let modifyAudioSettings = Permission(rawValue: try! JavaClass<Manifest.Permission>().MODIFY_AUDIO_SETTINGS)
    
    static let modifyPhoneState = Permission(rawValue: try! JavaClass<Manifest.Permission>().MODIFY_PHONE_STATE)
    
    static let mountFormatFilesystems = Permission(rawValue: try! JavaClass<Manifest.Permission>().MOUNT_FORMAT_FILESYSTEMS)
    
    static let mountUnmountFilesystems = Permission(rawValue: try! JavaClass<Manifest.Permission>().MOUNT_UNMOUNT_FILESYSTEMS)
    
    static let nfc = Permission(rawValue: try! JavaClass<Manifest.Permission>().NFC)
    
    static let nfcTransactionEvent = Permission(rawValue: try! JavaClass<Manifest.Permission>().NFC_TRANSACTION_EVENT)
    
    static let packageUsageStats = Permission(rawValue: try! JavaClass<Manifest.Permission>().PACKAGE_USAGE_STATS)
    
    static let processOutgoingCalls = Permission(rawValue: try! JavaClass<Manifest.Permission>().PROCESS_OUTGOING_CALLS)
    
    static let readCalendar = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_CALENDAR)
    
    static let readCallLog = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_CALL_LOG)
    
    static let readContacts = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_CONTACTS)
    
    static let readExternalStorage = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_EXTERNAL_STORAGE)
    
    //static let readFrameBuffer = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_FRAME_BUFFER)
    
    static let readLogs = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_LOGS)
    
    static let readPhoneNumbers = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_PHONE_NUMBERS)
    
    static let readPhoneState = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_PHONE_STATE)
    
    static let readSms = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_SMS)
    
    static let readSyncSettings = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_SYNC_SETTINGS)
    
    static let readSyncStats = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_SYNC_STATS)
    
    static let readVoicemail = Permission(rawValue: try! JavaClass<Manifest.Permission>().READ_VOICEMAIL)
    
    static let reboot = Permission(rawValue: try! JavaClass<Manifest.Permission>().REBOOT)
    
    static let receiveBootCompleted = Permission(rawValue: try! JavaClass<Manifest.Permission>().RECEIVE_BOOT_COMPLETED)
    
    static let receiveMms = Permission(rawValue: try! JavaClass<Manifest.Permission>().RECEIVE_MMS)
    
    static let receiveSms = Permission(rawValue: try! JavaClass<Manifest.Permission>().RECEIVE_SMS)
    
    static let receiveWapPush = Permission(rawValue: try! JavaClass<Manifest.Permission>().RECEIVE_WAP_PUSH)
    
    static let recordAudio = Permission(rawValue: try! JavaClass<Manifest.Permission>().RECORD_AUDIO)
    
    static let reorderTasks = Permission(rawValue: try! JavaClass<Manifest.Permission>().REORDER_TASKS)
    
    static let requestCompanionRunInBackground = Permission(rawValue: try! JavaClass<Manifest.Permission>().REQUEST_COMPANION_RUN_IN_BACKGROUND)
    
    static let requestCompanionUseDataInBackground = Permission(rawValue: try! JavaClass<Manifest.Permission>().REQUEST_COMPANION_USE_DATA_IN_BACKGROUND)
    
    static let requestDeletePackages = Permission(rawValue: try! JavaClass<Manifest.Permission>().REQUEST_DELETE_PACKAGES)
    
    static let requestIgnoreBatteryOptimizations = Permission(rawValue: try! JavaClass<Manifest.Permission>().REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
    
    static let requestInstallPackages = Permission(rawValue: try! JavaClass<Manifest.Permission>().REQUEST_INSTALL_PACKAGES)
    
    static let sendRespondViaMessage = Permission(rawValue: try! JavaClass<Manifest.Permission>().SEND_RESPOND_VIA_MESSAGE)
    
    static let sendSms = Permission(rawValue: try! JavaClass<Manifest.Permission>().SEND_SMS)
    
    static let setAlarm = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_ALARM)
    
    static let setAlwaysFinish = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_ALWAYS_FINISH)
    
    static let setAnimationScale = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_ANIMATION_SCALE)
    
    static let setDebugApp = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_DEBUG_APP)
    
    static let setProcessLimit = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_PROCESS_LIMIT)
    
    static let setTime = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_TIME)
    
    static let setTimeZone = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_TIME_ZONE)
    
    static let setWallpaper = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_WALLPAPER)
    
    static let setWallpaperHints = Permission(rawValue: try! JavaClass<Manifest.Permission>().SET_WALLPAPER_HINTS)
    
    static let signalPersistentProcesses = Permission(rawValue: try! JavaClass<Manifest.Permission>().SIGNAL_PERSISTENT_PROCESSES)
    
    static let statusBar = Permission(rawValue: try! JavaClass<Manifest.Permission>().STATUS_BAR)
    
    static let systemAlertWindow = Permission(rawValue: try! JavaClass<Manifest.Permission>().SYSTEM_ALERT_WINDOW)
    
    static let transmitIr = Permission(rawValue: try! JavaClass<Manifest.Permission>().TRANSMIT_IR)
    
    static let uninstallShortcut = Permission(rawValue: try! JavaClass<Manifest.Permission>().UNINSTALL_SHORTCUT)
    
    static let updateDeviceStats = Permission(rawValue: try! JavaClass<Manifest.Permission>().UPDATE_DEVICE_STATS)
    
    static let useBiometric = Permission(rawValue: try! JavaClass<Manifest.Permission>().USE_BIOMETRIC)
    
    static let useSip = Permission(rawValue: try! JavaClass<Manifest.Permission>().USE_SIP)
    
    static let vibrate = Permission(rawValue: try! JavaClass<Manifest.Permission>().VIBRATE)
    
    static let wakeLock = Permission(rawValue: try! JavaClass<Manifest.Permission>().WAKE_LOCK)
    
    static let writeApnSettings = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_APN_SETTINGS)
    
    static let writeCalendar = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_CALENDAR)
    
    static let writeCallLog = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_CALL_LOG)
    
    static let writeContacts = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_CONTACTS)
    
    static let writeExternalStorage = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_EXTERNAL_STORAGE)
    
    static let writeGservices = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_GSERVICES)
    
    static let writeSecureSettings = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_SECURE_SETTINGS)
    
    static let writeSettings = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_SETTINGS)
    
    static let writeSyncSettings = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_SYNC_SETTINGS)
    
    static let writeVoicemail = Permission(rawValue: try! JavaClass<Manifest.Permission>().WRITE_VOICEMAIL)
}
