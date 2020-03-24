import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/repository/secure_storage/secure_storing.dart';

class SecureStorage extends SecureStoring {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }

  @override
  Future<void> write({@required String key, @required String value}) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<String> read({@required String key}) {
    return _storage.read(key: key);
  }

  @override
  Future<void> delete({@required String key}) {
    return _storage.delete(key: key);
  }
}
