//
//  AndroidManifestPermission.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import JavaKit

public struct Permission: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension Permission {
    
    public static let acceptHandover = Permission(rawValue: AndroidManifest.Permission.ACCEPT_HANDOVER)
    
    public static let accessCheckinProperties = Permission(rawValue: AndroidManifest.Permission.ACCESS_CHECKIN_PROPERTIES)
    
    public static let accessCoarseLocation = Permission(rawValue: AndroidManifest.Permission.ACCESS_COARSE_LOCATION)
    
    public static let accessFineLocation = Permission(rawValue: AndroidManifest.Permission.ACCESS_FINE_LOCATION)
    
    public static let accessLocationExtraCommands = Permission(rawValue: AndroidManifest.Permission.ACCESS_LOCATION_EXTRA_COMMANDS)
    
    public static let accessNetworkState = Permission(rawValue: AndroidManifest.Permission.ACCESS_NETWORK_STATE)
    
    public static let accessNotificationPolicy = Permission(rawValue: AndroidManifest.Permission.ACCESS_NOTIFICATION_POLICY)
    
    public static let accessWifiState = Permission(rawValue: AndroidManifest.Permission.ACCESS_WIFI_STATE)
    
    public static let accountManager = Permission(rawValue: AndroidManifest.Permission.ACCOUNT_MANAGER)
    
    public static let addVoicemail = Permission(rawValue: AndroidManifest.Permission.ADD_VOICEMAIL)
    
    public static let answerPhoneCalls = Permission(rawValue: AndroidManifest.Permission.ANSWER_PHONE_CALLS)
    
    public static let batteryStats = Permission(rawValue: AndroidManifest.Permission.BATTERY_STATS)
    
    public static let bindAccessibilityService = Permission(rawValue: AndroidManifest.Permission.BIND_ACCESSIBILITY_SERVICE)
    
    public static let bindAppwidget = Permission(rawValue: AndroidManifest.Permission.BIND_APPWIDGET)
    
    public static let bindAutofillService = Permission(rawValue: AndroidManifest.Permission.BIND_AUTOFILL_SERVICE)
    
    public static let bindCarrierServices = Permission(rawValue: AndroidManifest.Permission.BIND_CARRIER_SERVICES)
    
    public static let bindChooserTargetService = Permission(rawValue: AndroidManifest.Permission.BIND_CHOOSER_TARGET_SERVICE)
    
    public static let bindConditionProviderService = Permission(rawValue: AndroidManifest.Permission.BIND_CONDITION_PROVIDER_SERVICE)
    
    public static let bindDeviceAdmin = Permission(rawValue: AndroidManifest.Permission.BIND_DEVICE_ADMIN)
    
    public static let bindDreamService = Permission(rawValue: AndroidManifest.Permission.BIND_DREAM_SERVICE)
    
    public static let bindIncallService = Permission(rawValue: AndroidManifest.Permission.BIND_INCALL_SERVICE)
    
    public static let bindInputMethod = Permission(rawValue: AndroidManifest.Permission.BIND_INPUT_METHOD)
    
    public static let bindMidiDeviceService = Permission(rawValue: AndroidManifest.Permission.BIND_MIDI_DEVICE_SERVICE)
    
    public static let bindNfcService = Permission(rawValue: AndroidManifest.Permission.BIND_NFC_SERVICE)
    
    public static let bindNotificationListenerService = Permission(rawValue: AndroidManifest.Permission.BIND_NOTIFICATION_LISTENER_SERVICE)
    
    public static let bindPrintService = Permission(rawValue: AndroidManifest.Permission.BIND_PRINT_SERVICE)
    
    public static let bindQuickSettingsTile = Permission(rawValue: AndroidManifest.Permission.BIND_QUICK_SETTINGS_TILE)
    
    public static let bindRemoteviews = Permission(rawValue: AndroidManifest.Permission.BIND_REMOTEVIEWS)
    
    public static let bindScreeningService = Permission(rawValue: AndroidManifest.Permission.BIND_SCREENING_SERVICE)
    
    public static let bindTelecomConnectionService = Permission(rawValue: AndroidManifest.Permission.BIND_TELECOM_CONNECTION_SERVICE)
    
    public static let bindTextService = Permission(rawValue: AndroidManifest.Permission.BIND_TEXT_SERVICE)
    
    public static let bindTvInput = Permission(rawValue: AndroidManifest.Permission.BIND_TV_INPUT)
    
    public static let bindVisualVoicemailService = Permission(rawValue: AndroidManifest.Permission.BIND_VISUAL_VOICEMAIL_SERVICE)
    
