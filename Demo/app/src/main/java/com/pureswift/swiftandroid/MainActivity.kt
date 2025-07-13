package com.pureswift.swiftandroid

import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import java.util.Date

class MainActivity : ComponentActivity() {

    init {
        NativeLibrary.shared()
    }

    val emitter = UnitEmitter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        onCreateSwift(savedInstanceState)
        //enableEdgeToEdge()

        // set composable root view
        setContent {
            EventReceiver(emitter = emitter)
        }
    }

    external fun onCreateSwift(savedInstanceState: Bundle?)

    fun setRootView(view: View) {
        Log.d("MainActivity", "AndroidSwiftUI.MainActivity.setRootView(_:)")
        setContentView(view)
    }
}

@Composable
fun EventReceiver(emitter: UnitEmitter) {

    val tick by emitter.flow.collectAsState(initial = Unit)

    var date by remember { mutableStateOf(Date()) }

    LaunchedEffect(Unit) {
        emitter.flow.collect {
            date = Date()
        }
    }

    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text("Hello Swift!")
            Text(date.toString())
        }
    }
}