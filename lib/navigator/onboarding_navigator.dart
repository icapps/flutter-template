import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OnboardingNavigator {
  final MainNavigator _navigator;
  final LocalStorage _localStorage;
  final LoginRepository _loginRepository;

  const OnboardingNavigator(
    this._navigator,
    this._localStorage,
    this._loginRepository,
  );

  Future<void> goToNextScreen() async {
    if (_localStorage.hasAnalyticsPermission == null) return _navigator.goToAnalyticsPermissionScreen();
    if (await _loginRepository.isLoggedIn) return _navigator.goToHomeScreen();
    return _navigator.goToLoginScreen();
  }
}
