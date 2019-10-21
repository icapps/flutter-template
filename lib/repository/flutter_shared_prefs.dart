import 'package:flutter_template/repository/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// FlutterSharedPrefs is defined as a singleton in the injector.dart
/// FlutterSharedPrefs should be accessed by KiwiContainer.resolve<FlutterSharedPrefs>()
///
class FlutterSharedPrefs extends SharedPrefs {
  final SharedPreferences _sharedPreferences;

  FlutterSharedPrefs(this._sharedPreferences);

  @override
  Future<void> saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  Future<void> saveBoolean(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    await _sharedPreferences.setDouble(key, value);
  }

  @override
  String getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  bool getBoolean(String key) {
    return _sharedPreferences.getBool(key);
  }

  @override
  int getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  @override
  double getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  @override
  Future<void> deleteKey(String key) async {
    await _sharedPreferences.remove(key);
  }
}
