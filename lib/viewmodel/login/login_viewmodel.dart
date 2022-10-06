import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel with ChangeNotifierEx {
  final LoginRepository _loginRepo;
  final MainNavigator _navigator;

  var _isLoading = false;
  var _password = '';
  var _email = '';

  LoginViewModel(
    this._loginRepo,
    this._navigator,
  );

  bool get isLoginEnabled => _password.isNotEmpty && _email.isNotEmpty;

  bool get isLoading => _isLoading;

  Future<void> init() async {}

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
      return _navigator.goToHome();
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
