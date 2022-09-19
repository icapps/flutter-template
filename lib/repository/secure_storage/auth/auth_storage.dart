import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class AuthStorage {
  @factoryMethod
  factory AuthStorage(SimpleKeyValueStorage storage) = _AuthStorage;

  Future<String?> getRefreshToken();

  Future<String?> getAccessToken();

  Future<void> clear();

  Future<void> saveUserCredentials({required String accessToken, required String refreshToken});

  Future<bool> hasLoggedInUser();

  bool? isLoggedIn;
}

class _AuthStorage implements AuthStorage {
  final SimpleKeyValueStorage _storage;
  static const _accessTokenKey = 'ACCESS_TOKEN';
  static const _refreshTokenKey = 'ACCESS_REFRESH_TOKEN';

  @override
  bool? isLoggedIn;

  _AuthStorage(this._storage);

  @override
  Future<String?> getAccessToken() async {
    final result = await await2(getRefreshToken(), getAccessToken());
    isLoggedIn = result.item1 != null && result.item2 != null;
    return result.item2;
  }

  @override
  Future<String?> getRefreshToken() async {
    final result = await await2(getRefreshToken(), getAccessToken());
    isLoggedIn = result.item1 != null && result.item2 != null;
    return result.item2;
  }

  @override
  Future<void> saveUserCredentials({required String accessToken, required String refreshToken}) async {
    await Future.wait(
      [
        _storage.setValue(key: _accessTokenKey, value: accessToken),
        _storage.setValue(key: _refreshTokenKey, value: refreshToken),
      ],
    );
    isLoggedIn = true;
  }

  @override
  Future<bool> hasLoggedInUser() async {
    final result = await await2(getRefreshToken(), getAccessToken());
    final hasLoggedInUser = result.item1 != null && result.item2 != null;
    isLoggedIn = hasLoggedInUser;
    return result.item1 != null && result.item2 != null;
  }

  @override
  Future<void> clear() async {
    await Future.wait([
      _storage.removeValue(key: _accessTokenKey),
      _storage.removeValue(key: _refreshTokenKey),
    ]);
    isLoggedIn = false;
  }
}
