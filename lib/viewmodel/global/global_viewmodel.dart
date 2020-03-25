import 'package:flutter/material.dart';
import 'package:flutter_template/repository/debug_repository.dart';
import 'package:flutter_template/repository/locale_repository.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';

class GlobalViewModel with ChangeNotifier {
  final LocaleRepository _localeRepo;
  final DebugRepository _debugRepo;
  var localeDelegate = LocalizationDelegate();
  var showsTranslationKeys = false;

  final themeMode = ThemeMode.system;

  TargetPlatform targetPlatform;

  GlobalViewModel(this._localeRepo, this._debugRepo);

  void init() {
    _initLocale();
    _initTargetPlatform();
  }

  void _initTargetPlatform() {
    targetPlatform = _debugRepo.getTargetPlatform();
    notifyListeners();
  }

  Future<void> _initLocale() async {
    final locale = await _localeRepo.getCustomLocale();
    if (locale != null) {
      localeDelegate = LocalizationDelegate(newLocale: locale);
      notifyListeners();
    }
  }

  Future<void> onSwitchToDutch() async {
    await _onUpdateLocaleClicked(const Locale('nl'));
  }

  Future<void> onSwitchToEnglish() async {
    await _onUpdateLocaleClicked(const Locale('en'));
  }

  Future<void> onSwitchToSystemLanguage() async {
    await _onUpdateLocaleClicked(null);
  }

  Future<void> _onUpdateLocaleClicked(Locale locale) async {
    await _localeRepo.setCustomLocale(locale);
    localeDelegate = LocalizationDelegate(newLocale: locale);
    notifyListeners();
  }

  void setSelectedPlatformToAndroid() {
    _debugRepo.saveSelectedPlatform('android');
    _initTargetPlatform();
  }

  void setSelectedPlatformToIOS() {
    _debugRepo.saveSelectedPlatform('ios');
    _initTargetPlatform();
  }

  void setSelectedPlatformToDefault() {
    _debugRepo.saveSelectedPlatform(null);
    _initTargetPlatform();
  }

  String getCurrentPlatform(Localization localization) {
    if (targetPlatform == TargetPlatform.android) {
      return 'Android';
    } else if (targetPlatform == TargetPlatform.iOS) {
      return 'iOS';
    }
    return 'System default';
  }

  String getCurrentLanguage() {
    switch (localeDelegate.activeLocale.languageCode) {
      case 'nl':
        return 'Nederlands';
      case 'en':
        return 'English';
    }
    return 'English';
  }

  bool isLanguageSelected(String languageCode) => localeDelegate.activeLocale.languageCode == languageCode;

  void toggleTranslationKeys() {
    showsTranslationKeys = !showsTranslationKeys;
    localeDelegate = LocalizationDelegate(newLocale: localeDelegate.activeLocale, isInTest: showsTranslationKeys);
    notifyListeners();
  }
}
