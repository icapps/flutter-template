import 'package:flutter/material.dart';
import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/styles/theme_text_styles.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';

abstract class ErrorNavigator {
  String showError(dynamic error);

  void showErrorWithLocaleKey(String errorGeneral);
}

mixin ErrorNavigatorMixin<T extends StatefulWidget> on State<T> implements ErrorNavigator {
  @override
  String showError(dynamic error) {
    String key;
    if (error is String) {
      _showError(error);
      return null;
    } else if (error is NetworkError) {
      if (error.showInProduction) {
        key = error.getLocalizedKey();
      } else if (FlavorConfig.instance.values.showFullErrorMessages) {
        final code = error.getErrorCode;
        if (code == null) {
          key = LocalizationKeys.errorGeneral;
        } else {
          showError(Localization.of(context).getTranslation(LocalizationKeys.errorGeneralWithCode, args: <String>[code]));
          return null;
        }
      } else {
        key = LocalizationKeys.errorGeneral;
      }
    } else if (error is FlutterTemplateError) {
      key = error.getLocalizedKey();
    } else {
      FlutterTemplateLogger.logDebug('Caught an error that is not handled by the FlutterTemplateError $error');
      key = LocalizationKeys.errorGeneral;
    }
    key ??= LocalizationKeys.errorGeneral;
    showErrorWithLocaleKey(key);
    return key;
  }

  void _showError(String error) {
    final snackBar = SnackBar(
      content: Text(
        error,
        style: ThemeTextStyles.lightButtonTextStyle,
      ),
    );
    getScaffoldState()?.showSnackBar(snackBar);
  }

  @override
  void showErrorWithLocaleKey(String errorKey) => _showError(Localization.of(context).getTranslation(errorKey));

  ScaffoldState getScaffoldState();
}
