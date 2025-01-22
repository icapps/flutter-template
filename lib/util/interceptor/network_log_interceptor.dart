import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/general_network_error.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkLogInterceptor extends SimpleInterceptor {
  @override
  Future<Object?> onRequest(RequestOptions options) async {
    FlutterTemplateLogger.logNetworkRequest(options);
    return super.onRequest(options);
  }

  @override
  Future<Object?> onResponse(Response response) async {
    FlutterTemplateLogger.logNetworkResponse(response);
    return super.onResponse(response);
  }

  @override
  Future<Object?> onError(DioException error) async {
    final response = error.response;
    if (response != null && response.statusCode == HttpStatus.notModified) {
      FlutterTemplateLogger.logNetworkResponse(response);
      return super.onError(error);
    }
    if (error is NetworkError) {
      FlutterTemplateLogger.logNetworkError(error);
    } else {
      FlutterTemplateLogger.logNetworkError(GeneralNetworkError(error));
    }
    return super.onError(error);
  }
}
