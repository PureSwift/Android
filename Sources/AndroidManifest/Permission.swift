//
//  AndroidManifestPermission.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import SwiftJava

/// Android Manifest Permission
public struct Permission: RawRepresentable, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

internal extension Permission {
    
    static let javaClass = try! JavaClass<Manifest.Permission>()
}

public extension Permission {
    
    static let acceptHandover = Permission(rawValue: javaClass.ACCEPT_HANDOVER)
    
    static let accessCheckinProperties = Permission(rawValue: javaClass.ACCESS_CHECKIN_PROPERTIES)
    
    static let accessCoarseLocation = Permission(rawValue: javaClass.ACCESS_COARSE_LOCATION)
    
    static let accessFineLocation = Permission(rawValue: javaClass.ACCESS_FINE_LOCATION)
    
    static let accessLocationExtraCommands = Permission(rawValue: javaClass.ACCESS_LOCATION_EXTRA_COMMANDS)
    
    static let accessNetworkState = Permission(rawValue: javaClass.ACCESS_NETWORK_STATE)
    
    static let accessNotificationPolicy = Permission(rawValue: javaClass.ACCESS_NOTIFICATION_POLICY)
    
    static let accessWifiState = Permission(rawValue: javaClass.ACCESS_WIFI_STATE)
    
    @available(Android 29, *)
    static let accessBackgroundLocation = Permission(rawValue: javaClass.ACCESS_BACKGROUND_LOCATION)
    
    @available(Android 29, *)
    static let accessMediaLocation = Permission(rawValue: javaClass.ACCESS_MEDIA_LOCATION)
    
    static let accountManager = Permission(rawValue: javaClass.ACCOUNT_MANAGER)
    
    @available(Android 29, *)
    static let activityRecognition = Permission(rawValue: javaClass.ACTIVITY_RECOGNITION)
    
    static let addVoicemail = Permission(rawValue: javaClass.ADD_VOICEMAIL)
    
    @available(Android 26, *)
    static let answerPhoneCalls = Permission(rawValue: javaClass.ANSWER_PHONE_CALLS)
    
    static let batteryStats = Permission(rawValue: javaClass.BATTERY_STATS)
    
    static let bindAccessibilityService = Permission(rawValue: javaClass.BIND_ACCESSIBILITY_SERVICE)
    
    static let bindAppwidget = Permission(rawValue: javaClass.BIND_APPWIDGET)
    
    static let bindAutofillService = Permission(rawValue: javaClass.BIND_AUTOFILL_SERVICE)
    
    static let bindCarrierServices = Permission(rawValue: javaClass.BIND_CARRIER_SERVICES)
    
    static let bindChooserTargetService = Permission(rawValue: javaClass.BIND_CHOOSER_TARGET_SERVICE)
    
    static let bindConditionProviderService = Permission(rawValue: javaClass.BIND_CONDITION_PROVIDER_SERVICE)
    
    static let bindDeviceAdmin = Permission(rawValue: javaClass.BIND_DEVICE_ADMIN)
    
    static let bindDreamService = Permission(rawValue: javaClass.BIND_DREAM_SERVICE)
    
    static let bindIncallService = Permission(rawValue: javaClass.BIND_INCALL_SERVICE)
    
    static let bindInputMethod = Permission(rawValue: javaClass.BIND_INPUT_METHOD)
    
    static let bindMidiDeviceService = Permission(rawValue: javaClass.BIND_MIDI_DEVICE_SERVICE)
    
    static let bindNfcService = Permission(rawValue: javaClass.BIND_NFC_SERVICE)
    
    static let bindNotificationListenerService = Permission(rawValue: javaClass.BIND_NOTIFICATION_LISTENER_SERVICE)
    
    static let bindPrintService = Permission(rawValue: javaClass.BIND_PRINT_SERVICE)
    
    static let bindQuickSettingsTile = Permission(rawValue: javaClass.BIND_QUICK_SETTINGS_TILE)
    
    static let bindRemoteviews = Permission(rawValue: javaClass.BIND_REMOTEVIEWS)
    
    static let bindScreeningService = Permission(rawValue: javaClass.BIND_SCREENING_SERVICE)
    
    static let bindTelecomConnectionService = Permission(rawValue: javaClass.BIND_TELECOM_CONNECTION_SERVICE)
    
