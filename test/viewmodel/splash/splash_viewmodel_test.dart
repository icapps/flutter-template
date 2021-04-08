import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late SplashViewModel sut;
  late MockLoginRepo loginRepo;
  late LocalStoring localStorage;
  late SplashNavigator navigator;

  setUp(() async {
    await initTestInjectable();
    loginRepo = GetIt.I.resolveAs<LoginRepo, MockLoginRepo>();
    navigator = MockSplashNavigator();
    localStorage = MockLocalStoring();
    sut = SplashViewModel(loginRepo, localStorage);
  });

  test('SplashViewModel init with loggedin user', () async {
    when(loginRepo.isLoggedIn()).thenAnswer((_) async => true);
    await sut.init(navigator);
    verify(loginRepo.isLoggedIn()).calledOnce();
    verify(navigator.goToHome()).calledOnce();
    verifyNoMoreInteractions(loginRepo);
    verifyNoMoreInteractions(navigator);
  });

  test('SplashViewModel init without loggedin user', () async {
    when(loginRepo.isLoggedIn()).thenAnswer((_) async => false);
    await sut.init(navigator);
    verify(loginRepo.isLoggedIn()).calledOnce();
    verify(navigator.goToLogin()).calledOnce();
    verifyNoMoreInteractions(loginRepo);
    verifyNoMoreInteractions(navigator);
  });
}

class MockSplashNavigator extends Mock implements SplashNavigator {}
