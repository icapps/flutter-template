import 'package:flutter_template/util/logging/log_types.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryLogger {
  SentryLogger._();

  static void logDebug(String message, {LogType? type}) => Sentry.logger.debug(
        message,
        attributes: {
          'subtype': type != null ? type.sentryAttribute : SentryAttribute.string('UNKNOWN'),
        },
      );

  static void logInfo(String message, {LogType? type}) => Sentry.logger.info(
        message,
        attributes: {
          'subtype': type != null ? type.sentryAttribute : SentryAttribute.string('UNKNOWN'),
        },
      );

  static void logWarning(String message, {LogType? type}) => Sentry.logger.warn(
        message,
        attributes: {
          'subtype': type != null ? type.sentryAttribute : SentryAttribute.string('UNKNOWN'),
        },
      );

  static void logError(String message, {LogType? type}) => Sentry.logger.error(
        message,
        attributes: {
          'subtype': type != null ? type.sentryAttribute : SentryAttribute.string('UNKNOWN'),
        },
      );

  static void logFatal(String message, {LogType? type}) => Sentry.logger.fatal(
        message,
        attributes: {
          'subtype': type != null ? type.sentryAttribute : SentryAttribute.string('UNKNOWN'),
        },
      );

  static void captureException(dynamic error, {StackTrace? stackTrace, String? message}) => Sentry.captureException(
        error,
        stackTrace: stackTrace,
        message: message != null ? SentryMessage(message) : null,
      );
}
