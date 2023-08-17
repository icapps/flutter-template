import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  String get stringValue => switch (this) {
      ThemeMode.dark => 'dark',
      ThemeMode.light => 'light',
      ThemeMode.system => 'system',
    };
}
