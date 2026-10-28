import 'package:flutter_template/util/sentry/sentry_drop_rule.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  group('SentryDropRule', () {
    test('exposes its id and matcher', () {
      bool matcher(SentryEvent event, Hint hint) => true;

      final rule = SentryDropRule(id: 'rule', matcher: matcher);

      expect(rule.id, 'rule');
      expect(rule.matcher, same(matcher));
    });

    test('matcher receives the event and hint it is invoked with', () {
      SentryEvent? receivedEvent;
      Hint? receivedHint;
      final rule = SentryDropRule(
        id: 'capture',
        matcher: (event, hint) {
          receivedEvent = event;
          receivedHint = hint;
          return true;
        },
      );
      final event = SentryEvent();
      final hint = Hint();

      final result = rule.matcher(event, hint);

      expect(result, isTrue);
      expect(receivedEvent, same(event));
      expect(receivedHint, same(hint));
    });
  });
}
