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
    
    static var acceptHandover: Permission { Permission(rawValue: "android.permission.ACCEPT_HANDOVER") }
    static var accessCheckinProperties: Permission { Permission(rawValue: "android.permission.ACCESS_CHECKIN_PROPERTIES") }
    static var accessCoarseLocation: Permission { Permission(rawValue: "android.permission.ACCESS_COARSE_LOCATION") }
    static var accessFineLocation: Permission { Permission(rawValue: "android.permission.ACCESS_FINE_LOCATION") }
    static var accessLocationExtraCommands: Permission { Permission(rawValue: "android.permission.ACCESS_LOCATION_EXTRA_COMMANDS") }
    static var accessNetworkState: Permission { Permission(rawValue: "android.permission.ACCESS_NETWORK_STATE") }
    static var accessNotificationPolicy: Permission { Permission(rawValue: "android.permission.ACCESS_NOTIFICATION_POLICY") }
    static var accessWifiState: Permission { Permission(rawValue: "android.permission.ACCESS_WIFI_STATE") }
    @available(Android 29, *)
    static var accessBackgroundLocation: Permission { Permission(rawValue: "android.permission.ACCESS_BACKGROUND_LOCATION") }
    @available(Android 29, *)
    static var accessMediaLocation: Permission { Permission(rawValue: "android.permission.ACCESS_MEDIA_LOCATION") }
    static var accountManager: Permission { Permission(rawValue: "android.permission.ACCOUNT_MANAGER") }
    @available(Android 29, *)
    static var activityRecognition: Permission { Permission(rawValue: "android.permission.ACTIVITY_RECOGNITION") }
    static var addVoicemail: Permission { Permission(rawValue: "com.android.voicemail.permission.ADD_VOICEMAIL") }
    @available(Android 26, *)
    static var answerPhoneCalls: Permission { Permission(rawValue: "android.permission.ANSWER_PHONE_CALLS") }
    static var batteryStats: Permission { Permission(rawValue: "android.permission.BATTERY_STATS") }
    static var bindAccessibilityService: Permission { Permission(rawValue: "android.permission.BIND_ACCESSIBILITY_SERVICE") }
    static var bindAppwidget: Permission { Permission(rawValue: "android.permission.BIND_APPWIDGET") }
    static var bindAutofillService: Permission { Permission(rawValue: "android.permission.BIND_AUTOFILL_SERVICE") }
    static var bindCarrierServices: Permission { Permission(rawValue: "android.permission.BIND_CARRIER_SERVICES") }
    static var bindChooserTargetService: Permission { Permission(rawValue: "android.permission.BIND_CHOOSER_TARGET_SERVICE") }
    static var bindConditionProviderService: Permission { Permission(rawValue: "android.permission.BIND_CONDITION_PROVIDER_SERVICE") }
    static var bindDeviceAdmin: Permission { Permission(rawValue: "android.permission.BIND_DEVICE_ADMIN") }
    static var bindDreamService: Permission { Permission(rawValue: "android.permission.BIND_DREAM_SERVICE") }
    static var bindIncallService: Permission { Permission(rawValue: "android.permission.BIND_INCALL_SERVICE") }
    static var bindInputMethod: Permission { Permission(rawValue: "android.permission.BIND_INPUT_METHOD") }
    static var bindMidiDeviceService: Permission { Permission(rawValue: "android.permission.BIND_MIDI_DEVICE_SERVICE") }
    static var bindNfcService: Permission { Permission(rawValue: "android.permission.BIND_NFC_SERVICE") }
    static var bindNotificationListenerService: Permission { Permission(rawValue: "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE") }
    static var bindPrintService: Permission { Permission(rawValue: "android.permission.BIND_PRINT_SERVICE") }
    static var bindQuickSettingsTile: Permission { Permission(rawValue: "android.permission.BIND_QUICK_SETTINGS_TILE") }
    static var bindRemoteviews: Permission { Permission(rawValue: "android.permission.BIND_REMOTEVIEWS") }
    static var bindScreeningService: Permission { Permission(rawValue: "android.permission.BIND_SCREENING_SERVICE") }
    static var bindTelecomConnectionService: Permission { Permission(rawValue: "android.permission.BIND_TELECOM_CONNECTION_SERVICE") }
    static var bindTextService: Permission { Permission(rawValue: "android.permission.BIND_TEXT_SERVICE") }
    static var bindTvInput: Permission { Permission(rawValue: "android.permission.BIND_TV_INPUT") }
    static var bindVisualVoicemailService: Permission { Permission(rawValue: "android.permission.BIND_VISUAL_VOICEMAIL_SERVICE") }
    static var bindVoiceInteraction: Permission { Permission(rawValue: "android.permission.BIND_VOICE_INTERACTION") }
    static var bindVpnService: Permission { Permission(rawValue: "android.permission.BIND_VPN_SERVICE") }
    static var bindVrListenerService: Permission { Permission(rawValue: "android.permission.BIND_VR_LISTENER_SERVICE") }
    static var bindWallpaper: Permission { Permission(rawValue: "android.permission.BIND_WALLPAPER") }
    static var bluetooth: Permission { Permission(rawValue: "android.permission.BLUETOOTH") }
    static var bluetoothAdmin: Permission { Permission(rawValue: "android.permission.BLUETOOTH_ADMIN") }
    static var bluetoothPrivileged: Permission { Permission(rawValue: "android.permission.BLUETOOTH_PRIVILEGED") }
    @available(Android 31, *)
    static var bluetoothAdvertise: Permission { Permission(rawValue: "android.permission.BLUETOOTH_ADVERTISE") }
    @available(Android 31, *)
    static var bluetoothConnect: Permission { Permission(rawValue: "android.permission.BLUETOOTH_CONNECT") }
    @available(Android 31, *)
    static var bluetoothScan: Permission { Permission(rawValue: "android.permission.BLUETOOTH_SCAN") }
    static var bodySensors: Permission { Permission(rawValue: "android.permission.BODY_SENSORS") }
    @available(Android 33, *)
    static var bodySensorsBackground: Permission { Permission(rawValue: "android.permission.BODY_SENSORS_BACKGROUND") }
    static var broadcastPackageRemoved: Permission { Permission(rawValue: "android.permission.BROADCAST_PACKAGE_REMOVED") }
    static var broadcastSms: Permission { Permission(rawValue: "android.permission.BROADCAST_SMS") }
    static var broadcastSticky: Permission { Permission(rawValue: "android.permission.BROADCAST_STICKY") }
    static var broadcastWapPush: Permission { Permission(rawValue: "android.permission.BROADCAST_WAP_PUSH") }
    static var callPhone: Permission { Permission(rawValue: "android.permission.CALL_PHONE") }
    static var callPrivileged: Permission { Permission(rawValue: "android.permission.CALL_PRIVILEGED") }
    static var camera: Permission { Permission(rawValue: "android.permission.CAMERA") }
    static var captureAudioOutput: Permission { Permission(rawValue: "android.permission.CAPTURE_AUDIO_OUTPUT") }
    @available(Android 21, *)
    static var captureSecureVideoOutput: Permission { Permission(rawValue: "android.permission.CAPTURE_SECURE_VIDEO_OUTPUT") }
    @available(Android 21, *)
    static var captureVideoOutput: Permission { Permission(rawValue: "android.permission.CAPTURE_VIDEO_OUTPUT") }
    static var changeComponentEnabledState: Permission { Permission(rawValue: "android.permission.CHANGE_COMPONENT_ENABLED_STATE") }
    static var changeConfiguration: Permission { Permission(rawValue: "android.permission.CHANGE_CONFIGURATION") }
    static var changeNetworkState: Permission { Permission(rawValue: "android.permission.CHANGE_NETWORK_STATE") }
    static var changeWifiMulticastState: Permission { Permission(rawValue: "android.permission.CHANGE_WIFI_MULTICAST_STATE") }
    static var changeWifiState: Permission { Permission(rawValue: "android.permission.CHANGE_WIFI_STATE") }
    static var clearAppCache: Permission { Permission(rawValue: "android.permission.CLEAR_APP_CACHE") }
    static var controlLocationUpdates: Permission { Permission(rawValue: "android.permission.CONTROL_LOCATION_UPDATES") }
    static var deleteCacheFiles: Permission { Permission(rawValue: "android.permission.DELETE_CACHE_FILES") }
    static var deletePackages: Permission { Permission(rawValue: "android.permission.DELETE_PACKAGES") }
    static var diagnostic: Permission { Permission(rawValue: "android.permission.DIAGNOSTIC") }
    static var disableKeyguard: Permission { Permission(rawValue: "android.permission.DISABLE_KEYGUARD") }
    static var dump: Permission { Permission(rawValue: "android.permission.DUMP") }
    static var expandStatusBar: Permission { Permission(rawValue: "android.permission.EXPAND_STATUS_BAR") }
    static var factoryTest: Permission { Permission(rawValue: "android.permission.FACTORY_TEST") }
    @available(Android 28, *)
    static var foregroundService: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE") }
    @available(Android 34, *)
    static var foregroundServiceCamera: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_CAMERA") }
    @available(Android 34, *)
    static var foregroundServiceConnectedDevice: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_CONNECTED_DEVICE") }
    @available(Android 34, *)
    static var foregroundServiceDataSync: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_DATA_SYNC") }
    @available(Android 34, *)
    static var foregroundServiceHealth: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_HEALTH") }
    @available(Android 34, *)
    static var foregroundServiceLocation: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_LOCATION") }
    @available(Android 34, *)
    static var foregroundServiceMediaPlayback: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK") }
    @available(Android 34, *)
    static var foregroundServiceMediaProjection: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION") }
    @available(Android 34, *)
    static var foregroundServiceMicrophone: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_MICROPHONE") }
    @available(Android 34, *)
    static var foregroundServicePhoneCall: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_PHONE_CALL") }
    @available(Android 34, *)
    static var foregroundServiceRemoteMessaging: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_REMOTE_MESSAGING") }
    @available(Android 34, *)
    static var foregroundServiceSpecialUse: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_SPECIAL_USE") }
    @available(Android 34, *)
    static var foregroundServiceSystemExempted: Permission { Permission(rawValue: "android.permission.FOREGROUND_SERVICE_SYSTEM_EXEMPTED") }
    static var getAccounts: Permission { Permission(rawValue: "android.permission.GET_ACCOUNTS") }
    static var getAccountsPrivileged: Permission { Permission(rawValue: "android.permission.GET_ACCOUNTS_PRIVILEGED") }
    static var getPackageSize: Permission { Permission(rawValue: "android.permission.GET_PACKAGE_SIZE") }
    static var globalSearch: Permission { Permission(rawValue: "android.permission.GLOBAL_SEARCH") }
    static var installLocationProvider: Permission { Permission(rawValue: "android.permission.INSTALL_LOCATION_PROVIDER") }
    static var installPackages: Permission { Permission(rawValue: "android.permission.INSTALL_PACKAGES") }
    static var installShortcut: Permission { Permission(rawValue: "com.android.launcher.permission.INSTALL_SHORTCUT") }
    static var instantAppForegroundService: Permission { Permission(rawValue: "android.permission.INSTANT_APP_FOREGROUND_SERVICE") }
    static var internet: Permission { Permission(rawValue: "android.permission.INTERNET") }
    static var killBackgroundProcesses: Permission { Permission(rawValue: "android.permission.KILL_BACKGROUND_PROCESSES") }
    static var locationHardware: Permission { Permission(rawValue: "android.permission.LOCATION_HARDWARE") }
    static var manageDocuments: Permission { Permission(rawValue: "android.permission.MANAGE_DOCUMENTS") }
    static var manageOwnCalls: Permission { Permission(rawValue: "android.permission.MANAGE_OWN_CALLS") }
    @available(Android 30, *)
    static var manageExternalStorage: Permission { Permission(rawValue: "android.permission.MANAGE_EXTERNAL_STORAGE") }
    @available(Android 31, *)
    static var manageMedia: Permission { Permission(rawValue: "android.permission.MANAGE_MEDIA") }
    @available(Android 31, *)
    static var manageOngoingCalls: Permission { Permission(rawValue: "android.permission.MANAGE_ONGOING_CALLS") }
    static var masterClear: Permission { Permission(rawValue: "android.permission.MASTER_CLEAR") }
    static var mediaContentControl: Permission { Permission(rawValue: "android.permission.MEDIA_CONTENT_CONTROL") }
    static var modifyAudioSettings: Permission { Permission(rawValue: "android.permission.MODIFY_AUDIO_SETTINGS") }
    static var modifyPhoneState: Permission { Permission(rawValue: "android.permission.MODIFY_PHONE_STATE") }
    static var mountFormatFilesystems: Permission { Permission(rawValue: "android.permission.MOUNT_FORMAT_FILESYSTEMS") }
    static var mountUnmountFilesystems: Permission { Permission(rawValue: "android.permission.MOUNT_UNMOUNT_FILESYSTEMS") }
    static var nfc: Permission { Permission(rawValue: "android.permission.NFC") }
    static var nfcTransactionEvent: Permission { Permission(rawValue: "android.permission.NFC_TRANSACTION_EVENT") }
    @available(Android 33, *)
    static var nfcPreferredPaymentInfo: Permission { Permission(rawValue: "android.permission.NFC_PREFERRED_PAYMENT_INFO") }
    @available(Android 33, *)
    static var nearbyWifiDevices: Permission { Permission(rawValue: "android.permission.NEARBY_WIFI_DEVICES") }
    static var packageUsageStats: Permission { Permission(rawValue: "android.permission.PACKAGE_USAGE_STATS") }
    @available(Android 33, *)
    static var postNotifications: Permission { Permission(rawValue: "android.permission.POST_NOTIFICATIONS") }
    static var processOutgoingCalls: Permission { Permission(rawValue: "android.permission.PROCESS_OUTGOING_CALLS") }
    static var readCalendar: Permission { Permission(rawValue: "android.permission.READ_CALENDAR") }
    static var readCallLog: Permission { Permission(rawValue: "android.permission.READ_CALL_LOG") }
    static var readContacts: Permission { Permission(rawValue: "android.permission.READ_CONTACTS") }
    static var readExternalStorage: Permission { Permission(rawValue: "android.permission.READ_EXTERNAL_STORAGE") }
    @available(Android 33, *)
    static var readMediaAudio: Permission { Permission(rawValue: "android.permission.READ_MEDIA_AUDIO") }
    @available(Android 33, *)
    static var readMediaImages: Permission { Permission(rawValue: "android.permission.READ_MEDIA_IMAGES") }
    @available(Android 33, *)
    static var readMediaVideo: Permission { Permission(rawValue: "android.permission.READ_MEDIA_VIDEO") }
    @available(Android 34, *)
    static var readMediaVisualUserSelected: Permission { Permission(rawValue: "android.permission.READ_MEDIA_VISUAL_USER_SELECTED") }
    @available(Android 21, *)
    static var readFrameBuffer: Permission { Permission(rawValue: "android.permission.READ_FRAME_BUFFER") }
    static var readLogs: Permission { Permission(rawValue: "android.permission.READ_LOGS") }
    @available(Android 26, *)
    static var readPhoneNumbers: Permission { Permission(rawValue: "android.permission.READ_PHONE_NUMBERS") }
    static var readPhoneState: Permission { Permission(rawValue: "android.permission.READ_PHONE_STATE") }
    static var readSms: Permission { Permission(rawValue: "android.permission.READ_SMS") }
    static var readSyncSettings: Permission { Permission(rawValue: "android.permission.READ_SYNC_SETTINGS") }
    static var readSyncStats: Permission { Permission(rawValue: "android.permission.READ_SYNC_STATS") }
    static var readVoicemail: Permission { Permission(rawValue: "com.android.voicemail.permission.READ_VOICEMAIL") }
    static var reboot: Permission { Permission(rawValue: "android.permission.REBOOT") }
    static var receiveBootCompleted: Permission { Permission(rawValue: "android.permission.RECEIVE_BOOT_COMPLETED") }
    static var receiveMms: Permission { Permission(rawValue: "android.permission.RECEIVE_MMS") }
    static var receiveSms: Permission { Permission(rawValue: "android.permission.RECEIVE_SMS") }
    static var receiveWapPush: Permission { Permission(rawValue: "android.permission.RECEIVE_WAP_PUSH") }
    static var recordAudio: Permission { Permission(rawValue: "android.permission.RECORD_AUDIO") }
    static var reorderTasks: Permission { Permission(rawValue: "android.permission.REORDER_TASKS") }
    static var requestCompanionRunInBackground: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND") }
    static var requestCompanionUseDataInBackground: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_USE_DATA_IN_BACKGROUND") }
    static var requestDeletePackages: Permission { Permission(rawValue: "android.permission.REQUEST_DELETE_PACKAGES") }
    static var requestIgnoreBatteryOptimizations: Permission { Permission(rawValue: "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS") }
    static var requestInstallPackages: Permission { Permission(rawValue: "android.permission.REQUEST_INSTALL_PACKAGES") }
    @available(Android 31, *)
    static var requestPasswordComplexity: Permission { Permission(rawValue: "android.permission.REQUEST_PASSWORD_COMPLEXITY") }
    @available(Android 31, *)
    static var scheduleExactAlarm: Permission { Permission(rawValue: "android.permission.SCHEDULE_EXACT_ALARM") }
    static var sendRespondViaMessage: Permission { Permission(rawValue: "android.permission.SEND_RESPOND_VIA_MESSAGE") }
    static var sendSms: Permission { Permission(rawValue: "android.permission.SEND_SMS") }
    static var setAlarm: Permission { Permission(rawValue: "com.android.alarm.permission.SET_ALARM") }
    static var setAlwaysFinish: Permission { Permission(rawValue: "android.permission.SET_ALWAYS_FINISH") }
    static var setAnimationScale: Permission { Permission(rawValue: "android.permission.SET_ANIMATION_SCALE") }
    static var setDebugApp: Permission { Permission(rawValue: "android.permission.SET_DEBUG_APP") }
    static var setProcessLimit: Permission { Permission(rawValue: "android.permission.SET_PROCESS_LIMIT") }
    static var setTime: Permission { Permission(rawValue: "android.permission.SET_TIME") }
    static var setTimeZone: Permission { Permission(rawValue: "android.permission.SET_TIME_ZONE") }
    static var setWallpaper: Permission { Permission(rawValue: "android.permission.SET_WALLPAPER") }
    static var setWallpaperHints: Permission { Permission(rawValue: "android.permission.SET_WALLPAPER_HINTS") }
    static var signalPersistentProcesses: Permission { Permission(rawValue: "android.permission.SIGNAL_PERSISTENT_PROCESSES") }
    static var statusBar: Permission { Permission(rawValue: "android.permission.STATUS_BAR") }
    static var systemAlertWindow: Permission { Permission(rawValue: "android.permission.SYSTEM_ALERT_WINDOW") }
    static var transmitIr: Permission { Permission(rawValue: "android.permission.TRANSMIT_IR") }
    static var uninstallShortcut: Permission { Permission(rawValue: "com.android.launcher.permission.UNINSTALL_SHORTCUT") }
    static var updateDeviceStats: Permission { Permission(rawValue: "android.permission.UPDATE_DEVICE_STATS") }
    static var useBiometric: Permission { Permission(rawValue: "android.permission.USE_BIOMETRIC") }
    @available(Android 33, *)
    static var useExactAlarm: Permission { Permission(rawValue: "android.permission.USE_EXACT_ALARM") }
    @available(Android 29, *)
    static var useFullScreenIntent: Permission { Permission(rawValue: "android.permission.USE_FULL_SCREEN_INTENT") }
    static var useSip: Permission { Permission(rawValue: "android.permission.USE_SIP") }
    @available(Android 31, *)
    static var uwbRanging: Permission { Permission(rawValue: "android.permission.UWB_RANGING") }
    static var vibrate: Permission { Permission(rawValue: "android.permission.VIBRATE") }
    static var wakeLock: Permission { Permission(rawValue: "android.permission.WAKE_LOCK") }
    static var writeApnSettings: Permission { Permission(rawValue: "android.permission.WRITE_APN_SETTINGS") }
    static var writeCalendar: Permission { Permission(rawValue: "android.permission.WRITE_CALENDAR") }
    static var writeCallLog: Permission { Permission(rawValue: "android.permission.WRITE_CALL_LOG") }
    static var writeContacts: Permission { Permission(rawValue: "android.permission.WRITE_CONTACTS") }
    static var writeExternalStorage: Permission { Permission(rawValue: "android.permission.WRITE_EXTERNAL_STORAGE") }
    static var writeGservices: Permission { Permission(rawValue: "android.permission.WRITE_GSERVICES") }
    static var writeSecureSettings: Permission { Permission(rawValue: "android.permission.WRITE_SECURE_SETTINGS") }
    static var writeSettings: Permission { Permission(rawValue: "android.permission.WRITE_SETTINGS") }
    static var writeSyncSettings: Permission { Permission(rawValue: "android.permission.WRITE_SYNC_SETTINGS") }
    static var writeVoicemail: Permission { Permission(rawValue: "com.android.voicemail.permission.WRITE_VOICEMAIL") }
    @available(Android 31, *)
    static var accessBlobsAcrossUsers: Permission { Permission(rawValue: "android.permission.ACCESS_BLOBS_ACROSS_USERS") }
    @available(Android 29, *)
    static var bindCallRedirectionService: Permission { Permission(rawValue: "android.permission.BIND_CALL_REDIRECTION_SERVICE") }
    @available(Android 29, *)
    static var bindCarrierMessagingClientService: Permission { Permission(rawValue: "android.permission.BIND_CARRIER_MESSAGING_CLIENT_SERVICE") }
    static var bindCarrierMessagingService: Permission { Permission(rawValue: "android.permission.BIND_CARRIER_MESSAGING_SERVICE") }
    @available(Android 31, *)
    static var bindCompanionDeviceService: Permission { Permission(rawValue: "android.permission.BIND_COMPANION_DEVICE_SERVICE") }
    @available(Android 30, *)
    static var bindControls: Permission { Permission(rawValue: "android.permission.BIND_CONTROLS") }
    @available(Android 30, *)
    static var bindQuickAccessWalletService: Permission { Permission(rawValue: "android.permission.BIND_QUICK_ACCESS_WALLET_SERVICE") }
    @available(Android 33, *)
    static var bindTvInteractiveApp: Permission { Permission(rawValue: "android.permission.BIND_TV_INTERACTIVE_APP") }
    @available(Android 29, *)
    static var callCompanionApp: Permission { Permission(rawValue: "android.permission.CALL_COMPANION_APP") }
    @available(Android 33, *)
    static var deliverCompanionMessages: Permission { Permission(rawValue: "android.permission.DELIVER_COMPANION_MESSAGES") }
    static var getTasks: Permission { Permission(rawValue: "android.permission.GET_TASKS") }
    @available(Android 31, *)
    static var hideOverlayWindows: Permission { Permission(rawValue: "android.permission.HIDE_OVERLAY_WINDOWS") }
    @available(Android 31, *)
    static var highSamplingRateSensors: Permission { Permission(rawValue: "android.permission.HIGH_SAMPLING_RATE_SENSORS") }
    @available(Android 30, *)
    static var interactAcrossProfiles: Permission { Permission(rawValue: "android.permission.INTERACT_ACROSS_PROFILES") }
    @available(Android 32, *)
    static var launchMultiPaneSettingsDeepLink: Permission { Permission(rawValue: "android.permission.LAUNCH_MULTI_PANE_SETTINGS_DEEP_LINK") }
    @available(Android 30, *)
    static var loaderUsageStats: Permission { Permission(rawValue: "android.permission.LOADER_USAGE_STATS") }
    @available(Android 33, *)
    static var manageWifiInterfaces: Permission { Permission(rawValue: "android.permission.MANAGE_WIFI_INTERFACES") }
    @available(Android 33, *)
    static var manageWifiNetworkSelection: Permission { Permission(rawValue: "android.permission.MANAGE_WIFI_NETWORK_SELECTION") }
    @available(Android 33, *)
    static var overrideWifiConfig: Permission { Permission(rawValue: "android.permission.OVERRIDE_WIFI_CONFIG") }
    static var persistentActivity: Permission { Permission(rawValue: "android.permission.PERSISTENT_ACTIVITY") }
    @available(Android 30, *)
    static var queryAllPackages: Permission { Permission(rawValue: "android.permission.QUERY_ALL_PACKAGES") }
    @available(Android 33, *)
    static var readAssistantAppSearchData: Permission { Permission(rawValue: "android.permission.READ_ASSISTANT_APP_SEARCH_DATA") }
    @available(Android 33, *)
    static var readBasicPhoneState: Permission { Permission(rawValue: "android.permission.READ_BASIC_PHONE_STATE") }
    @available(Android 33, *)
    static var readHomeAppSearchData: Permission { Permission(rawValue: "android.permission.READ_HOME_APP_SEARCH_DATA") }
    static var readInputState: Permission { Permission(rawValue: "android.permission.READ_INPUT_STATE") }
    @available(Android 33, *)
    static var readNearbyStreamingPolicy: Permission { Permission(rawValue: "android.permission.READ_NEARBY_STREAMING_POLICY") }
    @available(Android 30, *)
    static var readPrecisePhoneState: Permission { Permission(rawValue: "android.permission.READ_PRECISE_PHONE_STATE") }
    @available(Android 33, *)
    static var requestCompanionProfileAppStreaming: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_PROFILE_APP_STREAMING") }
    @available(Android 33, *)
    static var requestCompanionProfileAutomotiveProjection: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_PROFILE_AUTOMOTIVE_PROJECTION") }
    @available(Android 33, *)
    static var requestCompanionProfileComputer: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_PROFILE_COMPUTER") }
    @available(Android 31, *)
    static var requestCompanionProfileWatch: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_PROFILE_WATCH") }
    @available(Android 33, *)
    static var requestCompanionSelfManaged: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_SELF_MANAGED") }
    @available(Android 31, *)
    static var requestCompanionStartForegroundServicesFromBackground: Permission { Permission(rawValue: "android.permission.REQUEST_COMPANION_START_FOREGROUND_SERVICES_FROM_BACKGROUND") }
    @available(Android 31, *)
    static var requestObserveCompanionDevicePresence: Permission { Permission(rawValue: "android.permission.REQUEST_OBSERVE_COMPANION_DEVICE_PRESENCE") }
    static var restartPackages: Permission { Permission(rawValue: "android.permission.RESTART_PACKAGES") }
    static var setPreferredApplications: Permission { Permission(rawValue: "android.permission.SET_PREFERRED_APPLICATIONS") }
    @available(Android 29, *)
    static var smsFinancialTransactions: Permission { Permission(rawValue: "android.permission.SMS_FINANCIAL_TRANSACTIONS") }
    @available(Android 31, *)
    static var startForegroundServicesFromBackground: Permission { Permission(rawValue: "android.permission.START_FOREGROUND_SERVICES_FROM_BACKGROUND") }
    @available(Android 33, *)
    static var startViewAppFeatures: Permission { Permission(rawValue: "android.permission.START_VIEW_APP_FEATURES") }
    @available(Android 29, *)
    static var startViewPermissionUsage: Permission { Permission(rawValue: "android.permission.START_VIEW_PERMISSION_USAGE") }
    @available(Android 33, *)
    static var subscribeToKeyguardLockedState: Permission { Permission(rawValue: "android.permission.SUBSCRIBE_TO_KEYGUARD_LOCKED_STATE") }
    @available(Android 31, *)
    static var updatePackagesWithoutUserAction: Permission { Permission(rawValue: "android.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION") }
    @available(Android 23, *)
    static var useFingerprint: Permission { Permission(rawValue: "android.permission.USE_FINGERPRINT") }
    @available(Android 31, *)
    static var useIccAuthWithDeviceIdentifier: Permission { Permission(rawValue: "android.permission.USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER") }
}
