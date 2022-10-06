import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class ForbiddenError extends NetworkError {
  static const statusCode = HttpStatus.forbidden;

  ForbiddenError(
    super.dioError, {
    super.statusCodeValue,
  });

  @override
  String getLocalizedKey() => LocalizationKeys.errorForbidden;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }

  static NetworkError parseError(DioError err) {
    final dynamic data = err.response?.data;
    if (data is! Map) return ForbiddenError(err);
    if (!data.containsKey('code')) return ForbiddenError(err);
    final code = data['code'] as String;
    switch (code) {
      default:
        return ForbiddenError(err);
    }
  }
}
