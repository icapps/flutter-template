import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/exceptions/forbidden_error.dart';
import 'package:flutter_template/model/exceptions/no_internet_error.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/remote_config/remote_config.dart';
import 'package:flutter_template/util/logging/log_types.dart';
import 'package:flutter_template/util/logging/sentry_logger.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class FlutterTemplateLogger {
  static FirebaseCrashlytics get _firebaseCrashlytics => getIt<FirebaseCrashlytics>();

  FlutterTemplateLogger._();

  static void logDebug(String message, {LogType? type}) {
    staticLogger.debug(message);
    SentryLogger.logDebug(message, type: type);
  }

  static void logInfo(String message, {LogType? type}) {
    staticLogger.info(message);
    SentryLogger.logInfo(message, type: type);
  }

  static void logWarning(String message, {LogType? type}) {
    staticLogger.warning(message);
    SentryLogger.logWarning(message, type: type);
  }

  static void logFatal(String message, {LogType? type}) {
    staticLogger.error(message);
    SentryLogger.logFatal(message, type: type);
  }

  static void logError(
    String message, {
    bool sendToFirebase = true,
    required dynamic error,
    required StackTrace? stackTrace,
    LogType? type,
  }) {
    staticLogger.error(message, error: error, stackTrace: stackTrace);
    _recordToFirebase(message, error: error, stackTrace: stackTrace);
    _recordToSentry(error, stackTrace, message, type);
  }

  static Future<void> _recordToFirebase(
    String message, {
    required dynamic error,
    required StackTrace? stackTrace,
  }) async {
    try {
      final shouldNotSendError = error is UnAuthorizedError || error is ForbiddenError || error is NoInternetError || isInDebug;
      if (shouldNotSendError && !getIt.get<RemoteConfig>().sendBlockedErrorsToFirebase) return;
      await _firebaseCrashlytics.recordError(error, stackTrace, reason: message);
    } catch (error, trace) {
      staticLogger.error('Failed to log to firebase', error: error, stackTrace: trace);
    }
  }

  static void _recordToSentry(
    dynamic error,
    StackTrace? stackTrace,
    String message,
    LogType? type,
  ) {
    final shouldNotSendError = error is UnAuthorizedError || error is ForbiddenError || error is NoInternetError || isInDebug;
    if (shouldNotSendError) return;
    SentryLogger.logFatal(message, type: type);
    SentryLogger.captureException(error, stackTrace: stackTrace, message: message);
  }

  static void logNetworkRequest(RequestOptions request) => staticLogger.logNetworkRequest(request);

  static void logNetworkError(NetworkError error) => staticLogger.logNetworkError(error);

  static void logNetworkResponse(Response response) => staticLogger.logNetworkResponse(response);
}
