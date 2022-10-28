import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/secure_storage/secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late SecureStorage sut;
  late MockFlutterSecureStorage secureStorage;

  setUp(() async {
    await initTestInjectable();
    secureStorage = getIt.resolveAs<FlutterSecureStorage, MockFlutterSecureStorage>();
    sut = SecureStorage(secureStorage);

    when(secureStorage.read(key: anyNamed('key'), iOptions: anyNamed('iOptions'))).thenAnswer((_) => Future.value(null));
    when(secureStorage.containsKey(key: anyNamed('key'), iOptions: anyNamed('iOptions'))).thenAnswer((_) => Future.value(false));
  });

  test('SecureStorage should write', () {
    sut.write(key: 'Key', value: 'Value');
    verify(secureStorage.write(key: anyNamed('key'), value: anyNamed('value'), iOptions: anyNamed('iOptions'))).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });

  test('SecureStorage should read', () {
    sut.read(key: 'key');
    verify(secureStorage.read(key: anyNamed('key'), iOptions: anyNamed('iOptions'))).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });

  test('SecureStorage should delete', () {
    sut.delete(key: 'ke');
    verify(secureStorage.delete(key: anyNamed('key'), iOptions: anyNamed('iOptions'))).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });

  test('SecureStorage should delete all', () {
    sut.deleteAll();
    verify(secureStorage.deleteAll(iOptions: anyNamed('iOptions'))).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });

  test('SecureStorage containsKey', () {
    sut.containsKey(key: 'KEY');
    verify(secureStorage.containsKey(key: 'KEY', iOptions: anyNamed('iOptions'))).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });
}
