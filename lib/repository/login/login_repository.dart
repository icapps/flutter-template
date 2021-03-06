import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LoginRepo)
class LoginRepository extends LoginRepo {
  final AuthStoring _authStoring;

  LoginRepository(this._authStoring);

  @override
  Future<bool> isLoggedIn() async => _authStoring.hasLoggedInUser();

  @override
  Future<void> login({required String email, required String password}) async {
    FlutterTemplateLogger.logDebug('Login should be implemented');
  }
}
