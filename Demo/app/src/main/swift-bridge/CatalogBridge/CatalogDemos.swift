//
//  CatalogDemos.swift
//  SwiftAndroidApp
//
//  Per-library demo implementations, exercising the PureSwift Android SDK
//  wrappers. Internal only — jextract never sees this file's declarations.
//

import AndroidKit
import AndroidLocation
import AndroidMedia
import AndroidNet
import AndroidNFC

enum CatalogDemos {

    // MARK: - AndroidOS

    static func androidOS(_ out: (String) -> Void) {
        do {
            let build = try JavaClass<AndroidOS.Build>()
            out("Manufacturer: \(build.MANUFACTURER)")
            out("Model: \(build.MODEL)")
            out("Device: \(build.DEVICE)")
            let version = try JavaClass<AndroidOS.Build.VERSION>()
            out("Android version: \(version.RELEASE) (API \(version.SDK_INT))")
            let clock = try JavaClass<AndroidOS.SystemClock>()
            out("Uptime: \(clock.uptimeMillis() / 1000)s")
            out("Elapsed realtime: \(clock.elapsedRealtime() / 1000)s")
        } catch {
            out("Error: \(error)")
        }
    }

    // MARK: - AndroidContent

    static func androidContent(_ out: (String) -> Void) {
        guard let context = Catalog.context else {
            out("No Android Context available")
            return
        }
        out("Package: \(context.getPackageName())")
        if let info = context.getApplicationInfo() {
            out("Target SDK: \(info.targetSdkVersion)")
            out("Min SDK: \(info.minSdkVersion)")
            out("Data dir: \(info.dataDir)")
        }
    }

    // MARK: - AndroidLocation

    static func androidLocation(_ out: (String) -> Void) {
        guard let context = Catalog.context else {
            out("No Android Context available")
            return
        }
        do {
            let serviceName = try JavaClass<AndroidContent.Context>().LOCATION_SERVICE
            guard let manager = context.getSystemService(serviceName)?
                .as(AndroidLocation.LocationManager.self) else {
                out("LocationManager unavailable")
                return
            }
            guard let providers = manager.getAllProviders() else {
                out("No providers")
                return
            }
            out("Providers: \(providers.size())")
            for i in 0..<providers.size() {
                guard let provider = providers.get(i) else { continue }
                let name = String(provider.toString())
                let enabled = manager.isProviderEnabled(name)
                out("• \(name): \(enabled ? "enabled" : "disabled")")
            }
        } catch {
            out("Error: \(error)")
        }
    }

    // MARK: - AndroidMedia

    static func androidMedia(_ out: (String) -> Void) {
        guard let context = Catalog.context else {
            out("No Android Context available")
            return
        }
        do {
            let serviceName = try JavaClass<AndroidContent.Context>().AUDIO_SERVICE
            guard let audio = context.getSystemService(serviceName)?
                .as(AndroidMedia.AudioManager.self) else {
                out("AudioManager unavailable")
                return
            }
            let audioClass = try JavaClass<AndroidMedia.AudioManager>()
            let streams: [(String, Int32)] = [
                ("Music", audioClass.STREAM_MUSIC),
                ("Ring", audioClass.STREAM_RING),
                ("Alarm", audioClass.STREAM_ALARM),
                ("Notification", audioClass.STREAM_NOTIFICATION),
            ]
            for (label, stream) in streams {
                let volume = audio.getStreamVolume(stream)
                let max = audio.getStreamMaxVolume(stream)
                out("\(label) volume: \(volume)/\(max)")
            }
            let ringer = audio.getRingerMode()
            let ringerName: String
            switch ringer {
            case audioClass.RINGER_MODE_SILENT: ringerName = "silent"
            case audioClass.RINGER_MODE_VIBRATE: ringerName = "vibrate"
            default: ringerName = "normal"
            }
            out("Ringer mode: \(ringerName)")
        } catch {
            out("Error: \(error)")
        }
    }

    // MARK: - AndroidNet

    static func androidNet(_ out: (String) -> Void) {
        guard let context = Catalog.context else {
            out("No Android Context available")
            return
        }
        do {
            let contextClass = try JavaClass<AndroidContent.Context>()
            if let connectivity = context.getSystemService(contextClass.CONNECTIVITY_SERVICE)?
                .as(AndroidNet.ConnectivityManager.self) {
                if let info = connectivity.getActiveNetworkInfo() {
                    out("Active network: \(info.getTypeName())")
                    out("Connected: \(info.isConnected())")
                } else {
                    out("No active network")
                }
            } else {
                out("ConnectivityManager unavailable")
            }
            if let wifi = context.getSystemService(contextClass.WIFI_SERVICE)?
                .as(AndroidNet.WifiManager.self) {
                out("Wi-Fi enabled: \(wifi.isWifiEnabled())")
            } else {
                out("WifiManager unavailable")
            }
        } catch {
            out("Error: \(error)")
        }
    }

    // MARK: - AndroidNFC

    static func androidNFC(_ out: (String) -> Void) {
        guard let context = Catalog.context else {
            out("No Android Context available")
            return
        }
        do {
            let adapterClass = try JavaClass<AndroidNFC.NfcAdapter>()
            if let adapter = adapterClass.getDefaultAdapter(context) {
                out("NFC adapter present")
                out("Enabled: \(adapter.isEnabled())")
            } else {
                out("No NFC adapter on this device")
            }
        } catch {
            out("Error: \(error)")
        }
    }
}
