import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(AuthStorage storage) = _LoginRepository;

  Future<bool> isLoggedIn();

  Future<void> login({required String email, required String password});
}

class _LoginRepository implements LoginRepository {
  final AuthStorage _authStorage;

  _LoginRepository(this._authStorage);

  @override
  Future<bool> isLoggedIn() async => _authStorage.hasLoggedInUser();

  @override
  Future<void> login({required String email, required String password}) async {
    logger.debug('Login should be implemented');
  }
}
