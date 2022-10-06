import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel with ChangeNotifierEx {
  final LoginRepository _loginRepo;
  final LocalStorage _localStorage;
  final MainNavigator _navigator;

  SplashViewModel(
    this._loginRepo,
    this._localStorage,
    this._navigator,
  );

  Future<void> init() async {
    await _localStorage.checkForNewInstallation();
    final result = await _loginRepo.isLoggedIn;
    if (result) {
      _navigator.goToHome();
    } else {
      _navigator.goToLogin();
    }
  }
}
