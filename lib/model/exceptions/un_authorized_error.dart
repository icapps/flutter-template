import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class UnAuthorizedError extends NetworkError {
  static const statusCode = HttpStatus.unauthorized;

  UnAuthorizedError(
    super.dioException, {
    super.statusCodeValue,
  });

  @override
  String getLocalizedKey() => LocalizationKeys.errorUnauthorized;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }

  static NetworkError parseError(DioException err) {
    final dynamic data = err.response?.data;
    if (data is! Map) return UnAuthorizedError(err);
    if (!data.containsKey('code')) return UnAuthorizedError(err);
    final code = data['code'] as String?;
    switch (code) {
      default:
        return UnAuthorizedError(err);
    }
  }
}
