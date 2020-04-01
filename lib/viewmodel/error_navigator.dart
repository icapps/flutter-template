import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_text_styles.dart';
import 'package:flutter_template/util/locale/localization.dart';

abstract class ErrorNavigator {
  void showError(String error);

  void showErrorWithLocaleKey(String errorKey);
}

mixin ErrorNavigatorMixin<T extends StatefulWidget> on State<T> implements ErrorNavigator {
  @override
  void showError(String error) => _showSnackBar(error);

  @override
  void showErrorWithLocaleKey(String errorKey) => _showSnackBar(Localization.of(context).getTranslation(errorKey));

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: ThemeTextStyles.lightButtonTextStyle,
      ),
    );
    getScaffoldState()?.showSnackBar(snackBar);
  }

  ScaffoldState getScaffoldState();
}
