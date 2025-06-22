package com.pureswift.swiftandroid

import android.view.MenuItem
import com.google.android.material.navigation.NavigationBarView

class NavigationBarViewOnItemSelectedListener(val action: SwiftObject): NavigationBarView.OnItemSelectedListener {

    external override fun onNavigationItemSelected(menuItem: MenuItem): Boolean
}