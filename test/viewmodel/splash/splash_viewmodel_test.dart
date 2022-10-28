import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late SplashViewModel sut;
  late MockLoginRepository loginRepo;
  late LocalStorage localStorage;
  late MainNavigator navigator;

  setUp(() async {
    await initTestInjectable();
    loginRepo = getIt.resolveAs<LoginRepository, MockLoginRepository>();
    navigator = MockMainNavigator();
    localStorage = MockLocalStorage();
    sut = SplashViewModel(loginRepo, localStorage, navigator);
  });

  test('SplashViewModel init with loggedin user', () async {
    when(loginRepo.isLoggedIn).thenAnswer((_) async => true);
    await sut.init();
    verify(loginRepo.isLoggedIn).calledOnce();
    verify(navigator.goToHome()).calledOnce();
    verifyNoMoreInteractions(loginRepo);
    verifyNoMoreInteractions(navigator);
  });

  test('SplashViewModel init without loggedin user', () async {
    when(loginRepo.isLoggedIn).thenAnswer((_) async => false);
    await sut.init();
    verify(loginRepo.isLoggedIn).calledOnce();
    verify(navigator.goToLogin()).calledOnce();
    verifyNoMoreInteractions(loginRepo);
    verifyNoMoreInteractions(navigator);
  });
}
