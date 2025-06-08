package com.pureswift.swiftandroid;

import android.annotation.SuppressLint;
import com.example.swift.HelloSubclass;

public class Application extends android.app.Application {

    @SuppressLint("MissingSuperCall")
    @Override
    public native void onCreate();

    @SuppressLint("MissingSuperCall")
    @Override
    public native void onTerminate();
    
    public void sayHello() {
        int result = new HelloSubclass("Swift").sayHello(17, 25);
        System.out.println("sayHello(17, 25) = " + result);
    }
}
