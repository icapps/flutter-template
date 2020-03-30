import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../mocks/viewmodel/debug/mock_debug_platform_selector_viewmodel.dart';
import '../../mocks/viewmodel/debug/mock_debug_viewmodel.dart';
import '../../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  MockDebugPlatformSelectorViewModel platformSelectorViewModel;
  MockDebugViewModel debugViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    debugViewModel = TestKiwiUtil.resolveAs<DebugViewModel, MockDebugViewModel>();
    platformSelectorViewModel = TestKiwiUtil.resolveAs<DebugPlatformSelectorViewModel, MockDebugPlatformSelectorViewModel>();
  });

  testWidgets('Test debug select platform screen initial state', (tester) async {
    when(debugViewModel.slowAnimationsEnabled).thenReturn(false);
    seedGlobalViewModel();

    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_inital_state');
    verifyDebugPlatformViewModel();
    verifyGlobalViewModel();
  });
}

void verifyDebugPlatformViewModel() {
  final platformSelectorViewModel = TestKiwiUtil.resolveAs<DebugPlatformSelectorViewModel, MockDebugPlatformSelectorViewModel>();
  verify(platformSelectorViewModel.init(any)).calledOnce();
  verifyNoMoreInteractions(platformSelectorViewModel);
}
