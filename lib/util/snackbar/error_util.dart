import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/snackbar/snackbar_data.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../locale/localization.dart';

@lazySingleton
class ErrorUtil {
  String? showError({
    required dynamic error,
    required BuildContext context,
  }) {
    String key;
    if (error is String) {
      _showError(message: error);
      return null;
    } else if (error is NetworkError) {
      if (error.showInProduction) {
        key = error.getLocalizedKey();
      } else if (FlavorConfig.instance.values.showFullErrorMessages) {
        final code = error.getErrorCode;
        if (code == null) {
          key = LocalizationKeys.errorGeneral;
        } else {
          showErrorWithLocaleKey(
            context: context,
            messageKey: LocalizationKeys.errorGeneralWithCode,
            args: <String>[code],
          );
          return null;
        }
      } else {
        key = LocalizationKeys.errorGeneral;
      }
    } else if (error is LocalizedError) {
      key = error.getLocalizedKey();
    } else {
      FlutterTemplateLogger.logWarning('Caught an error that is not handled by the FlutterTemplateError $error');
      key = LocalizationKeys.errorGeneral;
    }
    showErrorWithLocaleKey(
      context: context,
      messageKey: key,
    );
    return key;
  }

  void _showError({
    required String message,
    String? title,
  }) =>
      getIt.get<MainNavigator>().showCustomSnackBar(
            message: message,
            title: title,
            style: SnackBarStyle.error,
          );

  void showErrorWithLocaleKey({
    required String messageKey,
    required BuildContext context,
    String? titleKey,
    List<dynamic>? args,
  }) {
    final localization = Localization.of(context);
    _showError(
      message: localization.getTranslation(messageKey),
      title: titleKey == null ? null : localization.getTranslation(titleKey),
    );
  }
}
