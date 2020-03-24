import 'package:flutter/widgets.dart';

abstract class SharedPrefsStoring {
  Future<void> saveString({@required String key, @required String value});

  Future<void> saveBoolean({@required String key, @required bool value});

  Future<void> saveInt({@required String key, @required int value});

  Future<void> saveDouble({@required String key, @required double value});

  String getString(String key);

  bool getBoolean(String key);

  int getInt(String key);

  double getDouble(String key);

  Future<void> deleteKey(String key);
}