    static let bindTextService = Permission(rawValue: javaClass.BIND_TEXT_SERVICE)
    
    static let bindTvInput = Permission(rawValue: javaClass.BIND_TV_INPUT)
    
    static let bindVisualVoicemailService = Permission(rawValue: javaClass.BIND_VISUAL_VOICEMAIL_SERVICE)
    
    static let bindVoiceInteraction = Permission(rawValue: javaClass.BIND_VOICE_INTERACTION)
    
    static let bindVpnService = Permission(rawValue: javaClass.BIND_VPN_SERVICE)
    
    static let bindVrListenerService = Permission(rawValue: javaClass.BIND_VR_LISTENER_SERVICE)
    
    static let bindWallpaper = Permission(rawValue: javaClass.BIND_WALLPAPER)
    
    static let bluetooth = Permission(rawValue: javaClass.BLUETOOTH)
    
    static let bluetoothAdmin = Permission(rawValue: javaClass.BLUETOOTH_ADMIN)
    
    static let bluetoothPrivileged = Permission(rawValue: javaClass.BLUETOOTH_PRIVILEGED)
    
    @available(Android 31, *)
    static let bluetoothAdvertise = Permission(rawValue: javaClass.BLUETOOTH_ADVERTISE)
    
    @available(Android 31, *)
    static let bluetoothConnect = Permission(rawValue: javaClass.BLUETOOTH_CONNECT)
    
    @available(Android 31, *)
    static let bluetoothScan = Permission(rawValue: javaClass.BLUETOOTH_SCAN)
    
    static let bodySensors = Permission(rawValue: javaClass.BODY_SENSORS)
    
    @available(Android 33, *)
    static let bodySensorsBackground = Permission(rawValue: javaClass.BODY_SENSORS_BACKGROUND)
    
    static let broadcastPackageRemoved = Permission(rawValue: javaClass.BROADCAST_PACKAGE_REMOVED)
    
    static let broadcastSms = Permission(rawValue: javaClass.BROADCAST_SMS)
    
    static let broadcastSticky = Permission(rawValue: javaClass.BROADCAST_STICKY)
    
    static let broadcastWapPush = Permission(rawValue: javaClass.BROADCAST_WAP_PUSH)
    
    static let callPhone = Permission(rawValue: javaClass.CALL_PHONE)
    
    static let callPrivileged = Permission(rawValue: javaClass.CALL_PRIVILEGED)
    
    static let camera = Permission(rawValue: javaClass.CAMERA)
    
    static let captureAudioOutput = Permission(rawValue: javaClass.CAPTURE_AUDIO_OUTPUT)
    
    @available(Android 21, *)
    static let captureSecureVideoOutput = Permission(rawValue: javaClass.CAPTURE_SECURE_VIDEO_OUTPUT)
    
    @available(Android 21, *)
    static let captureVideoOutput = Permission(rawValue: javaClass.CAPTURE_VIDEO_OUTPUT)
    
    static let changeComponentEnabledState = Permission(rawValue: javaClass.CHANGE_COMPONENT_ENABLED_STATE)
    
    static let changeConfiguration = Permission(rawValue: javaClass.CHANGE_CONFIGURATION)
    
    static let changeNetworkState = Permission(rawValue: javaClass.CHANGE_NETWORK_STATE)
    
    static let changeWifiMulticastState = Permission(rawValue: javaClass.CHANGE_WIFI_MULTICAST_STATE)
    
    static let changeWifiState = Permission(rawValue: javaClass.CHANGE_WIFI_STATE)
    
    static let clearAppCache = Permission(rawValue: javaClass.CLEAR_APP_CACHE)
    
    static let controlLocationUpdates = Permission(rawValue: javaClass.CONTROL_LOCATION_UPDATES)
    
    static let deleteCacheFiles = Permission(rawValue: javaClass.DELETE_CACHE_FILES)
    
    static let deletePackages = Permission(rawValue: javaClass.DELETE_PACKAGES)
    
    static let diagnostic = Permission(rawValue: javaClass.DIAGNOSTIC)
    
    static let disableKeyguard = Permission(rawValue: javaClass.DISABLE_KEYGUARD)
    
    static let dump = Permission(rawValue: javaClass.DUMP)
    
