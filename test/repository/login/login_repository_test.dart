import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late AuthStorage authStorage;
  late LoginRepository sut;

  setUp(() async {
    await initTestInjectable();
    authStorage = GetIt.I();
    sut = LoginRepository(authStorage);
  });

  group('isLoggedIn', () {
    test('isLoggedIn when not loggedin', () async {
      when(authStorage.hasLoggedInUser()).thenAnswer((_) async => false);
      await sut.isLoggedIn;
      verify(authStorage.hasLoggedInUser()).calledOnce();
      verifyNoMoreInteractions(authStorage);
    });
    test('isLoggedIn when user is loggedin', () async {
      when(authStorage.hasLoggedInUser()).thenAnswer((_) async => false);
      await sut.isLoggedIn;
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
