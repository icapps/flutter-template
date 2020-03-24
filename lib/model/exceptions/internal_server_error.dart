import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

class InternalServerError extends NetworkError {
  static const statusCode = HttpStatus.internalServerError;

  InternalServerError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorInternalServer;
}