    static let expandStatusBar = Permission(rawValue: javaClass.EXPAND_STATUS_BAR)
    
    static let factoryTest = Permission(rawValue: javaClass.FACTORY_TEST)
    
    @available(Android 28, *)
    static let foregroundService = Permission(rawValue: javaClass.FOREGROUND_SERVICE)
    
    @available(Android 34, *)
    static let foregroundServiceCamera = Permission(rawValue: javaClass.FOREGROUND_SERVICE_CAMERA)
    
    @available(Android 34, *)
    static let foregroundServiceConnectedDevice = Permission(rawValue: javaClass.FOREGROUND_SERVICE_CONNECTED_DEVICE)
    
    @available(Android 34, *)
    static let foregroundServiceDataSync = Permission(rawValue: javaClass.FOREGROUND_SERVICE_DATA_SYNC)
    
    @available(Android 34, *)
    static let foregroundServiceHealth = Permission(rawValue: javaClass.FOREGROUND_SERVICE_HEALTH)
    
    @available(Android 34, *)
    static let foregroundServiceLocation = Permission(rawValue: javaClass.FOREGROUND_SERVICE_LOCATION)
    
    @available(Android 34, *)
    static let foregroundServiceMediaPlayback = Permission(rawValue: javaClass.FOREGROUND_SERVICE_MEDIA_PLAYBACK)
    
    @available(Android 34, *)
    static let foregroundServiceMediaProjection = Permission(rawValue: javaClass.FOREGROUND_SERVICE_MEDIA_PROJECTION)
    
    @available(Android 34, *)
    static let foregroundServiceMicrophone = Permission(rawValue: javaClass.FOREGROUND_SERVICE_MICROPHONE)
    
    @available(Android 34, *)
    static let foregroundServicePhoneCall = Permission(rawValue: javaClass.FOREGROUND_SERVICE_PHONE_CALL)
    
    @available(Android 34, *)
    static let foregroundServiceRemoteMessaging = Permission(rawValue: javaClass.FOREGROUND_SERVICE_REMOTE_MESSAGING)
    
    @available(Android 34, *)
    static let foregroundServiceSpecialUse = Permission(rawValue: javaClass.FOREGROUND_SERVICE_SPECIAL_USE)
    
    @available(Android 34, *)
    static let foregroundServiceSystemExempted = Permission(rawValue: javaClass.FOREGROUND_SERVICE_SYSTEM_EXEMPTED)
    
    static let getAccounts = Permission(rawValue: javaClass.GET_ACCOUNTS)
    
    static let getAccountsPrivileged = Permission(rawValue: javaClass.GET_ACCOUNTS_PRIVILEGED)
    
    static let getPackageSize = Permission(rawValue: javaClass.GET_PACKAGE_SIZE)
    
    static let globalSearch = Permission(rawValue: javaClass.GLOBAL_SEARCH)
    
    static let installLocationProvider = Permission(rawValue: javaClass.INSTALL_LOCATION_PROVIDER)
    
    static let installPackages = Permission(rawValue: javaClass.INSTALL_PACKAGES)
    
    static let installShortcut = Permission(rawValue: javaClass.INSTALL_SHORTCUT)
    
    static let instantAppForegroundService = Permission(rawValue: javaClass.INSTANT_APP_FOREGROUND_SERVICE)
    
    static let internet = Permission(rawValue: javaClass.INTERNET)
    
    static let killBackgroundProcesses = Permission(rawValue: javaClass.KILL_BACKGROUND_PROCESSES)
    
    static let locationHardware = Permission(rawValue: javaClass.LOCATION_HARDWARE)
    
    static let manageDocuments = Permission(rawValue: javaClass.MANAGE_DOCUMENTS)
    
    static let manageOwnCalls = Permission(rawValue: javaClass.MANAGE_OWN_CALLS)
    
    @available(Android 30, *)
    static let manageExternalStorage = Permission(rawValue: javaClass.MANAGE_EXTERNAL_STORAGE)
    
    @available(Android 31, *)
    static let manageMedia = Permission(rawValue: javaClass.MANAGE_MEDIA)
    
    @available(Android 31, *)
    static let manageOngoingCalls = Permission(rawValue: javaClass.MANAGE_ONGOING_CALLS)
    
