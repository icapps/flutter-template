import 'package:dio/dio.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class FlutterTemplateLogger {
  static Function(Object obj) printToConsole = _wrappedPrint;

  FlutterTemplateLogger._();

  static void _wrappedPrint(Object object) {
    if (object is String) {
      final pattern = RegExp('.{1,800}');
      pattern.allMatches(object).forEach((match) => print(match.group(0))); // ignore: avoid_print
    } else {
      print(object); // ignore: avoid_print
    }
  }

  static void logNetworkRequest(RequestOptions options) {
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    // logDebug('---------------> ${options.method} - url: ${options.path}');
  }

  static void logNetworkResponse(Response response) {
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    // logDebug('<--------------- ${response.request.method} - url: ${response.request.path} - statucode: ${response.statusCode ?? 'N/A'}');
  }

  static void logNetworkError(NetworkError error) {
    final dioError = error;
    final message = StringBuffer();
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    final response = dioError.response;
    final request = dioError.requestOptions;
    if (response == null) {
      message..writeln('request | ${request.toString()}')..writeln('message | ${dioError.message}');
    } else {
      message..writeln('response.data | ${response.data}')..writeln('response.headers | ${response.headers}');
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

  static void logError({required String message, required dynamic error}) {
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
