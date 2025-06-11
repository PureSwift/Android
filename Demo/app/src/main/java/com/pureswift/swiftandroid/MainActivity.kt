package com.pureswift.swiftandroid

import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.activity.ComponentActivity

class MainActivity : ComponentActivity() {

    init {
        NativeLibrary.shared()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        onCreateSwift(savedInstanceState)
        //enableEdgeToEdge()
    }

    external fun onCreateSwift(savedInstanceState: Bundle?)

    fun setRootView(view: View) {
        Log.d("MainActivity", "AndroidSwiftUI.MainActivity.setRootView(_:)")
        setContentView(view)
    }
}
