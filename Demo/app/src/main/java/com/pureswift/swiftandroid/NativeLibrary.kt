package com.pureswift.swiftandroid

import android.util.Log

class NativeLibrary private constructor() {

    companion object {

        @Volatile
        var shared : NativeLibrary? = null

        fun shared(): NativeLibrary {
            return shared?: synchronized(this){
                val instance = NativeLibrary()
                shared = instance
                return instance
            }
        }
    }

    init {
        loadNativeLibrary()
    }

    private fun loadNativeLibrary() {
        try {
            System.loadLibrary("SwiftAndroidApp")
        } catch (error: UnsatisfiedLinkError) {
            Log.e("NativeLibrary", "Unable to load native libraries: $error")
            return
        }
        Log.d("NativeLibrary", "Loaded Swift library")
    }
}
