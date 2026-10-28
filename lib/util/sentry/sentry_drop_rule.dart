import 'package:sentry_flutter/sentry_flutter.dart';

typedef SentryDropRuleMatcher =
    bool Function(
      SentryEvent event,
      Hint hint,
    );

final class SentryDropRule {
  const SentryDropRule({
    required this.id,
    required this.matcher,
  });

  final String id;
  final SentryDropRuleMatcher matcher;
}
