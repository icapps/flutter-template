import 'package:flutter/widgets.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage extends SharedPrefsStoring {
  final SharedPreferences _sharedPreferences;

  SharedPrefsStorage(this._sharedPreferences);

  @override
  Future<void> saveString({@required String key, @required String value}) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  Future<void> saveBoolean({@required String key, @required bool value}) async {
    await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> saveInt({@required String key, @required int value}) async {
    await _sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> saveDouble({@required String key, @required double value}) async {
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
