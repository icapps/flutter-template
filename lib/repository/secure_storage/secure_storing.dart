import 'package:flutter/widgets.dart';

abstract class SecureStoring {
  Future<void> deleteAll();

  Future<void> write({@required String key, @required String value});

  Future<String> read({@required String key});

  Future<void> delete({@required String key});
}