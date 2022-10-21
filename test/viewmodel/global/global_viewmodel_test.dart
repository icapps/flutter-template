import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late GlobalViewModel sut;
  late LocaleRepository localeRepo;
  late DebugRepository debugRepo;
  late LocalStorage localStorage;
  late Localization localization;

  setUp(() async {
    await initTestInjectable();
    localeRepo = getIt();
    debugRepo = getIt();
    localStorage = getIt();
    localization = getIt();
    sut = GlobalViewModel(localeRepo, debugRepo, localStorage, localization);
  });

  test('GlobalViewModel init', () async {
    when(localeRepo.getCustomLocale()).thenAnswer((_) => null);
    when(debugRepo.getTargetPlatform()).thenReturn(null);
    when(localStorage.getThemeMode()).thenReturn(ThemeMode.system);
    await sut.init();
    verify(debugRepo.getTargetPlatform()).calledOnce();
    verify(localStorage.getThemeMode()).calledOnce();
    verifyNoMoreInteractions(localeRepo);
    verifyNoMoreInteractions(debugRepo);
    verifyNoMoreInteractions(localStorage);
  });

  test('GlobalViewModel init with saved locale', () async {
    when(localeRepo.getCustomLocale()).thenAnswer((_) => const Locale('nl'));
    when(debugRepo.getTargetPlatform()).thenReturn(null);
    when(localStorage.getThemeMode()).thenReturn(ThemeMode.system);
    await sut.init();
    verify(debugRepo.getTargetPlatform()).calledOnce();
    verify(localStorage.getThemeMode()).calledOnce();
    verifyNoMoreInteractions(localeRepo);
    verifyNoMoreInteractions(debugRepo);
    verifyNoMoreInteractions(localStorage);
  });

  test('GlobalViewModel check thememode', () async {
    when(localStorage.getThemeMode()).thenReturn(ThemeMode.system);
  });

  group('After init', () {
    setUp(() async {
      when(localeRepo.getCustomLocale()).thenAnswer((_) => null);
      when(debugRepo.getTargetPlatform()).thenReturn(null);
      when(localStorage.getThemeMode()).thenReturn(ThemeMode.system);
      await sut.init();
      reset(localeRepo);
      reset(debugRepo);
      reset(localStorage);
    });

    test('GlobalViewModel onSwitchToDutch', () async {
      expect(sut.showsTranslationKeys, false);
      await sut.toggleTranslationKeys();
      expect(sut.showsTranslationKeys, true);
      verifyZeroInteractions(localeRepo);
      verifyZeroInteractions(debugRepo);
    });

    group('Locale', () {
      test('GlobalViewModel onSwitchToDutch', () async {
        await sut.onSwitchToDutch();
        expect(sut.locale?.languageCode, 'nl');
        verify(localeRepo.setCustomLocale(any)).calledOnce();
        verifyNoMoreInteractions(localeRepo);
        verifyZeroInteractions(debugRepo);
      });

      test('GlobalViewModel onSwitchToEnglish', () async {
        await sut.onSwitchToDutch();
        expect(sut.locale?.languageCode, 'nl');
        reset(localeRepo);
        reset(debugRepo);
        await sut.onSwitchToEnglish();
        expect(sut.locale?.languageCode, 'en');
        verify(localeRepo.setCustomLocale(any)).calledOnce();
        verifyNoMoreInteractions(localeRepo);
        verifyZeroInteractions(debugRepo);
      });

      test('GlobalViewModel onSwitchToSystemLanguage', () async {
        await sut.onSwitchToDutch();
        expect(sut.locale?.languageCode, 'nl');
        reset(localeRepo);
        reset(debugRepo);
        await sut.onSwitchToSystemLanguage();
        expect(sut.locale, const Locale('nl'));
        verify(localeRepo.setCustomLocale(any)).calledOnce();
        verifyNoMoreInteractions(localeRepo);
        verifyZeroInteractions(debugRepo);
      });

      group('getCurrentLanguage', () {
        test('GlobalViewModel getCurrentLanguage English', () async {
          await sut.onSwitchToEnglish();
          reset(localeRepo);
          reset(debugRepo);
          expect(sut.isLanguageSelected(null), false);
          expect(sut.isLanguageSelected('en'), true);
          expect(sut.isLanguageSelected('nl'), false);
          expect(sut.getCurrentLanguage(), 'English');
          verifyZeroInteractions(localeRepo);
          verifyZeroInteractions(debugRepo);
        });

        test('GlobalViewModel getCurrentLanguage Nederlands', () async {
          await sut.onSwitchToDutch();
          reset(localeRepo);
          reset(debugRepo);
          expect(sut.isLanguageSelected(null), false);
          expect(sut.isLanguageSelected('en'), false);
          expect(sut.isLanguageSelected('nl'), true);
          expect(sut.getCurrentLanguage(), 'Nederlands');
          verifyZeroInteractions(localeRepo);
          verifyZeroInteractions(debugRepo);
        });

        test('GlobalViewModel getCurrentPlatform default', () async {
          await sut.onSwitchToSystemLanguage();
          reset(localeRepo);
          reset(debugRepo);
          expect(sut.isLanguageSelected(null), false);
          expect(sut.isLanguageSelected('en'), false);
          expect(sut.isLanguageSelected('nl'), true);
          expect(sut.getCurrentLanguage(), 'Nederlands');
          verifyZeroInteractions(localeRepo);
          verifyZeroInteractions(debugRepo);
        });
      });
    });

    group('Selected Platform', () {
      test('GlobalViewModel setSelectedPlatformToAndroid', () async {
        when(debugRepo.getTargetPlatform()).thenReturn(null);
        await sut.setSelectedPlatformToAndroid();
        verify(debugRepo.saveSelectedPlatform('android')).calledOnce();
        verify(debugRepo.getTargetPlatform()).calledOnce();
        verifyZeroInteractions(localeRepo);
        verifyNoMoreInteractions(debugRepo);
      });

      test('GlobalViewModel setSelectedPlatformToIOS', () async {
        when(debugRepo.getTargetPlatform()).thenReturn(null);
        await sut.setSelectedPlatformToIOS();
        verify(debugRepo.saveSelectedPlatform('ios')).calledOnce();
        verify(debugRepo.getTargetPlatform()).calledOnce();
        verifyZeroInteractions(localeRepo);
        verifyNoMoreInteractions(debugRepo);
      });

      test('GlobalViewModel setSelectedPlatformToDefault', () async {
        when(debugRepo.getTargetPlatform()).thenReturn(null);
        await sut.setSelectedPlatformToDefault();
        verify(debugRepo.saveSelectedPlatform(null)).calledOnce();
        verify(debugRepo.getTargetPlatform()).calledOnce();
        verifyZeroInteractions(localeRepo);
        verifyNoMoreInteractions(debugRepo);
      });

      group('getCurrentPlatform', () {
        test('GlobalViewModel getCurrentPlatform android', () async {
          when(debugRepo.getTargetPlatform()).thenAnswer((_) => TargetPlatform.android);
          await sut.setSelectedPlatformToAndroid();
          reset(localeRepo);
          reset(debugRepo);
          expect(sut.getCurrentPlatform(), LocalizationKeys.generalLabelAndroid);
          verifyZeroInteractions(localeRepo);
          verifyZeroInteractions(debugRepo);
        });

        test('GlobalViewModel getCurrentPlatform ios', () async {
          when(debugRepo.getTargetPlatform()).thenAnswer((_) => TargetPlatform.iOS);
          await sut.setSelectedPlatformToIOS();
          reset(localeRepo);
          reset(debugRepo);
          expect(sut.getCurrentPlatform(), LocalizationKeys.generalLabelIos);
          verifyZeroInteractions(localeRepo);
          verifyZeroInteractions(debugRepo);
        });

        test('GlobalViewModel getCurrentPlatform android', () async {
          when(debugRepo.getTargetPlatform()).thenAnswer((_) => null);
          await sut.setSelectedPlatformToDefault();
          reset(localeRepo);
          reset(debugRepo);
          expect(sut.getCurrentPlatform(), LocalizationKeys.generalLabelSystemDefault);
          verifyZeroInteractions(localeRepo);
          verifyZeroInteractions(debugRepo);
        });
      });
    });
  });
}
