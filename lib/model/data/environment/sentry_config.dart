import 'package:sentry_flutter/sentry_flutter.dart';

final class SentryConfig {
  static const String _defaultDSN = '';
  static const double _defaultTracesSampleRate = 1.0;

  static SentryFlutterOptions development(SentryFlutterOptions options) {
    options
      ..dsn = _defaultDSN
      ..debug = true
      ..enableLogs = true
      ..diagnosticLevel = SentryLevel.debug
      ..environment = 'development'
      ..tracesSampleRate = _defaultTracesSampleRate;
    return options;
  }

  static SentryFlutterOptions alpha(SentryFlutterOptions options) {
    options
      ..dsn = _defaultDSN
      ..debug = false
      ..beforeSendLog = (event) {
        if (event.level == SentryLogLevel.debug || event.level == SentryLogLevel.info) {
          return null;
        }
        return event;
      }
      ..diagnosticLevel = SentryLevel.error
      ..environment = 'alpha'
      ..tracesSampleRate = _defaultTracesSampleRate;
    return options;
  }

  static SentryFlutterOptions beta(SentryFlutterOptions options) {
    options
      ..dsn = _defaultDSN
      ..debug = false
      ..beforeSendLog = (event) {
        if (event.level == SentryLogLevel.debug || event.level == SentryLogLevel.info) {
          return null;
        }
        return event;
      }
      ..diagnosticLevel = SentryLevel.error
      ..environment = 'beta'
      ..tracesSampleRate = _defaultTracesSampleRate;
    return options;
  }

  static SentryFlutterOptions prod(SentryFlutterOptions options) {
    options
      ..dsn = _defaultDSN
      ..debug = false
      ..beforeSendLog = (event) {
        if (event.level == SentryLogLevel.debug || event.level == SentryLogLevel.info) {
          return null;
        }
        return event;
      }
      ..diagnosticLevel = SentryLevel.error
      ..environment = 'production'
      ..tracesSampleRate = _defaultTracesSampleRate;
    return options;
  }
}
