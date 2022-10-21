import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/internal_server_error.dart';
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';

void main() {
  late NetworkLogInterceptor sut;
  late RequestOptions requestOptions;

  setUp(() async {
    await initTestInjectable();
    sut = NetworkLogInterceptor();
    requestOptions = RequestOptions(
      baseUrl: 'https://test.com/',
      path: 'testing',
      method: 'GET',
    );
  });

  test('NetworkLogInterceptor test log request', () async {
    final request = requestOptions;
    final dynamic result = await sut.onRequest(request);
    expect(result, request);
  });

  test('NetworkLogInterceptor test log response', () async {
    final response = Response<void>(requestOptions: requestOptions);
    final dynamic result = await sut.onResponse(response);
    expect(result, response);
  });

  test('NetworkLogInterceptor test log error', () async {
    final error = DioError(requestOptions: requestOptions);
    final dynamic result = await sut.onError(error);
    expect(result, error);
  });

  test('NetworkLogInterceptor test log error with network error', () async {
    final error = InternalServerError(
      DioError(requestOptions: requestOptions),
    );
    final dynamic result = await sut.onError(error);
    expect(result, error);
  });

  test('NetworkLogInterceptor test doesn\'t log not modified', () async {
    final error = DioError(
      error: HttpStatus.notModified,
      response: Response<void>(
        requestOptions: requestOptions,
        statusCode: HttpStatus.notModified,
      ),
      requestOptions: requestOptions,
    );
    final dynamic result = await sut.onError(error);
    expect(result, error);
  });
}
