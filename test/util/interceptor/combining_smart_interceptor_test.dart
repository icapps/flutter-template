import 'package:dio/dio.dart';
import 'package:flutter_template/util/interceptor/combining_smart_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../di/test_injectable.dart';
import 'combining_smart_interceptor_test.mocks.dart';

@GenerateMocks([RequestInterceptorHandler, ResponseInterceptorHandler, ErrorInterceptorHandler,])
void main() {
  late CombiningSmartInterceptor sut;

  setUp(() async {
    await initTestInjectable();
    sut = CombiningSmartInterceptor();
  });

  test('CombiningSmartInterceptor test sequence onrequest', () async {
    final interceptor1 = TestInterceptor();
    final interceptor2 = TestInterceptor();
    final interceptor3 = TestInterceptor();
    sut..addInterceptor(interceptor1)..addInterceptor(interceptor2)..addInterceptor(interceptor3);

    final requestOptions = RequestOptions(path: '/todo');
    await sut.onRequest(requestOptions, MockRequestInterceptorHandler());
    expect(interceptor1.onRequestCalled!.isBefore(interceptor2.onRequestCalled!), true);
    expect(interceptor2.onRequestCalled!.isBefore(interceptor3.onRequestCalled!), true);
  });

  test('CombiningSmartInterceptor test sequence onresponse', () async {
    final interceptor1 = TestInterceptor();
    final interceptor2 = TestInterceptor();
    final interceptor3 = TestInterceptor();
    sut..addInterceptor(interceptor1)..addInterceptor(interceptor2)..addInterceptor(interceptor3);

    final requestOptions = RequestOptions(path: '/todo');
    final response = Response<void>(requestOptions: requestOptions);
    await sut.onResponse(response, MockResponseInterceptorHandler());
    expect(interceptor1.onResponseCalled!.isAfter(interceptor2.onResponseCalled!), true);
    expect(interceptor2.onResponseCalled!.isAfter(interceptor3.onResponseCalled!), true);
  });

  test('CombiningSmartInterceptor test sequence onError', () async {
    final interceptor1 = TestInterceptor();
    final interceptor2 = TestInterceptor();
    final interceptor3 = TestInterceptor();
    sut..addInterceptor(interceptor1)..addInterceptor(interceptor2)..addInterceptor(interceptor3);

    final error = DioError(requestOptions: RequestOptions(path: '/'));
    await sut.onError(error, MockErrorInterceptorHandler());
    expect(interceptor1.onErrorCalled!.isAfter(interceptor2.onErrorCalled!), true);
    expect(interceptor2.onErrorCalled!.isAfter(interceptor3.onErrorCalled!), true);
  });
}

class TestInterceptor extends SimpleInterceptor {
  DateTime? onRequestCalled;
  DateTime? onResponseCalled;
  DateTime? onErrorCalled;

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
