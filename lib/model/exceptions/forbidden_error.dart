import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

class ForbiddenError extends NetworkError {
  static const statusCode = HttpStatus.forbidden;

  ForbiddenError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorForbidden;

  static NetworkError parseError(DioError err) => ForbiddenError(err);
}
