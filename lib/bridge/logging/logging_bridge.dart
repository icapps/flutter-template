import 'package:flutter/services.dart';
import 'package:flutter_template/bridge/logging/logging_bridging.dart';

class LoggingBridge extends LoggingBridging {
  static const CHANNEL = 'com.icapps.fluttertemplate/logging';
  static const METHOD_CONSOLE_LOG_CHANNEL = 'consoleLog';

  final _channel = const MethodChannel(CHANNEL);

  @override
  Future<void> log(String message) async => _channel.invokeMethod(METHOD_CONSOLE_LOG_CHANNEL, {
        'message': message,
      });
}
