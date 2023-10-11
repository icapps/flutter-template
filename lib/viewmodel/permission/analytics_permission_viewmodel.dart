import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_template/navigator/onboarding_navigator.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher_string.dart';

@injectable
class AnalyticsPermissionViewModel with ChangeNotifierEx {
  final OnboardingNavigator _onboardingNavigator;

  final LocalStorage _localStorage;

  AnalyticsPermissionViewModel(
    this._onboardingNavigator,
    this._localStorage,
  );

  Future<void> init() async {}

  Future<void> onAcceptClicked() async {
    await _localStorage.updateHasAnalyticsPermission(true);
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await _onboardingNavigator.goToNextScreen();
  }

  Future<void> onMoreInfoClicked() async => launchUrlString('https://www.example.com/privacy-policy');
}
