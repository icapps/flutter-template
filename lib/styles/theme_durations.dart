import 'package:flutter_template/util/env/flavor_config.dart';

class ThemeDurations {
  ThemeDurations._();

  static bool _isInTest() {
    if (FlavorConfig.hasInstance) return FlavorConfig.isInTestEnv();
    return FlavorConfig.isInTest();
  }

  static Duration shortAnimationDuration() {
    if (_isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 200);
  }

  static Duration mediumAnimationDuration() {
    if (_isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 350);
  }

  static Duration longAnimationDuration() {
    if (_isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 500);
  }

  static Duration splashAnimationDuration() {
    if (_isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(seconds: 1, milliseconds: 500);
  }

  static Duration demoNetworkCallDuration() {
    if (_isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 800);
  }
}
