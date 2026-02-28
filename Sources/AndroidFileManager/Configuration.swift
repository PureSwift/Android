//
//  Configuration.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if os(Android)
import Android
import CAndroidNDK
#endif

/// Wrapper around Android NDK `AConfiguration`.
public struct Configuration: ~Copyable {

    internal let pointer: OpaquePointer

    internal init(pointer: OpaquePointer) {
        self.pointer = pointer
    }

    deinit {
        AConfiguration_delete(pointer)
    }
}

// MARK: - Initialization

public extension Configuration {

    /// Creates a new, empty configuration object.
    init() throws(AndroidFileManagerError) {
        guard let pointer = AConfiguration_new() else {
            throw .invalidConfiguration
        }
        self.init(pointer: pointer)
    }

    /// Creates a configuration populated from the current asset manager state.
    init(assetManager: borrowing AssetManager) throws(AndroidFileManagerError) {
        try self.init()
        AConfiguration_fromAssetManager(pointer, assetManager.pointer)
    }
}

// MARK: - Methods

public extension Configuration {

    /// Copies all values from another configuration.
    func copy(from other: borrowing Configuration) {
        AConfiguration_copy(pointer, other.pointer)
    }

    /// Returns bitmask differences between two configurations.
    func diff(_ other: borrowing Configuration) -> Int32 {
        AConfiguration_diff(pointer, other.pointer)
    }

    /// Returns `true` when this configuration matches the requested one.
    func matches(_ requested: borrowing Configuration) -> Bool {
        AConfiguration_match(pointer, requested.pointer) != 0
    }

    /// Returns `true` if this configuration is a better match than `base`.
    func isBetter(than base: borrowing Configuration, requested: borrowing Configuration) -> Bool {
        AConfiguration_isBetterThan(base.pointer, pointer, requested.pointer) != 0
    }
}

// MARK: - Properties

public extension Configuration {

    var mobileCountryCode: Int32 { AConfiguration_getMcc(pointer) }
    var mobileNetworkCode: Int32 { AConfiguration_getMnc(pointer) }
    var orientation: Int32 { AConfiguration_getOrientation(pointer) }
    var touchscreen: Int32 { AConfiguration_getTouchscreen(pointer) }
    var density: Int32 { AConfiguration_getDensity(pointer) }
    var keyboard: Int32 { AConfiguration_getKeyboard(pointer) }
    var navigation: Int32 { AConfiguration_getNavigation(pointer) }
    var keysHidden: Int32 { AConfiguration_getKeysHidden(pointer) }
    var navHidden: Int32 { AConfiguration_getNavHidden(pointer) }
    var sdkVersion: Int32 { AConfiguration_getSdkVersion(pointer) }
    var screenSize: Int32 { AConfiguration_getScreenSize(pointer) }
    var screenLong: Int32 { AConfiguration_getScreenLong(pointer) }
    var uiModeType: Int32 { AConfiguration_getUiModeType(pointer) }
    var uiModeNight: Int32 { AConfiguration_getUiModeNight(pointer) }
    var screenWidthDp: Int32 { AConfiguration_getScreenWidthDp(pointer) }
    var screenHeightDp: Int32 { AConfiguration_getScreenHeightDp(pointer) }
    var smallestScreenWidthDp: Int32 { AConfiguration_getSmallestScreenWidthDp(pointer) }
    var layoutDirection: Int32 { AConfiguration_getLayoutDirection(pointer) }

    /// ISO 639-1 language code when available.
    var languageCode: String? {
        var out = [CChar](repeating: 0, count: 2)
        AConfiguration_getLanguage(pointer, &out)
        return decodeCode(out)
    }

    /// ISO 3166-1 alpha-2 region code when available.
    var countryCode: String? {
        var out = [CChar](repeating: 0, count: 2)
        AConfiguration_getCountry(pointer, &out)
        return decodeCode(out)
    }
}

// MARK: - Private

private extension Configuration {

    func decodeCode(_ raw: [CChar]) -> String? {
        guard raw.count >= 2 else { return nil }
        let b0 = UInt8(bitPattern: raw[0])
        let b1 = UInt8(bitPattern: raw[1])
        guard b0 != 0 || b1 != 0 else {
            return nil
        }
        let bytes = b1 == 0 ? [b0] : [b0, b1]
        return String(decoding: bytes, as: UTF8.self)
    }
}
