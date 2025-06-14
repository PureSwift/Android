package com.pureswift.swiftandroid

import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.ViewHolder

class RecyclerViewAdapter(val swiftObject: SwiftObject) :
    RecyclerView.Adapter<ViewHolder>() {

    class ViewHolder(view: View, val swiftObject: SwiftObject) : RecyclerView.ViewHolder(view) {

    }

    // Create new views (invoked by the layout manager)
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerViewAdapter.ViewHolder {
        val viewHolder = onCreateViewHolderSwift(parent, viewType)
        check(viewHolder.itemView != null) {
            ("ViewHolder.itemView == nil")
        }
        return viewHolder
    }

    external fun onCreateViewHolderSwift(parent: ViewGroup, viewType: Int): RecyclerViewAdapter.ViewHolder

    // Replace the contents of a view (invoked by the layout manager)
    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        onBindViewHolderSwift(holder, position)
    }

    external fun onBindViewHolderSwift(holder: RecyclerView.ViewHolder, position: Int)

    // Return the size of your dataset (invoked by the layout manager)
    override fun getItemCount(): Int {
        return getItemCountSwift()
    }

    external fun getItemCountSwift(): Int
}