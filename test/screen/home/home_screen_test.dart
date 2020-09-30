import 'package:flutter/material.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_kiwi_util.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test home screen initial state', (tester) async {
    final sut = HomeScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'home_screen_initial_state');

    final firstTab = find.byIcon(Icons.list);
    expect(firstTab, findsOneWidget);
    await tester.tap(firstTab);
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'home_screen_initial_state_first_tab');

    final secondTab = find.byIcon(Icons.settings);
    expect(secondTab, findsOneWidget);
    await tester.tap(firstTab);
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'home_screen_initial_state_second_tab');
  });
}
