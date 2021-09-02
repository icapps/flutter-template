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
  static const _UNINSTALL_CHECK = 'UNINSTALL_CHECK';

  final AuthStorage _authStorage;
  final SharedPreferenceStorage _sharedPrefs;

  _LocalStorage(this._authStorage, this._sharedPrefs);

  @override
  Future<void> checkForNewInstallation() async {
    final result = _sharedPrefs.getBoolean(_UNINSTALL_CHECK);
    if (result == null) {
      await _sharedPrefs.saveBoolean(key: _UNINSTALL_CHECK, value: true);
      await _authStorage.clear();
    }
  }
}
