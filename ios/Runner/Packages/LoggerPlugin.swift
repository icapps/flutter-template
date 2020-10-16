//
//  LoggerPlugin.swift
//  Runner
//
//  Created by Hannes Van den Berghe on 14/05/2020.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Flutter
import os

@available(iOS 10.0, *)
public class LoggerPlugin: NSObject, FlutterPlugin {
    let os_app = OSLog(subsystem: "com.icapps.fluttertemplate", category: "logging")

    public static func register(with registrar: FlutterPluginRegistrar?) {
        guard let registrar = registrar else {
            return;
        }
        let channel = FlutterMethodChannel(name: "com.icapps.fluttertemplate/logging", binaryMessenger: registrar.messenger())
        let instance = LoggerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "consoleLog":
                self.logMessage(call.arguments);
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
        }
    }
    
    private func logMessage(_ arguments: Any?) {
        guard let arguments = arguments as? [String: Any], let message = arguments["message"] as? String else {
            os_log("LoggerPlugin - error - could not parse message", log: os_app, type: .error)
            return
        }
        os_log("LoggerPlugin - message - %{public}@", log: os_app, type: .error, message)

    }
}
