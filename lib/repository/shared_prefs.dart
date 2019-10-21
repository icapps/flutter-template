abstract class SharedPrefs {
  Future<void> saveString(String key, String value);

  // ignore: avoid_positional_boolean_parameters
  Future<void> saveBoolean(String key, bool value);

  Future<void> saveInt(String key, int value);

  Future<void> saveDouble(String key, double value);

  String getString(String key);

  bool getBoolean(String key);

  int getInt(String key);

  double getDouble(String key);

  Future<void> deleteKey(String key);
}
