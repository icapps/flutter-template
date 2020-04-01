import 'package:flutter/material.dart';
import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';
import 'package:flutter_template/viewmodel/error_navigator.dart';

class LoginViewModel with ChangeNotifier {
  final LoginRepo _loginRepo;
  LoginNavigator _navigator;

  var _isLoading = false;
  var _password = '';
  var _email = '';

  LoginViewModel(this._loginRepo);

  bool get isLoginEnabled => _password.isNotEmpty && _email.isNotEmpty;

  bool get isLoading => _isLoading;

  Future<void> init(LoginNavigator navigator) async {
    _navigator = navigator;
  }

  void onEmailUpdated(String email) {
    _email = email;
    notifyListeners();
  }

  void onPasswordUpdated(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> onLoginClicked() async {
    try {
      _isLoading = true;
      await _loginRepo.login(email: _email, password: _password);
      _navigator.goToHome();
    } catch (e) {
      FlutterTemplateLogger.logError(message: 'Failed to login', error: e);
      if (e is FlutterTemplateError) {
        _navigator.showErrorWithLocaleKey(e.getLocalizedKey());
      } else {
        _navigator.showErrorWithLocaleKey(LocalizationKeys.errorGeneral);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// ignore: one_member_abstracts
abstract class LoginNavigator implements ErrorNavigator {
  void goToHome();
}
