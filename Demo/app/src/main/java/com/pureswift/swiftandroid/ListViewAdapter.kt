package com.pureswift.swiftandroid

import android.database.DataSetObserver
import android.view.View
import android.view.ViewGroup
import android.widget.ListAdapter

class ListViewAdapter(val context: SwiftObject): ListAdapter {

    external override fun getCount(): Int

    external override fun isEmpty(): Boolean

    external override fun getItem(position: Int): Any?

    external override fun getItemId(position: Int): Long

    external override fun getItemViewType(position: Int): Int

    external override fun getViewTypeCount(): Int

    external override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View?

    external override fun areAllItemsEnabled(): Boolean

    external override fun isEnabled(position: Int): Boolean

    external override fun registerDataSetObserver(observer: DataSetObserver?)

    external override fun unregisterDataSetObserver(observer: DataSetObserver?)

    external override fun hasStableIds(): Boolean
}