import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class SentryConfig {
  static SentryFlutterOptions development(SentryFlutterOptions options) {
    options
      ..dsn = FlavorConfig.instance.values.dsn
      ..debug = true
      ..enableLogs = true
      ..diagnosticLevel = SentryLevel.debug
      ..environment = FlavorConfig.instance.flavor.name
      ..tracesSampleRate = 1.0;
    return options;
  }

  static SentryFlutterOptions alpha(SentryFlutterOptions options) {
    options
      ..dsn = FlavorConfig.instance.values.dsn
      ..debug = false
      ..beforeSendLog = (event) {
        if (event.level == SentryLogLevel.debug || event.level == SentryLogLevel.info) {
          return null;
        }
        return event;
      }
      ..diagnosticLevel = SentryLevel.error
      ..environment = FlavorConfig.instance.flavor.name
      ..tracesSampleRate = 1.0;
    return options;
  }

  static SentryFlutterOptions beta(SentryFlutterOptions options) {
    options
      ..dsn = FlavorConfig.instance.values.dsn
      ..debug = false
      ..beforeSendLog = (event) {
        if (event.level == SentryLogLevel.debug || event.level == SentryLogLevel.info) {
          return null;
        }
        return event;
      }
      ..diagnosticLevel = SentryLevel.error
      ..environment = FlavorConfig.instance.flavor.name
      ..tracesSampleRate = 1.0;
    return options;
  }

  static SentryFlutterOptions prod(SentryFlutterOptions options) {
    options
      ..dsn = FlavorConfig.instance.values.dsn
      ..debug = false
      ..beforeSendLog = (event) {
        if (event.level == SentryLogLevel.debug || event.level == SentryLogLevel.info) {
          return null;
        }
        return event;
      }
      ..diagnosticLevel = SentryLevel.error
      ..environment = FlavorConfig.instance.flavor.name
      ..tracesSampleRate = 1.0;
    return options;
  }
}
