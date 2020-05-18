import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/repository/secure_storage/secure_storing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../mocks/repository/secure_storage/mock_secure_storage.dart';
import '../../../util/test_extensions.dart';

void main() {
  MockSecureStorage secureStorage;
  AuthStoring sut;

  setUp(() async {
    await TestKiwiUtil.init();
    secureStorage = TestKiwiUtil.resolveAs<SecureStoring, MockSecureStorage>();
    sut = AuthStorage(secureStorage);
  });

  group('getAccessToken', () {
    test('getAccessToken with access-token', () async {
      when(secureStorage.read(key: 'ACCESS_TOKEN')).thenAnswer((_) async => 'access-token');

      final result = await sut.getAccessToken();
      expect(result, 'access-token');
      verify(secureStorage.read(key: 'ACCESS_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('getAccessToken without access-token', () async {
      when(secureStorage.read(key: 'ACCESS_TOKEN')).thenAnswer((_) async => null);

      final result = await sut.getAccessToken();
      expect(result, isNull);
      verify(secureStorage.read(key: 'ACCESS_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });

  group('getRefreshToken', () {
    test('getRefreshToken with refresh-token', () async {
      when(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).thenAnswer((_) async => 'refresh-token');

      final result = await sut.getRefreshToken();
      expect(result, 'refresh-token');
      verify(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('getRefreshToken without refresh-token', () async {
      when(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).thenAnswer((_) async => null);

      final result = await sut.getRefreshToken();
      expect(result, isNull);
      verify(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });

  group('logout', () {
    test('getRefreshToken with refresh-token', () async {
      when(secureStorage.delete(key: 'ACCESS_REFRESH_TOKEN')).thenAnswer((_) => Future.value());
      when(secureStorage.delete(key: 'ACCESS_TOKEN')).thenAnswer((_) => Future.value());

      await sut.clear();
      verify(secureStorage.deleteAll()).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });

  group('saveUserCredentials', () {
    test('getRefreshToken with refresh-token', () async {
      when(secureStorage.write(key: 'ACCESS_TOKEN', value: 'access-token')).thenAnswer((_) => Future.value());
      when(secureStorage.write(key: 'ACCESS_REFRESH_TOKEN', value: 'refresh-token')).thenAnswer((_) => Future.value());

      await sut.saveUserCredentials(accessToken: 'access-token', refreshToken: 'refresh-token');
      verify(secureStorage.write(key: 'ACCESS_TOKEN', value: 'access-token')).calledOnce();
      verify(secureStorage.write(key: 'ACCESS_REFRESH_TOKEN', value: 'refresh-token')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });

  group('hasLoggedInUser', () {
    test('hasLoggedInUser with access token and refresh token', () async {
      when(secureStorage.read(key: 'ACCESS_TOKEN')).thenAnswer((_) async => 'access-token');
      when(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).thenAnswer((_) async => 'refresh-token');

      final result = await sut.hasLoggedInUser();
      expect(result, true);
      verify(secureStorage.read(key: 'ACCESS_TOKEN')).calledOnce();
      verify(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('hasLoggedInUser with refresh token', () async {
      when(secureStorage.read(key: 'ACCESS_TOKEN')).thenAnswer((_) async => null);
      when(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).thenAnswer((_) async => 'refresh-token');

      final result = await sut.hasLoggedInUser();
      expect(result, false);
      verify(secureStorage.read(key: 'ACCESS_TOKEN')).calledOnce();
      verify(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('hasLoggedInUser with access token', () async {
      when(secureStorage.read(key: 'ACCESS_TOKEN')).thenAnswer((_) async => 'access-token');
      when(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).thenAnswer((_) async => null);

      final result = await sut.hasLoggedInUser();
      expect(result, false);
      verify(secureStorage.read(key: 'ACCESS_TOKEN')).calledOnce();
      verify(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
    test('hasLoggedInUser without access token and refresh token', () async {
      when(secureStorage.read(key: 'ACCESS_TOKEN')).thenAnswer((_) async => null);
      when(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).thenAnswer((_) async => null);

      final result = await sut.hasLoggedInUser();
      expect(result, false);
      verify(secureStorage.read(key: 'ACCESS_TOKEN')).calledOnce();
      verify(secureStorage.read(key: 'ACCESS_REFRESH_TOKEN')).calledOnce();
      verifyNoMoreInteractions(secureStorage);
    });
  });
}
