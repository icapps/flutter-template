import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/model/exceptions/general_network_error.dart';
import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/repository/login/mock_login_repository.dart';
import '../../util/test_extensions.dart';

void main() {
  LoginViewModel sut;
  MockLoginRepository loginRepo;
  LoginNavigator navigator;

  setUp(() async {
    await TestKiwiUtil.init();
    loginRepo = TestKiwiUtil.resolveAs<LoginRepo, MockLoginRepository>();
    navigator = MockLoginNavigator();
    sut = LoginViewModel(loginRepo);
  });

  test('LoginViewModel init with loggedin user', () async {
    await sut.init(navigator);
    expect(sut.isLoginEnabled, false);
    expect(sut.isLoading, false);
    verifyZeroInteractions(loginRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      await sut.init(navigator);
      reset(loginRepo);
      reset(navigator);
    });

    test('LoginViewModel onEmailUpdated', () async {
      sut.onEmailUpdated('email');
      expect(sut.isLoginEnabled, false);
      expect(sut.isLoading, false);
      verifyZeroInteractions(loginRepo);
      verifyZeroInteractions(navigator);
    });

    test('LoginViewModel onPasswordUpdated', () async {
      sut.onPasswordUpdated('password');
      expect(sut.isLoginEnabled, false);
      expect(sut.isLoading, false);
      verifyZeroInteractions(loginRepo);
      verifyZeroInteractions(navigator);
    });

    test('LoginViewModel onEmailUpdated and onPasswordUpdated', () async {
      sut
        ..onEmailUpdated('email')
        ..onPasswordUpdated('password');
      expect(sut.isLoginEnabled, true);
      expect(sut.isLoading, false);
      verifyZeroInteractions(loginRepo);
      verifyZeroInteractions(navigator);
    });

    group('onLoginClicked', () {
      test('LoginViewModel onLoginClicked', () async {
        when(loginRepo.login(email: anyNamed('email'), password: anyNamed('password'))).thenAnswer((_) => Future.value());
        await sut.onLoginClicked();
        expect(sut.isLoginEnabled, false);
        expect(sut.isLoading, false);
        verify(loginRepo.login(email: anyNamed('email'), password: anyNamed('password'))).calledOnce();
        verify(navigator.goToHome()).calledOnce();
        verifyNoMoreInteractions(loginRepo);
        verifyNoMoreInteractions(navigator);
      });

      test('LoginViewModel onLoginClicked with FlutterTemplateError', () async {
        expect(GeneralError() is FlutterTemplateError, true);
        when(loginRepo.login(email: anyNamed('email'), password: anyNamed('password'))).thenThrow(GeneralError());
        await sut.onLoginClicked();
        expect(sut.isLoginEnabled, false);
        expect(sut.isLoading, false);
        verify(loginRepo.login(email: anyNamed('email'), password: anyNamed('password'))).calledOnce();
        verify(navigator.showErrorWithLocaleKey(LocalizationKeys.errorGeneral));
        verifyNoMoreInteractions(loginRepo);
        verifyNoMoreInteractions(navigator);
      });

      test('LoginViewModel onLoginClicked with random error', () async {
        when(loginRepo.login(email: anyNamed('email'), password: anyNamed('password'))).thenThrow(ArgumentError());
        await sut.onLoginClicked();
        expect(sut.isLoginEnabled, false);
        expect(sut.isLoading, false);
        verify(loginRepo.login(email: anyNamed('email'), password: anyNamed('password'))).calledOnce();
        verify(navigator.showErrorWithLocaleKey(LocalizationKeys.errorGeneral));
        verifyNoMoreInteractions(loginRepo);
        verifyNoMoreInteractions(navigator);
      });

      test('LoginViewModel onLoginClicked with random error', () async {
        when(loginRepo.login(email: 'email', password: 'password')).thenAnswer((_) => Future.value());
        sut
          ..onEmailUpdated('email')
          ..onPasswordUpdated('password');
        await sut.onLoginClicked();
        expect(sut.isLoginEnabled, true);
        expect(sut.isLoading, false);
        verify(loginRepo.login(email: 'email', password: 'password')).calledOnce();
        verify(navigator.goToHome());
        verifyNoMoreInteractions(loginRepo);
        verifyNoMoreInteractions(navigator);
      });
    });
  });
}

class MockLoginNavigator extends Mock implements LoginNavigator {}
