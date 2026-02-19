import 'dart:async';

import 'package:flutter_template/navigator/onboarding_navigator.dart';
import 'package:flutter_template/repository/remote_config/remote_config_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/logging/app_transactions.dart';
import 'package:flutter_template/util/logging/sentry_performance_logger.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel with ChangeNotifierEx {
  final LocalStorage _localStorage;
  final OnboardingNavigator _onboardingNavigator;
  final RemoteConfigRepository _remoteConfigRepository;
  final SentryPerformanceLogger _sentryPerformanceLogger;

  SplashViewModel(
    this._localStorage,
    this._onboardingNavigator,
    this._remoteConfigRepository,
    this._sentryPerformanceLogger,
  );

  Future<void> init() async {
    await _sentryPerformanceLogger.startTransaction(AppTransactions.splashComplete);
    await _localStorage.checkForNewInstallation();
    await _remoteConfigRepository.refreshRemoteConfig();
    await _sentryPerformanceLogger.finishTransaction(AppTransactions.splashComplete);
    await _onboardingNavigator.goToNextScreen();
  }

  void finishAppLoadTransaction() => _sentryPerformanceLogger.finishAppLoadTransaction();
}
