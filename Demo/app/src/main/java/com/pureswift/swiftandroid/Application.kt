package com.pureswift.swiftandroid

import android.util.Log
import com.example.swift.HelloSubclass
import com.pureswift.swiftandroid.bridge.CatalogBridge

class Application: android.app.Application() {

    init {
        NativeLibrary.shared()
    }

    override fun onCreate() {
        super.onCreate()
        onCreateSwift()
        testCatalogBridge()
    }

    /// Smoke test for the jextract JNI bridge: a Java->Swift downcall and a
    /// Swift->Java callback (closure/Runnable block).
    private fun testCatalogBridge() {
        val sum = CatalogBridge.addOne(41)
        Log.d("CatalogBridge", "addOne(41) = $sum")
        CatalogBridge.runBlock {
            Log.d("CatalogBridge", "runBlock callback invoked from Swift")
        }
    }

    private external fun onCreateSwift()

    override fun onTerminate() {
        super.onTerminate()
        onTerminateSwift()
    }

    private external fun onTerminateSwift()

    fun sayHello() {
        val result = HelloSubclass("Swift").sayHello(17, 25)
        println("sayHello(17, 25) = $result")
    }
}