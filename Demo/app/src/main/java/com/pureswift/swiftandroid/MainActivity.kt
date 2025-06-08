package com.pureswift.swiftandroid

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.pureswift.swiftandroid.ui.theme.SwiftAndroidTheme

class MainActivity : ComponentActivity() {

    init {
        NativeLibrary.shared()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val hello = MainActivityHello()
        enableEdgeToEdge()
        setContent {
            SwiftAndroidTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Greeting(
                        name = hello.sayHelloName(),
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}

class MainActivityHello {

    init {
        NativeLibrary.shared()
    }

    external fun sayHelloName(): String
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    SwiftAndroidTheme {
        Greeting(MainActivityHello().sayHelloName())
    }
}