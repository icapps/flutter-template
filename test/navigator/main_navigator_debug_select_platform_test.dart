import 'package:flutter/cupertino.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_util.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test main navigator widget login', (tester) async {
    seedGlobalViewModel();

    final key = GlobalKey<MainNavigatorWidgetState>();
    final sut = MainNavigatorWidget(key: key);
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_debug_select_platform_screen_0_initial_screen');
    key.currentState.goToDebugPlatformSelector();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_debug_select_platform_screen_1');
    key.currentState.goBack<void>();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_debug_select_platform_screen_2_go_back');
  });
}