    static let masterClear = Permission(rawValue: javaClass.MASTER_CLEAR)
    
    static let mediaContentControl = Permission(rawValue: javaClass.MEDIA_CONTENT_CONTROL)
    
    static let modifyAudioSettings = Permission(rawValue: javaClass.MODIFY_AUDIO_SETTINGS)
    
    static let modifyPhoneState = Permission(rawValue: javaClass.MODIFY_PHONE_STATE)
    
    static let mountFormatFilesystems = Permission(rawValue: javaClass.MOUNT_FORMAT_FILESYSTEMS)
    
    static let mountUnmountFilesystems = Permission(rawValue: javaClass.MOUNT_UNMOUNT_FILESYSTEMS)
    
    static let nfc = Permission(rawValue: javaClass.NFC)
    
    static let nfcTransactionEvent = Permission(rawValue: javaClass.NFC_TRANSACTION_EVENT)
    
    @available(Android 33, *)
    static let nfcPreferredPaymentInfo = Permission(rawValue: javaClass.NFC_PREFERRED_PAYMENT_INFO)
    
    @available(Android 33, *)
    static let nearbyWifiDevices = Permission(rawValue: javaClass.NEARBY_WIFI_DEVICES)
    
    static let packageUsageStats = Permission(rawValue: javaClass.PACKAGE_USAGE_STATS)
    
    @available(Android 33, *)
    static let postNotifications = Permission(rawValue: javaClass.POST_NOTIFICATIONS)
    
    static let processOutgoingCalls = Permission(rawValue: javaClass.PROCESS_OUTGOING_CALLS)
    
    static let readCalendar = Permission(rawValue: javaClass.READ_CALENDAR)
    
    static let readCallLog = Permission(rawValue: javaClass.READ_CALL_LOG)
    
    static let readContacts = Permission(rawValue: javaClass.READ_CONTACTS)
    
    static let readExternalStorage = Permission(rawValue: javaClass.READ_EXTERNAL_STORAGE)
    
    @available(Android 33, *)
    static let readMediaAudio = Permission(rawValue: javaClass.READ_MEDIA_AUDIO)
    
    @available(Android 33, *)
    static let readMediaImages = Permission(rawValue: javaClass.READ_MEDIA_IMAGES)
    
    @available(Android 33, *)
    static let readMediaVideo = Permission(rawValue: javaClass.READ_MEDIA_VIDEO)
    
    @available(Android 34, *)
    static let readMediaVisualUserSelected = Permission(rawValue: javaClass.READ_MEDIA_VISUAL_USER_SELECTED)
    
    @available(Android 21, *)
    static let readFrameBuffer = Permission(rawValue: javaClass.READ_FRAME_BUFFER)
    
    static let readLogs = Permission(rawValue: javaClass.READ_LOGS)
    
    @available(Android 26, *)
    static let readPhoneNumbers = Permission(rawValue: javaClass.READ_PHONE_NUMBERS)
    
    static let readPhoneState = Permission(rawValue: javaClass.READ_PHONE_STATE)
    
    static let readSms = Permission(rawValue: javaClass.READ_SMS)
    
    static let readSyncSettings = Permission(rawValue: javaClass.READ_SYNC_SETTINGS)
    
    static let readSyncStats = Permission(rawValue: javaClass.READ_SYNC_STATS)
    
    static let readVoicemail = Permission(rawValue: javaClass.READ_VOICEMAIL)
    
    static let reboot = Permission(rawValue: javaClass.REBOOT)
    
    static let receiveBootCompleted = Permission(rawValue: javaClass.RECEIVE_BOOT_COMPLETED)
    
    static let receiveMms = Permission(rawValue: javaClass.RECEIVE_MMS)
    
    static let receiveSms = Permission(rawValue: javaClass.RECEIVE_SMS)
    
    static let receiveWapPush = Permission(rawValue: javaClass.RECEIVE_WAP_PUSH)
    
    static let recordAudio = Permission(rawValue: javaClass.RECORD_AUDIO)
    
    static let reorderTasks = Permission(rawValue: javaClass.REORDER_TASKS)
    
    static let requestCompanionRunInBackground = Permission(rawValue: javaClass.REQUEST_COMPANION_RUN_IN_BACKGROUND)
    
    static let requestCompanionUseDataInBackground = Permission(rawValue: javaClass.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND)
    
