import 'package:dio/dio.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/util/interceptor/network_auth_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/repository/secure_storage/auth/mock_auth_storage.dart';
import '../../util/test_extensions.dart';

void main() {
  NetworkAuthInterceptor sut;
  MockAuthStorage authStorage;

  setUp(() async {
    await TestKiwiUtil.init();
    authStorage = TestKiwiUtil.resolveAs<AuthStoring, MockAuthStorage>();
    sut = NetworkAuthInterceptor(authStorage);
  });

  test('NetworkTokenInterceptor test authenticate call', () async {
    final request = RequestOptions(path: 'login');
    final dynamic result = await sut.onRequest(request);
    expect(result, request);
    verifyZeroInteractions(authStorage);
  });
  test('NetworkTokenInterceptor test other call', () async {
    const accessToken = 'accessToken-123ewiojfdc4';
    when(authStorage.getAccessToken()).thenAnswer((_) async => accessToken);

    final request = RequestOptions(path: '/some-other-api-call');
    final dynamic result = await sut.onRequest(request);
    expect(result, request);
    // ignore: avoid_as
    expect((result as RequestOptions).headers['Authorization'], 'Bearer $accessToken');
    verify(authStorage.getAccessToken()).calledOnce();
    verifyNoMoreInteractions(authStorage);
  });
}
