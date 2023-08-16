import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  String get stringValue {
    switch (this) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.system:
        return 'system';
    }
  }
}
