import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/refresh/refresh_repo.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/util/interceptor/network_refresh_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  NetworkRefreshInterceptor sut;
  AuthStoring authStorage;
  RefreshRepo refreshRepo;
  Dio dio;
  setUp(() async {
    await initTestInjectable();
    authStorage = GetIt.I();
    refreshRepo = GetIt.I();
    dio = GetIt.I();
    sut = NetworkRefreshInterceptor(authStorage, refreshRepo);
  });

  test('NetworkRefreshInterceptor should intercept 401', () async {
    when(refreshRepo.refresh(any)).thenAnswer((_) => Future<void>.value());

    final dioError = DioError(response: Response<void>(statusCode: 401));
    final requestHeaders = <String, dynamic>{};
    final requestOption = RequestOptions(path: 'https://somthing.com', headers: requestHeaders);
    dioError.request = requestOption;
    dioError.response.request = requestOption;
    final unAuthorizedError = UnAuthorizedError(dioError);

    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);

    await sut.onError(unAuthorizedError);

    verify(refreshRepo.refresh(unAuthorizedError)).calledOnce();
    verify(dio.request<void>('https://somthing.com', options: anyNamed('options')));
  });

  test('NetworkRefreshInterceptor should not intercept other errors', () async {
    final dioError = DioError(response: Response<void>(statusCode: 499));
    final requestOption = RequestOptions(path: 'https://somthing.com');
    dioError.request = requestOption;

    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);
    await sut.onError(dioError);
    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);
  });

  test('NetworkREfreshInterceptor should reset refresh repo on rsponse', () {
    verifyZeroInteractions(refreshRepo);
    final response = Response(data: 'Test');
    sut.onResponse(response);
    verify(refreshRepo.resetFailure()).calledOnce();
  });

  test('NetworkRefreshInterceptor should do nothing when authorization call', () async {
    final dioError = DioError(response: Response<void>(statusCode: 401));
    final requestOption = RequestOptions(path: 'login');
    dioError.request = requestOption;
    final unAuthorizedError = UnAuthorizedError(dioError);

    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);

    await sut.onError(unAuthorizedError);

    verifyZeroInteractions(refreshRepo);
    verifyZeroInteractions(authStorage);
  });
}
