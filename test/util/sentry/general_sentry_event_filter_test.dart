import 'package:flutter_template/util/sentry/general_sentry_event_filter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'sentry_test_util.dart';

void main() {
  group('GeneralSentryEventFilter', () {
    test('always applies rules', () {
      expect(GeneralSentryEventFilter().shouldApplyRules, isTrue);
    });

    test('ships without default rules', () {
      expect(GeneralSentryEventFilter.rules, isEmpty);
    });

    test('keeps events by default', () {
      final event =
          SentryEvent(throwable: Exception('general filter default behavior'));

      expect(GeneralSentryEventFilter().beforeSend(event, Hint()), same(event));
    });

    test('drops events matching a registered rule', () {
      final rule = ruleDroppingMessage('general_test_rule', 'general drop');
      GeneralSentryEventFilter.rules.add(rule);
      addTearDown(() => GeneralSentryEventFilter.rules.remove(rule));

      final filter = GeneralSentryEventFilter();

      expect(
          filter.beforeSend(eventWithMessage('general drop'), Hint()), isNull);
    });

    test('keeps matched events at or above the minimum level', () {
      final rule = ruleDroppingMessage('general_test_rule', 'general drop');
      GeneralSentryEventFilter.rules.add(rule);
      addTearDown(() => GeneralSentryEventFilter.rules.remove(rule));
      final filter =
          GeneralSentryEventFilter(minimumLevelToKeep: SentryLevel.fatal);
      final fatal = eventWithMessage('general drop', level: SentryLevel.fatal);
      final error = eventWithMessage('general drop', level: SentryLevel.error);

      expect(filter.beforeSend(fatal, Hint()), same(fatal));
      expect(filter.beforeSend(error, Hint()), isNull);
    });
  });
}
