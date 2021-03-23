import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/general_error.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/util/interceptor/combining_smart_interceptor.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';
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
  Future<Object?> onError(DioError err) async {
    if (err is NetworkError) {
      FlutterTemplateLogger.logNetworkError(err);
    } else {
      FlutterTemplateLogger.logNetworkError(GeneralNetworkError(err));
    }
    return super.onError(err);
  }
}
