import 'package:flutter_template/util/env/flavor_config.dart';

class ThemeDurations {
  ThemeDurations._();

  static shortAnimationDuration() {
    if (FlavorConfig.isInTest()) return const Duration(seconds: 0);
    return const Duration(milliseconds: 200);
  }

  static mediumAnimationDuration() {
    if (FlavorConfig.isInTest()) return const Duration(seconds: 0);
    return const Duration(milliseconds: 350);
  }

  static longAnimationDuration() {
    if (FlavorConfig.isInTest()) return const Duration(seconds: 0);
    return const Duration(milliseconds: 500);
  }

  static splashAnimationDuration() {
    if (FlavorConfig.isInTest()) return const Duration(seconds: 0);
    return const Duration(seconds: 1, milliseconds: 500);
  }

  static demoNetworkCallDuration() {
    if (FlavorConfig.isInTest()) return const Duration(seconds: 0);
    return const Duration(milliseconds: 800);
  }
}
