import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../mocks/viewmodel/debug/mock_debug_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  MockDebugViewModel debugViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    debugViewModel = TestKiwiUtil.resolveAs<DebugViewModel, MockDebugViewModel>();
  });

  testWidgets('Test debug screen on select target clicked', (tester) async {
    when(debugViewModel.slowAnimationsEnabled).thenReturn(true);
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final debugKey = GlobalKey<DebugScreenState>();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: DebugScreen(key: debugKey),
    );
    await TestUtil.loadScreen(tester, sut);

    debugKey.currentState.goToTargetPlatformSelector();
    verify(mockNavigation.goToDebugPlatformSelector()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState.goToLicenses();
    verify(mockNavigation.goToLicense()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState.goToSelectLanguage();
    verify(mockNavigation.showCustomDialog(builder: anyNamed('builder'))).calledOnce();
    verifyNoMoreInteractions(mockNavigation);
  });
}
