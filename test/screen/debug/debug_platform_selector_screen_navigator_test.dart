import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  MockGlobalViewModel globalViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    globalViewModel = TestKiwiUtil.resolveAs<GlobalViewModel, MockGlobalViewModel>();
  });

  testWidgets('Test debug select platform screen navigator test', (tester) async {
    seedGlobalViewModel();
    when(globalViewModel.targetPlatform).thenReturn(TargetPlatform.iOS);

    final mockNavigation = MockMainNavigation();
    final key = GlobalKey<DebugPlatformSelectorScreenState>();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: DebugPlatformSelectorScreen(key: key),
    );
    await TestUtil.loadScreen(tester, sut);
    reset(globalViewModel);

    key.currentState.goBack<void>();
    verify(mockNavigation.goBack<void>()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    key.currentState.goBack(result: 'test');
    verify(mockNavigation.goBack(result: 'test')).calledOnce();
    verifyNoMoreInteractions(mockNavigation);
  });
}
