import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

class NoInternetError extends NetworkError {
  NoInternetError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorNoNetwork;

  @override
  String get getErrorCode => null;
}

class NoNetworkError extends Error {}
