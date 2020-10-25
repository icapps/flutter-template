import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';

class CombiningSmartInterceptor implements Interceptor {
  final _interceptors = <Interceptor>[];

  void addInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
  }

  @override
  Future onError(DioError err) async {
    dynamic finalResult;
    for (final interceptor in _interceptors.reversed) {
      final dynamic res = await interceptor.onError(finalResult is DioError ? finalResult : err);
      if (res is Response) {
        return res;
      }
      if (res is NetworkError) {
        finalResult = res;
      }
    }
    return finalResult ?? err;
  }

  @override
  Future onRequest(RequestOptions options) async {
    var intermediate = options;
    for (final interceptor in _interceptors) {
      final dynamic res = await interceptor.onRequest(intermediate);
      if (res is RequestOptions) {
        intermediate = res;
        continue;
      }
      return res;
    }
    return intermediate;
  }

  @override
  Future onResponse(Response response) async {
    var intermediate = response;
    for (final interceptor in _interceptors.reversed) {
      final dynamic res = await interceptor.onResponse(intermediate);
      if (res is Response) {
        intermediate = res;
        continue;
      }
      return res;
    }
    return intermediate;
  }
}
