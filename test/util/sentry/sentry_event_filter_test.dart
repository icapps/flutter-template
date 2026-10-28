import 'package:flutter_template/util/sentry/combined_sentry_event_filter.dart';
import 'package:flutter_template/util/sentry/sentry_drop_rule.dart';
import 'package:flutter_template/util/sentry/sentry_event_filter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'sentry_test_util.dart';

void main() {
  group('SentryEventFilter factory', () {
    test('creates a CombinedSentryEventFilter', () {
      expect(SentryEventFilter(), isA<CombinedSentryEventFilter>());
    });
  });

  group('SentryEventFilter.applyRules', () {
    test('keeps the event when there are no rules', () {
      final filter = TestSentryEventFilter(rules: const []);
      final event = eventWithMessage('anything');

      expect(filter.beforeSend(event, Hint()), same(event));
    });

    test('keeps the event when no rule matches', () {
      final filter = TestSentryEventFilter(
          rules: [ruleDroppingMessage('drop', 'drop me')]);
      final event = eventWithMessage('keep me');

      expect(filter.beforeSend(event, Hint()), same(event));
    });

    test('drops the event when a rule matches', () {
      final filter = TestSentryEventFilter(
          rules: [ruleDroppingMessage('drop', 'drop me')]);

      expect(filter.beforeSend(eventWithMessage('please drop me'), Hint()),
          isNull);
    });

    test('drops the event when only one of multiple rules matches', () {
      final filter = TestSentryEventFilter(
        rules: [
          ruleDroppingMessage('first', 'first'),
          ruleDroppingMessage('second', 'second'),
        ],
      );

      expect(filter.beforeSend(eventWithMessage('the second one'), Hint()),
          isNull);
    });

    test('passes the event and hint to the matcher', () {
      SentryEvent? receivedEvent;
      Hint? receivedHint;
      final filter = TestSentryEventFilter(
        rules: [
          SentryDropRule(
            id: 'capture',
            matcher: (event, hint) {
              receivedEvent = event;
              receivedHint = hint;
              return false;
            },
          ),
        ],
      );
      final event = eventWithMessage('event');
      final hint = Hint();

      filter.beforeSend(event, hint);

      expect(receivedEvent, same(event));
      expect(receivedHint, same(hint));
    });

    test('ignores all rules when shouldApplyRules is false', () {
      final filter = TestSentryEventFilter(
        rules: [ruleDroppingMessage('drop', 'drop me')],
        applyRulesEnabled: false,
      );
      final event = eventWithMessage('drop me');

      expect(filter.beforeSend(event, Hint()), same(event));
    });

    test('does not evaluate matchers when shouldApplyRules is false', () {
      var matcherCalls = 0;
      final filter = TestSentryEventFilter(
        rules: [
          SentryDropRule(
            id: 'counting',
            matcher: (event, hint) {
              matcherCalls++;
              return true;
            },
          ),
        ],
        applyRulesEnabled: false,
      );

      filter.beforeSend(eventWithMessage('x'), Hint());

      expect(matcherCalls, 0);
    });

    test('does not mutate the default rules list passed in', () {
      final rules = [ruleDroppingMessage('drop', 'drop me')];
      TestSentryEventFilter(rules: rules);

      expect(rules, hasLength(1));
    });
  });

  group('SentryEventFilter minimumLevelToKeep', () {
    test('drops a matched event when no minimum level is configured', () {
      final filter =
          TestSentryEventFilter(rules: [ruleDroppingMessage('drop', 'drop')]);

      expect(
          filter.beforeSend(
              eventWithMessage('drop', level: SentryLevel.fatal), Hint()),
          isNull);
    });

    test('keeps a matched event whose level equals the minimum level', () {
      final filter = TestSentryEventFilter(
        rules: [ruleDroppingMessage('drop', 'drop')],
        minimumLevelToKeep: SentryLevel.error,
      );
      final event = eventWithMessage('drop', level: SentryLevel.error);

      expect(filter.beforeSend(event, Hint()), same(event));
    });

    test('keeps a matched event whose level is above the minimum level', () {
      final filter = TestSentryEventFilter(
        rules: [ruleDroppingMessage('drop', 'drop')],
        minimumLevelToKeep: SentryLevel.warning,
      );
      final event = eventWithMessage('drop', level: SentryLevel.fatal);

      expect(filter.beforeSend(event, Hint()), same(event));
    });

    test('drops a matched event whose level is below the minimum level', () {
      final filter = TestSentryEventFilter(
        rules: [ruleDroppingMessage('drop', 'drop')],
        minimumLevelToKeep: SentryLevel.fatal,
      );

      expect(
          filter.beforeSend(
              eventWithMessage('drop', level: SentryLevel.error), Hint()),
          isNull);
    });

    test(
        'drops a matched event without level even when a minimum level is configured',
        () {
      final filter = TestSentryEventFilter(
        rules: [ruleDroppingMessage('drop', 'drop')],
        minimumLevelToKeep: SentryLevel.debug,
      );

      expect(filter.beforeSend(eventWithMessage('drop'), Hint()), isNull);
    });

    test('keeps unmatched events regardless of the minimum level', () {
      final filter = TestSentryEventFilter(
        rules: [ruleDroppingMessage('drop', 'drop')],
        minimumLevelToKeep: SentryLevel.fatal,
      );
      final event = eventWithMessage('other', level: SentryLevel.debug);

      expect(filter.beforeSend(event, Hint()), same(event));
    });

    test('init updates the minimum level', () {
      final filter =
          TestSentryEventFilter(rules: [ruleDroppingMessage('drop', 'drop')]);
      final event = eventWithMessage('drop', level: SentryLevel.error);
      expect(filter.beforeSend(event, Hint()), isNull);

      filter.init(minimumLevelToKeep: SentryLevel.error);

      expect(filter.beforeSend(event, Hint()), same(event));
    });

    test('init without a level clears the minimum level', () {
      final filter = TestSentryEventFilter(
        rules: [ruleDroppingMessage('drop', 'drop')],
        minimumLevelToKeep: SentryLevel.debug,
      );
      final event = eventWithMessage('drop', level: SentryLevel.error);
      expect(filter.beforeSend(event, Hint()), same(event));

      filter.init();

      expect(filter.beforeSend(event, Hint()), isNull);
    });
  });
}
