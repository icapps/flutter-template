package com.icapps.flutter_template

import android.os.Bundle
import com.icapps.flutter_template.bridge.LoggerPlugin

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    LoggerPlugin.registerWith(flutterView, applicationContext)
  }
}
