import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../screen/seed.dart';
import '../util/test_util.dart';

@GenerateMocks([
  GlobalViewModel,
  TodoAddViewModel,
  AuthStorage,
  LocalStorage,
])
void main() {
  testWidgets('Test main navigator widget todo add', (tester) async {
    seedTodoAddViewModel();
    seedGlobalViewModel();
    seedAuthStorage();
    seedLocalStorage();

    final mainNavigator = MainNavigator(getIt.get());
    final testWidget = await TestUtil.loadScreen(tester, const SizedBox.shrink());
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_todo_add_screen_0_initial_screen');

    unawaited(mainNavigator.goToAddTodo());
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_todo_add_screen_1');
    mainNavigator.goBack<void>();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_todo_add_screen_2_go_back');
  });
}
