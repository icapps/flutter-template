import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/flutter_template_error.dart';

abstract class NetworkError extends DioError with FlutterTemplateError {
  final String statusCodeValue;

  NetworkError(DioError dioError, {this.statusCodeValue})
      : super(
    request: dioError.request,
    response: dioError.response,
    error: dioError.error,
    type: dioError.type,
  );

  bool get showInProduction => true;

  String get getErrorCode;
}
