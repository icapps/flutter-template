import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/sentry/background_sentry_event_filter.dart';
import 'package:flutter_template/util/sentry/combined_sentry_event_filter.dart';
import 'package:flutter_template/util/sentry/general_sentry_event_filter.dart';
import 'package:flutter_template/util/sentry/sentry_drop_rule.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'sentry_test_util.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  void setAppLifecycleState(AppLifecycleState state) {
    binding.handleAppLifecycleStateChanged(state);
  }

  late SentryDropRule backgroundRule;
  late SentryDropRule generalRule;

  setUp(() {
    setAppLifecycleState(AppLifecycleState.resumed);
    backgroundRule =
        ruleDroppingMessage('background_test_rule', 'background drop');
    generalRule = ruleDroppingMessage('general_test_rule', 'general drop');
  });

  tearDown(() {
    setAppLifecycleState(AppLifecycleState.resumed);
    BackgroundSentryEventFilter.rules.remove(backgroundRule);
    GeneralSentryEventFilter.rules.remove(generalRule);
  });

  void registerBackgroundRule() =>
      BackgroundSentryEventFilter.rules.add(backgroundRule);
  void registerGeneralRule() => GeneralSentryEventFilter.rules.add(generalRule);

  group('CombinedSentryEventFilter', () {
    test('always applies rules', () {
      expect(CombinedSentryEventFilter().shouldApplyRules, isTrue);
    });

    test('keeps events by default', () {
      setAppLifecycleState(AppLifecycleState.paused);
      final event = SentryEvent(throwable: Exception('some error'));

      expect(
          CombinedSentryEventFilter().beforeSend(event, Hint()), same(event));
    });

    test('drops events matched by a background rule while in the background',
        () {
      registerBackgroundRule();
      setAppLifecycleState(AppLifecycleState.paused);

      expect(
          CombinedSentryEventFilter()
              .beforeSend(eventWithMessage('background drop'), Hint()),
          isNull);
    });

    test('keeps events matched by a background rule while in the foreground',
        () {
      registerBackgroundRule();
      setAppLifecycleState(AppLifecycleState.resumed);
      final event = eventWithMessage('background drop');

      expect(
          CombinedSentryEventFilter().beforeSend(event, Hint()), same(event));
    });

    test('drops events matched by a general rule regardless of lifecycle', () {
      registerGeneralRule();
      final filter = CombinedSentryEventFilter();

      setAppLifecycleState(AppLifecycleState.resumed);
      expect(
          filter.beforeSend(eventWithMessage('general drop'), Hint()), isNull);

      setAppLifecycleState(AppLifecycleState.paused);
      expect(
          filter.beforeSend(eventWithMessage('general drop'), Hint()), isNull);
    });

    test('keeps events that match no rule', () {
      registerBackgroundRule();
      registerGeneralRule();
      setAppLifecycleState(AppLifecycleState.paused);
      final event = eventWithMessage('unrelated');

      expect(
          CombinedSentryEventFilter().beforeSend(event, Hint()), same(event));
    });

    test('applies the minimum level passed to the constructor to both filters',
        () {
      registerBackgroundRule();
      registerGeneralRule();
      setAppLifecycleState(AppLifecycleState.paused);
      final filter =
          CombinedSentryEventFilter(minimumLevelToKeep: SentryLevel.error);
      final backgroundEvent =
          eventWithMessage('background drop', level: SentryLevel.error);
      final generalEvent =
          eventWithMessage('general drop', level: SentryLevel.error);

      expect(filter.beforeSend(backgroundEvent, Hint()), same(backgroundEvent));
      expect(filter.beforeSend(generalEvent, Hint()), same(generalEvent));
    });

    test('init propagates the minimum level to both filters', () {
      registerBackgroundRule();
      registerGeneralRule();
      setAppLifecycleState(AppLifecycleState.paused);
      final filter = CombinedSentryEventFilter();
      final backgroundEvent =
          eventWithMessage('background drop', level: SentryLevel.error);
      final generalEvent =
          eventWithMessage('general drop', level: SentryLevel.error);
      expect(filter.beforeSend(backgroundEvent, Hint()), isNull);
      expect(filter.beforeSend(generalEvent, Hint()), isNull);

      filter.init(minimumLevelToKeep: SentryLevel.error);

      expect(filter.beforeSend(backgroundEvent, Hint()), same(backgroundEvent));
      expect(filter.beforeSend(generalEvent, Hint()), same(generalEvent));
    });
  });
}
