package com.pureswift.swiftandroid

import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.activity.ComponentActivity
import androidx.activity.compose.BackHandler
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Card
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.pureswift.swiftandroid.bridge.CatalogBridge
import java.util.Date

class MainActivity : ComponentActivity() {

    init {
        NativeLibrary.shared()
    }

    val emitter = UnitEmitter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        onCreateSwift(savedInstanceState)

        setContent {
            MaterialTheme {
                CatalogApp(emitter)
            }
        }
    }

    external fun onCreateSwift(savedInstanceState: Bundle?)

    fun setRootView(view: View) {
        Log.d("MainActivity", "AndroidSwiftUI.MainActivity.setRootView(_:)")
        setContentView(view)
    }
}

/// One entry of the Swift library catalog, loaded over the jextract JNI bridge.
data class CatalogEntry(val index: Long, val name: String, val summary: String)

private fun loadCatalog(): List<CatalogEntry> =
    (0 until CatalogBridge.catalogEntryCount()).map { index ->
        CatalogEntry(
            index = index,
            name = CatalogBridge.catalogEntryName(index),
            summary = CatalogBridge.catalogEntrySummary(index)
        )
    }

@Composable
fun CatalogApp(emitter: UnitEmitter) {
    val entries = remember { loadCatalog() }
    var selected by remember { mutableStateOf<CatalogEntry?>(null) }

    val current = selected
    if (current == null) {
        CatalogListScreen(emitter, entries) { selected = it }
    } else {
        DemoScreen(entry = current) { selected = null }
    }
}

@Composable
fun CatalogListScreen(
    emitter: UnitEmitter,
    entries: List<CatalogEntry>,
    onSelect: (CatalogEntry) -> Unit
) {
    Scaffold { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = 16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            item {
                SwiftClockHeader(emitter)
            }
            items(entries) { entry ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onSelect(entry) }
                ) {
                    Column(Modifier.padding(16.dp)) {
                        Text(entry.name, style = MaterialTheme.typography.titleMedium)
                        Spacer(Modifier.height(4.dp))
                        Text(entry.summary, style = MaterialTheme.typography.bodyMedium)
                    }
                }
            }
            item { Spacer(Modifier.height(16.dp)) }
        }
    }
}

/// Header driven by the Swift-side timer emitting through [UnitEmitter].
@Composable
fun SwiftClockHeader(emitter: UnitEmitter) {
    var date by remember { mutableStateOf(Date()) }

    LaunchedEffect(Unit) {
        emitter.flow.collect {
            date = Date()
        }
    }

    Column(Modifier.padding(vertical = 16.dp)) {
        Text("Swift Library Catalog", style = MaterialTheme.typography.headlineSmall)
        Spacer(Modifier.height(4.dp))
        Text(date.toString(), style = MaterialTheme.typography.bodySmall)
    }
}

/// Runs the selected demo in Swift; output lines and completion arrive through
/// jextract JNI callbacks (closures/runnable blocks) invoked from Swift.
@Composable
fun DemoScreen(entry: CatalogEntry, onBack: () -> Unit) {
    val lines = remember(entry.index) { mutableStateListOf<String>() }
    var completed by remember(entry.index) { mutableStateOf(false) }

    BackHandler(onBack = onBack)

    LaunchedEffect(entry.index) {
        lines.clear()
        completed = false
        CatalogBridge.runCatalogDemo(
            entry.index,
            { line -> lines.add(line) },
            { completed = true }
        )
    }

    Scaffold { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
        ) {
            Text(entry.name, style = MaterialTheme.typography.headlineSmall)
            Spacer(Modifier.height(4.dp))
            Text(entry.summary, style = MaterialTheme.typography.bodyMedium)
            Spacer(Modifier.height(12.dp))
            HorizontalDivider()
            Spacer(Modifier.height(12.dp))
            LazyColumn(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                items(lines.toList()) { line ->
                    Text(line, style = MaterialTheme.typography.bodyMedium)
                }
                item {
                    if (completed) {
                        Spacer(Modifier.height(8.dp))
                        Text(
                            "✓ Demo completed (Swift → Kotlin callback)",
                            style = MaterialTheme.typography.labelMedium
                        )
                    }
                }
            }
        }
    }
}
