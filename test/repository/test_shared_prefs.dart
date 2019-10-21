import 'package:flutter_template/repository/shared_prefs.dart';

///
/// TestSharedPrefs is defined as a singleton in the test_injector.dart
/// TestSharedPrefs should be accessed by KiwiContainer.resolve<TestSharedPrefs>()
///
class TestSharedPrefs extends SharedPrefs {
  final data = Map<String, dynamic>();

  @override
  Future<void> saveString(String key, String value) async {
    data[key] = value;
  }

  @override
  Future<void> saveBoolean(String key, bool value) async {
    data[key] = value;
  }

  @override
  Future<void> saveInt(String key, int value) async {
    data[key] = value;
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    data[key] = value;
  }

  @override
  String getString(String key) {
    return data[key];
  }

  @override
  bool getBoolean(String key) {
    return data[key];
  }

  @override
  int getInt(String key) {
    return data[key];
  }

  @override
  double getDouble(String key) {
    return data[key];
  }

  @override
  Future<void> deleteKey(String key) async {
    return data.remove(key);
  }
}
