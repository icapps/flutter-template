import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/repository/secure_storage/auth/mock_auth_storage.dart';
import '../../util/test_extensions.dart';

void main() {
  MockAuthStorage authStorage;
  LoginRepo sut;

  setUp(() async {
    await TestKiwiUtil.init();
    authStorage = TestKiwiUtil.resolveAs<AuthStoring, MockAuthStorage>();
    sut = LoginRepository(authStorage);
  });

  group('isLoggedIn', () {
    test('isLoggedIn when not loggedin', () async {
      when(authStorage.hasLoggedInUser()).thenAnswer((_) async => false);
      await sut.isLoggedIn();
      verify(authStorage.hasLoggedInUser()).calledOnce();
      verifyNoMoreInteractions(authStorage);
    });
    test('isLoggedIn when user is loggedin', () async {
      when(authStorage.hasLoggedInUser()).thenAnswer((_) async => false);
      await sut.isLoggedIn();
      verify(authStorage.hasLoggedInUser()).calledOnce();
      verifyNoMoreInteractions(authStorage);
    });
  });

  group('login', () {
    test('login', () async {
      await sut.login(email: 'email', password: 'password');
      verifyZeroInteractions(authStorage);
    });
  });
}
