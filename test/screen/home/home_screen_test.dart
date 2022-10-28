import 'package:flutter/material.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_themes_util.dart';
import '../../util/test_util.dart';
import '../debug/debug_screen_test.dart';
import '../seed.dart';
import '../todo/todo_list/todo_list_screen_test.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('Test home screen initial state', (tester) async {
    TestThemeUtil.setLightMode();

    seedGlobalViewModel();
    seedTodoListViewModel();
    seedDebugViewModel();
    seedLocalStorage();

    const sut = HomeScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'home_screen_initial_state');
    verifyTodoListViewModel();
    verifyDebugViewModel();
    verifyGlobalViewModelForDebugScreen();
    verifyGlobalViewModel();

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

  testWidgets('Test home screen initial state dark mode', (tester) async {
    TestThemeUtil.setDarkMode();

    seedGlobalViewModel();
    seedTodoListViewModel();
    seedDebugViewModel();
    seedLocalStorage();

    const sut = HomeScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'home_screen_initial_state_darkmode');
    verifyTodoListViewModel();
    verifyDebugViewModel();
    verifyGlobalViewModelForDebugScreen();
    verifyGlobalViewModel();

    final firstTab = find.byIcon(Icons.list);
    expect(firstTab, findsOneWidget);
    await tester.tap(firstTab);
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'home_screen_initial_state_first_tab_darkmode');

    final secondTab = find.byIcon(Icons.settings);
    expect(secondTab, findsOneWidget);
    await tester.tap(firstTab);
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'home_screen_initial_state_second_tab_darkmode');
  });
}
