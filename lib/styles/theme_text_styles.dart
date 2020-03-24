import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemeTextStyles {
  ThemeTextStyles._();

  static const TextStyle title = TextStyle(color: ThemeColors.white, fontSize: 24);

  static const disabledButtonTextStyle = TextStyle(color: ThemeColors.lightGrey, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);
  static const lightButtonTextStyle = TextStyle(color: ThemeColors.white, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);
}
