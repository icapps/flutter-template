import 'package:dio/dio.dart';
import 'package:flutter_template/util/logger/logger.dart';

class NetworkLogInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    Logger.logNetworkRequest(options);
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) {
    Logger.logNetworkResponse(response);
    return super.onResponse(response);
  }

  @override
  onError(DioError err) {
    Logger.logNetworkError(err);
    return super.onError(err);
  }
}
