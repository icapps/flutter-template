import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/repository/secure_storage/secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_extensions.dart';

void main() {
  late SecureStorage secureStorage;
  late AuthStorage sut;

  setUp(() async {
    await initTestInjectable();
    secureStorage = getIt();
    sut = AuthStorage(secureStorage);
  });

  group('getAccessToken', () {
    test('getAccessToken with access-token', () async {
      when(secureStorage.getValue(key: 'ACCESS_TOKEN')).thenAnswer((_) async => 'access-token');

      final result = await sut.getAccessToken();
      expect(result, 'access-token');
      verify(secureStorage.getValue(key: 'ACCESS_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('getAccessToken without access-token', () async {
      when(secureStorage.getValue(key: 'ACCESS_TOKEN')).thenAnswer((_) async => null);

      final result = await sut.getAccessToken();
      expect(result, isNull);
      verify(secureStorage.getValue(key: 'ACCESS_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });

  group('getRefreshToken', () {
    test('getRefreshToken with refresh-token', () async {
      when(secureStorage.getValue(key: 'REFRESH_TOKEN')).thenAnswer((_) async => 'refresh-token');

      final result = await sut.getRefreshToken();
      expect(result, 'refresh-token');
      verify(secureStorage.getValue(key: 'REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('getRefreshToken without refresh-token', () async {
      when(secureStorage.getValue(key: 'REFRESH_TOKEN')).thenAnswer((_) async => null);

      final result = await sut.getRefreshToken();
      expect(result, isNull);
      verify(secureStorage.getValue(key: 'REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });

  group('logout', () {
    test('getRefreshToken with refresh-token', () async {
      when(secureStorage.removeValue(key: 'REFRESH_TOKEN')).thenAnswer((_) => Future.value());
      when(secureStorage.removeValue(key: 'ACCESS_TOKEN')).thenAnswer((_) => Future.value());

      await sut.clear();
      verify(secureStorage.removeValue(key: 'REFRESH_TOKEN')).calledOnce();
      verify(secureStorage.removeValue(key: 'ACCESS_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });

  group('saveUserCredentials', () {
    test('getRefreshToken with refresh-token', () async {
      when(secureStorage.setValue(key: 'ACCESS_TOKEN', value: 'access-token')).thenAnswer((_) => Future.value());
      when(secureStorage.setValue(key: 'REFRESH_TOKEN', value: 'refresh-token')).thenAnswer((_) => Future.value());

      await sut.saveUserCredentials(accessToken: 'access-token', refreshToken: 'refresh-token');
      verify(secureStorage.setValue(key: 'ACCESS_TOKEN', value: 'access-token')).calledOnce();
      verify(secureStorage.setValue(key: 'REFRESH_TOKEN', value: 'refresh-token')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });

  group('hasLoggedInUser', () {
    test('hasLoggedInUser with access token and refresh token', () async {
      when(secureStorage.getValue(key: 'ACCESS_TOKEN')).thenAnswer((_) async => 'access-token');
      when(secureStorage.getValue(key: 'REFRESH_TOKEN')).thenAnswer((_) async => 'refresh-token');

      final result = await sut.hasLoggedInUser();
      expect(result, true);
      verify(secureStorage.getValue(key: 'ACCESS_TOKEN')).calledOnce();
      verify(secureStorage.getValue(key: 'REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('hasLoggedInUser with refresh token', () async {
      when(secureStorage.getValue(key: 'ACCESS_TOKEN')).thenAnswer((_) async => null);
      when(secureStorage.getValue(key: 'REFRESH_TOKEN')).thenAnswer((_) async => 'refresh-token');

      final result = await sut.hasLoggedInUser();
      expect(result, false);
      verify(secureStorage.getValue(key: 'ACCESS_TOKEN')).calledOnce();
      verify(secureStorage.getValue(key: 'REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('hasLoggedInUser with access token', () async {
      when(secureStorage.getValue(key: 'ACCESS_TOKEN')).thenAnswer((_) async => 'access-token');
      when(secureStorage.getValue(key: 'REFRESH_TOKEN')).thenAnswer((_) async => null);

      final result = await sut.hasLoggedInUser();
      expect(result, false);
      verify(secureStorage.getValue(key: 'ACCESS_TOKEN')).calledOnce();
      verify(secureStorage.getValue(key: 'REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('hasLoggedInUser without access token and refresh token', () async {
      when(secureStorage.getValue(key: 'ACCESS_TOKEN')).thenAnswer((_) async => null);
      when(secureStorage.getValue(key: 'REFRESH_TOKEN')).thenAnswer((_) async => null);

      final result = await sut.hasLoggedInUser();
      expect(result, false);
      verify(secureStorage.getValue(key: 'ACCESS_TOKEN')).calledOnce();
      verify(secureStorage.getValue(key: 'REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });
}
