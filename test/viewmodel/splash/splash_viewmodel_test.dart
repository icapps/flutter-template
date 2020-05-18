import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/repository/login/mock_login_repository.dart';
import '../../mocks/repository/shared_prefs/local/mock_local_storage.dart';
import '../../util/test_extensions.dart';

void main() {
  SplashViewModel sut;
  MockLoginRepository loginRepo;
  MockLocalStorage localStorage;
  SplashNavigator navigator;

  setUp(() async {
    await TestKiwiUtil.init();
    loginRepo = TestKiwiUtil.resolveAs<LoginRepo, MockLoginRepository>();
    navigator = MockSplashNavigator();
    localStorage = MockLocalStorage();
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
