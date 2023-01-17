import 'package:dio/dio.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/util/interceptor/network_auth_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'network_auth_interceptor_test.mocks.dart';

@GenerateMocks([
  AuthStorage,
])
void main() {
  late NetworkAuthInterceptor sut;
  late AuthStorage authStorage;

  setUp(() async {
    authStorage = MockAuthStorage();
    sut = NetworkAuthInterceptor(authStorage);
  });

  tearDown(() {
    verifyNoMoreInteractions(authStorage);
  });

  test('NetworkTokenInterceptor test authenticate call', () async {
    final request = RequestOptions(path: 'login');
    final dynamic result = await sut.onRequest(request);
    expect(result, request);
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
  });
}
