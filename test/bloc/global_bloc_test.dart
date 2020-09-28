import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_util.dart';
import '../mocks/repository/debug/mock_debug_repository.dart';
import '../mocks/repository/locale/mock_locale_repository.dart';

void main() {
  group('GlobalCubit', () {
    GlobalCubit globalCubit;
    DebugRepo debugRepo;
    LocaleRepo localeRepo;

    setUp(() async {
      await TestKiwiUtil.init();
      debugRepo = TestKiwiUtil.resolveAs<DebugRepo, MockDebugRepository>();
      localeRepo = TestKiwiUtil.resolveAs<LocaleRepo, MockLocaleRepoitory>();
      globalCubit = GlobalCubit(debugRepo: debugRepo, localeRepo: localeRepo);
    });

    test('initial state is InitialGlobalState', () {
      expect(globalCubit.state, InitialGlobalState());
    });

    blocTest('emits correct data when loadInitialState is called',
        build: () => globalCubit,
        act: (cubit) => cubit.loadInitialState(),
        verify: (globalCubit) {
          expect(globalCubit.state.locale, null);
          expect(globalCubit.state.localizationDelegate.newLocale, null);
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });

    blocTest('emits correct data when changeLanguageToDutch is called',
        build: () => globalCubit,
        act: (cubit) async {
          await cubit.loadInitialState();
          await cubit.changeLanguageToDutch();
        },
        verify: (globalCubit) {
          expect(globalCubit.state.locale, const Locale('nl'));
          expect(globalCubit.state.localizationDelegate.newLocale, const Locale('nl'));
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
          expect(globalCubit.state.slowAnimationsEnabled, false);
          expect(globalCubit.state.showsTranslationKeys, false);
        });
  });
}
