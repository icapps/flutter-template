package com.icapps.fluttertemplate

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.icapps.fluttertemplate.bridge.LoggerPlugin

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        //Custom plugins
        val binaryMessenger = flutterEngine.dartExecutor.binaryMessenger
        LoggerPlugin.registerWith(binaryMessenger)
    }
}