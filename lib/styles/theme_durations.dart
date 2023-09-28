import 'package:flutter_template/util/env/flavor_config.dart';

class ThemeDurations {
  ThemeDurations._();

  static Duration? get _isInTestResult {
    final bool isInTest;
    if (FlavorConfig.hasInstance) {
      isInTest = FlavorConfig.isInTestEnv();
    } else {
      isInTest = FlavorConfig.isInTest();
    }
    if (isInTest) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return null;
  }

  static Duration get shortAnimationDuration => _isInTestResult ?? const Duration(milliseconds: 200);

  static Duration get mediumAnimationDuration => _isInTestResult ?? const Duration(milliseconds: 350);

  static Duration get longAnimationDuration => _isInTestResult ?? const Duration(milliseconds: 500);

  static Duration get splashAnimationDuration => _isInTestResult ?? const Duration(seconds: 1, milliseconds: 500);

  static Duration get demoNetworkCallDuration => _isInTestResult ?? const Duration(milliseconds: 800);

  static Duration get snackBarDuration => _isInTestResult ?? const Duration(seconds: 3);
}
