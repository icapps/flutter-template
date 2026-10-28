import 'package:flutter_template/util/sentry/sentry_drop_rule.dart';
import 'package:flutter_template/util/sentry/combined_sentry_event_filter.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@lazySingleton
abstract class SentryEventFilter {
  @factoryMethod
  factory SentryEventFilter() = CombinedSentryEventFilter;

  SentryEventFilter.shared({
    required List<SentryDropRule> defaultRules,
    SentryLevel? minimumLevelToKeep,
  }) : _rules = [
         ...defaultRules,
       ],
       _minimumLevelToKeep = minimumLevelToKeep;

  final List<SentryDropRule> _rules;
  SentryLevel? _minimumLevelToKeep;

  bool get shouldApplyRules;

  void init({SentryLevel? minimumLevelToKeep}) {
    _minimumLevelToKeep = minimumLevelToKeep;
  }

  SentryEvent? beforeSend(SentryEvent event, Hint hint);

  SentryEvent? applyRules(SentryEvent event, Hint hint) {
    if (!shouldApplyRules) {
      return event;
    }

    for (final rule in _rules) {
      if (!rule.matcher(event, hint)) {
        continue;
      }

      if (_shouldKeepMatchedEventForLevel(event)) {
        return event;
      }

      return null;
    }

    return event;
  }

  bool _shouldKeepMatchedEventForLevel(SentryEvent event) {
    final minimumLevel = _minimumLevelToKeep;
    if (minimumLevel == null) {
      return false;
    }

    final eventLevel = event.level;
    if (eventLevel == null) {
      return false;
    }

    return eventLevel.toDartLogLevel() >= minimumLevel.toDartLogLevel();
  }
}
