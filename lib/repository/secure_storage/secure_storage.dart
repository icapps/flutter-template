import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/repository/secure_storage/secure_storing.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SecureStoring)
class SecureStorage extends SecureStoring {
  final FlutterSecureStorage _storage;

  final iOSOptions = const IOSOptions(accessibility: IOSAccessibility.unlocked);

  SecureStorage(this._storage);

  @override
  Future<void> deleteAll() => _storage.deleteAll(iOptions: iOSOptions);

  @override
  Future<void> write({required String key, required String value}) => _storage.write(key: key, value: value, iOptions: iOSOptions);

  @override
  Future<String?> read({required String key}) => _storage.read(key: key, iOptions: iOSOptions);

  @override
  Future<void> delete({required String key}) => _storage.delete(key: key, iOptions: iOSOptions);

  @override
  Future<bool> containsKey({required String key}) => _storage.containsKey(key: key, iOptions: iOSOptions);
}
