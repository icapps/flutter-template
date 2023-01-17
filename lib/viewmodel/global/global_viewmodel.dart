import 'package:flutter/material.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/theme/theme_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GlobalViewModel with ChangeNotifierEx {
  final LocaleRepository _localeRepo;
  final DebugRepository _debugRepo;
  final ThemeConfigUtil _themeConfigUtil;
  final LocalStorage _localStorage;
  var _localeDelegate = LocalizationDelegate();
  var _showsTranslationKeys = false;

  TargetPlatform? _targetPlatform;

  LocalizationDelegate? get localeDelegate => _localeDelegate;

  List<Locale> get supportedLocales => LocalizationDelegate.supportedLocales;

  ThemeMode get themeMode => _themeConfigUtil.themeMode;

  Locale? get locale => _localeDelegate.activeLocale;

  TargetPlatform? get targetPlatform => _targetPlatform;

  bool get showsTranslationKeys => _showsTranslationKeys;

  GlobalViewModel(
    this._localeRepo,
    this._debugRepo,
    this._localStorage,
    this._themeConfigUtil,
  );

  Future<void> init() async {
    await _initLocale();
    _initTargetPlatform();
    _getThemeMode();
  }

  Future<void> _initLocale() async {
    final locale = _localeRepo.getCustomLocale();
    if (locale != null) {
      _localeDelegate = LocalizationDelegate(
        newLocale: locale,
      );
    }
    notifyListeners();
  }

  void _initTargetPlatform() {
    _targetPlatform = _debugRepo.getTargetPlatform();
    notifyListeners();
  }

  void _getThemeMode() {
    _themeConfigUtil.themeMode = _localStorage.getThemeMode() ?? _themeConfigUtil.themeMode;
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    _themeConfigUtil.themeMode = themeMode;
    notifyListeners();
    await _localStorage.updateThemeMode(themeMode);
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
    _localeDelegate = LocalizationDelegate(
      newLocale: locale,
      showLocalizationKeys: _localeDelegate.showLocalizationKeys,
    );
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
    switch (_themeConfigUtil.themeMode) {
      case ThemeMode.dark:
        return localization.themeModeLabelDark;
      case ThemeMode.light:
        return localization.themeModeLabelLight;
      default:
        return localization.themeModeLabelSystem;
    }
  }

  String getCurrentLanguage() {
    switch (_localeDelegate.activeLocale?.languageCode) {
      case 'nl':
        return 'Nederlands';
      case 'en':
        return 'English';
    }
    return 'English';
  }

  bool isLanguageSelected(String? languageCode) {
    if (_localeDelegate.activeLocale == null && languageCode == null) return true;
    return _localeDelegate.activeLocale?.languageCode == languageCode;
  }

  Future<void> toggleTranslationKeys() async {
    _showsTranslationKeys = !showsTranslationKeys;
    _localeDelegate = LocalizationDelegate(
      newLocale: locale,
      showLocalizationKeys: _showsTranslationKeys,
    );
    notifyListeners();
  }
}
