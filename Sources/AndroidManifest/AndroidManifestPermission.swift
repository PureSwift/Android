//
//  AndroidManifestPermission.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import JavaKit

public struct AndroidManifestPermission: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension AndroidManifestPermission {
    
    public static let acceptHandover = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCEPT_HANDOVER)
    
    public static let accessCheckinProperties = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCESS_CHECKIN_PROPERTIES)
    
    public static let accessCoarseLocation = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCESS_COARSE_LOCATION)
    
    public static let accessFineLocation = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCESS_FINE_LOCATION)
    
    public static let accessLocationExtraCommands = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCESS_LOCATION_EXTRA_COMMANDS)
    
    public static let accessNetworkState = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCESS_NETWORK_STATE)
    
    public static let accessNotificationPolicy = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCESS_NOTIFICATION_POLICY)
    
    public static let accessWifiState = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCESS_WIFI_STATE)
    
    public static let accountManager = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ACCOUNT_MANAGER)
    
    public static let addVoicemail = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ADD_VOICEMAIL)
    
    public static let answerPhoneCalls = AndroidManifestPermission(rawValue: AndroidManifest.Permission.ANSWER_PHONE_CALLS)
    
    public static let batteryStats = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BATTERY_STATS)
    
    public static let bindAccessibilityService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_ACCESSIBILITY_SERVICE)
    
    public static let bindAppwidget = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_APPWIDGET)
    
    public static let bindAutofillService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_AUTOFILL_SERVICE)
    
    public static let bindCarrierServices = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_CARRIER_SERVICES)
    
    public static let bindChooserTargetService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_CHOOSER_TARGET_SERVICE)
    
    public static let bindConditionProviderService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_CONDITION_PROVIDER_SERVICE)
    
    public static let bindDeviceAdmin = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_DEVICE_ADMIN)
    
    public static let bindDreamService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_DREAM_SERVICE)
    
    public static let bindIncallService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_INCALL_SERVICE)
    
    public static let bindInputMethod = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_INPUT_METHOD)
    
    public static let bindMidiDeviceService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_MIDI_DEVICE_SERVICE)
    
    public static let bindNfcService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_NFC_SERVICE)
    
    public static let bindNotificationListenerService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_NOTIFICATION_LISTENER_SERVICE)
    
    public static let bindPrintService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_PRINT_SERVICE)
    
    public static let bindQuickSettingsTile = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_QUICK_SETTINGS_TILE)
    
    public static let bindRemoteviews = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_REMOTEVIEWS)
    
    public static let bindScreeningService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_SCREENING_SERVICE)
    
    public static let bindTelecomConnectionService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_TELECOM_CONNECTION_SERVICE)
    
    public static let bindTextService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_TEXT_SERVICE)
    
    public static let bindTvInput = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_TV_INPUT)
    
    public static let bindVisualVoicemailService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_VISUAL_VOICEMAIL_SERVICE)
    
    public static let bindVoiceInteraction = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_VOICE_INTERACTION)
    
    public static let bindVpnService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_VPN_SERVICE)
    
    public static let bindVrListenerService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_VR_LISTENER_SERVICE)
    
    public static let bindWallpaper = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BIND_WALLPAPER)
    
    public static let bluetooth = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BLUETOOTH)
    
    public static let bluetoothAdmin = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BLUETOOTH_ADMIN)
    
    public static let bluetoothPrivileged = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BLUETOOTH_PRIVILEGED)
    
    public static let bodySensors = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BODY_SENSORS)
    
    public static let broadcastPackageRemoved = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BROADCAST_PACKAGE_REMOVED)
    
    public static let broadcastSms = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BROADCAST_SMS)
    
    public static let broadcastSticky = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BROADCAST_STICKY)
    
    public static let broadcastWapPush = AndroidManifestPermission(rawValue: AndroidManifest.Permission.BROADCAST_WAP_PUSH)
    
    public static let callPhone = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CALL_PHONE)
    
    public static let callPrivileged = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CALL_PRIVILEGED)
    
    public static let camera = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CAMERA)
    
    public static let captureAudioOutput = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CAPTURE_AUDIO_OUTPUT)
    
    public static let captureSecureVideoOutput = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CAPTURE_SECURE_VIDEO_OUTPUT)
    
    public static let captureVideoOutput = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CAPTURE_VIDEO_OUTPUT)
    
    public static let changeComponentEnabledState = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CHANGE_COMPONENT_ENABLED_STATE)
    
    public static let changeConfiguration = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CHANGE_CONFIGURATION)
    
    public static let changeNetworkState = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CHANGE_NETWORK_STATE)
    
    public static let changeWifiMulticastState = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CHANGE_WIFI_MULTICAST_STATE)
    
    public static let changeWifiState = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CHANGE_WIFI_STATE)
    
    public static let clearAppCache = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CLEAR_APP_CACHE)
    
    public static let controlLocationUpdates = AndroidManifestPermission(rawValue: AndroidManifest.Permission.CONTROL_LOCATION_UPDATES)
    
    public static let deleteCacheFiles = AndroidManifestPermission(rawValue: AndroidManifest.Permission.DELETE_CACHE_FILES)
    
    public static let deletePackages = AndroidManifestPermission(rawValue: AndroidManifest.Permission.DELETE_PACKAGES)
    
    public static let diagnostic = AndroidManifestPermission(rawValue: AndroidManifest.Permission.DIAGNOSTIC)
    
    public static let disableKeyguard = AndroidManifestPermission(rawValue: AndroidManifest.Permission.DISABLE_KEYGUARD)
    
    public static let dump = AndroidManifestPermission(rawValue: AndroidManifest.Permission.DUMP)
    
    public static let expandStatusBar = AndroidManifestPermission(rawValue: AndroidManifest.Permission.EXPAND_STATUS_BAR)
    
    public static let factoryTest = AndroidManifestPermission(rawValue: AndroidManifest.Permission.FACTORY_TEST)
    
    public static let foregroundService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.FOREGROUND_SERVICE)
    
    public static let getAccounts = AndroidManifestPermission(rawValue: AndroidManifest.Permission.GET_ACCOUNTS)
    
    public static let getAccountsPrivileged = AndroidManifestPermission(rawValue: AndroidManifest.Permission.GET_ACCOUNTS_PRIVILEGED)
    
    public static let getPackageSize = AndroidManifestPermission(rawValue: AndroidManifest.Permission.GET_PACKAGE_SIZE)
    
    public static let globalSearch = AndroidManifestPermission(rawValue: AndroidManifest.Permission.GLOBAL_SEARCH)
    
    public static let installLocationProvider = AndroidManifestPermission(rawValue: AndroidManifest.Permission.INSTALL_LOCATION_PROVIDER)
    
    public static let installPackages = AndroidManifestPermission(rawValue: AndroidManifest.Permission.INSTALL_PACKAGES)
    
    public static let installShortcut = AndroidManifestPermission(rawValue: AndroidManifest.Permission.INSTALL_SHORTCUT)
    
    public static let instantAppForegroundService = AndroidManifestPermission(rawValue: AndroidManifest.Permission.INSTANT_APP_FOREGROUND_SERVICE)
    
    public static let internet = AndroidManifestPermission(rawValue: AndroidManifest.Permission.INTERNET)
    
    public static let killBackgroundProcesses = AndroidManifestPermission(rawValue: AndroidManifest.Permission.KILL_BACKGROUND_PROCESSES)
    
    public static let locationHardware = AndroidManifestPermission(rawValue: AndroidManifest.Permission.LOCATION_HARDWARE)
    
    public static let manageDocuments = AndroidManifestPermission(rawValue: AndroidManifest.Permission.MANAGE_DOCUMENTS)
    
    public static let manageOwnCalls = AndroidManifestPermission(rawValue: AndroidManifest.Permission.MANAGE_OWN_CALLS)
    
    public static let masterClear = AndroidManifestPermission(rawValue: AndroidManifest.Permission.MASTER_CLEAR)
    
    public static let mediaContentControl = AndroidManifestPermission(rawValue: AndroidManifest.Permission.MEDIA_CONTENT_CONTROL)
    
    public static let modifyAudioSettings = AndroidManifestPermission(rawValue: AndroidManifest.Permission.MODIFY_AUDIO_SETTINGS)
    
    public static let modifyPhoneState = AndroidManifestPermission(rawValue: AndroidManifest.Permission.MODIFY_PHONE_STATE)
    
    public static let mountFormatFilesystems = AndroidManifestPermission(rawValue: AndroidManifest.Permission.MOUNT_FORMAT_FILESYSTEMS)
    
    public static let mountUnmountFilesystems = AndroidManifestPermission(rawValue: AndroidManifest.Permission.MOUNT_UNMOUNT_FILESYSTEMS)
    
    public static let nfc = AndroidManifestPermission(rawValue: AndroidManifest.Permission.NFC)
    
    public static let nfcTransactionEvent = AndroidManifestPermission(rawValue: AndroidManifest.Permission.NFC_TRANSACTION_EVENT)
    
    public static let packageUsageStats = AndroidManifestPermission(rawValue: AndroidManifest.Permission.PACKAGE_USAGE_STATS)
    
    public static let processOutgoingCalls = AndroidManifestPermission(rawValue: AndroidManifest.Permission.PROCESS_OUTGOING_CALLS)
    
    public static let readCalendar = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_CALENDAR)
    
    public static let readCallLog = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_CALL_LOG)
    
    public static let readContacts = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_CONTACTS)
    
    public static let readExternalStorage = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_EXTERNAL_STORAGE)
    
    public static let readFrameBuffer = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_FRAME_BUFFER)
    
    public static let readLogs = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_LOGS)
    
    public static let readPhoneNumbers = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_PHONE_NUMBERS)
    
    public static let readPhoneState = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_PHONE_STATE)
    
    public static let readSms = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_SMS)
    
    public static let readSyncSettings = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_SYNC_SETTINGS)
    
    public static let readSyncStats = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_SYNC_STATS)
    
    public static let readVoicemail = AndroidManifestPermission(rawValue: AndroidManifest.Permission.READ_VOICEMAIL)
    
    public static let reboot = AndroidManifestPermission(rawValue: AndroidManifest.Permission.REBOOT)
    
    public static let receiveBootCompleted = AndroidManifestPermission(rawValue: AndroidManifest.Permission.RECEIVE_BOOT_COMPLETED)
    
    public static let receiveMms = AndroidManifestPermission(rawValue: AndroidManifest.Permission.RECEIVE_MMS)
    
    public static let receiveSms = AndroidManifestPermission(rawValue: AndroidManifest.Permission.RECEIVE_SMS)
    
    public static let receiveWapPush = AndroidManifestPermission(rawValue: AndroidManifest.Permission.RECEIVE_WAP_PUSH)
    
    public static let recordAudio = AndroidManifestPermission(rawValue: AndroidManifest.Permission.RECORD_AUDIO)
    
    public static let reorderTasks = AndroidManifestPermission(rawValue: AndroidManifest.Permission.REORDER_TASKS)
    
    public static let requestCompanionRunInBackground = AndroidManifestPermission(rawValue: AndroidManifest.Permission.REQUEST_COMPANION_RUN_IN_BACKGROUND)
    
    public static let requestCompanionUseDataInBackground = AndroidManifestPermission(rawValue: AndroidManifest.Permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND)
    
    public static let requestDeletePackages = AndroidManifestPermission(rawValue: AndroidManifest.Permission.REQUEST_DELETE_PACKAGES)
    
    public static let requestIgnoreBatteryOptimizations = AndroidManifestPermission(rawValue: AndroidManifest.Permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
    
    public static let requestInstallPackages = AndroidManifestPermission(rawValue: AndroidManifest.Permission.REQUEST_INSTALL_PACKAGES)
    
    public static let sendRespondViaMessage = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SEND_RESPOND_VIA_MESSAGE)
    
    public static let sendSms = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SEND_SMS)
    
    public static let setAlarm = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_ALARM)
    
    public static let setAlwaysFinish = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_ALWAYS_FINISH)
    
    public static let setAnimationScale = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_ANIMATION_SCALE)
    
    public static let setDebugApp = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_DEBUG_APP)
    
    public static let setProcessLimit = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_PROCESS_LIMIT)
    
    public static let setTime = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_TIME)
    
    public static let setTimeZone = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_TIME_ZONE)
    
    public static let setWallpaper = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_WALLPAPER)
    
    public static let setWallpaperHints = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SET_WALLPAPER_HINTS)
    
    public static let signalPersistentProcesses = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SIGNAL_PERSISTENT_PROCESSES)
    
    public static let statusBar = AndroidManifestPermission(rawValue: AndroidManifest.Permission.STATUS_BAR)
    
    public static let systemAlertWindow = AndroidManifestPermission(rawValue: AndroidManifest.Permission.SYSTEM_ALERT_WINDOW)
    
    public static let transmitIr = AndroidManifestPermission(rawValue: AndroidManifest.Permission.TRANSMIT_IR)
    
    public static let uninstallShortcut = AndroidManifestPermission(rawValue: AndroidManifest.Permission.UNINSTALL_SHORTCUT)
    
    public static let updateDeviceStats = AndroidManifestPermission(rawValue: AndroidManifest.Permission.UPDATE_DEVICE_STATS)
    
    public static let useBiometric = AndroidManifestPermission(rawValue: AndroidManifest.Permission.USE_BIOMETRIC)
    
    public static let useSip = AndroidManifestPermission(rawValue: AndroidManifest.Permission.USE_SIP)
    
    public static let vibrate = AndroidManifestPermission(rawValue: AndroidManifest.Permission.VIBRATE)
    
    public static let wakeLock = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WAKE_LOCK)
    
    public static let writeApnSettings = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_APN_SETTINGS)
    
    public static let writeCalendar = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_CALENDAR)
    
    public static let writeCallLog = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_CALL_LOG)
    
    public static let writeContacts = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_CONTACTS)
    
    public static let writeExternalStorage = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_EXTERNAL_STORAGE)
    
    public static let writeGservices = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_GSERVICES)
    
    public static let writeSecureSettings = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_SECURE_SETTINGS)
    
    public static let writeSettings = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_SETTINGS)
    
    public static let writeSyncSettings = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_SYNC_SETTINGS)
    
    public static let writeVoicemail = AndroidManifestPermission(rawValue: AndroidManifest.Permission.WRITE_VOICEMAIL)
}
