import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeConfigUtil {
  var themeMode = ThemeMode.system;
}
