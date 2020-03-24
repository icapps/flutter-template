import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

class GeneralError extends NetworkError {
  GeneralError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorGeneral;
}
