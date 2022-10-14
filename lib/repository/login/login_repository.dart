import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(AuthStorage storage) = _LoginRepository;

  Future<bool> get isLoggedIn;

  Future<void> login({required String email, required String password});
}

class _LoginRepository implements LoginRepository {
  final AuthStorage _storage;
  _LoginRepository(this._storage);

  @override
  Future<bool> get isLoggedIn => _storage.hasLoggedInUser();

  @override
  Future<void> login({required String email, required String password}) async {
    await _storage.saveUserCredentials(accessToken: 'test_access_token', refreshToken: 'test_refresh_token');
    logger.debug('Login should be implemented');
  }
}
