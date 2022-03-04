import 'package:flutter/material.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class GlobalViewModel with ChangeNotifierEx {
  final LocaleRepository _localeRepo;
  final DebugRepository _debugRepo;
  final LocalStorage _localStorage;
  var _localeDelegate = LocalizationDelegate();
  var _showsTranslationKeys = false;

  final _themeMode = ThemeMode.system;

  TargetPlatform? _targetPlatform;

  GlobalViewModel(
    this._localeRepo,
    this._debugRepo,
    this._localStorage,
  );

  ThemeMode get themeMode => FlavorConfig.instance.themeMode;

  Locale? get locale => _localeDelegate.newLocale;

  TargetPlatform? get targetPlatform => _targetPlatform;

  LocalizationDelegate get localeDelegate => _localeDelegate;

  bool get showsTranslationKeys => _showsTranslationKeys;

  Future<void> init() async {
    _initLocale();
    _initTargetPlatform();
    _getThemeMode();
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

  void _getThemeMode() {
    FlavorConfig.instance.themeMode = _localStorage.getThemeMode();
    notifyListeners();
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

  Future<void> _onUpdateLocaleClicked(Locale? locale) async {
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

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    FlavorConfig.instance.themeMode = themeMode;
    notifyListeners();
    await _localStorage.updateThemeMode(themeMode);
  }

  String getCurrentPlatform() {
    if (targetPlatform == TargetPlatform.android) {
      return LocalizationKeys.generalLabelAndroid;
    } else if (targetPlatform == TargetPlatform.iOS) {
      return LocalizationKeys.generalLabelIos;
    }
    return LocalizationKeys.generalLabelSystemDefault;
  }

  String getAppearanceValue(Localization localization) {
    switch (FlavorConfig.instance.themeMode) {
      case ThemeMode.dark:
        return localization.themeModeLabelDark;
      case ThemeMode.light:
        return localization.themeModeLabelLight;
      default:
        return localization.themeModeLabelSystem;
    }
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

  bool isLanguageSelected(String? languageCode) {
    if (localeDelegate.activeLocale == null && languageCode == null) return true;
    return localeDelegate.activeLocale?.languageCode == languageCode;
  }

  void toggleTranslationKeys() {
    _showsTranslationKeys = !showsTranslationKeys;
    _localeDelegate = LocalizationDelegate(newLocale: localeDelegate.activeLocale, showLocalizationKeys: showsTranslationKeys);
    notifyListeners();
  }
}
