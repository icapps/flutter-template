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

void main() {
  MockDebugViewModel debugViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    debugViewModel = TestKiwiUtil.resolveAs<DebugViewModel, MockDebugViewModel>();
  });

  testWidgets('Test debug screen initial state', (tester) async {
    when(debugViewModel.slowAnimationsEnabled).thenReturn(false);
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: const DebugScreen(),
    );
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_inital_state');
    verifyDebugViewModel();
    verifyGlobalViewModelForDebugScreen();
    verifyGlobalViewModel();
  });
}

void verifyDebugViewModel() {
  final debugViewModel = TestKiwiUtil.resolveAs<DebugViewModel, MockDebugViewModel>();
  verify(debugViewModel.init(any)).calledOnce();
  verify(debugViewModel.slowAnimationsEnabled);
  verifyNoMoreInteractions(debugViewModel);
}

void verifyGlobalViewModelForDebugScreen() {
  final globalViewModel = TestKiwiUtil.resolveAs<GlobalViewModel, MockGlobalViewModel>();
  verify(globalViewModel.showsTranslationKeys);
  verify(globalViewModel.getCurrentLanguage());
  verify(globalViewModel.getCurrentPlatform());
}
