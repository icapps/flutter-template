import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/sentry/background_sentry_event_filter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'sentry_test_util.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  void setAppLifecycleState(AppLifecycleState state) {
    binding.handleAppLifecycleStateChanged(state);
  }

  setUp(() {
    setAppLifecycleState(AppLifecycleState.resumed);
  });

  tearDown(() {
    setAppLifecycleState(AppLifecycleState.resumed);
  });

  group('BackgroundSentryEventFilter', () {
    test('does not apply rules in the foreground', () {
      setAppLifecycleState(AppLifecycleState.resumed);

      expect(BackgroundSentryEventFilter().shouldApplyRules, isFalse);
    });

    test('applies rules when the app is paused', () {
      setAppLifecycleState(AppLifecycleState.paused);

      expect(BackgroundSentryEventFilter().shouldApplyRules, isTrue);
    });

    test('applies rules when the app is hidden', () {
      setAppLifecycleState(AppLifecycleState.hidden);

      expect(BackgroundSentryEventFilter().shouldApplyRules, isTrue);
    });

    test('registers the example rule', () {
      expect(BackgroundSentryEventFilter.rules.map((rule) => rule.id),
          contains('example_background_event'));
    });

    test(
        'keeps events in the background because the example rule never matches',
        () {
      setAppLifecycleState(AppLifecycleState.paused);
      final events = [
        SentryEvent(throwable: Exception('some error')),
        eventWithMessage('some message'),
        SentryEvent(logger: 'some logger'),
      ];

      for (final event in events) {
        expect(BackgroundSentryEventFilter().beforeSend(event, Hint()),
            same(event));
      }
    });

    test('drops events matching a registered rule in the background', () {
      final rule =
          ruleDroppingMessage('background_test_rule', 'background drop');
      BackgroundSentryEventFilter.rules.add(rule);
      addTearDown(() => BackgroundSentryEventFilter.rules.remove(rule));
      setAppLifecycleState(AppLifecycleState.paused);

      final result = BackgroundSentryEventFilter()
          .beforeSend(eventWithMessage('background drop'), Hint());

      expect(result, isNull);
    });

    test('keeps events matching a registered rule in the foreground', () {
      final rule =
          ruleDroppingMessage('background_test_rule', 'background drop');
      BackgroundSentryEventFilter.rules.add(rule);
      addTearDown(() => BackgroundSentryEventFilter.rules.remove(rule));
      setAppLifecycleState(AppLifecycleState.resumed);
      final event = eventWithMessage('background drop');

      expect(
          BackgroundSentryEventFilter().beforeSend(event, Hint()), same(event));
    });

    test('keeps matched events at or above the minimum level in the background',
        () {
      final rule =
          ruleDroppingMessage('background_test_rule', 'background drop');
      BackgroundSentryEventFilter.rules.add(rule);
      addTearDown(() => BackgroundSentryEventFilter.rules.remove(rule));
      setAppLifecycleState(AppLifecycleState.paused);
      final filter =
          BackgroundSentryEventFilter(minimumLevelToKeep: SentryLevel.fatal);
      final fatal =
          eventWithMessage('background drop', level: SentryLevel.fatal);
      final error =
          eventWithMessage('background drop', level: SentryLevel.error);

      expect(filter.beforeSend(fatal, Hint()), same(fatal));
      expect(filter.beforeSend(error, Hint()), isNull);
    });
  });
}
