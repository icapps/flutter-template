import 'package:flutter/material.dart';
import 'package:flutter_template/repository/login/todo_repo.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/util/future/future_helper.dart';

class SplashViewModel with ChangeNotifier {
  final LoginRepo _loginRepo;

  SplashViewModel(this._loginRepo);

  Future<void> init(SplashNavigator navigator) async {
    final result = await _loginRepo.isLoggedIn();
    if (result) {
      navigator.goToHome();
    } else {
      navigator.goToLogin();
    }
  }
}

abstract class SplashNavigator {
  void goToHome();

  void goToLogin();
}
