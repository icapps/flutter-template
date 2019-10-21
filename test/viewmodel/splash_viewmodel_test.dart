import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../di/test_kiwi_container.dart';

void main() {
  setUp(() async => TestKiwiContainer.init());

  test('Test splash viewmodel with a clean install', () async {
    final splashViewModel = KiwiContainer.resolve<SplashViewModel>();
    final mock = SplashNavigatorMockInterface();
    await splashViewModel.init(mock);
    verify(mock.goToHome()).called(1);
  });
}

class SplashNavigatorMockInterface extends Mock implements SplashNavigator {}
