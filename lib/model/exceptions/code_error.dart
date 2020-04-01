import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

class CodeError with FlutterTemplateError {
  @override
  String getLocalizedKey() {
    if (FlavorConfig.isDev()) {
      return LocalizationKeys.errorDuringDev;
    }
    return LocalizationKeys.errorGeneral;
  }
}
