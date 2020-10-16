package com.icapps.fluttertemplate.bridge

import android.content.Context
import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

object LoggerPlugin {
    private const val CHANNEL = "com.icapps.fluttertemplate/logging"

    fun registerWith(binaryMessenger: BinaryMessenger) {
        MethodChannel(binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "consoleLog" -> log(call, result)
                    else -> throw  NotImplementedError("No implementation found for ${call.method}")
                }
            } catch (e: Exception) {
                result.error(e.message, e.toString(), e)
            }
        }
    }
    private fun log(call: MethodCall, result: MethodChannel.Result) {
        val messageParam = "message"
        if (!call.hasArgument(messageParam)) {
            Log.e("LoggerPlugin", "error - could not parse message")
            result.error("400", "Not all arguments are passed", null)
            return
        }
        val message = call.argument<String>(messageParam)
        Log.d("LoggerPlugin", "message - $message")
        result.success(true)
    }
}