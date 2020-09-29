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

  GlobalCubit({this.debugRepo, this.localeRepo}) : super(InitialGlobalState());

  String get targetPlatformAsString => debugRepo.getCurrentPlatform();

  Future<void> loadInitialState() async {
    await localeRepo.setCustomLocale(null);
    final localizationDelegate = LocalizationDelegate(newLocale: null);
    final selectedPlatform = debugRepo.getTargetPlatform();
    emit(LoadedGlobalState(
      targetPlatform: selectedPlatform,
      locale: null,
      localizationDelegate: localizationDelegate,
      slowAnimationsEnabled: false,
      showsTranslationKeys: false,
    ));
  }

  Future<void> changeLanguage(Locale newLanguage) async {
    final currentState = state;
    emit(LoadingGlobalState());
    await localeRepo.setCustomLocale(newLanguage);
    final localizationDelegate = LocalizationDelegate(newLocale: newLanguage);
    emit(LoadedGlobalState(
      locale: newLanguage,
      localizationDelegate: localizationDelegate,
      targetPlatform: currentState.targetPlatform,
      slowAnimationsEnabled: currentState.slowAnimationsEnabled,
      showsTranslationKeys: currentState.showsTranslationKeys,
    ));
  }

  Future<void> changePlatform(String newPlatform) async {
    final currentState = state;
    emit(LoadingGlobalState());
    await debugRepo.saveSelectedPlatform(newPlatform);
    final selectedPlatform = debugRepo.getTargetPlatform();
    emit(LoadedGlobalState(
      targetPlatform: selectedPlatform,
      locale: currentState.locale,
      localizationDelegate: currentState.localizationDelegate,
      slowAnimationsEnabled: currentState.slowAnimationsEnabled,
      showsTranslationKeys: currentState.showsTranslationKeys,
    ));
  }

  Future<void> toggleTranslationKeys() async {
    final currentState = state;
    emit(LoadingGlobalState());
    final localizationDelegate = LocalizationDelegate(newLocale: currentState?.localizationDelegate?.activeLocale, showLocalizationKeys: !currentState.showsTranslationKeys);
    emit(LoadedGlobalState(
      showsTranslationKeys: !currentState.showsTranslationKeys,
      localizationDelegate: localizationDelegate,
      slowAnimationsEnabled: currentState.slowAnimationsEnabled,
      locale: currentState.locale,
      targetPlatform: currentState.targetPlatform,
    ));
  }

  Future<void> changeSlowAnimations({bool enabled}) async {
    final currentState = state;
    emit(LoadedGlobalState(
      slowAnimationsEnabled: enabled,
      showsTranslationKeys: currentState.showsTranslationKeys,
      localizationDelegate: currentState.localizationDelegate,
      locale: currentState.locale,
      targetPlatform: currentState.targetPlatform,
    ));
  }

  Future<void> changePlatformToDefault() => changePlatform(null);
  Future<void> changePlatformToIos() => changePlatform('ios');
  Future<void> changePlatformToAndroid() => changePlatform('android');

  Future<void> changeLanguageToDefault() => changeLanguage(null);
  Future<void> changeLanguageToEnglish() => changeLanguage(const Locale('en'));
  Future<void> changeLanguageToDutch() => changeLanguage(const Locale('nl'));
}
