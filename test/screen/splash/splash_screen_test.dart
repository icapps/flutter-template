import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../mocks/viewmodel/debug/mock_debug_viewmodel.dart';
import '../../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../../mocks/viewmodel/splash/mock_splash_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  MockSplashViewModel splashViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    splashViewModel = TestKiwiUtil.resolveAs<SplashViewModel, MockSplashViewModel>();
  });

  testWidgets('Test splash screen initial state', (tester) async {
    when(splashViewModel.init(any)).thenAnswer((_) => Future.value());
    seedGlobalViewModel();

    const sut = SplashScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'splash_screen_inital_state_IGNORE');
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'splash_screen_inital_state');
    verifySplashViewModel();
    verifyGlobalViewModel();
  });
}

void verifySplashViewModel() {
  final splash = TestKiwiUtil.resolveAs<SplashViewModel, MockSplashViewModel>();
  verify(splash.init(any)).calledOnce();
  verifyNoMoreInteractions(splash);
}
