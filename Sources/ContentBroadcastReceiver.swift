//
//  ContentBroadcastReceiver.swift
//  Android
//
//  Created by Marco Estrella on 6/21/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias BroadcastReceiver = AndroidBroadcastReceiver
}

public protocol AndroidBroadcastReceiver: JavaProtocol {
    
    func onReceive(context: Android.Content.Context, intent: JavaObject)
}
