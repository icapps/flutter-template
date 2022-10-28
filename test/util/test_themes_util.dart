import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

class TestThemeUtil {
  static void setDarkMode() {
    FlavorConfig.instance.themeMode = ThemeMode.dark;
    final flutterTemplateTheme = getIt<FlutterTemplateTheme>();
    flutterTemplateTheme.configureForThemeStyle(FlutterTemplateThemeStyle.dark);
  }

  static void setLightMode() {
    FlavorConfig.instance.themeMode = ThemeMode.light;
    final flutterTemplateTheme = getIt<FlutterTemplateTheme>();
    flutterTemplateTheme.configureForThemeStyle(FlutterTemplateThemeStyle.light);
  }
}
