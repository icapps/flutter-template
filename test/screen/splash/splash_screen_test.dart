import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import 'splash_screen_test.mocks.dart';

@GenerateMocks([
  SplashViewModel,
])
void main() {
  setUp(() {
    getIt.registerLazySingleton<SplashViewModel>(() => MockSplashViewModel());
  });

  tearDown(() async {
    verifySplashViewModel();
    await getIt.reset();
  });

  testWidgets('Test splash screen initial state', (tester) async {
    const sut = SplashScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'splash_screen_inital_state');
  });
}

void verifySplashViewModel() {
  final splash = getIt<SplashViewModel>();
  verify(splash.init()).calledOnce();
}
