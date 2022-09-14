import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository() = _LoginRepository;

  bool get isLoggedIn;

  Future<void> login({required String email, required String password});
}

class _LoginRepository implements LoginRepository {
  _LoginRepository();

  var _isLoggedIn = false;

  @override
  bool get isLoggedIn => _isLoggedIn;

  @override
  Future<void> login({required String email, required String password}) async {
    _isLoggedIn = true;
    logger.debug('Login should be implemented');
  }
}
