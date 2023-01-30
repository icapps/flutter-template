import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'splash_viewmodel_test.mocks.dart';

@GenerateMocks([
  LoginRepository,
  LocalStorage,
  MainNavigator,
])
void main() {
  late SplashViewModel sut;
  late MockLoginRepository loginRepo;
  late LocalStorage localStorage;
  late MainNavigator navigator;

  setUp(() async {
    loginRepo = MockLoginRepository();
    navigator = MockMainNavigator();
    localStorage = MockLocalStorage();
    sut = SplashViewModel(loginRepo, localStorage, navigator);
  });

  test('SplashViewModel init with loggedin user', () async {
    when(loginRepo.isLoggedIn).thenAnswer((_) async => true);
    await sut.init();
    verify(loginRepo.isLoggedIn).calledOnce();
    verify(navigator.goToHomeScreen()).calledOnce();
    verifyNoMoreInteractions(loginRepo);
    verifyNoMoreInteractions(navigator);
  });

  test('SplashViewModel init without loggedin user', () async {
    when(loginRepo.isLoggedIn).thenAnswer((_) async => false);
    await sut.init();
    verify(loginRepo.isLoggedIn).calledOnce();
    verify(navigator.goToLoginScreen()).calledOnce();
    verifyNoMoreInteractions(loginRepo);
    verifyNoMoreInteractions(navigator);
  });
}