    public static let bindVoiceInteraction = Permission(rawValue: AndroidManifest.Permission.BIND_VOICE_INTERACTION)
    
    public static let bindVpnService = Permission(rawValue: AndroidManifest.Permission.BIND_VPN_SERVICE)
    
    public static let bindVrListenerService = Permission(rawValue: AndroidManifest.Permission.BIND_VR_LISTENER_SERVICE)
    
    public static let bindWallpaper = Permission(rawValue: AndroidManifest.Permission.BIND_WALLPAPER)
    
    public static let bluetooth = Permission(rawValue: AndroidManifest.Permission.BLUETOOTH)
    
    public static let bluetoothAdmin = Permission(rawValue: AndroidManifest.Permission.BLUETOOTH_ADMIN)
    
    public static let bluetoothPrivileged = Permission(rawValue: AndroidManifest.Permission.BLUETOOTH_PRIVILEGED)
    
    public static let bodySensors = Permission(rawValue: AndroidManifest.Permission.BODY_SENSORS)
    
    public static let broadcastPackageRemoved = Permission(rawValue: AndroidManifest.Permission.BROADCAST_PACKAGE_REMOVED)
    
    public static let broadcastSms = Permission(rawValue: AndroidManifest.Permission.BROADCAST_SMS)
    
    public static let broadcastSticky = Permission(rawValue: AndroidManifest.Permission.BROADCAST_STICKY)
    
    public static let broadcastWapPush = Permission(rawValue: AndroidManifest.Permission.BROADCAST_WAP_PUSH)
    
    public static let callPhone = Permission(rawValue: AndroidManifest.Permission.CALL_PHONE)
    
    public static let callPrivileged = Permission(rawValue: AndroidManifest.Permission.CALL_PRIVILEGED)
    
    public static let camera = Permission(rawValue: AndroidManifest.Permission.CAMERA)
    
    public static let captureAudioOutput = Permission(rawValue: AndroidManifest.Permission.CAPTURE_AUDIO_OUTPUT)
    
    public static let captureSecureVideoOutput = Permission(rawValue: AndroidManifest.Permission.CAPTURE_SECURE_VIDEO_OUTPUT)
    
    public static let captureVideoOutput = Permission(rawValue: AndroidManifest.Permission.CAPTURE_VIDEO_OUTPUT)
    
    public static let changeComponentEnabledState = Permission(rawValue: AndroidManifest.Permission.CHANGE_COMPONENT_ENABLED_STATE)
    
    public static let changeConfiguration = Permission(rawValue: AndroidManifest.Permission.CHANGE_CONFIGURATION)
    
    public static let changeNetworkState = Permission(rawValue: AndroidManifest.Permission.CHANGE_NETWORK_STATE)
    
    public static let changeWifiMulticastState = Permission(rawValue: AndroidManifest.Permission.CHANGE_WIFI_MULTICAST_STATE)
    
    public static let changeWifiState = Permission(rawValue: AndroidManifest.Permission.CHANGE_WIFI_STATE)
    
    public static let clearAppCache = Permission(rawValue: AndroidManifest.Permission.CLEAR_APP_CACHE)
    
    public static let controlLocationUpdates = Permission(rawValue: AndroidManifest.Permission.CONTROL_LOCATION_UPDATES)
    
    public static let deleteCacheFiles = Permission(rawValue: AndroidManifest.Permission.DELETE_CACHE_FILES)
    
    public static let deletePackages = Permission(rawValue: AndroidManifest.Permission.DELETE_PACKAGES)
    
    public static let diagnostic = Permission(rawValue: AndroidManifest.Permission.DIAGNOSTIC)
    
    public static let disableKeyguard = Permission(rawValue: AndroidManifest.Permission.DISABLE_KEYGUARD)
    
    public static let dump = Permission(rawValue: AndroidManifest.Permission.DUMP)
    
    public static let expandStatusBar = Permission(rawValue: AndroidManifest.Permission.EXPAND_STATUS_BAR)
    
    public static let factoryTest = Permission(rawValue: AndroidManifest.Permission.FACTORY_TEST)
    
    public static let foregroundService = Permission(rawValue: AndroidManifest.Permission.FOREGROUND_SERVICE)
    
    public static let getAccounts = Permission(rawValue: AndroidManifest.Permission.GET_ACCOUNTS)
    
    public static let getAccountsPrivileged = Permission(rawValue: AndroidManifest.Permission.GET_ACCOUNTS_PRIVILEGED)
    
    public static let getPackageSize = Permission(rawValue: AndroidManifest.Permission.GET_PACKAGE_SIZE)
    
