import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/internal_server_error.dart';
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_kiwi_util.dart';

void main() {
  NetworkLogInterceptor sut;

  setUp(() async {
    await TestKiwiUtil.init();
    sut = NetworkLogInterceptor();
  });

  test('NetworkLogInterceptor test log request', () async {
    final request = RequestOptions(
      baseUrl: 'https://test.com/',
      path: 'testing',
      method: 'GET',
    );
    final dynamic result = await sut.onRequest(request);
    expect(result, request);
  });

  test('NetworkLogInterceptor test log response', () async {
    final response = Response<void>(
      request: RequestOptions(
        baseUrl: 'https://test.com/',
        path: 'testing',
        method: 'GET',
      ),
    );
    final dynamic result = await sut.onResponse(response);
    expect(result, response);
  });

  test('NetworkLogInterceptor test log error', () async {
    final error = DioError(
      request: RequestOptions(
        baseUrl: 'https://test.com/',
        path: 'testing',
        method: 'GET',
      ),
    );
    final dynamic result = await sut.onError(error);
    expect(result, error);
  });

  test('NetworkLogInterceptor test log error with network error', () async {
    final error = InternalServerError(
      DioError(
        request: RequestOptions(
          baseUrl: 'https://test.com/',
          path: 'testing',
          method: 'GET',
        ),
      ),
    );
    final dynamic result = await sut.onError(error);
    expect(result, error);
  });
}
