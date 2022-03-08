import 'package:flutter/material.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late GlobalViewModel sut;
  late LocaleRepository localeRepo;
  late DebugRepository debugRepo;
  late LocalStorage localStorage;

  setUp(() async {
    await initTestInjectable();
    localeRepo = GetIt.I();
    debugRepo = GetIt.I();
    localStorage = GetIt.I();
    sut = GlobalViewModel(localeRepo, debugRepo, localStorage);
  });

  test('GlobalViewModel init', () async {
    when(localeRepo.getCustomLocale()).thenAnswer((_) => null);
    when(debugRepo.getTargetPlatform()).thenReturn(null);
    when(localStorage.getThemeMode()).thenReturn(ThemeMode.system);
    await sut.init();
    expect(sut.localeDelegate, isNotNull);
    expect(sut.localeDelegate.activeLocale, isNull);
    expect(sut.localeDelegate.newLocale, isNull);
    expect(sut.locale, isNull);
    verify(localeRepo.getCustomLocale()).calledOnce();
    verify(debugRepo.getTargetPlatform()).calledOnce();
    verifyNoMoreInteractions(localeRepo);
    verifyNoMoreInteractions(debugRepo);
  });

  test('GlobalViewModel init with saved locale', () async {
    when(localeRepo.getCustomLocale()).thenAnswer((_) => const Locale('nl'));
    when(debugRepo.getTargetPlatform()).thenReturn(null);
    when(localStorage.getThemeMode()).thenReturn(ThemeMode.system);
    await sut.init();
    expect(sut.localeDelegate, isNotNull);
    expect(sut.localeDelegate.activeLocale, isNotNull);
    expect(sut.localeDelegate.newLocale, isNotNull);
    expect(sut.localeDelegate.newLocale?.languageCode, 'nl');
    expect(sut.locale, isNotNull);
    expect(sut.locale?.languageCode, 'nl');
    verify(localeRepo.getCustomLocale()).calledOnce();
    verify(debugRepo.getTargetPlatform()).calledOnce();
    verifyNoMoreInteractions(localeRepo);
    verifyNoMoreInteractions(debugRepo);
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
      sut.toggleTranslationKeys();
      expect(sut.showsTranslationKeys, true);
      verifyZeroInteractions(localeRepo);
      verifyZeroInteractions(debugRepo);
    });

    group('Locale', () {
      test('GlobalViewModel onSwitchToDutch', () async {
        await sut.onSwitchToDutch();
        expect(sut.localeDelegate.activeLocale?.languageCode, 'nl');
        verify(localeRepo.setCustomLocale(any)).calledOnce();
        verifyNoMoreInteractions(localeRepo);
        verifyZeroInteractions(debugRepo);
      });

      test('GlobalViewModel onSwitchToEnglish', () async {
        await sut.onSwitchToDutch();
        expect(sut.localeDelegate.activeLocale?.languageCode, 'nl');
        reset(localeRepo);
        reset(debugRepo);
        await sut.onSwitchToEnglish();
        expect(sut.localeDelegate.activeLocale?.languageCode, 'en');
        verify(localeRepo.setCustomLocale(any)).calledOnce();
        verifyNoMoreInteractions(localeRepo);
        verifyZeroInteractions(debugRepo);
      });

      test('GlobalViewModel onSwitchToSystemLanguage', () async {
        await sut.onSwitchToDutch();
        expect(sut.localeDelegate.activeLocale?.languageCode, 'nl');
        reset(localeRepo);
        reset(debugRepo);
        await sut.onSwitchToSystemLanguage();
        expect(sut.localeDelegate.activeLocale, isNull);
        expect(sut.localeDelegate.newLocale, isNull);
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
          expect(sut.isLanguageSelected(null), true);
          expect(sut.isLanguageSelected('en'), false);
          expect(sut.isLanguageSelected('nl'), false);
          expect(sut.getCurrentLanguage(), 'English');
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

    group('ThemeMode',(){
      test('GlobalViewModel updateThemeMode light', () async {
        when(localStorage.getThemeMode()).thenAnswer((_) => ThemeMode.system);
        await sut.updateThemeMode(ThemeMode.light);
        reset(localeRepo);
        reset(debugRepo);
        expect(sut.themeMode, ThemeMode.light);
        verifyZeroInteractions(localeRepo);
        verifyZeroInteractions(debugRepo);
      });

      test('GlobalViewModel updateThemeMode dark', () async {
        when(localStorage.getThemeMode()).thenAnswer((_) => ThemeMode.system);
        await sut.updateThemeMode(ThemeMode.dark);
        reset(localeRepo);
        reset(debugRepo);
        expect(sut.themeMode, ThemeMode.dark);
        verifyZeroInteractions(localeRepo);
        verifyZeroInteractions(debugRepo);
      });

      test('GlobalViewModel updateThemeMode system', () async {
        when(localStorage.getThemeMode()).thenAnswer((_) => ThemeMode.dark);
        await sut.updateThemeMode(ThemeMode.system);
        reset(localeRepo);
        reset(debugRepo);
        expect(sut.themeMode, ThemeMode.system);
        verifyZeroInteractions(localeRepo);
        verifyZeroInteractions(debugRepo);
      });
    });
  });
}
