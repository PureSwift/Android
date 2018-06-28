//
//  Application.swift
//  Android
//
//  Created by Marco Estrella on 6/27/18.
//

import Foundation
import java_swift
import JNI

public extension SwiftSupport.App {
    
    public typealias Application = SwiftApplication
}

open class SwiftApplication: JavaObject {
    
    open func onConfigurationChanged(newConfig: JavaObject){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onCreate(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onLowMemory(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onTerminate(){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func onTrimMemory(leveL: Int){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func registerActivityLifecycleCallbacks(callback: JavaObject){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func unregisterActivityLifecycleCallbacks(callback: JavaObject){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func registerComponentCallbacks(callback: JavaObject){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func unregisterComponentCallbacks(callback: JavaObject){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func registerOnProvideAssistDataListener(callback: JavaObject){
        
        NSLog("\(type(of: self)) \(#function)")
    }
    
    open func unregisterOnProvideAssistDataListener(callback: JavaObject){
        
        NSLog("\(type(of: self)) \(#function)")
    }
}
