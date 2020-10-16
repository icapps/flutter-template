import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_text_styles.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/error_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_util.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
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
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              key: const ValueKey('showErrorWithLocaleKey'),
              child: const Text(
                'Show Error with locale key',
                style: ThemeTextStyles.lightButtonTextStyle,
              ),
              color: ThemeColors.accent,
              onPressed: () {
                showErrorWithLocaleKey(LocalizationKeys.errorUnauthorized);
              },
            ),
            MaterialButton(
              key: const ValueKey('showError'),
              child: const Text(
                'Show Error',
                style: ThemeTextStyles.lightButtonTextStyle,
              ),
              color: ThemeColors.accent,
              onPressed: () {
                showError('SOMETHING something');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  ScaffoldState getScaffoldState() => _key.currentState;
}
