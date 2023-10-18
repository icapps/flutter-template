import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/general_error.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/refresh/refresh_repository.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocked_answer.dart';
import '../../util/test_extensions.dart';
import 'refresh_repository_test.mocks.dart';

@GenerateMocks([
  AuthStorage,
])
void main() {
  late AuthStorage authStorage;
  late RefreshRepository sut;

  setUp(() async {
    authStorage = MockAuthStorage();
    sut = RefreshRepository(authStorage);
  });

  tearDown(() async {
    verifyNoMoreInteractions(authStorage);
  });

  group('refresh', () {
    test('refresh with success', () async {
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getRefreshToken()).thenAnswer((_) => Future.value(null));
      final err = DioException(requestOptions: RequestOptions(path: '/'));
      dynamic error;
      try {
        await sut.refresh(err);
      } catch (e) {
        error = e;
      }
      expect(error is UnimplementedError, true);
      verify(authStorage.getAccessToken()).calledTwice();
      verify(authStorage.getRefreshToken()).calledOnce();
      verifyNoMoreInteractions(authStorage);
    });
    test('refresh with success with already refresh token', () async {
      final mockedAnswer = MockedAnswer<Future<String>>((invocation, amountOfTimesCalled) async {
        if (amountOfTimesCalled > 1) {
          return 'access-token-1234';
        }
        return 'access-token-1233';
      });
      when(authStorage.getAccessToken()).thenAnswer(mockedAnswer.answer);
      final err = DioException(requestOptions: RequestOptions(path: '/'));
      await sut.refresh(err);
      verify(authStorage.getAccessToken()).calledTwice();
      verifyNoMoreInteractions(authStorage);
    });

    test('refresh with error', () async {
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getRefreshToken()).thenThrow(GeneralError());
      final err = DioException(requestOptions: RequestOptions(path: '/'));
      dynamic error;
      var logoutCallbackCalled = false;
      try {
        sut
          ..logoutCallback = () {
            logoutCallbackCalled = true;
          }
          ..resetFailure();
        await sut.refresh(err);
      } catch (e) {
        error = e;
      }
      expect(error, isNotNull);
      expect(error is GeneralError, true);
      expect(logoutCallbackCalled, true);
      verify(authStorage.getAccessToken()).calledTwice();
      verify(authStorage.getRefreshToken()).calledOnce();
      verify(authStorage.clear()).calledOnce();
      verifyNoMoreInteractions(authStorage);
      reset(authStorage);
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      error = null;
      logoutCallbackCalled = false;
      try {
        sut.logoutCallback = () {
          logoutCallbackCalled = true;
        };
        await sut.refresh(err);
      } catch (e) {
        error = e;
      }
      expect(error is UnAuthorizedError, true);
      expect(logoutCallbackCalled, false);
      verify(authStorage.getAccessToken()).calledTwice();
      verifyNoMoreInteractions(authStorage);
    });

    test('refresh with error with logout callback', () async {
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getRefreshToken()).thenThrow(GeneralError());
      final err = DioException(requestOptions: RequestOptions(path: '/'));
      dynamic error;
      var logoutCallbackCalled = false;
      try {
        sut
          ..logoutCallback = () {
            logoutCallbackCalled = true;
          }
          ..resetFailure();
        await sut.refresh(err);
      } catch (e) {
        error = e;
      }
      expect(error, isNotNull);
      expect(error is GeneralError, true);
      expect(logoutCallbackCalled, true);
      verify(authStorage.getAccessToken()).calledTwice();
      verify(authStorage.getRefreshToken()).calledOnce();
      verify(authStorage.clear()).calledOnce();
      verifyNoMoreInteractions(authStorage);
      reset(authStorage);
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getRefreshToken()).thenThrow(GeneralError());
      error = null;
      logoutCallbackCalled = false;
      try {
        sut.logoutCallback = () {
          logoutCallbackCalled = true;
        };
        await sut.refresh(err);
      } catch (e) {
        error = e;
      }
      expect(error, isNotNull);
      expect(error is UnAuthorizedError, true);
      expect(logoutCallbackCalled, false);
      verify(authStorage.getAccessToken()).calledTwice();
      verifyNoMoreInteractions(authStorage);
    });

    test('refresh with error with logout callback but first reset', () async {
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getRefreshToken()).thenThrow(GeneralError());
      final err = DioException(requestOptions: RequestOptions(path: '/'));
      dynamic error;
      var logoutCallbackCalled = false;
      try {
        sut
          ..logoutCallback = () {
            logoutCallbackCalled = true;
          }
          ..resetFailure();
        await sut.refresh(err);
      } catch (e) {
        error = e;
      }
      expect(error, isNotNull);
      expect(error is GeneralError, true);
      expect(logoutCallbackCalled, true);
      verify(authStorage.getAccessToken()).calledTwice();
      verify(authStorage.getRefreshToken()).calledOnce();
      verify(authStorage.clear()).calledOnce();
      verifyNoMoreInteractions(authStorage);
      reset(authStorage);
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getAccessToken()).thenAnswer((_) async => 'access-token-1234');
      when(authStorage.getRefreshToken()).thenAnswer((_) async => 'refresh-token-1232');
      error = null;
      logoutCallbackCalled = false;
      try {
        sut
          ..logoutCallback = () {
            logoutCallbackCalled = true;
          }
          ..resetFailure();
        await sut.refresh(err);
      } catch (e) {
        error = e;
      }
      expect(error is UnimplementedError, true);
//      expect(error, isNull); TODO remove after implemenation
//      expect(error is UnAuthorizedError, false); TODO remove after implemenation
//      expect(logoutCallbackCalled, false); TODO remove after implemenation
      verify(authStorage.getAccessToken()).calledTwice();
      verify(authStorage.getRefreshToken()).calledOnce();
      // TODO remove after implemenation
      verify(authStorage.clear()).calledOnce();
      verifyNoMoreInteractions(authStorage);
    });
  });
}
