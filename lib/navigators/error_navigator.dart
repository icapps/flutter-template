import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_text_styles.dart';
import 'package:flutter_template/util/locale/localization.dart';

abstract class ErrorNavigator {
  void showError(String error, BuildContext context);

  void showErrorWithLocaleKey(String errorKey, BuildContext context);
}

mixin ErrorNavigatorMixin implements ErrorNavigator {
  @override
  void showError(String error, BuildContext context) => _showSnackBar(error, context);

  @override
  void showErrorWithLocaleKey(String errorKey, BuildContext context) => _showSnackBar(Localization.of(context).getTranslation(errorKey), context);

  void _showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: ThemeTextStyles.lightButtonTextStyle,
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
