import 'package:flutter_template/util/logging/log_types.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryLogger {
  SentryLogger._();

  static void logDebug(String message, {LogType? type}) {
    final attributes = <String, SentryAttribute>{};
    if (type != null) {
      attributes['subtype'] = type.sentryAttribute;
    }
    Sentry.logger.debug(
      message,
      attributes: attributes,
    );
  }

  static void logInfo(String message, {LogType? type}) {
    final attributes = <String, SentryAttribute>{};
    if (type != null) {
      attributes['subtype'] = type.sentryAttribute;
    }
    Sentry.logger.info(
      message,
      attributes: attributes,
    );
  }

  static void logWarning(String message, {LogType? type}) {
    final attributes = <String, SentryAttribute>{};
    if (type != null) {
      attributes['subtype'] = type.sentryAttribute;
    }
    Sentry.logger.warn(
      message,
      attributes: attributes,
    );
  }

  static void logError(String message, {LogType? type}) {
    final attributes = <String, SentryAttribute>{};
    if (type != null) {
      attributes['subtype'] = type.sentryAttribute;
    }
    Sentry.logger.error(
      message,
      attributes: attributes,
    );
  }

  static void logFatal(String message, {LogType? type}) {
    final attributes = <String, SentryAttribute>{};
    if (type != null) {
      attributes['subtype'] = type.sentryAttribute;
    }
    Sentry.logger.fatal(
      message,
      attributes: attributes,
    );
  }

  static void captureException(dynamic error, {StackTrace? stackTrace, String? message}) => Sentry.captureException(
        error,
        stackTrace: stackTrace,
        message: message != null ? SentryMessage(message) : null,
      );
}