    public static let globalSearch = Permission(rawValue: AndroidManifest.Permission.GLOBAL_SEARCH)
    
    public static let installLocationProvider = Permission(rawValue: AndroidManifest.Permission.INSTALL_LOCATION_PROVIDER)
    
    public static let installPackages = Permission(rawValue: AndroidManifest.Permission.INSTALL_PACKAGES)
    
    public static let installShortcut = Permission(rawValue: AndroidManifest.Permission.INSTALL_SHORTCUT)
    
    public static let instantAppForegroundService = Permission(rawValue: AndroidManifest.Permission.INSTANT_APP_FOREGROUND_SERVICE)
    
    public static let internet = Permission(rawValue: AndroidManifest.Permission.INTERNET)
    
    public static let killBackgroundProcesses = Permission(rawValue: AndroidManifest.Permission.KILL_BACKGROUND_PROCESSES)
    
    public static let locationHardware = Permission(rawValue: AndroidManifest.Permission.LOCATION_HARDWARE)
    
    public static let manageDocuments = Permission(rawValue: AndroidManifest.Permission.MANAGE_DOCUMENTS)
    
    public static let manageOwnCalls = Permission(rawValue: AndroidManifest.Permission.MANAGE_OWN_CALLS)
    
    public static let masterClear = Permission(rawValue: AndroidManifest.Permission.MASTER_CLEAR)
    
    public static let mediaContentControl = Permission(rawValue: AndroidManifest.Permission.MEDIA_CONTENT_CONTROL)
    
    public static let modifyAudioSettings = Permission(rawValue: AndroidManifest.Permission.MODIFY_AUDIO_SETTINGS)
    
    public static let modifyPhoneState = Permission(rawValue: AndroidManifest.Permission.MODIFY_PHONE_STATE)
    
    public static let mountFormatFilesystems = Permission(rawValue: AndroidManifest.Permission.MOUNT_FORMAT_FILESYSTEMS)
    
    public static let mountUnmountFilesystems = Permission(rawValue: AndroidManifest.Permission.MOUNT_UNMOUNT_FILESYSTEMS)
    
    public static let nfc = Permission(rawValue: AndroidManifest.Permission.NFC)
    
    public static let nfcTransactionEvent = Permission(rawValue: AndroidManifest.Permission.NFC_TRANSACTION_EVENT)
    
    public static let packageUsageStats = Permission(rawValue: AndroidManifest.Permission.PACKAGE_USAGE_STATS)
    
    public static let processOutgoingCalls = Permission(rawValue: AndroidManifest.Permission.PROCESS_OUTGOING_CALLS)
    
    public static let readCalendar = Permission(rawValue: AndroidManifest.Permission.READ_CALENDAR)
    
    public static let readCallLog = Permission(rawValue: AndroidManifest.Permission.READ_CALL_LOG)
    
    public static let readContacts = Permission(rawValue: AndroidManifest.Permission.READ_CONTACTS)
    
    public static let readExternalStorage = Permission(rawValue: AndroidManifest.Permission.READ_EXTERNAL_STORAGE)
    
    public static let readFrameBuffer = Permission(rawValue: AndroidManifest.Permission.READ_FRAME_BUFFER)
    
    public static let readLogs = Permission(rawValue: AndroidManifest.Permission.READ_LOGS)
    
    public static let readPhoneNumbers = Permission(rawValue: AndroidManifest.Permission.READ_PHONE_NUMBERS)
    
    public static let readPhoneState = Permission(rawValue: AndroidManifest.Permission.READ_PHONE_STATE)
    
    public static let readSms = Permission(rawValue: AndroidManifest.Permission.READ_SMS)
    
    public static let readSyncSettings = Permission(rawValue: AndroidManifest.Permission.READ_SYNC_SETTINGS)
    
    public static let readSyncStats = Permission(rawValue: AndroidManifest.Permission.READ_SYNC_STATS)
    
    public static let readVoicemail = Permission(rawValue: AndroidManifest.Permission.READ_VOICEMAIL)
    
    public static let reboot = Permission(rawValue: AndroidManifest.Permission.REBOOT)
    
    public static let receiveBootCompleted = Permission(rawValue: AndroidManifest.Permission.RECEIVE_BOOT_COMPLETED)
    
    public static let receiveMms = Permission(rawValue: AndroidManifest.Permission.RECEIVE_MMS)
    
    public static let receiveSms = Permission(rawValue: AndroidManifest.Permission.RECEIVE_SMS)
    
    public static let receiveWapPush = Permission(rawValue: AndroidManifest.Permission.RECEIVE_WAP_PUSH)
    
    public static let recordAudio = Permission(rawValue: AndroidManifest.Permission.RECORD_AUDIO)
    
