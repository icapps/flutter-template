import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/repository/secure_storage/secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'secure_storage_test.mocks.dart';

@GenerateMocks([
  FlutterSecureStorage,
])
void main() {
  late SecureStorage sut;
  late MockFlutterSecureStorage secureStorage;

  setUp(() async {
    secureStorage = MockFlutterSecureStorage();
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
