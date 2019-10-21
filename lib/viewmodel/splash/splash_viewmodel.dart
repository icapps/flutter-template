import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_durations.dart';

class SplashViewModel with ChangeNotifier {
  Future<void> init(SplashNavigator navigator) async {
    await Future.delayed(ThemeDurations.longAnimationDuration());
    navigator.goToHome();
  }
}

// ignore: one_member_abstracts
abstract class SplashNavigator {
  void goToHome();
}
