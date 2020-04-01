import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

class BadRequestError extends NetworkError {
  static const statusCode = HttpStatus.badRequest;

  BadRequestError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorBadRequest;

  static NetworkError parseError(DioError err) {
    return BadRequestError(err);
//    final data = err.response.data;
//    if (data == null) return BadRequestError(err);
//    final String code = data['code'];
//    switch (code) {
//      case Invalid2svCode.statusCode:
//        return Invalid2svCode(err);
//      default:
//        return BadRequestError(err);
//    }
  }
}
