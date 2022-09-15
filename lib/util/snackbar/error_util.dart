import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/snackbar/snackbar_util.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ErrorUtil {
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
          //TODO: Reenable until localization tool is updated so it doesn't required  context.
          //showError(Localization.of(context).getTranslation(LocalizationKeys.errorGeneralWithCode, args: <String>[code]));
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

  void _showError(String error) => showCustomSnackBar(message: error);

  //TODO: translate key again when localization is updated
  void showErrorWithLocaleKey(String errorKey, {List<dynamic>? args}) => _showError(errorKey);
}
