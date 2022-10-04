import 'package:flutter_template/model/snackbar/snackbar_data.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:get/route_manager.dart';

class SnackBarUtil {
  SnackBarUtil._();

  static void showSnackbar({
    required String message,
    String? title,
    SnackBarStyle style = SnackBarStyle.neutral,
  }) {
    final snackBarStyle = _getSnackBarStyle(style);
    Get.snackbar(
      title ?? '',
      message,
      colorText: snackBarStyle.textColor,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: snackBarStyle.backgroundColor,
    );
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
