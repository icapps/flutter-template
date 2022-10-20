import 'package:flutter/material.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GlobalViewModel with ChangeNotifierEx {
  final Localization _localizationInstance;
  final LocaleRepository _localeRepo;
  final DebugRepository _debugRepo;
  final LocalStorage _localStorage;
  var _showsTranslationKeys = false;

  TargetPlatform? _targetPlatform;

  Localization get localizationInstance => _localizationInstance;

  List<Locale> get supportedLocales => _localizationInstance.supportedLocales;

  GlobalViewModel(
    this._localeRepo,
    this._debugRepo,
    this._localStorage,
    this._localizationInstance,
  );

  ThemeMode get themeMode => FlavorConfig.instance.themeMode;

  Locale? get locale => _localizationInstance.locale;

  TargetPlatform? get targetPlatform => _targetPlatform;

  bool get showsTranslationKeys => _showsTranslationKeys;

  Future<void> init() async {
    _initTargetPlatform();
    _getThemeMode();
  }

  void _initTargetPlatform() {
    _targetPlatform = _debugRepo.getTargetPlatform();
    notifyListeners();
  }

  void _getThemeMode() {
    FlavorConfig.instance.themeMode = _localStorage.getThemeMode() ?? FlavorConfig.instance.themeMode;
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
    await _localizationInstance.load(locale: locale);
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

  String getAppearanceValue(Localization localization) {
    switch (FlavorConfig.instance.themeMode) {
      case ThemeMode.dark:
        return _localizationInstance.themeModeLabelDark;
      case ThemeMode.light:
        return _localizationInstance.themeModeLabelLight;
      default:
        return _localizationInstance.themeModeLabelSystem;
    }
  }

  String getCurrentLanguage() {
    switch (_localizationInstance.locale?.languageCode) {
      case 'nl':
        return 'Nederlands';
      case 'en':
        return 'English';
    }
    return 'English';
  }

  bool isLanguageSelected(String? languageCode) {
    if (_localizationInstance.locale == null && languageCode == null) return true;
    return _localizationInstance.locale?.languageCode == languageCode;
  }

  Future<void> toggleTranslationKeys() async {
    _showsTranslationKeys = !showsTranslationKeys;
    await _localizationInstance.load(
      locale: _localizationInstance.locale,
      showLocalizationKeys: _showsTranslationKeys,
    );
    notifyListeners();
  }
}
