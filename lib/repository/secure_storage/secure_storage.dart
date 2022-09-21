import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class SecureStorage implements SimpleKeyValueStorage {
  @factoryMethod
  factory SecureStorage(FlutterSecureStorage storage) = _SecureStorage;

  Future<void> deleteAll();

  Future<void> write({required String key, required String value});

  Future<String?> read({required String key});

  Future<void> delete({required String key});

  Future<bool> containsKey({required String key});
}

class _SecureStorage implements SecureStorage {
  final FlutterSecureStorage _storage;

  final iOSOptions = const IOSOptions(accessibility: KeychainAccessibility.unlocked);

  _SecureStorage(this._storage);

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

  @override
  Future<String?> getValue({required String key}) => read(key: key);

  @override
  Future<bool> hasValue({required String key}) => containsKey(key: key);

  @override
  Future<void> removeValue({required String key}) => delete(key: key);

  @override
  Future<void> setValue({required String key, required String value}) => write(key: key, value: value);
}
