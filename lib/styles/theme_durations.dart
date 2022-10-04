import 'package:flutter_template/util/env/flavor_config.dart';

class ThemeDurations {
  ThemeDurations._();

  static Duration shortAnimationDuration() {
    if (FlavorConfig.isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 200);
  }

  static Duration mediumAnimationDuration() {
    if (FlavorConfig.isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 350);
  }

  static Duration longAnimationDuration() {
    if (FlavorConfig.isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 500);
  }

  static Duration splashAnimationDuration() {
    if (FlavorConfig.isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(seconds: 1, milliseconds: 500);
  }

  static Duration demoNetworkCallDuration() {
    if (FlavorConfig.isInTest()) return const Duration(milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 800);
  }
}
