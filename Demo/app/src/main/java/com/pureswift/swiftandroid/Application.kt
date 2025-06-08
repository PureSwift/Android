package com.pureswift.swiftandroid

import com.example.swift.HelloSubclass

class Application: android.app.Application() {

    init {
        NativeLibrary.shared()
    }

    override fun onCreate() {
        super.onCreate()
        onCreateSwift()
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