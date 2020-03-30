import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../mocks/viewmodel/debug/mock_debug_viewmodel.dart';
import '../../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';
import 'debug_screen_test.dart';

void main() {
  MockDebugViewModel debugViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    debugViewModel = TestKiwiUtil.resolveAs<DebugViewModel, MockDebugViewModel>();
  });

  testWidgets('Test debug screen disable slow animations', (tester) async {
    when(debugViewModel.slowAnimationsEnabled).thenReturn(true);
    seedGlobalViewModel();

    const sut = DebugScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_slow_animations_enabled');

    final target = find.byKey(Keys.debugSlowAnimations);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(debugViewModel.onSlowAnimationsChanged(false)).calledOnce();
    verifyDebugViewModel();
    verifyGlobalViewModelForDebugScreen();
    verifyGlobalViewModel();
  });
}
