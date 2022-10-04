import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../di/test_injectable.dart';
import 'test_extensions.dart';

void main() {
  setUp(() async => initTestInjectable());

  test('calledOnce', () async {
    final mock = MockTesting();
    verifyZeroInteractions(mock);
    mock.test();
    verify(mock.test()).calledOnce();
    verifyNoMoreInteractions(mock);
  });
  test('calledTwice', () async {
    final mock = MockTesting();
    verifyZeroInteractions(mock);
    mock..test()..test();
    verify(mock.test()).calledTwice();
    verifyNoMoreInteractions(mock);
  });
  test('called3Times', () async {
    final mock = MockTesting();
    verifyZeroInteractions(mock);
    mock..test()..test()..test();
    verify(mock.test()).called3Times();
    verifyNoMoreInteractions(mock);
  });
  test('called4Times', () async {
    final mock = MockTesting();
    verifyZeroInteractions(mock);
    mock..test()..test()..test()..test();
    verify(mock.test()).called4Times();
    verifyNoMoreInteractions(mock);
  });
}

// ignore: one_member_abstracts
abstract class Testing {
  void test();
}

class MockTesting extends Mock implements Testing {}
