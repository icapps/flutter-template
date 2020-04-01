import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/general_error.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';

class NetworkLogInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    FlutterTemplateLogger.logNetworkRequest(options);
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) async {
    FlutterTemplateLogger.logNetworkResponse(response);
    return super.onResponse(response);
  }

  @override
  onError(DioError err) async {
    if (err is NetworkError) {
      FlutterTemplateLogger.logNetworkError(err);
    } else {
      FlutterTemplateLogger.logNetworkError(GeneralNetworkError(err));
    }
    return super.onError(err);
  }
}
