import 'dart:convert';

import 'package:flutter_template/util/lifecycle/lifecycle_util.dart';
import 'package:flutter_template/util/sentry/observability_error_filter.dart';
import 'package:flutter_template/util/sentry/sentry_drop_rule.dart';
import 'package:flutter_template/util/sentry/sentry_event_filter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class BackgroundSentryEventFilter extends SentryEventFilter {
  BackgroundSentryEventFilter({
    super.minimumLevelToKeep,
  }) : super.shared(
          defaultRules: rules,
        );

  static final List<SentryDropRule> rules = [
    SentryDropRule(
      id: 'example_background_event',
      matcher: _dropExampleBackgroundEvent,
    ),
  ];

  @override
  bool get shouldApplyRules => LifecycleUtil.appIsInBackground;

  @override
  SentryEvent? beforeSend(SentryEvent event, Hint hint) {
    return applyRules(event, hint);
  }

  static bool _dropExampleBackgroundEvent(
    SentryEvent event,
    Hint hint,
  ) {
    return _eventTextMatches(event);
  }

  static bool _eventTextMatches(
    SentryEvent event,
  ) {
    return ObservabilityErrorFilter.shouldDropBackgroundEvent(
      candidateTexts: [
        event.throwable?.toString(),
        event.message?.formatted,
        jsonEncode(event.toJson()),
      ],
    );
  }
}
