import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_injectable.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('Test main navigator widget go to home', (tester) async {
    seedTodoListViewModel();
    seedDebugViewModel();
    seedGlobalViewModel();
    seedAuthStorage();
    seedLocalStorage();

    final mainNavigator = MainNavigator(getIt());
    final testWidget = await TestUtil.loadScreen(tester, const SizedBox.shrink());
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_home_screen_0_initial_screen');
    mainNavigator.goToHome();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_home_screen_1');
//    The app should go to the previous screen. For some reason the screenshot has been taken successfully but the
//    key.currentState!.goBack();
//    await tester.pumpAndSettle();
//    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_login_screen_2_go_back');
  });
}
