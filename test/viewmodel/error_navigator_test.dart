import 'package:flutter/material.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_injectable.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async {
    await initTestInjectable();
    seedGlobalViewModel();
  });

  testWidgets('Test errormixin showError', (tester) async {
    final sut = ErrorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'error_mixin_show_error_before_show');

    final finder = find.byKey(const ValueKey('showError'));
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'error_mixin_show_error');
  });

  testWidgets('Test errormixin showErrorWithLocaleKey', (tester) async {
    final sut = ErrorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'error_mixin_show_error_with_locale_key_before_show');

    final finder = find.byKey(const ValueKey('showErrorWithLocaleKey'));
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'error_mixin_show_error_with_locale_key');
  });
}

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> with ErrorNavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              key: const ValueKey('showErrorWithLocaleKey'),
              child: const Text(
                'Show Error with locale key',
              ),
              color: Colors.amber,
              onPressed: () {
                showErrorWithLocaleKey(LocalizationKeys.errorUnauthorized);
              },
            ),
            MaterialButton(
              key: const ValueKey('showError'),
              child: const Text(
                'Show Error',
              ),
              color: Colors.amber,
              onPressed: () {
                showError('SOMETHING something');
              },
            ),
          ],
        ),
      ),
    );
  }
}
