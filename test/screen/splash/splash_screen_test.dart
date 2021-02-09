import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('Test splash screen initial state', (tester) async {
    seedGlobalViewModel();

    const sut = SplashScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'splash_screen_inital_state');
    verifySplashViewModel();
    verifyGlobalViewModel();
  });
}

void verifySplashViewModel() {
  final splash = GetIt.I<SplashViewModel>();
  verify(splash.init(any)).calledOnce();
  verifyNoMoreInteractions(splash);
}
