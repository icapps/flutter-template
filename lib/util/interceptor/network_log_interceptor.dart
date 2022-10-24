import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/general_error.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkLogInterceptor extends SimpleInterceptor {
  @override
  Future<Object?> onRequest(RequestOptions options) async {
    logger.logNetworkRequest(options);
    return super.onRequest(options);
  }

  @override
  Future<Object?> onResponse(Response response) async {
    logger.logNetworkResponse(response);
    return super.onResponse(response);
  }

  @override
  Future<Object?> onError(DioError error) async {
    final response = error.response;
    if (response != null && response.statusCode == HttpStatus.notModified) {
      logger.logNetworkResponse(response);
      return super.onError(error);
    }
    if (error is NetworkError) {
      logger.logNetworkError(error);
    } else {
      logger.logNetworkError(GeneralNetworkError(error));
    }
    return super.onError(error);
  }
}
