import 'package:dio/dio.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/refresh/refresh_repository.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/util/interceptor/network_refresh_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late NetworkRefreshInterceptor sut;
  late MockAuthStorage authStorage;
  late MockRefreshRepository refreshRepo;
  late MockDio dio;

  setUp(() async {
    await initTestInjectable();
    authStorage = getIt.resolveAs<AuthStorage, MockAuthStorage>();
    refreshRepo = getIt.resolveAs<RefreshRepository, MockRefreshRepository>();
    dio = getIt.resolveAs<Dio, MockDio>();
    sut = NetworkRefreshInterceptor(authStorage, refreshRepo);
  });

  test('NetworkRefreshInterceptor should intercept 401', () async {
    when(refreshRepo.refresh(any)).thenAnswer((_) => Future<void>.value());
    when(authStorage.getAccessToken()).thenAnswer((_) => Future.value(null));
    when(dio.fetch<dynamic>(any)).thenAnswer((_) => Future.value(Response<void>(requestOptions: RequestOptions(path: '/'))));

    final requestOptions = RequestOptions(path: '/todo');
    final dioError = DioError(response: Response<void>(statusCode: 401, requestOptions: requestOptions), requestOptions: requestOptions);
    final requestHeaders = <String, dynamic>{};
    final requestOption = RequestOptions(path: 'https://somthing.com', headers: requestHeaders);
    dioError.response?.requestOptions = requestOption;
    final unAuthorizedError = UnAuthorizedError(dioError);

    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);

    await sut.onError(unAuthorizedError);

    verify(refreshRepo.refresh(unAuthorizedError)).calledOnce();
    verify(dio.fetch<dynamic>(any)).calledOnce();
  });

  test('NetworkRefreshInterceptor should not intercept other errors', () async {
    final requestOptions = RequestOptions(path: '/todo');
    final dioError = DioError(response: Response<void>(statusCode: 499, requestOptions: requestOptions), requestOptions: requestOptions);
    final requestOption = RequestOptions(path: 'https://somthing.com');
    dioError.requestOptions = requestOption;

    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);
    await sut.onError(dioError);
    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);
  });

  test('NetworkREfreshInterceptor should reset refresh repo on rsponse', () {
    verifyZeroInteractions(refreshRepo);
    // ignore: void_checks
    when(refreshRepo.resetFailure()).thenReturn(1);
    final requestOptions = RequestOptions(path: '/todo');
    final response = Response(data: 'Test', requestOptions: requestOptions);
    sut.onResponse(response);
    verify(refreshRepo.resetFailure()).calledOnce();
  });

  test('NetworkRefreshInterceptor should do nothing when authorization call', () async {
    final requestOptions = RequestOptions(path: '/todo');
    final dioError = DioError(response: Response<void>(statusCode: 401, requestOptions: requestOptions), requestOptions: requestOptions);
    final requestOption = RequestOptions(path: 'login');
    dioError.requestOptions = requestOption;
    final unAuthorizedError = UnAuthorizedError(dioError);

    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);

    await sut.onError(unAuthorizedError);

    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);
  });
}
