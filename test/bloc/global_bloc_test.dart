import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_util.dart';
import '../mocks/repository/debug/mock_debug_repository.dart';
import '../mocks/repository/locale/mock_locale_repository.dart';

void main() {
  GlobalCubit globalCubit;
  LocaleRepo localeRepo;
  DebugRepo debugRepo;
  setUp(() async {
    await TestKiwiUtil.init();
    localeRepo = TestKiwiUtil.resolveAs<LocaleRepo, MockLocaleRepository>();
    debugRepo = TestKiwiUtil.resolveAs<DebugRepo, MockDebugRepository>();
    globalCubit = GlobalCubit(debugRepo: debugRepo, localeRepo: localeRepo);
  });

  group('GlobalCubit init', () {
    test('initial state is InitialGlobalState', () {
      expect(globalCubit.state, InitialGlobalState());
    });

    blocTest('emits correct data when loadInitialState is called',
        build: () => globalCubit,
        act: (cubit) => cubit.loadInitialState(),
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });
  });

  group('GlobalCubit languages', () {
    blocTest('emits correct data when changeLanguageToDutch is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changeLanguageToDutch();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, const Locale('nl'));
          expect(globalCubit.state.localizationDelegate.newLocale, const Locale('nl'));
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });

    blocTest('emits correct data when changeLanguageToEnglish is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changeLanguageToEnglish();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, const Locale('en'));
          expect(globalCubit.state.localizationDelegate.newLocale, const Locale('en'));
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });

    blocTest('emits correct data when changeLanguageToDefault is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changeLanguageToDefault();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });
  });

  group('GlobalCubit platforms', () {
    blocTest('emits correct data when changePlatformToIos is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changePlatformToIos();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, TargetPlatform.iOS);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });

    blocTest('emits correct data when changePlatformToAndroid is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changePlatformToAndroid();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, TargetPlatform.android);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });

    blocTest('emits correct data when changePlatformToDefault is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changePlatformToDefault();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });
  });

  group('GlobalCubit animation and translation', () {
    blocTest('emits correct data when toggleTranslationKeys is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.toggleTranslationKeys();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, true);
        });

    blocTest('emits correct data when toggleTranslationKeys is called three times',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.toggleTranslationKeys();
          await cubit.toggleTranslationKeys();
          await cubit.toggleTranslationKeys();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, true);
        });

    blocTest('emits correct data when changeSlowAnimations(true) is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changeSlowAnimations(enabled: true);
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, true);
          expect(globalCubit.state.showsTranslationKeys, false);
        });

    blocTest('emits correct data when changeSlowAnimations(false) is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changeSlowAnimations(enabled: false);
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.targetPlatform, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });
  });
}
