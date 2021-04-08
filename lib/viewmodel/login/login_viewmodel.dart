import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel with ChangeNotifierEx {
  final LoginRepo _loginRepo;
  late LoginNavigator _navigator;

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
    } catch (e, stack) {
      logger.error('Failed to login', error: e, trace: stack);
      if (e is LocalizedError) {
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
