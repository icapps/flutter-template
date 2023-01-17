import 'package:flutter/material.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../util/test_util.dart';
import '../debug/debug_screen_test.dart';
import '../seed.dart';
import '../todo/todo_list/todo_list_screen_test.dart';

@GenerateMocks([
  GlobalViewModel,
  TodoListViewModel,
  DebugViewModel,
  LocalStorage,
])
void main() {
  testWidgets('Test home screen initial state', (tester) async {
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
