import 'package:flutter/rendering.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'locale_repository_test.mocks.dart';

@GenerateMocks([
  SharedPreferenceStorage,
])
void main() {
  late SharedPreferenceStorage shardPrefs;
  late LocaleRepository sut;

  setUp(() async {
    shardPrefs = MockSharedPreferenceStorage();
    sut = LocaleRepository(shardPrefs);
  });

  tearDown(() async {
    verifyNoMoreInteractions(shardPrefs);
  });

  group('setCustomLocale', () {
    test('setCustomLocale enabled true', () async {
      await sut.setCustomLocale(const Locale('en'));
      verify(shardPrefs.saveString(key: 'locale', value: 'en')).calledOnce();
    });

    test('setCustomLocale enabled false', () async {
      await sut.setCustomLocale(const Locale('nl'));
      verify(shardPrefs.saveString(key: 'locale', value: 'nl')).calledOnce();
    });

    test('setCustomLocale enabled set to null', () async {
      await sut.setCustomLocale(null);
      verify(shardPrefs.deleteKey('locale')).calledOnce();
    });
  });

  group('getCustomLocale', () {
    test('getCustomLocale when enabled was not set', () async {
      when(shardPrefs.getString('locale')).thenReturn(null);
      final result = sut.getCustomLocale();
      expect(result, null);
      verify(shardPrefs.getString('locale')).calledOnce();
    });

    test('getCustomLocale when enabled was set to en', () async {
      when(shardPrefs.getString('locale')).thenAnswer((_) => '');
      final result = sut.getCustomLocale();
      expect(result, null);
      verify(shardPrefs.getString('locale'));
    });

    test('getCustomLocale when enabled was set to en', () async {
      when(shardPrefs.getString('locale')).thenAnswer((_) => 'en');
      final result = sut.getCustomLocale();
      expect(result?.languageCode, 'en');
      verify(shardPrefs.getString('locale')).calledOnce();
    });

    test('getCustomLocale when enabled was set to nl', () async {
      when(shardPrefs.getString('locale')).thenAnswer((_) => 'nl');
      final result = sut.getCustomLocale();
      expect(result?.languageCode, 'nl');
      verify(shardPrefs.getString('locale')).calledOnce();
    });
  });
}
