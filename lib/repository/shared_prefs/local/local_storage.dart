import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LocalStorage {
  @factoryMethod
  factory LocalStorage(AuthStorage storage, SharedPreferenceStorage preferences) = _LocalStorage;

  Future<void> checkForNewInstallation();
}

class _LocalStorage implements LocalStorage {
  static const _uninstallCheckKey = 'UNINSTALL_CHECK';

  final AuthStorage _authStorage;
  final SharedPreferenceStorage _sharedPreferences;

  _LocalStorage(this._authStorage, this._sharedPreferences);

  @override
  Future<void> checkForNewInstallation() async {
    final result = _sharedPreferences.getBoolean(_uninstallCheckKey);
    if (result == null) {
      await _sharedPreferences.saveBoolean(key: _uninstallCheckKey, value: true);
      await _authStorage.clear();
    }
  }
}
