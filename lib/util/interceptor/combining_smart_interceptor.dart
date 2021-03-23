import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';

abstract class SimpleInterceptor {
  Future<Object?> onRequest(RequestOptions options) => Future.value(options);

  Future<Object?> onResponse(Response response) => Future.value(response);

  Future<Object?> onError(DioError err) => Future.value(err);
}

class CombiningSmartInterceptor implements Interceptor {
  final _interceptors = <SimpleInterceptor>[];

  void addInterceptor(SimpleInterceptor interceptor) {
    _interceptors.add(interceptor);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    NetworkError? finalResult;
    for (final interceptor in _interceptors.reversed) {
      final dynamic res = await interceptor.onError(finalResult is DioError ? finalResult! : err);
      if (res is Response) {
        handler.resolve(res);
        return;
      }
      if (res is NetworkError) {
        finalResult = res;
      }
    }
    handler.next(finalResult ?? err);
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var intermediate = options;
    for (final interceptor in _interceptors) {
      final dynamic res = await interceptor.onRequest(intermediate);
      if (res is RequestOptions) {
        intermediate = res;
        continue;
      }
      return res;
    }
    handler.next(intermediate);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    var intermediate = response;
    for (final interceptor in _interceptors.reversed) {
      final dynamic res = await interceptor.onResponse(intermediate);
      if (res is Response) {
        intermediate = res;
        continue;
      }
      return res;
    }
    handler.next(intermediate);
  }
}
