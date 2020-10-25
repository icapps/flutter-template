import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

class FlutterTemplateLogger {
  static Function(Object obj) printToConsole = print;

  FlutterTemplateLogger._();

  static void logNetworkRequest(RequestOptions options) {
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    logDebug('---------------> ${options.method} - url: ${options.uri.toString()}');
  }

  static void logNetworkResponse(Response response) {
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    logDebug('<--------------- ${response.request.method} - url: ${response.request.uri.toString()} - statucode: ${response.statusCode ?? 'N/A'}');
  }

  static void logNetworkError(NetworkError error) {
    final dioError = error;
    final message = StringBuffer();
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    if (dioError.response == null) {
      message..writeln('request | ${dioError.request.toString()}')..writeln('message | ${dioError.message}');
    } else {
      message..writeln('response.data | ${dioError.response.data}')..writeln('response.headers | ${dioError.response.headers}');
    }
    if (dioError.request != null) {
      message.writeln('<--------------- ${dioError.request.method} - url: ${dioError.request.uri.toString()} - statucode: ${dioError.response?.statusCode ?? 'N/A'}');
    }
    logError(message: '${message.toString()}', error: Error());
  }

  static void logDebug(String message) {
    if (FlavorConfig.isDev() | FlavorConfig.isDummy()) {
      printToConsole('🐛 - ${DateTime.now()} - $message');
    }
  }

  static void logWarning(String message) {
    if (FlavorConfig.isDev() | FlavorConfig.isDummy()) {
      printToConsole('⚠️ $message');
    }
  }

  static void logError({@required String message, @required dynamic error}) {
    if (FlavorConfig.isDev() | FlavorConfig.isDummy()) {
      final sb = StringBuffer()..writeln('---⛔ ERROR ⛔---')..writeln(message);
      if (error is Error && error.stackTrace != null) {
        sb..writeln(error.toString())..writeln(error.stackTrace);
      } else if (error != null) {
        sb.writeln(error);
      }
      sb.writeln('-----------------');
      printToConsole(sb.toString());
    }
  }

  static void logInfo(String message) {
    if (FlavorConfig.isDev() | FlavorConfig.isDummy()) {
      printToConsole('💡️ $message');
    }
  }

  static void logVerbose(String message) {
    if (FlavorConfig.isDev() | FlavorConfig.isDummy()) {
      printToConsole('$message');
    }
  }
}
