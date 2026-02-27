//
//  Syscalls.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

#if !os(Android)

func stub() -> Never {
    fatalError("Not running on Android")
}

// MARK: - AConfiguration

func AConfiguration_new() -> OpaquePointer? { stub() }

func AConfiguration_delete(_ config: OpaquePointer) { stub() }

func AConfiguration_fromAssetManager(_ out: OpaquePointer, _ am: OpaquePointer) { stub() }

func AConfiguration_copy(_ dest: OpaquePointer, _ src: OpaquePointer) { stub() }

func AConfiguration_diff(_ config1: OpaquePointer, _ config2: OpaquePointer) -> Int32 { stub() }

func AConfiguration_match(_ base: OpaquePointer, _ requested: OpaquePointer) -> Int32 { stub() }

func AConfiguration_isBetterThan(
    _ base: OpaquePointer,
    _ test: OpaquePointer,
    _ requested: OpaquePointer
) -> Int32 { stub() }

func AConfiguration_getMcc(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getMnc(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getLanguage(_ config: OpaquePointer, _ outLanguage: UnsafeMutablePointer<CChar>?) { stub() }

func AConfiguration_getCountry(_ config: OpaquePointer, _ outCountry: UnsafeMutablePointer<CChar>?) { stub() }

func AConfiguration_getOrientation(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getTouchscreen(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getDensity(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getKeyboard(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getNavigation(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getKeysHidden(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getNavHidden(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getSdkVersion(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getScreenSize(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getScreenLong(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getUiModeType(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getUiModeNight(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getScreenWidthDp(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getScreenHeightDp(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getSmallestScreenWidthDp(_ config: OpaquePointer) -> Int32 { stub() }

func AConfiguration_getLayoutDirection(_ config: OpaquePointer) -> Int32 { stub() }

// MARK: - AAssetManager

func AAssetManager_open(
    _ manager: OpaquePointer,
    _ fileName: UnsafePointer<CChar>?,
    _ mode: Int32
) -> OpaquePointer? { stub() }

// MARK: - AAsset

func AAsset_close(_ asset: OpaquePointer) { stub() }

func AAsset_read(
    _ asset: OpaquePointer,
    _ buf: UnsafeMutableRawPointer?,
    _ count: Int
) -> Int32 { stub() }

func AAsset_seek64(
    _ asset: OpaquePointer,
    _ offset: Int64,
    _ whence: Int32
) -> Int64 { stub() }

func AAsset_getLength64(_ asset: OpaquePointer) -> Int64 { stub() }

func AAsset_getRemainingLength64(_ asset: OpaquePointer) -> Int64 { stub() }

func AAsset_getBuffer(_ asset: OpaquePointer) -> UnsafeRawPointer? { stub() }

func AAsset_isAllocated(_ asset: OpaquePointer) -> Int32 { stub() }

func AAsset_openFileDescriptor64(
    _ asset: OpaquePointer,
    _ outStart: UnsafeMutablePointer<Int64>?,
    _ outLength: UnsafeMutablePointer<Int64>?
) -> Int32 { stub() }

// MARK: - AStorageManager

func AStorageManager_new() -> OpaquePointer? { stub() }

func AStorageManager_delete(_ manager: OpaquePointer) { stub() }

func AStorageManager_mountObb(
    _ manager: OpaquePointer,
    _ filename: UnsafePointer<CChar>?,
    _ key: UnsafePointer<CChar>?,
    _ callback: UnsafeMutableRawPointer?,
    _ data: UnsafeMutableRawPointer?
) { stub() }

func AStorageManager_unmountObb(
    _ manager: OpaquePointer,
    _ filename: UnsafePointer<CChar>?,
    _ force: Int32,
    _ callback: UnsafeMutableRawPointer?,
    _ data: UnsafeMutableRawPointer?
) { stub() }

func AStorageManager_isObbMounted(
    _ manager: OpaquePointer,
    _ filename: UnsafePointer<CChar>?
) -> Int32 { stub() }

func AStorageManager_getMountedObbPath(
    _ manager: OpaquePointer,
    _ filename: UnsafePointer<CChar>?
) -> UnsafePointer<CChar>? { stub() }

#endif