    public static let reorderTasks = Permission(rawValue: AndroidManifest.Permission.REORDER_TASKS)
    
    public static let requestCompanionRunInBackground = Permission(rawValue: AndroidManifest.Permission.REQUEST_COMPANION_RUN_IN_BACKGROUND)
    
    public static let requestCompanionUseDataInBackground = Permission(rawValue: AndroidManifest.Permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND)
    
    public static let requestDeletePackages = Permission(rawValue: AndroidManifest.Permission.REQUEST_DELETE_PACKAGES)
    
    public static let requestIgnoreBatteryOptimizations = Permission(rawValue: AndroidManifest.Permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
    
    public static let requestInstallPackages = Permission(rawValue: AndroidManifest.Permission.REQUEST_INSTALL_PACKAGES)
    
    public static let sendRespondViaMessage = Permission(rawValue: AndroidManifest.Permission.SEND_RESPOND_VIA_MESSAGE)
    
    public static let sendSms = Permission(rawValue: AndroidManifest.Permission.SEND_SMS)
    
    public static let setAlarm = Permission(rawValue: AndroidManifest.Permission.SET_ALARM)
    
    public static let setAlwaysFinish = Permission(rawValue: AndroidManifest.Permission.SET_ALWAYS_FINISH)
    
    public static let setAnimationScale = Permission(rawValue: AndroidManifest.Permission.SET_ANIMATION_SCALE)
    
    public static let setDebugApp = Permission(rawValue: AndroidManifest.Permission.SET_DEBUG_APP)
    
    public static let setProcessLimit = Permission(rawValue: AndroidManifest.Permission.SET_PROCESS_LIMIT)
    
    public static let setTime = Permission(rawValue: AndroidManifest.Permission.SET_TIME)
    
    public static let setTimeZone = Permission(rawValue: AndroidManifest.Permission.SET_TIME_ZONE)
    
    public static let setWallpaper = Permission(rawValue: AndroidManifest.Permission.SET_WALLPAPER)
    
    public static let setWallpaperHints = Permission(rawValue: AndroidManifest.Permission.SET_WALLPAPER_HINTS)
    
    public static let signalPersistentProcesses = Permission(rawValue: AndroidManifest.Permission.SIGNAL_PERSISTENT_PROCESSES)
    
    public static let statusBar = Permission(rawValue: AndroidManifest.Permission.STATUS_BAR)
    
    public static let systemAlertWindow = Permission(rawValue: AndroidManifest.Permission.SYSTEM_ALERT_WINDOW)
    
    public static let transmitIr = Permission(rawValue: AndroidManifest.Permission.TRANSMIT_IR)
    
    public static let uninstallShortcut = Permission(rawValue: AndroidManifest.Permission.UNINSTALL_SHORTCUT)
    
    public static let updateDeviceStats = Permission(rawValue: AndroidManifest.Permission.UPDATE_DEVICE_STATS)
    
    public static let useBiometric = Permission(rawValue: AndroidManifest.Permission.USE_BIOMETRIC)
    
    public static let useSip = Permission(rawValue: AndroidManifest.Permission.USE_SIP)
    
    public static let vibrate = Permission(rawValue: AndroidManifest.Permission.VIBRATE)
    
    public static let wakeLock = Permission(rawValue: AndroidManifest.Permission.WAKE_LOCK)
    
    public static let writeApnSettings = Permission(rawValue: AndroidManifest.Permission.WRITE_APN_SETTINGS)
    
    public static let writeCalendar = Permission(rawValue: AndroidManifest.Permission.WRITE_CALENDAR)
    
    public static let writeCallLog = Permission(rawValue: AndroidManifest.Permission.WRITE_CALL_LOG)
    
    public static let writeContacts = Permission(rawValue: AndroidManifest.Permission.WRITE_CONTACTS)
    
    public static let writeExternalStorage = Permission(rawValue: AndroidManifest.Permission.WRITE_EXTERNAL_STORAGE)
    
    public static let writeGservices = Permission(rawValue: AndroidManifest.Permission.WRITE_GSERVICES)
    
    public static let writeSecureSettings = Permission(rawValue: AndroidManifest.Permission.WRITE_SECURE_SETTINGS)
    
    public static let writeSettings = Permission(rawValue: AndroidManifest.Permission.WRITE_SETTINGS)
    
    public static let writeSyncSettings = Permission(rawValue: AndroidManifest.Permission.WRITE_SYNC_SETTINGS)
    
    public static let writeVoicemail = Permission(rawValue: AndroidManifest.Permission.WRITE_VOICEMAIL)
}
