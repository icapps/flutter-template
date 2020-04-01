import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_fonts.dart';

class ThemeTextStyles {
  ThemeTextStyles._();

  static const TextStyle title = TextStyle(color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontSize: 24);

  static const disabledButtonTextStyle =
      TextStyle(color: ThemeColors.lightGrey, fontFamily: ThemeFonts.OpenSans, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);
  static const lightButtonTextStyle = TextStyle(color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);
}
