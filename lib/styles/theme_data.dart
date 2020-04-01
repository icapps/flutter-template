import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_fonts.dart';

class FlutterTemplateThemeData {
  FlutterTemplateThemeData._();

  static final _lightThemeData = ThemeData(
    fontFamily: ThemeFonts.OpenSans,
    primaryColor: ThemeColors.primary,
    accentColor: ThemeColors.accent,
    cursorColor: ThemeColors.primary,
    textSelectionHandleColor: ThemeColors.primary,
    scaffoldBackgroundColor: ThemeColors.backgroundGrey,
  );

  static final _darkThemeData = _lightThemeData.copyWith();

  static ThemeData lightTheme(TargetPlatform targetPlatform) {
    return _lightThemeData.copyWith(platform: targetPlatform);
  }

  static ThemeData darkTheme(TargetPlatform targetPlatform) {
    return _darkThemeData.copyWith(platform: targetPlatform);
  }
}
