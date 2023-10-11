import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/snackbar/snackbar_data.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_durations.dart';

class SnackBarUtil {
  SnackBarUtil._();

  static void showSnackbar({
    required String message,
    required BuildContext context,
    String? title,
    SnackBarStyle style = SnackBarStyle.neutral,
  }) {
    final snackBarStyle = _getSnackBarStyle(style);
    Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      titleColor: snackBarStyle.textColor,
      messageColor: snackBarStyle.textColor,
      backgroundColor: snackBarStyle.backgroundColor,
      duration: ThemeDurations.snackBarDuration,
    ).show(context);
  }

  static SnackBarStyleData _getSnackBarStyle(SnackBarStyle style) {
    switch (style) {
      case SnackBarStyle.neutral:
        return const SnackBarStyleData(
          textColor: ThemeColors.white,
          backgroundColor: ThemeColors.primary,
        );
      case SnackBarStyle.success:
        return const SnackBarStyleData(
          textColor: ThemeColors.white,
          backgroundColor: ThemeColors.success,
        );
      case SnackBarStyle.error:
        return const SnackBarStyleData(
          textColor: ThemeColors.white,
          backgroundColor: ThemeColors.error,
        );
    }
  }
}
