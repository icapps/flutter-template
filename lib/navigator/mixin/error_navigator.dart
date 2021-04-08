import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

abstract class ErrorNavigator {
  String? showError(dynamic error);

  void showErrorWithLocaleKey(String errorGeneral);
}

mixin ErrorNavigatorMixin<T extends StatefulWidget> on State<T> implements ErrorNavigator {
  @override
  String? showError(dynamic error) {
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
    } else if (error is LocalizedError) {
      key = error.getLocalizedKey();
    } else {
      logger.warning('Caught an error that is not handled by the FlutterTemplateError $error');
      key = LocalizationKeys.errorGeneral;
    }
    showErrorWithLocaleKey(key);
    return key;
  }

  void _showError(String error) {
    final snackBar = SnackBar(
      content: DataProviderWidget(
        childBuilderTheme: (context, theme) => Text(
          error,
          style: theme.lightTextTheme.labelButtonSmall,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void showErrorWithLocaleKey(String errorKey) => _showError(Localization.of(context).getTranslation(errorKey));
}
