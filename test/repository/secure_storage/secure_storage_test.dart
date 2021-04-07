import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/repository/secure_storage/secure_storage.dart';
import 'package:flutter_template/repository/secure_storage/secure_storing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late SecureStoring sut;
  late MockFlutterSecureStorage secureStorage;

  setUp(() async {
    await initTestInjectable();
    secureStorage = GetIt.I.resolveAs<FlutterSecureStorage, MockFlutterSecureStorage>();
    sut = SecureStorage(secureStorage);

    when(secureStorage.read(key: anyNamed('key'))).thenAnswer((_) => Future.value(null));
    when(secureStorage.containsKey(key: anyNamed('key'))).thenAnswer((_) => Future.value(false));
  });

  test('SecureStorage should write', () {
    sut.write(key: 'Key', value: 'Value');
    verify(secureStorage.write(key: anyNamed('key'), value: anyNamed('value'))).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });

  test('SecureStorage should read', () {
    sut.read(key: 'key');
    verify(secureStorage.read(key: anyNamed('key'))).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });

  test('SecureStorage should delete', () {
    sut.delete(key: 'ke');
    verify(secureStorage.delete(key: anyNamed('key'))).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });

  test('SecureStorage should delete all', () {
    sut.deleteAll();
    verify(secureStorage.deleteAll()).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });

  test('SecureStorage containsKey', () {
    sut.containsKey(key: 'KEY');
    verify(secureStorage.containsKey(key: 'KEY')).calledOnce();
    verifyNoMoreInteractions(secureStorage);
  });
}
