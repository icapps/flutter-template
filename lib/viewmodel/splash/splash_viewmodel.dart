import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel with ChangeNotifierEx {
  final LoginRepository _loginRepo;
  final LocalStorage _localStorage;

  SplashViewModel(this._loginRepo, this._localStorage);

  Future<void> init(SplashNavigator navigator) async {
    print('Checking for new installation');
    await _localStorage.checkForNewInstallation();
    print('Checking if logged in');
    final result = await _loginRepo.isLoggedIn();
    if (result) {
      print('Going to home');
      navigator.goToHome();
    } else {
      print('Going to login');
      navigator.goToLogin();
    }
  }
}

abstract class SplashNavigator {
  void goToHome();

  void goToLogin();
}
