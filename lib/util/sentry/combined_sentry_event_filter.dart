import 'package:flutter_template/util/sentry/background_sentry_event_filter.dart';
import 'package:flutter_template/util/sentry/general_sentry_event_filter.dart';
import 'package:flutter_template/util/sentry/sentry_event_filter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class CombinedSentryEventFilter extends SentryEventFilter {
  CombinedSentryEventFilter({
    SentryLevel? minimumLevelToKeep,
  }) : _backgroundFilter = BackgroundSentryEventFilter(
         minimumLevelToKeep: minimumLevelToKeep,
       ),
       _generalFilter = GeneralSentryEventFilter(
         minimumLevelToKeep: minimumLevelToKeep,
       ),
       super.shared(defaultRules: const []);

  final BackgroundSentryEventFilter _backgroundFilter;
  final GeneralSentryEventFilter _generalFilter;

  @override
  bool get shouldApplyRules => true;

  @override
  void init({SentryLevel? minimumLevelToKeep}) {
    super.init(minimumLevelToKeep: minimumLevelToKeep);
    _backgroundFilter.init(minimumLevelToKeep: minimumLevelToKeep);
    _generalFilter.init(minimumLevelToKeep: minimumLevelToKeep);
  }

  @override
  SentryEvent? beforeSend(SentryEvent event, Hint hint) {
    final backgroundResult = _backgroundFilter.beforeSend(event, hint);
    if (backgroundResult == null) {
      return null;
    }

    return _generalFilter.beforeSend(backgroundResult, hint);
  }
}
