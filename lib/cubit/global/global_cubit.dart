import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  final DebugRepo debugRepo;
  final LocaleRepo localeRepo;

  GlobalCubit({this.debugRepo, this.localeRepo}) : super(const InitialGlobalState());

  Future<void> changeLanguage(Locale newLanguage) async {
    emit(LoadingGlobalState());
    await localeRepo.setCustomLocale(newLanguage);
    final localizationDelegate = LocalizationDelegate(newLocale: newLanguage);
    emit(InitialGlobalState(
      locale: newLanguage,
      localizationDelegate: localizationDelegate,
      targetPlatform: state.targetPlatform,
      slowAnimationsEnabled: state.slowAnimationsEnabled,
      showsTranslationKeys: state.showsTranslationKeys,
    ));
  }

  Future<void> changePlatform(String newPlatform) async {
    emit(LoadingGlobalState());
    await debugRepo.saveSelectedPlatform(newPlatform);
    final selectedPlatform = debugRepo.getTargetPlatform();
    emit(InitialGlobalState(
      targetPlatform: selectedPlatform,
      locale: state.locale,
      localizationDelegate: state.localizationDelegate,
      slowAnimationsEnabled: state.slowAnimationsEnabled,
      showsTranslationKeys: state.showsTranslationKeys,
    ));
  }

  Future<void> toggleTranslationKeys() async {
    emit(LoadingGlobalState());
    final localizationDelegate = LocalizationDelegate(newLocale: state?.localizationDelegate?.activeLocale, showLocalizationKeys: !state.showsTranslationKeys);
    emit(InitialGlobalState(
      showsTranslationKeys: !state.showsTranslationKeys,
      localizationDelegate: localizationDelegate,
      slowAnimationsEnabled: state.slowAnimationsEnabled,
      locale: state.locale,
      targetPlatform: state.targetPlatform,
    ));
  }

  Future<void> changeSlowAnimations({bool enabled}) async {
    emit(InitialGlobalState(
      slowAnimationsEnabled: enabled,
      showsTranslationKeys: state.showsTranslationKeys,
      localizationDelegate: state.localizationDelegate,
      locale: state.locale,
      targetPlatform: state.targetPlatform,
    ));
  }

  Future<void> changePlatformToDefault() => changePlatform(null);
  Future<void> changePlatformToIos() => changePlatform('android');
  Future<void> changePlatformToAndroid() => changePlatform('ios');

  Future<void> changeLanguageToDefault() => changeLanguage(null);
  Future<void> changeLanguageToEnglish() => changeLanguage(const Locale('en'));
  Future<void> changeLanguageToDutch() => changeLanguage(const Locale('nl'));
}
