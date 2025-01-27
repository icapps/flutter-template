import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/snackbar/snackbar_data.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_data.dart';
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
    final context = getIt<MainNavigator>().context;
    final theme = FlutterTemplateTheme.of(context);
    switch (style) {
      case SnackBarStyle.neutral:
        return SnackBarStyleData(
          textColor: theme.pureWhite,
          backgroundColor: theme.main,
        );
      case SnackBarStyle.success:
        return SnackBarStyleData(
          textColor: theme.pureWhite,
          backgroundColor: theme.systemPositive,
        );
      case SnackBarStyle.error:
        return SnackBarStyleData(
          textColor: theme.pureWhite,
          backgroundColor: theme.systemNegative,
        );
    }
  }
}
