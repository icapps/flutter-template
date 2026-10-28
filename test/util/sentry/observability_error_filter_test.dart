import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/sentry/observability_error_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
  });

  tearDown(() {
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
  });

  group('ObservabilityErrorFilter.shouldDropBackgroundEvent', () {
    test('does not drop anything in the foreground', () {
      final result = ObservabilityErrorFilter.shouldDropBackgroundEvent(
        candidateTexts: ['some error'],
      );

      expect(result, isFalse);
    });

    test('does not drop the template example texts in the background', () {
      binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);

      final result = ObservabilityErrorFilter.shouldDropBackgroundEvent(
        candidateTexts: ['some error', 'Example', null],
      );

      expect(result, isFalse);
    });

    test('handles an empty list of candidates', () {
      binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);

      final result = ObservabilityErrorFilter.shouldDropBackgroundEvent(
        candidateTexts: const [],
      );

      expect(result, isFalse);
    });

    test('handles null-only candidates', () {
      binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);

      final result = ObservabilityErrorFilter.shouldDropBackgroundEvent(
        candidateTexts: const [null, null],
      );

      expect(result, isFalse);
    });
  });
}
