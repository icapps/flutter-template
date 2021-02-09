import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/repository/secure_storage/secure_storing.dart';
import 'package:injectable/injectable.dart';

@dev
@alpha
@beta
@prod
@Singleton(as: SecureStoring)
class SecureStorage extends SecureStoring {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  @override
  Future<void> deleteAll() => _storage.deleteAll();

  @override
  Future<void> write({@required String key, @required String value}) => _storage.write(key: key, value: value);

  @override
  Future<String> read({@required String key}) => _storage.read(key: key);

  @override
  Future<void> delete({@required String key}) => _storage.delete(key: key);

  @override
  Future<bool> containsKey({@required String key}) => _storage.containsKey(key: key);
}
