import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {

  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test debug screen on select target clicked', (tester) async {
    seedDebugViewModel();
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
    verify(mockNavigation.showCustomDialog<void>(builder: anyNamed('builder'))).calledOnce();
    verifyNoMoreInteractions(mockNavigation);
  });
}
