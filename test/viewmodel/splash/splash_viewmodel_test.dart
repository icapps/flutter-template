import 'package:flutter_template/navigator/onboarding_navigator.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'splash_viewmodel_test.mocks.dart';

@GenerateMocks([
  LocalStorage,
  OnboardingNavigator,
])
void main() {
  late SplashViewModel sut;
  late LocalStorage localStorage;
  late OnboardingNavigator onboardingNavigator;

  setUp(() async {
    onboardingNavigator = MockOnboardingNavigator();
    localStorage = MockLocalStorage();
    sut = SplashViewModel(localStorage, onboardingNavigator);
  });

  test('SplashViewModel init with loggedin user', () async {
    await sut.init();
    verify(onboardingNavigator.goToNextScreen()).calledOnce();
    verifyNoMoreInteractions(onboardingNavigator);
  });
}
