import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';

class LocalStorage extends LocalStoring {
  static const _UNINSTALL_CHECK = 'UNINSTALL_CHECK';

  final AuthStoring _authStoring;
  final SharedPrefsStoring _sharedPrefs;

  LocalStorage(this._authStoring, this._sharedPrefs);

  @override
  Future<void> checkForNewInstallation() async {
    final result = _sharedPrefs.getBoolean(_UNINSTALL_CHECK);
    if (result == null) {
      await _sharedPrefs.saveBoolean(key: _UNINSTALL_CHECK, value: true);
      await _authStoring.clear();
    }
  }
}
