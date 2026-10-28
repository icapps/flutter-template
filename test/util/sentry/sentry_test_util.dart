import 'package:flutter_template/util/sentry/sentry_drop_rule.dart';
import 'package:flutter_template/util/sentry/sentry_event_filter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Minimal filter to exercise the shared rule engine in [SentryEventFilter].
final class TestSentryEventFilter extends SentryEventFilter {
  TestSentryEventFilter({
    required List<SentryDropRule> rules,
    this.applyRulesEnabled = true,
    super.minimumLevelToKeep,
  }) : super.shared(defaultRules: rules);

  final bool applyRulesEnabled;

  @override
  bool get shouldApplyRules => applyRulesEnabled;

  @override
  SentryEvent? beforeSend(SentryEvent event, Hint hint) =>
      applyRules(event, hint);
}

SentryDropRule ruleDroppingMessage(String id, String needle) {
  return SentryDropRule(
    id: id,
    matcher: (event, hint) =>
        event.message?.formatted.contains(needle) ?? false,
  );
}

SentryEvent eventWithMessage(String message, {SentryLevel? level}) {
  return SentryEvent(message: SentryMessage(message), level: level);
}