    static let requestDeletePackages = Permission(rawValue: javaClass.REQUEST_DELETE_PACKAGES)
    
    static let requestIgnoreBatteryOptimizations = Permission(rawValue: javaClass.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
    
    static let requestInstallPackages = Permission(rawValue: javaClass.REQUEST_INSTALL_PACKAGES)
    
    @available(Android 31, *)
    static let requestPasswordComplexity = Permission(rawValue: javaClass.REQUEST_PASSWORD_COMPLEXITY)
    
    @available(Android 31, *)
    static let scheduleExactAlarm = Permission(rawValue: javaClass.SCHEDULE_EXACT_ALARM)
    
    static let sendRespondViaMessage = Permission(rawValue: javaClass.SEND_RESPOND_VIA_MESSAGE)
    
    static let sendSms = Permission(rawValue: javaClass.SEND_SMS)
    
    static let setAlarm = Permission(rawValue: javaClass.SET_ALARM)
    
    static let setAlwaysFinish = Permission(rawValue: javaClass.SET_ALWAYS_FINISH)
    
    static let setAnimationScale = Permission(rawValue: javaClass.SET_ANIMATION_SCALE)
    
    static let setDebugApp = Permission(rawValue: javaClass.SET_DEBUG_APP)
    
    static let setProcessLimit = Permission(rawValue: javaClass.SET_PROCESS_LIMIT)
    
    static let setTime = Permission(rawValue: javaClass.SET_TIME)
    
    static let setTimeZone = Permission(rawValue: javaClass.SET_TIME_ZONE)
    
    static let setWallpaper = Permission(rawValue: javaClass.SET_WALLPAPER)
    
    static let setWallpaperHints = Permission(rawValue: javaClass.SET_WALLPAPER_HINTS)
    
    static let signalPersistentProcesses = Permission(rawValue: javaClass.SIGNAL_PERSISTENT_PROCESSES)
    
    static let statusBar = Permission(rawValue: javaClass.STATUS_BAR)
    
    static let systemAlertWindow = Permission(rawValue: javaClass.SYSTEM_ALERT_WINDOW)
    
    static let transmitIr = Permission(rawValue: javaClass.TRANSMIT_IR)
    
    static let uninstallShortcut = Permission(rawValue: javaClass.UNINSTALL_SHORTCUT)
    
    static let updateDeviceStats = Permission(rawValue: javaClass.UPDATE_DEVICE_STATS)
    
    static let useBiometric = Permission(rawValue: javaClass.USE_BIOMETRIC)
    
    @available(Android 33, *)
    static let useExactAlarm = Permission(rawValue: javaClass.USE_EXACT_ALARM)
    
    @available(Android 29, *)
    static let useFullScreenIntent = Permission(rawValue: javaClass.USE_FULL_SCREEN_INTENT)
    
    static let useSip = Permission(rawValue: javaClass.USE_SIP)
    
    @available(Android 31, *)
    static let uwbRanging = Permission(rawValue: javaClass.UWB_RANGING)
    
    static let vibrate = Permission(rawValue: javaClass.VIBRATE)
    
    static let wakeLock = Permission(rawValue: javaClass.WAKE_LOCK)
    
    static let writeApnSettings = Permission(rawValue: javaClass.WRITE_APN_SETTINGS)
    
    static let writeCalendar = Permission(rawValue: javaClass.WRITE_CALENDAR)
    
    static let writeCallLog = Permission(rawValue: javaClass.WRITE_CALL_LOG)
    
    static let writeContacts = Permission(rawValue: javaClass.WRITE_CONTACTS)
    
    static let writeExternalStorage = Permission(rawValue: javaClass.WRITE_EXTERNAL_STORAGE)
    
    static let writeGservices = Permission(rawValue: javaClass.WRITE_GSERVICES)
    
    static let writeSecureSettings = Permission(rawValue: javaClass.WRITE_SECURE_SETTINGS)
    
    static let writeSettings = Permission(rawValue: javaClass.WRITE_SETTINGS)
    
    static let writeSyncSettings = Permission(rawValue: javaClass.WRITE_SYNC_SETTINGS)
    
    static let writeVoicemail = Permission(rawValue: javaClass.WRITE_VOICEMAIL)
}
