//
//  WidgetArrayAdapter.swift
//  Android
//
//  Created by Marco Estrella on 9/10/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias ArrayAdapter = AndroidArrayAdapter
}

/**
 * You can use this adapter to provide views for an AdapterView, Returns a view for each object in a collection of data objects you provide,
 * and can be used with list-based user interface widgets such as Recyclerview or Spinner.
 */
open class AndroidArrayAdapter<Element>: AndroidWidgetRecyclerViewAdapter {
    
    private var items: [Element] = [Element]()
    private var activity: SwiftSupportAppCompatActivity?
    
    public var onClickBlock: ((Int) -> ())?
    
    public convenience init(activity: SwiftSupportAppCompatActivity, items: [Element]) {
        
        self.init(javaObject: nil)
        bindNewJavaObject()
        
        self.items = items
        self.activity = activity
    }
    
    open override func onCreateViewHolder(parent: Android.View.ViewGroup, viewType: Int?) -> AndroidWidgetRecyclerView.ViewHolder {
        
        guard let activity = activity
            else { fatalError("Activity is nil") }
        
        let density = activity.getDensity()
        
        let tvPaddingLeft = Int(24 * density)
        let tvPaddingRight = Int(24 * density)
        
        let textViewMessage = AndroidTextView.init(context: activity)
        textViewMessage.layoutParams = AndroidViewGroupLayoutParams.init(width: AndroidViewGroupLayoutParams.MATCH_PARENT, height: Int(48 * density))
        textViewMessage.setPadding(left: tvPaddingLeft, top: 0, right: tvPaddingRight, bottom: 0)
        textViewMessage.setTextSize(size: 15.0)
        textViewMessage.gravity = AndroidGravity.centerVertical.rawValue
        textViewMessage.color = AndroidGraphicsColor.BLACK
        
        return ViewHolder.init(itemView: textViewMessage, onClickBlock: onClickBlock)
    }
    
    open override func getItemCount() -> Int {
        return items.count
    }
    
    open override func onBindViewHolder(holder: AndroidWidgetRecyclerView.ViewHolder, position: Int) {
        
        let itemViewHolder = holder as! ViewHolder
        
        itemViewHolder.textView?.text = "\(items[position])"
    }
}

class ViewHolder: AndroidWidgetRecyclerViewViewHolder {
    
    var textView: AndroidTextView?
    
    public convenience init( itemView: AndroidView, onClickBlock: ((Int) -> ())? ){
        self.init(javaObject: nil)
        bindNewJavaObject(itemView: itemView)
        
        textView = itemView as? AndroidTextView
        
        textView?.setOnClickListener {
            
            guard let onClick = onClickBlock
                else { return }
            
            onClick(self.adapterPosition)
        }
    }
}

