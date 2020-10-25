import 'package:flutter/material.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

class GlobalViewModel with ChangeNotifier {
  final LocaleRepo _localeRepo;
  final DebugRepo _debugRepo;
  var _localeDelegate = LocalizationDelegate();
  var _showsTranslationKeys = false;

  final _themeMode = ThemeMode.system;

  TargetPlatform _targetPlatform;

  GlobalViewModel(this._localeRepo, this._debugRepo);

  ThemeMode get themeMode => _themeMode;

  Locale get locale => _localeDelegate.newLocale;

  TargetPlatform get targetPlatform => _targetPlatform;

  LocalizationDelegate get localeDelegate => _localeDelegate;

  bool get showsTranslationKeys => _showsTranslationKeys;

  Future<void> init() async {
    _initLocale();
    _initTargetPlatform();
  }

  void _initTargetPlatform() {
    _targetPlatform = _debugRepo.getTargetPlatform();
    notifyListeners();
  }

  void _initLocale() {
    final locale = _localeRepo.getCustomLocale();
    if (locale != null) {
      _localeDelegate = LocalizationDelegate(newLocale: locale);
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
    _localeDelegate = LocalizationDelegate(newLocale: locale);
    notifyListeners();
  }

  Future<void> setSelectedPlatformToAndroid() async {
    await _debugRepo.saveSelectedPlatform('android');
    _initTargetPlatform();
  }

  Future<void> setSelectedPlatformToIOS() async {
    await _debugRepo.saveSelectedPlatform('ios');
    _initTargetPlatform();
  }

  Future<void> setSelectedPlatformToDefault() async {
    await _debugRepo.saveSelectedPlatform(null);
    _initTargetPlatform();
  }

  String getCurrentPlatform() {
    if (targetPlatform == TargetPlatform.android) {
      return LocalizationKeys.generalLabelAndroid;
    } else if (targetPlatform == TargetPlatform.iOS) {
      return LocalizationKeys.generalLabelIos;
    }
    return LocalizationKeys.generalLabelSystemDefault;
  }

  String getCurrentLanguage() {
    switch (localeDelegate.activeLocale?.languageCode) {
      case 'nl':
        return 'Nederlands';
      case 'en':
        return 'English';
    }
    return 'English';
  }

  bool isLanguageSelected(String languageCode) {
    if (localeDelegate.activeLocale == null && languageCode == null) return true;
    return localeDelegate.activeLocale?.languageCode == languageCode;
  }

  void toggleTranslationKeys() {
    _showsTranslationKeys = !showsTranslationKeys;
    _localeDelegate = LocalizationDelegate(newLocale: localeDelegate.activeLocale, showLocalizationKeys: showsTranslationKeys);
    notifyListeners();
  }
}
