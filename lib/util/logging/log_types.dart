import 'package:sentry_flutter/sentry_flutter.dart';

enum LogType {
  debug,
  global,
  license,
  logDetal,
  login,
  logs,
  permission,
  splash,
  todo,
}

extension LogTypeExtension on LogType {
  SentryAttribute get sentryAttribute => SentryAttribute.string(
        name.toUpperCase(),
      );
}
