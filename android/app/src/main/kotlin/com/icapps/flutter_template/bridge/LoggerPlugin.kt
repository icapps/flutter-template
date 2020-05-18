package com.icapps.flutter_template.bridge

import android.content.Context
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView

object LoggerPlugin {
    private const val CHANNEL = "com.icapps.fluttertemplate/logging"

    fun registerWith(flutterView: FlutterView, applicationContext: Context) {
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "consoleLog" -> log(applicationContext, call, result)
                    else -> throw  NotImplementedError("No implementation found for ${call.method}")
                }
            } catch (e: Exception) {
                result.error(e.message, e.toString(), e)
            }
        }
    }

    private fun log(context: Context, call: MethodCall, result: MethodChannel.Result) {
        val messageParam = "message"
        if (!call.hasArgument(messageParam)) {
            Log.e("flutter_template", "error - could not parse message")
            result.error("400", "Not all arguments are passed", null)
            return
        }
        val message = call.argument<String>(messageParam)
        Log.d("flutter_template", "message - $message")
        result.success(true)
    }
}