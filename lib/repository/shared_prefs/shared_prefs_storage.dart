import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: SharedPrefsStoring)
class SharedPrefsStorage extends SharedPrefsStoring {
  final SharedPreferences _sharedPreferences;

  SharedPrefsStorage(this._sharedPreferences);

  @override
  Future<void> saveString({required String key, required String value}) => _sharedPreferences.setString(key, value);

  @override
  Future<void> saveBoolean({required String key, required bool value}) => _sharedPreferences.setBool(key, value);

  @override
  Future<void> saveInt({required String key, required int value}) => _sharedPreferences.setInt(key, value);

  @override
  Future<void> saveDouble({required String key, required double value}) => _sharedPreferences.setDouble(key, value);

  @override
  String? getString(String key) => _sharedPreferences.getString(key);

  @override
  bool? getBoolean(String key) => _sharedPreferences.getBool(key);

  @override
  int? getInt(String key) => _sharedPreferences.getInt(key);

  @override
  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  @override
  Future<void> deleteKey(String key) => _sharedPreferences.remove(key);

  @override
  bool containsKey(String key) => _sharedPreferences.containsKey(key);
}
