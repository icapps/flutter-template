import 'dart:async';

import 'package:flutter_template/navigator/onboarding_navigator.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel with ChangeNotifierEx {
  final LocalStorage _localStorage;
  final OnboardingNavigator _onboardingNavigator;

  SplashViewModel(
    this._localStorage,
    this._onboardingNavigator,
  );

  Future<void> init() async {
    await _localStorage.checkForNewInstallation();
    await _onboardingNavigator.goToNextScreen();
  }
}
