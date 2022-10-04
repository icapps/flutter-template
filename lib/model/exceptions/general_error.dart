import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class GeneralNetworkError extends NetworkError {
  GeneralNetworkError(super.dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorGeneral;

  @override
  String? get getErrorCode => null;
}
