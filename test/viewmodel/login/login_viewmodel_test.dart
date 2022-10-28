import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/exceptions/general_network_error.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late LoginViewModel sut;
  late MockLoginRepository loginRepo;
  late MainNavigator navigator;

  setUp(() async {
    await initTestInjectable();
    loginRepo = getIt.resolveAs<LoginRepository, MockLoginRepository>();
    navigator = MockMainNavigator();
    sut = LoginViewModel(loginRepo, navigator);
  });

  test('LoginViewModel init with loggedin user', () async {
    await sut.init();
    expect(sut.isLoginEnabled, false);
    expect(sut.isLoading, false);
    verifyZeroInteractions(loginRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      await sut.init();
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
        expect(GeneralError(), isA<LocalizedError>());
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
