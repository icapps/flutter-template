import 'package:dio/dio.dart';
import 'package:flutter_template/util/interceptor/combining_smart_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_kiwi_util.dart';

void main() {
  CombiningSmartInterceptor sut;

  setUp(() async {
    await TestKiwiUtil.init();
    sut = CombiningSmartInterceptor();
  });

  test('CombiningSmartInterceptor test sequence onrequest', () async {
    final interceptor1 = TestInterceptor();
    final interceptor2 = TestInterceptor();
    final interceptor3 = TestInterceptor();
    sut..addInterceptor(interceptor1)..addInterceptor(interceptor2)..addInterceptor(interceptor3);

    final requestOptions = RequestOptions();
    await sut.onRequest(requestOptions);
    expect(interceptor1.onRequestCalled.isBefore(interceptor2.onRequestCalled), true);
    expect(interceptor2.onRequestCalled.isBefore(interceptor3.onRequestCalled), true);

  });

  test('CombiningSmartInterceptor test sequence onresponse', () async {
    final interceptor1 = TestInterceptor();
    final interceptor2 = TestInterceptor();
    final interceptor3 = TestInterceptor();
    sut..addInterceptor(interceptor1)..addInterceptor(interceptor2)..addInterceptor(interceptor3);

    final response = Response<void>();
    await sut.onResponse(response);
    expect(interceptor1.onResponseCalled.isAfter(interceptor2.onResponseCalled), true);
    expect(interceptor2.onResponseCalled.isAfter(interceptor3.onResponseCalled), true);
  });

  test('CombiningSmartInterceptor test sequence onError', () async {
    final interceptor1 = TestInterceptor();
    final interceptor2 = TestInterceptor();
    final interceptor3 = TestInterceptor();
    sut..addInterceptor(interceptor1)..addInterceptor(interceptor2)..addInterceptor(interceptor3);

    final error = DioError();
    await sut.onError(error);
    expect(interceptor1.onErrorCalled.isAfter(interceptor2.onErrorCalled), true);
    expect(interceptor2.onErrorCalled.isAfter(interceptor3.onErrorCalled), true);
  });
}

class TestInterceptor extends Interceptor {
  DateTime onRequestCalled;
  DateTime onResponseCalled;
  DateTime onErrorCalled;

  @override
  Future onRequest(RequestOptions options) {
    onRequestCalled = DateTime.now();
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    onResponseCalled = DateTime.now();
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    onErrorCalled = DateTime.now();
    return super.onError(err);
  }
}
