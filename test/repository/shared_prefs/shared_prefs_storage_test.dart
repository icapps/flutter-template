import 'package:flutter_template/repository/shared_prefs/shared_prefs_storage.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late MockSharedPreferences sharedPreferences;
  late SharedPrefsStoring sut;

  setUp(() async {
    await initTestInjectable();
    sharedPreferences = GetIt.I.resolveAs<SharedPreferences, MockSharedPreferences>();
    sut = SharedPrefsStorage(sharedPreferences);

    when(sharedPreferences.setString(any, any)).thenAnswer((_) => Future.value(true));
    when(sharedPreferences.setDouble(any, any)).thenAnswer((_) => Future.value(true));
    when(sharedPreferences.setBool(any, any)).thenAnswer((_) => Future.value(true));
    when(sharedPreferences.setStringList(any, any)).thenAnswer((_) => Future.value(true));
    when(sharedPreferences.setInt(any, any)).thenAnswer((_) => Future.value(true));
    when(sharedPreferences.getString(any)).thenReturn(null);
    when(sharedPreferences.getDouble(any)).thenReturn(null);
    when(sharedPreferences.getBool(any)).thenReturn(null);
    when(sharedPreferences.getStringList(any)).thenReturn(null);
    when(sharedPreferences.getInt(any)).thenReturn(null);
    when(sharedPreferences.remove(any)).thenAnswer((_) => Future.value(true));
    when(sharedPreferences.containsKey(any)).thenReturn(false);
  });

  group('String', () {
    test('SharedPrefsStorage should write string', () {
      sut.saveString(key: 'Key', value: 'Value');
      verify(sharedPreferences.setString('Key', 'Value')).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });
    test('SharedPrefsStorage should read string', () {
      sut.getString('Key');
      verify(sharedPreferences.getString('Key')).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });
  });

  group('bool', () {
    test('SharedPrefsStorage should write bool', () {
      sut.saveBoolean(key: 'Key', value: true);
      verify(sharedPreferences.setBool('Key', true)).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });
    test('SharedPrefsStorage should write bool false', () {
      sut.saveBoolean(key: 'Key', value: false);
      verify(sharedPreferences.setBool('Key', false)).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });

    test('SharedPrefsStorage should read bool', () {
      when(sharedPreferences.getBool('Key')).thenAnswer((_) => true);
      final result = sut.getBoolean('Key');
      expect(result, true);
      verify(sharedPreferences.getBool('Key')).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });
  });

  group('double', () {
    test('SharedPrefsStorage should write double', () {
      sut.saveDouble(key: 'Key', value: 1.2145);
      verify(sharedPreferences.setDouble('Key', 1.2145)).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });

    test('SharedPrefsStorage should read double', () {
      when(sharedPreferences.getDouble('Key')).thenAnswer((_) => 1.23435);
      final result = sut.getDouble('Key');
      expect(result, 1.23435);
      verify(sharedPreferences.getDouble('Key')).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });
  });

  group('int', () {
    test('SharedPrefsStorage should write int', () {
      sut.saveInt(key: 'Key', value: 123425);
      verify(sharedPreferences.setInt('Key', 123425)).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });

    test('SharedPrefsStorage should read double', () {
      when(sharedPreferences.getInt('Key')).thenAnswer((_) => 21345);
      final result = sut.getInt('Key');
      expect(result, 21345);
      verify(sharedPreferences.getInt('Key')).calledOnce();
      verifyNoMoreInteractions(sharedPreferences);
    });
  });

  test('SharedPrefsStorage should delete', () {
    sut.deleteKey('KEY');
    verify(sharedPreferences.remove('KEY')).calledOnce();
    verifyNoMoreInteractions(sharedPreferences);
  });

  test('SharedPrefsStorage containsKey', () {
    sut.containsKey('KEY');
    verify(sharedPreferences.containsKey('KEY')).calledOnce();
    verifyNoMoreInteractions(sharedPreferences);
  });
}
