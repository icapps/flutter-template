import 'package:flutter_template/util/sentry/sentry_drop_rule.dart';
import 'package:flutter_template/util/sentry/sentry_event_filter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class GeneralSentryEventFilter extends SentryEventFilter {
  GeneralSentryEventFilter({
    super.minimumLevelToKeep,
  }) : super.shared(
         defaultRules: rules,
       );

  static final List<SentryDropRule> rules = [];

  @override
  bool get shouldApplyRules => true;

  @override
  SentryEvent? beforeSend(SentryEvent event, Hint hint) {
    return applyRules(event, hint);
  }
}
